
//code for the polygon shape: http://processing.org/learning/anatomy/
//inspired by http://www.flickr.com/photos/50ftw/6957793396/in/photostream
//a creation by 50ftw 

void setup (){
  size(480, 320);
  smooth();
  noStroke();
  frameRate(5);
}
  
void draw(){
  background(255);
  for (float cx=0;cx<=600;cx+=150){ //to draw along width
    for (float cy=0;cy<=450;cy+=86){ //to draw along height
      int r=50; // radius
      int f=255/int(random(1,3)); //to fill with gray scales
      mosaico (cx,cy, f,r);
      mosaico (cx+75,cy+43, f,r);
    }
  }
}

void mosaico (float cx, float cy, int f, int r){
  for (int angle=120; angle<480;angle+=120){ //it's a hexagon based shape, that's why I need and 60 angle
    beginShape();
    vertex(cx,cy);
    fill(f);
    for (int i = 0; i <= 120; i+=60){
      float anglei=angle+i;
      float vx=cx + r*cos(radians(anglei));
      float vy= cy + r * sin(radians(anglei));
      vertex(vx,vy);
    }
    endShape(CLOSE);
  f-=255/3; //to vary the scale of gray  
  if (f<0){f=0;}
  }
}


