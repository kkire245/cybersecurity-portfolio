# Simulated Incident Response Investigation

## Overview

This project documents a simulated Linux incident response investigation conducted within an Ubuntu virtual machine environment.

The investigation focused on identifying failed authentication attempts, invalid SSH login events, privileged account activity, suspicious file permissions, and network activity. Evidence was collected through system logs, process review, file system analysis, and network inspection.

## Scenario

A security investigation was performed to determine the source and scope of repeated authentication failures and privileged account activity observed on a Linux system.

## Environment

* Ubuntu 26.04 Virtual Machine

## Investigation Activities

### Authentication Analysis

* Failed root authentication attempts
* Invalid SSH user login attempts
* Authentication log review using auth.log
* SSH log review using journalctl

### System Review

* User account enumeration
* Sudo privilege review
* Active session review
* Process inspection

### File System Analysis

* Identification of suspicious files
* Permission analysis
* Ownership review
* World-writable file investigation

### Network Analysis

* Open port identification
* Active connection review
* SSH service review

## Tools Used

* auth.log
* journalctl
* grep
* tail
* find
* ls
* ps
* ss
* who
* w
* getent

## Files

* `incident_response_investigation.pdf` – Complete investigation documentation
* `incident_report_2026-06-15.txt` – Formal incident investigation report

## Key Findings

* Multiple failed authentication attempts against the root account
* Invalid SSH login attempts targeting a non-existent user
* Privileged activity performed through sudo
* Detection of a world-writable file within `/tmp`
* SSH activity traced to localhost (127.0.0.1)

## Key Takeaways

This project strengthened my understanding of authentication log analysis, Linux incident response workflows, evidence collection, root cause analysis, and security documentation.

