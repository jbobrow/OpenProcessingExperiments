
color c1=color(232, 226, 211);
color c2=color(85, 82, 82);
color b=color(0);
color w=color(255);

int localX = 400;
int localY = 400;


void setup(){
  size(800,800);
}

void draw(){
  background(255);
  smooth();
  
  if(mousePressed && (mouseButton == LEFT) ) {
    localX = mouseX;
    localY= mouseY;
  }
  
  for (int i=0; i<3; i++){
    draw_creature (localX+(i*225-255), localY);
  }
}

void draw_creature (int x, int y){
  ellipseMode(CENTER);
  noStroke();fill(c2);
  ellipse(x, y+100, 260, 300);  //body
  ellipse(x, y-45, 150, 150);  //head
  ellipse(x-50, y-120, 20, 100);  //left ear
  ellipse(x+50, y-120, 20, 100);  //right ear
  
  //mouth
  fill(b);
  ellipse(x, y-50, 25, 10);
  
  //feet
  fill(c2);
  ellipse(x-50, y+235, 120, 50);
  ellipse(x+50, y+235, 120, 50);
  
  //arms
  ellipse(x-120, y+100, 50, 150);
  ellipse(x+120, y+100, 50, 150);
 
  //eyes
  fill(w);
  ellipse(x-45, y-80, 22, 22);   //left white
  ellipse(x+45, y-80, 22, 22);  //right white
  fill(b);

  //eye movement
  float thetaLeft = atan2(mouseY-320, mouseX-355);
  float thetaRight = atan2(mouseY-320, mouseX-445);
  float DRX = abs((400.0-mouseX)/400*6); //distance ratio X- adjusts distance the pupils shoud move with respect to the center of creature
  float DRY = abs((400.0-mouseY)/400*6);

  ellipse((int)(x-45+DRX*cos(thetaLeft)), (int)(y-80+DRY*sin(thetaLeft)), 10, 10);   //left pupil
  ellipse((int)(x+45+DRX*cos(thetaRight)), (int)(y-80+DRY*sin(thetaRight)), 10, 10);   //right pupil

  fill(w);
  ellipse((int)(x-44+DRX*cos(thetaLeft)), (int)(y-83+DRY*sin(thetaLeft)), 4, 4);     //white reflect eyes
  ellipse((int)(x+46+DRX*cos(thetaRight)), (int)(y-83+DRY*sin(thetaRight)), 4, 4);     //white reflect eyes

  //belly
  if (mousePressed) {
    if (mouseButton == RIGHT)
    {
      c1=color(random(255), random(255), random(255));
    }
  }
  fill(c1);
  ellipse(x, y+100, 210, 250);
  
  fill(b);
  stroke(10);
  line(x-47, y-57, x-105, y-79); //left of face wiskers
  line(x-47, y-53,x-113, y-56);
  line(x-47, y-48, x-107, y-32);
  line(x+47, y-57, x+105, y-81); //right of face wiskers
  line(x+47, y-53, x+113, y-56);
  line(x+47, y-48, x+107, y-31);
 }


