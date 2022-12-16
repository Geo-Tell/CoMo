function conf = Our_init(conf)
if ~isfield(conf,'beta'), conf.beta =1; end;
if ~isfield(conf,'lambda1'), conf.lambda1=1; end;

