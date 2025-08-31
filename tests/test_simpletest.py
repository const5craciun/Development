import sys
import pytest
import pandas
from projects.simple import check1


def test_simpletest():
    x = check1()
    assert x == 5
