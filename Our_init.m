function conf = Our_init(conf)
if ~isfield(conf,'beta'), conf.beta =1; end;
if ~isfield(conf,'lambda1'), conf.lambda1=1; end;
if ~isfield(conf,'dataset'), conf.dataset = 'I:/chanllge_data/'; end;
if ~isfield(conf,'datanames'), conf.datanames = 'buckingham_palace'; end; 
if ~isfield(conf,'datadump'), conf.datadump = 'I:/chanllge_data/dump/'; end; 
if ~isfield(conf,'resultdir'), conf.resultdir = './result/ablation/'; end; 
