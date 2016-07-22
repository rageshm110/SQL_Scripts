-- Scheduler info

SELECT 
	er.session_id,
	CONVERT(varchar(10), er.status) AS status,
	CONVERT(varchar(20), er.command) AS command,
	CONVERT(varchar(15),ow.state) AS worker_state
FROM sys.dm_exec_requests as er
JOIN sys.dm_os_workers as ow
ON ow.task_address = er.task_address
WHERE command = 'RESOURCE MONITOR';