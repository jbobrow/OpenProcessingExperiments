
int w = 500;
int h = 500;
int framerate = 30;
float x = -w/2;
float y = +h/2;
float x1 = -w/2;
float y1 = -h/2;

void setup() {
  size(w,h);
  frameRate(framerate);
  fill(180, 180, 180); 
  noStroke();  
}

void draw() {
 fill(180, 180, 180); 
 background(131, 131, 131);
 
 ellipse(width/2,height/2,width/2+x,height/2+y);
 ellipse(width/2,height/2,width/2+y,height/2+x);
 
 if(width/2+x > width*2-width/2) {
   fill(131, 131, 131);
   ellipse(width/2,height/2,width/2+x1,height/2+y1);
   ellipse(width/2,height/2,width/2+y1,height/2+x1);
   x1 += 15;
   y1 -= 15;
 }

 x += 15;
 y -= 15;
}
