dprint_sources = ['dprint.vala']
c_args = ['-DG_LOG_DOMAIN="dprint"']
tgts += shared_module(
    'dprint',
    dprint_sources,
    c_args: c_args,
    dependencies: dependencies,
    include_directories: inc,
    install: true,
    install_dir: install_dir,
)