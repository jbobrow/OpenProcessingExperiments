
int boxsize = 100;
int cols, rows;
color[][] colors;
 
void setup() {
size(600, 600);
cols = width/boxsize;
rows = height/boxsize;
colors = new color[cols][rows];
for (int i=0; i<cols; i++) {
for (int j=0; j<rows; j++) {
colors[i][j] = color(255); // white
}
}
}
 
void draw() {
background(255);
for (int i=0; i<cols; i++) {
for (int j=0; j<rows; j++) {
int x = i*boxsize;
int y = j*boxsize;
if (mouseX > x && mouseX < (x + boxsize) && mouseY > y && mouseY < (y + boxsize)) {
if (mousePressed) { //courtesy of ammon
          
colors[i][j] = color(random(250),random(250),random(250));
} else if (mousePressed) {
colors[i][j] = color(255);
}
}
fill(colors[i][j]);
rect(x, y, boxsize, boxsize); 
}
}
}
