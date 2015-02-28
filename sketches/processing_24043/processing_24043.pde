
float xpos, ypos;
int yspeed=3;

ArrayList balls,removeThese;
float diff = 1;
float [][]xs;
boolean drawAvg;
float inc=0.0;
float angle=0.0;
PImage sky;
PImage water;
PImage w0;
PImage w1;
PImage w2;
PImage w3;
PImage coral;


float offset = 60;
float scalar = 40;
float speed = 0.05;

int frame = 0;
int numFrames = 48;
PImage[] clown = new PImage[numFrames];

void setup(){
   size(400,600);
   smooth();
   frameRate(70);
   sky = loadImage("sky.png");
   water= loadImage("water.png");
     w0= loadImage("w0.png");
     w1= loadImage("w1.png");
     w2= loadImage("w2.png");
     w3= loadImage("w3.png");
     coral= loadImage("coral.png");
  xpos=0; ypos=0;
 
 
  clown[0]  = loadImage("17.png");
  clown[1]  = loadImage("17.png"); 
  clown[2]  = loadImage("1.png");
  clown[3]  = loadImage("1.png"); 
  clown[4]  = loadImage("2.png");
  clown[5]  = loadImage("2.png"); 
  clown[6]  = loadImage("3.png");
  clown[7]  = loadImage("3.png"); 
  clown[8]  = loadImage("4.png");
  clown[9]  = loadImage("4.png"); 
  clown[10]  = loadImage("5.png"); 
  clown[11]  = loadImage("5.png"); 
  clown[12]  = loadImage("6.png"); 
  clown[13]  = loadImage("6.png"); 
  clown[14]  = loadImage("7.png"); 
  clown[15]  = loadImage("7.png"); 
  clown[16]  = loadImage("8.png"); 
  clown[17]  = loadImage("8.png");
  clown[18]  = loadImage("9.png"); 
  clown[19]  = loadImage("9.png");
  clown[20]  = loadImage("10.png"); 
  clown[21]  = loadImage("10.png");
  clown[22]  = loadImage("11.png"); 
  clown[23]  = loadImage("11.png");
  clown[24]  = loadImage("12.png"); 
  clown[25]  = loadImage("12.png");
  clown[26]  = loadImage("13.png"); 
  clown[27]  = loadImage("13.png"); 
  clown[28]  = loadImage("14.png"); 
  clown[29]  = loadImage("14.png"); 
  clown[30]  = loadImage("15.png"); 
  clown[31]  = loadImage("15.png"); 
  clown[32]  = loadImage("16.png"); 
  clown[33]  = loadImage("16.png"); 
  clown[34]  = loadImage("17.png"); 
  clown[35]  = loadImage("17.png");
  clown[36]  = loadImage("17.png");
  clown[37]  = loadImage("17.png");
  clown[38]  = loadImage("17.png");
  clown[39]  = loadImage("17.png");
  clown[40]  = loadImage("17.png");
  clown[41]  = loadImage("17.png");
  clown[42]  = loadImage("17.png");
  clown[43]  = loadImage("17.png");
  clown[44]  = loadImage("17.png");
  clown[45]  = loadImage("17.png");
  clown[46]  = loadImage("17.png");
  clown[47]  = loadImage("17.png");
  
 
 
  balls = new ArrayList();
  removeThese = new ArrayList();
  xs = new float[width/1][2];  
   
}

