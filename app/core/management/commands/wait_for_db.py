import time

from django.db import connections
from django.db.utils import OperationalError
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    """Comando para pausar la ejecucion hasta que la DB este disponible"""

    def handle(self, *args, **options):
        self.stdout.write('esperando a la base de datos...')
        db_conn = None
        while not db_conn:
            try:
                db_conn = connections['default']
            except OperationalError:
                self.stdout.write('BD no disponible, esperando 1 segundo...')
                time.sleep(1)

        self.stdout.write(self.style.SUCCESS('Base de datos disponible'))
