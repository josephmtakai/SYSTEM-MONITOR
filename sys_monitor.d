import std.stdio;
import std.json;
import std.conv;
import std.file;
import std.datetime;
import std.regex;

// Define a struct for Threat Intelligence
struct ThreatEntry {
    string indicator;
    string description;
    bool isCritical;
}

// Load Threat Intelligence Data from a JSON File
ThreatEntry[] loadThreatIntelligence(string filePath) {
    auto content = readText(filePath);
    auto jsonData = parseJSON(content);

    ThreatEntry[] threatList;
    foreach (entry; jsonData.array) {
        threatList ~= ThreatEntry(
            entry["indicator"].str,
            entry["description"].str,
            entry["isCritical"].to!bool
        );
    }
    return threatList;
}

// Parse Log File and Match Against Threat Intelligence
void analyzeLogs(string logFilePath, ThreatEntry[] threats) {
    auto logContent = readText(logFilePath);

    writeln("Analyzing Logs...");
    foreach (line; logContent.splitLines) {
        foreach (threat; threats) {
            if (line.matchFirst(threat.indicator)) {
                auto timestamp = Clock.currTime().toISOExtString();
                writeln("ALERT: Threat Detected at ", timestamp);
                writeln("  Indicator: ", threat.indicator);
                writeln("  Description: ", threat.description);
                writeln("  Severity: ", threat.isCritical ? "CRITICAL" : "LOW");
                break;
            }
        }
    }
}

void main() {
    writeln("Starting Real-Time Alert System...");

    string threatFile = "threats.json"; // Path to threat intelligence JSON
    string logFile = "system_logs.txt"; // Path to log file

    // Sample Threat Intelligence JSON (for testing purposes)
    if (!exists(threatFile)) {
        string sampleThreats = `[
            {"indicator": "error", "description": "System Error Detected", "isCritical": true},
            {"indicator": "failed login", "description": "Unauthorized Login Attempt", "isCritical": false},
            {"indicator": "warning", "description": "General Warning", "isCritical": false}
        ]`;
        write(threatFile, sampleThreats);
    }

    // Sample Logs File (for testing purposes)
    if (!exists(logFile)) {
        string sampleLogs = """
        2024-06-27 12:00:01: User failed login attempt
        2024-06-27 12:05:15: System encountered error during startup
        2024-06-27 12:10:45: General system warning issued
        2024-06-27 12:15:30: User logged in successfully
        """;
        write(logFile, sampleLogs);
    }

    // Load Threat Intelligence
    writeln("Loading Threat Intelligence...");
    ThreatEntry[] threats = loadThreatIntelligence(threatFile);

    writeln("Threat Intelligence Loaded: ", threats.length, " entries.");

    // Analyze Logs in Real-Time
    analyzeLogs(logFile, threats);
}
