
float angle = 0.0;
float speed = .15;
float radius = random(100, 150);
float sx = random(1.0, 3.0);
float sy = 2.0;
float sx2 = random(3.0, 5.0);
float sy2 = 1.0;
float sx3 = 0;
float sy3 = 0;
float sMoveX;
float sMoveY;
float x = 0;
float y = 0;
float tMoveX;
float tMoveY;


void setup() {
  size(600, 500);
  smooth();
  
  sMoveX=8.0; 
  sMoveY=8.0;
  
  tMoveX=30; 
  tMoveY=20;
 
 
  sx3=random(radius*2, width-radius*2);  
  sy3=random(radius*2, height-radius*2);  

}

void draw() {
  PImage img;
  img = loadImage("townsvillegood.png");
  image(img, 0, 0);
  angle += speed;
  //float sinval = sin(angle);
  //float cosval = cos(angle);
  //float x = 200 + (cosval * radius);
  //float y = 200 + (sinval * radius);
  
  if (dist(x, y, sx3, sy3)<radius*1) {
  img = loadImage("townsvillegood2.png");
  image(img, 0, 0);
  }
  
 x+=tMoveX;  
 y+=tMoveY;
 if (x>width-100 || x<0) { 
  tMoveX=-tMoveX;
  }
  if (y>height-100 || y<0) {
    tMoveY=-tMoveY;
  }
  img = loadImage("mojojojogood.png");
  image(img, x, y);
  
  
  float x2 = x + cos(angle * sx) * radius/.8;
  float y2 = y + sin(angle * sy) * radius/.8;
  img = loadImage("blossomgood.png");
  image(img, x2, y2);
  if (dist(x, y, x2, y2)<radius*1) {
  img = loadImage("mojojojored.png");
  image(img, x, y);
  }
  float x3 = x + cos(angle * sx2) * radius/.8;
  float y3 = y + sin(angle * sy2) * radius/.8;
  img = loadImage("buttercupgood.png");
  image(img, x3, y3);
  if (dist(x, y, x3, y3)<radius*1) {
  img = loadImage("mojojojogreen.png");
  image(img, x, y);
  }
  
  
 sx3+=sMoveX;  
 sy3+=sMoveY;
 if (sx3>width-100 || sx3<0) { 
  sMoveX=-sMoveX;
  }
  if (sy3>height-100 || sy3<0) {
    sMoveY=-sMoveY;
  }
    img = loadImage("bubblesgood.png");
  image(img, sx3, sy3);
  
  if (dist(x, y, sx3, sy3)<radius*1) {
  img = loadImage("mojojojoblue.png");
  image(img, x, y);
  }
 

    
  
}

