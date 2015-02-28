
float x0 = 0, y0 =0, x1=400,y1=100,x2=300,y2=200,x3=500,y3=300,x4=400,y4=400;
int steps = 80;
int flip1 = 1, flip2 = 1;
int ewidth = 150, ehight = 40, evar = 20;
PImage img;

void setup(){
  size(800,600);
  noFill();
  frameRate(16);
  img = loadImage("sky.jpg");
}

void draw(){
  background(40);
  image(img,0,0);
  x0 = mouseX - 400;
  y0 = mouseY - 400;
  x2 += flip2 * 20;
  x3 -= flip2 * 20;
  if(x2 > 500 || x2 < 300){
    flip2*=-1;
  }
  //bezier(x1,y1,x2,y2,x3,y3,x4,y4);
  //fill(255);

  for (int i = 1; i <= steps; i++) {
    float t = i / float(steps);
    float x = bezierPoint(x1,x2,x3,x4, t);
    float y = bezierPoint(y1,y2,y3,y4, t);
    float tx = bezierTangent(x1,x2,x3,x4, t);
    float ty = bezierTangent(y1,y2,y3,y4, t);
    float a = atan2(ty, tx);
    a -= HALF_PI;
    //line(x, y, cos(a)*8 + x, sin(a)*8 + y);
    
    for (int j = 0; j <= 8; j++){
      flip1 *=-1;
      pushMatrix();
      translate(x + x0,y + y0);
      rotate(a);
      //ellipse(0, 0, t*100, t*20);
      strokeWeight((1-t)* random(4));
      stroke(random(50,100) - (1-t) * 50);
      arc(0, 0, (1- t) * ewidth + random(-evar * (1-t) , evar * (1-t)), (1- t) * ehight, random(PI)*flip1,random(PI)*flip1);
      
      fill(random(50,100));
      noStroke();
      ellipse(random(- ewidth / 1.5 * (1-t) , ewidth / 1.5 * (1- t)),random(-ehight,ehight),random(1,5) * t,random(1,5) * t);
      noFill();
      
      popMatrix();
    }
  }
  //filter(BLUR,1);
}


