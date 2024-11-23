//
//  RuntimeWarning.swift
//  ReportRuntimeWarningSample
//
//  Created by Fumiya Tanaka on 2024/11/23.
//

import os

final actor RuntimeWarning {
    var info = Dl_info()
    
    init() {
        dladdr(
            dlsym(
                dlopen(
                    nil,
                    RTLD_LAZY
                ),
                """
                $sxSg7SwiftUI8CommandsA2bCRzlAbCP4body4BodyQzvgTW
                """
            ),
            &info
        )
    }
    
    func log(message: StaticString) {
        os_log(
            .fault,
            dso: info.dli_fbase,
            log: OSLog(
                subsystem: "com.apple.runtime-issues",
                category: "ReportRuntimeWarningSample"
            ),
            message
        )
    }
}
