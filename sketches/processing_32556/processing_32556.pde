
int x;
int y;
float c;
int g;
int a;
int s;

void setup(){
 size(501, 500);
 background(255);
 smooth();
 frameRate(2500);
 
    
}
void draw(){
  fill(0, 0, g, a);
  noStroke();
  rect(x, y, s, s);
  s=25; 
  c = random(0, 3);
  if (c<=2){
    g=150;
  }
  if (c<=1){
    g=75;
  }
  if (c>2){
    g=225;
  }
    x=x+s;
  a=x/2;

 if (x>=500){
   y=y+s;
   x=x-520-s;
 }
 
}

