import click

@click.command()
@click.option(
    '--log_level', default='INFO',
    help='set the logger level, choose between [CRITICAL / ERROR / WARNING / INFO / '
         'DEBUG] (default = INFO)'
)
@click.option(
    '--rest_url', default='http://localhost:8080',
    help='set the rest url (default = http://localhost:8080)'
)
@click.option(
    '--storage_name', default='storage_name',
    help='set the storage name on (default = storage_name)'
)
def command_line(
        log_level: str,
        rest_url: str,
        storage_name: str
):
    print(f'=== {script.__name__} Start ===')
    script_executor = Script(
        log_level,
        rest_url,
        storage_name,
    )
    script_executor.run()
    print(f'=== {Script.__name__} End ===')


if __name__ == '__main__':
    command_line()
