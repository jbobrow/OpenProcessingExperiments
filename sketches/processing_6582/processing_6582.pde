
// Snowing on Munich
// 12.2009
// Munich, Bavaria, Germany.
// Alexis Brion
// Design vs Art

snow_storm[] ss;
PImage snow_flock;
PImage background_image;

void setup(){
  size(375,500);
  smooth();
  stroke(0,0,250);
  fill(255);
  frameRate(30);

  snow_flock = loadImage("snowflock_02.png");
  background_image = loadImage("munich_marienplatz.jpg");

  ss = new snow_storm[100];
  for(int i=0; i < 100; i++){
    ss[i] = new snow_storm();
    //coordinates
    ss[i].x = random(0,width);
    ss[i].y = random(-height,height*2);
    //diameter
    ss[i].d = (int)random(2,6);
    ss[i].w = width*0.01;
    ss[i].h = height*0.01;
    //velocity
    ss[i].v = (int)random(1,10);
  }
}

void draw(){    
  image(background_image, 0, 0, width, height);
  
  for(int i=0; i < ss.length; i++){
    ss[i].move();
    ss[i].show();
  }  
}

class snow_storm{  
  float x, y, w, h;
  int d, v; 
  
  void show(){
    image(snow_flock, x, y, d*w, d*h);
  }

  void move(){
    if (x > width){
    x = 0;
    }
    else if (x < 0){
    x = width;
    }
    
    x += ( mouseX - width/2  ) * 0.004 * v;
     
    if (y > height-d*w){
    y = 0;
    }
    
    y += ( y + 1 ) * 0.003 * v;
    
  }
}

