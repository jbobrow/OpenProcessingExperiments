
int[] row0, row1;
ArrayList triangle;

int m = 2;
float r = 13;

void setup() {
  size(600,600);
  colorMode(HSB, m);
  background(0);
  noLoop();
  
  int[] temp0 = {1};
  row0 = temp0;
  int[] temp1 = {1,1};
  row1 = temp1;
  triangle = new ArrayList();
  triangle.add(row0);
  triangle.add(row1);
}

float getColor(int base){  return base%m; }

void draw(){
  background(0);
  for(int i=0; i<triangle.size(); i++)
  {
     int[] curr = (int[]) triangle.get(i);
     for(int j=0; j<curr.length; j++)
     {
        fill(getColor(curr[j]), m, m);
        ellipse(width/2 - curr.length*r/2 + j*r, (i+1)*r, r, r);
     }
  }
  for(int n = 0; n<m; n++)
    { fill(getColor(n), m, m); 
      rect(0, n*r, r, r); }
 }
 void keyPressed(){
    if(key == CODED){
      if(keyCode == LEFT){ m = max(m - 1, 2); }
      else if(keyCode == RIGHT) { m++; }
      else if(keyCode == DOWN && triangle.size() < height/r-2) { triangle.add(nextRow((int[]) triangle.get(triangle.size()-1))); }
      else if(keyCode == UP && triangle.size()>1) {triangle.remove(triangle.size()-1); } 
      colorMode(HSB, m);
      redraw();
    }
 }
 
 int[] nextRow(int[] lastRow){
   int[] curr = new int[lastRow.length + 1];
   curr[0] = 1; curr[curr.length-1] = 1;
   for(int i = 1; i<curr.length-1; i++)
     curr[i] = lastRow[i-1] + lastRow[i];
   return curr;
 }

