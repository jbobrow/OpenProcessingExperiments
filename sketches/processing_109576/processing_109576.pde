
float x,y;
float vx,vy;
float ay;

void setup() {
  size(600, 600);
  x=0;
  y=280;
  vx=4;
  vy=8;
  ay=0.5;
}

void draw() {
 background(random(150), 200, random(200));

  chara(int(x), int(y));

  x=x+vx;
  y=y+vy;

  if (x>550)vx=-vx;
  if (x<0)vx=-vx;
  if (y>550) {
    vy=-vy;
    y=550;
    vy=vy*0.93;
    vx=vx*0.95;
  }
  if (y<0)vy=-vy;

  vy=vy+ay;

  if (mousePressed) {
    if ((mouseX>x-50)&&(mouseX<x+50)&&(mouseY>y-50)&&(mouseY<y+50)) {
      x=mouseX;
      y=mouseY;
      vx=0;
      vy=0;
      
 for(int x = 4; x < width; x+=13){
    for(int y = 0; y <height; y+=13){
      text(int(random(10)),x,y);
      
    }
  }
      
    }
  }
}

  void mouseReleased() {
    vx=mouseX-pmouseX;
    vy=mouseY-pmouseY;
    
    vx=vx*0.2;
    vy=vy*0.2;
    
  }


void chara(int a, int b) {
  pushMatrix();
  translate(a-50,b-50);

  //body
  noStroke();
  fill(#EB4444);
  arc(50,98,25,30,radians(180),radians(360));
  fill(#F5DADA);
  triangle(50,91,43,85,57,85);

  //face
  strokeWeight(2);
  stroke(#FF8519);
  fill(#FFF0CF);
  ellipse(50,65,75,40);
  noStroke();
  ellipse(50,58,80,30);

  //cheek
  noStroke();
  fill(#FFBCB5);
  ellipse(25,71,14,8);
  ellipse(75,71,14,8);

  //eyes
  strokeWeight(3);
  stroke(0, 0, 0);
  fill(0, 0, 0, 0);
  ellipse(30,60,10,10);
  ellipse(70,60,10,10);

  //highlight
  strokeWeight(3);
  stroke(215);
  arc(30,60,10,10,radians(260),radians(265));
  arc(70,60,10,10,radians(260),radians(265));

  //mouth
  stroke(0);
  arc(50,72,10,10,radians(40),radians(140));

  //electricity
  noStroke();
  fill(#FFFF00);
  triangle(50,15,30,23,70,45);
  triangle(50,15,70,23,30,45);

  //jellyfish
  strokeWeight(2.5);
  stroke(255);
  fill(map(a,0,600,0,255),map(b,0,600,0,255),255,130);
  arc(50,50,90,90,radians(180),radians(360));
  arc(35,50,60,60,radians(140),radians(180));
  arc(65,50,60,60,radians(360),radians(400));

  //electricity
  strokeWeight(1);
  stroke(#858500);
  fill(#FFFF00);
  triangle(90,0,65,30,50,15);
  triangle(10,0,35,30,50,15);
  stroke(#FFFF00);
  triangle(50,15,75,40,70,45);
  triangle(50,15,25,40,30,45);

  //Eyelashes
  strokeWeight(3);
  stroke(0, 0, 0);
  arc(68,52,10,10,radians(120),radians(180));
  arc(28,52,10,10,radians(120),radians(180));


  //shock
  int m = millis();
  m = m%(3*1000);
  if(m > 2.3*1000 ){

  fill(#FFFF00);
  noStroke();
  triangle(145,-90,97,-35,117,-47);
  triangle(97,-5,122,-35,145,-47);
  quad(97,-35,117,-47,145,-47,122,-35);
  triangle(3,-5,-22,-35,-45,-47);
  triangle(-45,-90,3,-35,-17,-47);
  quad(-45,-47,-17,-47,3,-35,-22,-35);
  }
  else if(m >  2.3*1000 && m <= 3*1000);
  noFill();
  
 
  popMatrix();
  
}


