import Foundation

class SessionStore {
    static let shared = SessionStore()

    private(set) var sessions = [StudySession] = []

    func addSession(_ session: StudySession) {
        sessions.append(session)
    }

    func session(at Index: Int) -> StudySession {
        return sessions[index]
    }
}