void draw(){
  frameRate(50);
  image(sky,xpos,ypos);
  angle +=speed/2;
  image(w0,xpos+20,ypos+178+(sin(angle +0.4)*scalar/5));
  image(w1,xpos+20,ypos+180+(cos(angle +0.4)*scalar/5));
  image(w2,xpos+20,ypos+170+(-sin(angle +0.7)*scalar/5));
  image(w3,xpos+20,ypos+180+(cos(angle +0.2)*scalar/5));
  image(water,xpos,ypos-20);
  image(coral,xpos+180,ypos+900);


 
  
 if (mouseY>550){

   ypos-=yspeed;
  image(sky,0,ypos);
  image(w0,20,ypos+170);
  image(w1,20,ypos+170);
  image(w2,20,ypos+170);
  image(w3,20,ypos+170);
  image(water,0,ypos-20);
  image(coral,xpos+180,ypos+900);
 }
  
   if (mouseY<50 && ypos<0){

   ypos+=yspeed;
image(sky,0,ypos);
image(w0,20,ypos+170);
  image(w1,20,ypos+170);
  image(w2,20,ypos+170);
  image(w3,20,ypos+170);
  image(water,0,ypos-20);
  image(coral,xpos+180,ypos+900);
 }
  pushMatrix();

  translate(0,ypos);
  if((int)random(5)<diff)
    balls.add(new Ball());
  render(); 
  if(drawAvg)
    for(int i=1;i<xs.length;i++)
      if(xs[i][1]>0)
        line((i-1)*1,xs[i-1][0]/xs[i-1][1],i*1,xs[i][0]/xs[i][1]);
  fill(0);
  
  
  
   //left cluster
   
  float angle=.8*cos(inc)/10+sin(inc*1.2)/30.0;
  float angle2=.7*sin(inc)/10;
inc +=0.015;

 pushMatrix(); 
  translate(110,860);
  stroke(200,133,212);
  rotate(5+PI/3);
  tendril(179,29,-angle/1.2);
  tendril(181,42,angle/2.7);
  stroke(165,133,180);
  rotate(2*PI);
  tendril(179,19,angle/1.2);
  tendril(185,26,angle*1.2);
  rotate(5.4+PI/4);
  stroke(215,123,230);
  tendril(164,43,-angle2/2.5);
  tendril(175,25,angle*1.3);
  stroke(203,161,224);
  rotate(3.3+PI);
  tendril(195,40,angle2/1.7);
  tendril(210,33,-angle/2);
  tendril(182,14,angle2*3.2);
  
  stroke(180,143,202);
  rotate(6*PI/3);
  tendril(179,29,-angle/1.2);
  tendril(181,42,angle/1.7);
  rotate(5.4+PI/4);
  stroke(225,153,240);
  tendril(164,43,angle/2.5);
  tendril(175,25,angle2*1.3);
  stroke(183,171,204);
  rotate(PI/6);
  translate(110,-110);
  tendril(195,40,angle2/2.7);
  tendril(190,33,-angle/2);
  rotate(-PI/3);
  translate(-360,0);
  tendril(182,14,-angle2*1.6);
   stroke(205,163,210);
   translate(20,0);
  rotate(2*PI);
  tendril(179,19,-angle/1.2);
  tendril(165,26,-angle*1.2);
 popMatrix(); 
   
 pushMatrix();  
  translate(90,870);
  stroke(200,113,212);
  rotate(5+PI/3);
  tendril(179,29,-angle2/1.7);
  tendril(181,42,angle2/1.3);
  stroke(205,183,220);
  rotate(2*PI);
  tendril(179,19,angle/3.2);
  tendril(185,26,-angle2*1.2);
  rotate(5.4+PI/4);
  stroke(215,123,240);
  tendril(164,43,angle2/2.5);
  tendril(175,25,angle*1.3);
  stroke(200,131,214);
  rotate(3.3+PI);
  tendril(195,40,angle2/2.7);
  tendril(210,33,-angle/2);
  tendril(182,14,angle2*1.2);
  
  stroke(210,120,230);
  rotate(6*PI/3);
  tendril(179,29,-angle2/1.2);
  tendril(181,42,angle2);
  rotate(5.4+PI/4);
  stroke(175,123,190);
  tendril(164,43,-angle2/2.5);
  tendril(175,25,angle*1.3);
  stroke(200,121,214);
  rotate(PI/6);
  translate(110,-110);
  tendril(195,40,angle2/2.7);
  tendril(190,33,angle/2);
  rotate(-PI/3);
  translate(-360,0);
  tendril(182,14,angle2*1.6);
   stroke(185,83,190);
   translate(20,0);
  rotate(2*PI);
  tendril(179,19,-angle/1.2);
  tendril(165,26,-angle*1.2);
  translate(-200,-70);
popMatrix(); 

pushMatrix();  
  translate(100,870);
  stroke(200,113,212);
  rotate(5+PI/3);
  tendril(179,29,-angle2/1.7);
  tendril(181,42,angle2/1.3);
  stroke(205,183,220);
  rotate(2*PI);
  tendril(179,19,angle/1.2);
  tendril(185,26,-angle*1.2);
  rotate(5.4+PI/4);
  stroke(215,123,240);
  tendril(164,43,angle2/2.5);
  tendril(175,25,-angle*1.3);
  stroke(200,131,214);
  rotate(3.3+PI);
  tendril(195,40,angle2/2.7);
  tendril(210,33,-angle/2);
  tendril(182,14,angle2*1.2);
  
  stroke(210,120,230);
  rotate(6*PI/3);
  tendril(179,29,-angle/1.2);
  tendril(181,42,-angle);
  rotate(5.4+PI/4);
  stroke(175,123,190);
  tendril(164,43,angle2/2.5);
  tendril(175,25,-angle*1.3);
  stroke(200,121,214);
  rotate(PI/6);
  translate(110,-110);
  tendril(195,40,angle/2.7);
  tendril(190,33,angle/1.7);
  rotate(-PI/3);
  translate(-360,0);
  tendril(182,14,angle2*1.6);
   stroke(185,83,190);
   translate(20,0);
  rotate(2*PI);
  tendril(179,19,angle/1.2);
  tendril(165,26,-angle2*1.2);
  translate(-200,-70);
popMatrix(); 

if(mousePressed){
translate(270,790);
 frame = (frame+1) % numFrames;  
 image(clown[frame], 0, 300); 
}
popMatrix();
}


void tendril(int x, int units, float angle2) {
  pushMatrix();
  translate(x,300);
  for(int i=8; i>0; i--){
    strokeWeight(i*.35);
    line(0,0,0,-8);
    translate(0,-8);
    rotate(angle2);
  }
  popMatrix();
}

void render()
{
   
  for(int i=0;i<balls.size();i++) {
    Ball temp = (Ball) balls.get(i);
    temp.update(xs); 
  }
}
  

class Ball
{
  PVector pos,vel,acc;
  float radius;
  float gravity = -.02;
  float h;
  Ball()
  {
    radius = random(10,30);
    pos = new PVector(0,1000);
    vel = new PVector(random(-5,1),0);
    acc = new PVector(0,gravity);
 
  }
  void update(float[][] inxs)
  {
    pos.add(vel);
    vel.add(acc);
   
    render();
    if(pos.y>200)
    {
     
   
    }
  }
  void render()
  {
    pushMatrix();
    translate(pos.x,pos.y);
    noStroke();
    fill(255,10);
    stroke(255,50);
    ellipse(0,0,radius,radius);
    ellipse(radius-11*(radius/10),radius-12*(radius/10),radius/5,radius/5);
    popMatrix();
  }
 
  }
  

