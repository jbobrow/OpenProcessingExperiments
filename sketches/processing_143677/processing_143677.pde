
float noiseValue = 5;
PImage heroes;
void setup() {
size(800, 600);
}
void draw() {
heroes = loadImage("heroes.png");
heroes.loadPixels();
int dimension = heroes.width * heroes.height;
color[] currentRow = {};
int currentRowNumber = 0;
int[] changedPixels = {};
for(int i = 0; i < dimension; i++)
{
color currentPixel = heroes.pixels[i];
currentRow = append(currentRow, currentPixel);
if((i % heroes.width) == 1)
{
// distort row since this is the last element
int rotateVal = int( noise(noiseValue) * 50 );
// rotate the row a few times
currentRow = rotateRow(currentRow, rotateVal);
// Add the row to the chnaged pixels array
changedPixels = concat(changedPixels, currentRow);
// change noise value
noiseValue = noiseValue + 0.4;
// since we are done with the current row
// increment row number
currentRowNumber += 1;
// and clear the current row
currentRow = new color[heroes.width];
}
}
// since we are done with the distortion
// assign the distorted pixel array to the original image
heroes.pixels = changedPixels;
image(heroes, 0, 0);
}
int[] rotate(int[] arr) {
int[] newArray = {};
for(int i = 1; i < arr.length; i++) {
newArray = append(newArray, arr[i]);
}
return append(newArray, arr[0]);
}
int[] rotateRow(int[] row, int times) {
int[] resultRow = row;
for(int i = 0; i < times; i++)
{
resultRow = rotate(resultRow);
}
return resultRow;
}
