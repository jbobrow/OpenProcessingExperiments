
/* @pjs preload="feels.gif, cry.jpg, bad.jpg"; */

PImage feels;
PImage cry;
PImage bad;

void setup(){
  size(500,500);
 // myimage = requestImage("stoneskull.jpg");
  feels = loadImage("feels.gif");
  feels.filter(INVERT);
  feels.filter(BLUR, 5);
  cry = loadImage("cry.jpg");
  bad = loadImage("bad.jpg");
}

void draw(){
 background(244,244,244);
  stroke(0);
  for(int y = 0; y < height;y+=25){
      line(0, y, width, y); 
  }
  for(int x = 0; x < width;x+=25){
      line(x, 0, x, height);
  }
  
  image(feels, width/3, height-240,200,240);
  
  image(cry, 0, 0, 180, 240);
  
  image(bad, width-200, 0, 200, 240);
  
  stroke(0,255,0);
  
  float ly = 120.0;
  float lx = 0.0;
  
  while(lx < height){
    float nextX = lx + random(1, 10);
    float nextY = ly + random(50);

    line(lx, ly, nextX, nextY);
    
    ly = nextY;
    lx = nextX;
    rotate(45);  
  }

  
}



