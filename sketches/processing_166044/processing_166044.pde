
int maxImages = 10; 
int imageIndex = 0; 
PImage[] images = new PImage[maxImages];


float x[] = {};
float y[] = {};
Bug[] orecuho = new Bug[400];
float x = 100;
float y = 100;
float sz = 100;
color bgcolor;



void setup() {
  size(640,640);
  for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "animal" + i + ".jpg" ); 
  }
  frameRate(2);
  
  
  noStroke();
  fill(255,255,255,70);
  for(int i=0; i<orecuho.length; i++) {
    float x = width/2 + cos(i/2.0) * i;
    float y = height/2 + sin(i/2.0) * i;
    orecuho[i] = new Bug(x, y, 0.05 + (i/1000.0) );
  }

}


void draw() {  
  background(0);
  image(images[imageIndex],0,0);
  filter(ERODE);
  imageIndex = (imageIndex + 1) % images.length;
  
  int i = 0;
  while(i < x.length) {
    if(random(20) > 17) {
      fill(255, 0, 0);
    } else {
      fill(0);
    }
    ellipse(x[i], y[i], 20, 20);
    x[i] = x[i] + random(-2, 2);
    y[i] = y[i] + random(-2, 2);
    i = i + 1;
}
for(int i=0; i<orecuho.length; i++) {
    orecuho[i].live();
}
if(dist(x,y, mouseX, mouseY) < sz / 2) {
    if(mousePressed) {
      cursor(MOVE);
      x = lerp(x, mouseX, 0.2);
      y = lerp(y, mouseY, 0.2);
      target_weight = 10;
    } else {
      cursor(HAND);
      target_weight = 5;
    }
    target_alpha = 255;
  } else {
    cursor(ARROW);
    target_alpha = 0;
  }
}


void mousePressed() {
  x = append(x, mouseX);
  y = append(y, mouseY);
}

class Bug {
  float x;
  float y;
  
  float t;
  float speed;
   
  Bug(float tx, float ty, float tspeed) {
    x = tx;
    y = ty;
    t = 5;
    speed = tspeed;
  }

  void live() {
    float sz = map(sin(t), -1, 1, 10, 20);
    ellipse(x, y, sz, sz);
    t = t + speed;
  }  
}



//http://www.openprocessing.org/sketch/87384
//I am cited this project's code as my citation. 
  



