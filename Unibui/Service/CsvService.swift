//
//  CsvService.swift
//  Unibui
//
//  Created by Jonathan Zheng on 9/13/24.
//

import Foundation
import SwiftCSV

class CsvService {
    func parseCsvData() async -> [Job]? {
        do {
            guard let filePath = Bundle.main.url(forResource: "jobs", withExtension: "csv") else {
                print("File not found in bundle")
                return nil
            }
            let csvFile = try CSV<Named>(url: filePath)
            var jobs = [Job]()
            for row in csvFile.rows {
                if let title = row["Job Title"],
                   let company = row["Company Name"],
                   let location = row["Location"],
                   let description = row["Job Description"],
                   let requirements = row["Requirements"] {
                    let job = Job(
                        jobTitle: title,
                        companyName: company,
                        location: location,
                        jobDescription: description,
                        requirements: requirements
                    )
                    jobs.append(job)
                }
            }
            return jobs
        } catch is CSVParseError {
            print("Error parsing CSV")
        } catch {
            print("Error loading CSV: \(error.localizedDescription)")
        }
        return nil
    }
}
