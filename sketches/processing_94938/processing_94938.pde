
int x = 0;
int dir = 1;
int r = 255; 
int b= 0; 
int temp;

void setup(){
  size(1000,1000);
  noStroke();
  
}
void draw (){
  background(200);
  fill(r, 24, b);
  rect(20+x,20, 50, 50);
  x = x + dir;

}
void mousePressed(){
  dir = -10 - dir;
  temp = r; r = b ; b = temp;
}


