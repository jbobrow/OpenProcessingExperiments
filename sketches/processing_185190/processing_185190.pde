
//Write a script that paints a grid over the canvas using horizontal and vertical lines. The resolution of the grid (i.e., the number of cells in each direction) should be determined by two int variables, r and c, where rspecifies the number of rows and c specifies the number of columns.

// r = rows
int r = 8;
// c = columns
int c = 5;

void setup() {
size(300, 300);
background (200);
}

void draw() {
stroke(0);
for (int i = 0; i < height; i = height/r) {
    line(0, i, 300, i);
} 

for(int j = 0; j < width; j = width/c) {
    line(j, 0, width, j);
 } 
 }

