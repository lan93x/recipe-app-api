from django.test import TestCase

from app.calc import add
from app.calc import substract


class CalcTest(TestCase):

    def test_add_numbers(self):
        self.assertEqual(add(3, 8), 11)

    def test_substract_numbers(self):
        """Testear que los valores se resten y se retornen"""
        self.assertEqual(substract(5, 3), 2)
