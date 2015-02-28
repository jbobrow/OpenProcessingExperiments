
int l = 50;
int w = 50;
int x1 = 150;
int x2 = 200;
int x3 = 250;
int y1 = 150;
int y2 = 200;
int y3 = 250;

void setup(){
  
  size(400, 400);
  background(255);
  smooth();
  
}


void draw(){
  
  
  
  strokeWeight(5);
  
  stroke(255,0,0);
    rect(x1, y1, l, w);
rect(x2, y1, l, w);
rect(x3, y1, l, w);
rect(x1, y2, l, w);
rect(x2, y2, l, w);
rect(x3, y2, l, w);
rect(x1, y3, l, w);
rect(x2, y3, l, w);
rect(x3, y3, l, w);
  
  if (mousePressed){
    fill(255, 0, 0);
  }
if (mousePressed){
    stroke(255, 0, 0);
    rect(x1, y1, l, w);
rect(x2, y1, l, w);
rect(x3, y1, l, w);
rect(x1, y2, l, w);
rect(x2, y2, l, w);
rect(x3, y2, l, w);
rect(x1, y3, l, w);
rect(x2, y3, l, w);
rect(x3, y3, l, w);
  }




if (mousePressed){
  background(255, 0, 0);
}
if (mousePressed){
strokeWeight(20);
stroke(0);
fill(0);
rect(40, 40, 300, 300);


}




}


