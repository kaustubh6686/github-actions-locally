#!/usr/bin/env python3
import os
import sys
import json

if __name__ == '__main__':
    result = {'include': []}
    result['include'].append({'node': 14})
    result['include'].append({'node': 16})
    result['include'].append({'node': 18})
    result['include'].append({'node': 18})
    json_obj = json.dumps(result)
    if "GITHUB_OUTPUT" in os.environ:
        with open(os.environ["GITHUB_OUTPUT"], "a") as f:
            print(f'matrix={json_obj}', file=f)
