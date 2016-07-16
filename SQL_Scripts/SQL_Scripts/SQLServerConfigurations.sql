/*
SQL Server 2012 has 69 server configuration options that can be quried using catalog view
sys.configurations
*/

SELECT * FROM sys.configurations
GO

/*
Dynamic changes can take place immediately but others don't take place untill the server is restarted.
*/

--Backup compression
SELECT * FROM msdb..backupset;
GO

-- Max Degree Of Parallelism and Cost Threshold For Parallelism
SELECT
	ot.task_address,
	ot.task_state,
	ot.session_id,
	ot.context_switches_count,
	ot.pending_io_count,
	ot.pending_io_byte_count,
	ot.pending_io_byte_average,
	ot.scheduler_id,
	ot.exec_context_id,
	ot.request_id,
	ot.worker_address,
	ot.host_address
FROM sys.dm_os_tasks AS ot
ORDER BY ot.session_id,ot.request_id
GO

SELECT  
    scheduler_id,  
    cpu_id,  
    parent_node_id,  
    current_tasks_count,  
    runnable_tasks_count,  
    current_workers_count,  
    active_workers_count,  
    work_queue_count  
FROM sys.dm_os_schedulers;  
GO


SELECT OBJECT_DEFINITION(Object_id('sys.tables'));
GO
/*
CREATE VIEW sys.tables AS
	SELECT o.name, o.object_id, o.principal_id, o.schema_id, o.parent_object_id,
		o.type, o.type_desc, o.create_date, o.modify_date,
		o.is_ms_shipped, o.is_published, o.is_schema_published,
		isnull(ds.indepid, 0) AS lob_data_space_id,
		rfs.indepid AS filestream_data_space_id,
		o.property AS max_column_id_used,
		o.lock_on_bulk_load, o.uses_ansi_nulls, o.is_replicated, o.has_replication_filter,
		o.is_merge_published, o.is_sync_tran_subscribed, o.has_unchecked_assembly_data,
		lob.intprop AS text_in_row_limit,
		o.large_value_types_out_of_row,
		o.is_tracked_by_cdc,
		o.lock_escalation_option AS lock_escalation,
		ts.name AS lock_escalation_desc,
		o.is_filetable,
		o.is_memory_optimized,
		o.durability_option as durability,
		d.name as durability_desc
	FROM sys.objects$ o
	LEFT JOIN sys.sysidxstats lob ON lob.id = o.object_id AND lob.indid <= 1
	LEFT JOIN sys.syssingleobjrefs ds ON ds.depid = o.object_id AND ds.class = 8 AND ds.depsubid <= 1	-- SRC_INDEXTOLOBDS	
	LEFT JOIN sys.syssingleobjrefs rfs ON rfs.depid = o.object_id AND rfs.class = 42 AND rfs.depsubid = 0	-- SRC_OBJTOFSDS
	LEFT JOIN sys.syspalvalues ts ON ts.class = 'LEOP' AND ts.value = o.lock_escalation_option
	LEFT JOIN sys.syspalvalues d ON d.class = 'DOPT' AND d.value = o.durability_option
	WHERE o.type = 'U'

*/
