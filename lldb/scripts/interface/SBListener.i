//===-- SWIG Interface for SBListener ---------------------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

namespace lldb {

%feature("docstring",
"API clients can register its own listener to debugger events.

See aslo SBEvent for example usage of creating and adding a listener."
) SBListener;
class SBListener
{
public:
    SBListener ();

    SBListener (const char *name);

    SBListener (const SBListener &rhs);

    ~SBListener ();

    void
    AddEvent (const lldb::SBEvent &event);

    void
    Clear ();

    bool
    IsValid () const;

    uint32_t
    StartListeningForEventClass (SBDebugger &debugger,
                                 const char *broadcaster_class, 
                                 uint32_t event_mask);
                                 
    uint32_t
    StopListeningForEventClass (SBDebugger &debugger,
                                const char *broadcaster_class,
                                uint32_t event_mask);
    
    uint32_t
    StartListeningForEvents (const lldb::SBBroadcaster& broadcaster,
                             uint32_t event_mask);

    bool
    StopListeningForEvents (const lldb::SBBroadcaster& broadcaster,
                            uint32_t event_mask);

    // Returns true if an event was received, false if we timed out.
    bool
    WaitForEvent (uint32_t num_seconds,
                  lldb::SBEvent &event);

    bool
    WaitForEventForBroadcaster (uint32_t num_seconds,
                                const lldb::SBBroadcaster &broadcaster,
                                lldb::SBEvent &sb_event);

    bool
    WaitForEventForBroadcasterWithType (uint32_t num_seconds,
                                        const lldb::SBBroadcaster &broadcaster,
                                        uint32_t event_type_mask,
                                        lldb::SBEvent &sb_event);

    bool
    PeekAtNextEvent (lldb::SBEvent &sb_event);

    bool
    PeekAtNextEventForBroadcaster (const lldb::SBBroadcaster &broadcaster,
                                   lldb::SBEvent &sb_event);

    bool
    PeekAtNextEventForBroadcasterWithType (const lldb::SBBroadcaster &broadcaster,
                                           uint32_t event_type_mask,
                                           lldb::SBEvent &sb_event);

    bool
    GetNextEvent (lldb::SBEvent &sb_event);

    bool
    GetNextEventForBroadcaster (const lldb::SBBroadcaster &broadcaster,
                                lldb::SBEvent &sb_event);

    bool
    GetNextEventForBroadcasterWithType (const lldb::SBBroadcaster &broadcaster,
                                        uint32_t event_type_mask,
                                        lldb::SBEvent &sb_event);

    bool
    HandleBroadcastEvent (const lldb::SBEvent &event);
};

} // namespace lldb
