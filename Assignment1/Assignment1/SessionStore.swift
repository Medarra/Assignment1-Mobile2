//
//  SessionStore.swift
//  Assignment1
//
//  Created by Student on 2026-10-09.
//

import Foundation

class SessionStore {
    static let shared = SessionStore()
    
    private(set) var sessions = [StudySession] = []
    
    fun addSession(_ session: StudySession) {
        sessions.append(session)
    }
    
    func session(at Index: Int) -> StudySession {
        return sessions[index]
    }
}
