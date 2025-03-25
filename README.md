# TAZ Adjacency Matrix Generator

This R script reads a GeoJSON file of Traffic Analysis Zones (TAZ), processes it to ensure geometric validity, and generates an adjacency matrix indicating which zones share borders. The result is saved as a CSV file.

## Features

- Reads GeoJSON shapefiles using `rgdal`
- Ensures valid polygon geometries using `rgeos`
- Computes a dense adjacency matrix based on polygon intersections
- Exports the adjacency matrix as a CSV

## Requirements

Install the required R packages before running the script:

```r
install.packages("rgdal")
install.packages("rgeos")
```

## Usage

1. Update the file path in the script to point to your GeoJSON file:
   ```r
   polys <- readOGR("D:/boston_taz-Edited.json")
   ```

2. Run the script in your R environment. It will:
   - Buffer polygons to fix topology issues
   - Compute intersections to find adjacent zones
   - Save the adjacency matrix to `adj.csv`

## Output

- `adj.csv`: A square matrix where each cell `(i, j)` is `TRUE` if zone `i` is adjacent to zone `j`, and `FALSE` otherwise.

## Notes

- The buffer width of 0 is a common trick to correct invalid geometries.
- `returnDense=TRUE` ensures the full matrix is output instead of a sparse list.
- `checkValidity=TRUE` enables additional geometry validation checks.

## License

[MIT License](LICENSE)
