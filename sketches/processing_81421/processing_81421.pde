
// Pascals Triangle Visualed
// Notes: Default is in base 2 (two colors)

ArrayList pascal;
int[] row0, row1;
  
int m = 2;    // Base (mod) and the colors of the spheres
float r = 20;  // radius of spheres
boolean numbers = false;
 
void setup() {
  size(700, 700);
  noStroke();
  colorMode(HSB, m);
  noLoop();
   
  int[] row0 = {1};
  int[] row1 = {1,1};
  pascal = new ArrayList();
  pascal.add(row0);
  pascal.add(row1);
}
 
void draw() {
  background(0);  
  for(int i=0; i < pascal.size(); i++) {  // size is how many rows are in the triangle
    int[] curr = (int[]) pascal.get(i);  // assigns curr to the specific row
    for(int j=0; j < curr.length; j++) {    // goes through each element in the row and makes the sphere
      fill(curr[j], m, m);  // color sphere and text
      if(!numbers)
        ellipse(width/2 - curr.length*r/2 + j*r, (i+1)*r, r, r);  // size of sphere
      else {
        textSize(r);
        text(curr[j], width/2 - curr.length*r/2 + j*r, (i+1)*r);
      }  
    }
  }
  // Key for colors = numbers
  for(int n = 0; n < m; n++) { 
    fill(n, m, m);
    rect(0, n*15, 15, 15);
    textSize(12);
    text(n, 15, 15+n*15); 
  }
}
 
void keyPressed() {
  if(key == CODED) {
    if(keyCode == DOWN) {
      pascal.add(nextRow((int[]) pascal.get(pascal.size() - 1)));
      if(pascal.size() > height/r - 1)
        r = r*.97; 
    }
    else if(keyCode == UP && pascal.size() > 1)
      pascal.remove(pascal.size() - 1);
    else if(keyCode == LEFT)
      numbers = true;
    else if(keyCode == RIGHT)
      numbers = false;
    redraw();
  }
}
 
int[] nextRow(int[] lastRow) {
  int[] curr = new int[lastRow.length + 1];
  curr[0] = 1;  // left-side 1 
  curr[curr.length - 1] = 1;  // right-side 1
  for(int i = 1; i < curr.length - 1; i++)
    curr[i] = (lastRow[i - 1] % m + lastRow[i] % m) % m;  // change base to mod m
  return curr;
}

