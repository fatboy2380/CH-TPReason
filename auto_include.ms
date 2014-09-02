
proc (_log_this_tp, @player, @to, @reason,
  @log = simple_date('[MM/dd/YYYY HH:mm]');
  @log = @log.' '.@player.' teleported to '.@to.' because '.@reason;

  @current = get_value(get_server_info(0).'.tplogs.'.to_lower(@player));
  if(!is_array(@current)){
    @current = array();
  }
  array_insert(@current, @log, 0);
  store_value(get_server_info(0).'.tplogs.'.to_lower(@player), @current);

  @global = get_value(get_server_info(0).'.gtplogs');
  if(!is_array(@global)){
    @global = array();
  }
  array_insert(@global, @log, 0);
  store_value(get_server_info(0).'.gtplogs', @global);
 )