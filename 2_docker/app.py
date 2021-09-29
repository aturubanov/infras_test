import csv

from pydantic import BaseModel

class DataRow(BaseModel):
    row_id: int
    name: str
    value: float

def main():
    results = []
    with open('data.csv', 'r', encoding='utf8', newline='\n') as input_file:
        reader = csv.reader(input_file)
        skip_header = True
        for row in reader:
            if skip_header:
                skip_header = False
                continue
                
            results.append(
                DataRow(
                    row_id=row[0],
                    name=row[1],
                    value=row[2]
                )
            )
    
    for result in results:
        print(result)

if __name__ == '__main__':
    main()
