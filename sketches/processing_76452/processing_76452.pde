
void setup()
{
 size(800, 800);
 smooth();
 frameRate(90);  
 
}
void draw() {
  colorMode(HSB);
  int x1=int(random(600));
  int y1=int(random(600));
   int x2=int(random(600));
  int y2=int(random(600));
   int x3=int(random(600));
  int y3=int(random(600));
  int H=int(random(360));
  int S=int(random(100));
  int B=int(random(100));
  int h=height;
  int w=width;
  int shape=int(random(9));
  
 
for (int i = 0; i < w; i = i+1) {
  for (int j = 0; j < h; j = j+1) {
    fill(H, S, B);
   
      noStroke();
    if (shape>0&&shape<3) {
    
       ellipse(x1, y1, x2, y2);
    } else if(shape>=3 && shape<=4){
        rect(x1, y1, x2, y2);
      }
      else if (shape>4&& shape<7){
        triangle(x1,y1,x3,y3,x2,y2);
      }
      else if (shape>=8){
        line(x1,y1,x2,y2);
      }
     
  }
}


}




