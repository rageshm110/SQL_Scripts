/*
Check protocols used by sessions
*/
SELECT
	ec.session_id,
	ec.net_transport,
	ec.protocol_type,
	ec.encrypt_option,
	ec.endpoint_id,
	ec.client_net_address,
	ec.client_tcp_port
FROM sys.dm_exec_connections AS ec;
GO