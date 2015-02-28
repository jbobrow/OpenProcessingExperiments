
int scene = 0; 

int x = 0;
int y = 0;
int S;
int xx = 250;
int yy = 300;
int ww = 100;
int hh = 50;
float dis = dist(x+50,y-100, mouseX, mouseY);

PFont font; 


void setup(){
 size(600,600);
background(0);
  font = loadFont("NewRomanBold-18.vlw");
  textFont(font);
  smooth();
  //PFont font;
  //font = loadFont("New Roman Bold.ttf");
  //textFont(font);
//int x1 = 200; int y1 = 400; float s1 = 50; int Cr1 = 100;
}
//ellipce(int x = x position,int y = y position,int S = ellipse size,float s = scale,int Cr = color)
void draw(){
  if(scene == 0){
    text("push the left eye",238,55);
  skul(0,0,1,100);
  eyehole(300,400,50,1,0);
  eyehole(200,400,50,1,0);
  jaw(0,0,1);
  //rect(xx - 25,yy - 25,ww -50,hh);
  }
else if(scene == 1){
  background(0);
  text("Clatter!!",265,60);
    skul(0,0,1,100);
  eyehole(300,400,50,1,0);
  eyehole(200,400,50,1,0);
  jaw(0,25,1);
}
else if(scene == 2){
  background(0);
  text("Help!",265,55);
  text("Give me a hand",265,80);
  skul(0,0,1,100);
  eyehole(300,400,50,1,0);
  eyehole(200,400,50,1,0);
  jaw(0,60,1);
}
else if(scene == 3){
background(0);
  text("Clatter!",265,60);
  text("Is that noise form my jaw?!",265,80);
   skul(0,0,1,100);
  eyehole(300,400,50,1,0);
  eyehole(200,400,50,1,0);
  rotate(angle+0.1);
  jaw(0,50,1);
//same problem(rotate). I guess scale too.
}
else if(scene == 4){
  background(0);
  skul(0,0,1,100);
  eyehole(300,400,50,1,0);
  eyehole(200,400,50,1,0);
  rotate(angle+0.05);
  jaw(0,200,1);
}

else if(scene == 5){
  background(0);
  text("T.T",265,60);
  skul(0,0,1,100);
  eyehole(300,400,50,1,0);
  eyehole(200,400,50,1,0);
  jaw(0,250,1);
}
else if(scene == 6){
  background(0);
  text("End",0,0);
  fill(255);
}
  
}
float angle = 0.0;
//int x1 = 200; int y1 = 400; float s1 = 50; int Cr1 = 100;
//skul(200 = x position,400 = y position,1 = scale,100 = color);
void skul(int x1, int y1, float s1, int Cr1){
  pushMatrix();
  translate(200,400);
  scale(s1);
  strokeWeight(1);
  fill(50);
  ellipse(x1+100,y1-130,200,300);
  fill(100);
    //bezier(200,280,160,50,440,50,400,280);
  bezier(x1,y1-120,x1-40,y1-350,x1+240,y1-350,x1+200,y1-120);
  stroke(100);
rect(x1+5,y1-190,190,150);
rect(x1+35,y1-190,130,200);
stroke(0);
line(x1+65,y1+10,x1+65,y1-30);
line(x1+100,y1+10,x1+100,y1-30);
line(x1+135,y1+10,x1+135,y1-30);
//nouse
stroke(50);
strokeWeight(5);
line(x1+100,y1-100,x1+110,y1-70);
line(x1+100,y1-100,x1+90,y1-70);

popMatrix();
}
void eyehole(int x,int y,int S,float s,int Cr){
  float dis = dist(x+50,y-100, mouseX, mouseY);
    if (mousePressed && dis < S) {
   Cr = 255;
  }
  else {
   Cr = 0;
  }
  pushMatrix();
  float mapColorB = map(mouseX, 0, 600, 200, 255);
  float mapColorG = map(mouseY, 0, 600, 0, 255);
  strokeWeight(5);
  scale(s);
  fill(Cr,mapColorG,mapColorB);
 ellipse(x+50,y-100,S,S);
  popMatrix();
}
  void jaw(int x2,int y2,float s2){
  pushMatrix();
  translate(300,400);
  strokeWeight(1);
  fill(80);
  stroke(100);
rect(x2-85,y2-40,15,100);
rect(x2+70,y2-40,15,100);
fill(100);
rect(x2-85,y2+20,170,60);
stroke(0);
line(x2-35,y2+20,x2-35,y2+50);
line(x2,y2+20,x2,y2+50);
line(x2+35,y2+20,x2+35,y2+50);
  scale(s2);
popMatrix();  
}
void bomb(int b){
 rect(0,0,width,height);
fill(b,0,0);
}
//next scene
void mousePressed() {  

  if (scene == 0) {  
   
    if((mouseX > xx - 25) && (mouseX < xx - 25 + ww - 50) && (mouseY > yy - 25) && (mouseY < yy -25 + hh)) {
      scene = 1;
    } 
    else scene = 0;
  }
  else if (scene == 1) {  

float d = dist(mouseX, mouseY, xx, yy);
    if (d < 20) {
      scene = 2;
    }
    else scene = 1;
  }   
  else if (scene == 2) {
float d = dist(mouseX, mouseY, xx, yy);
    if (d < 20) {
      scene = 3;
    }
    else scene = 2;
  }
  else if (scene == 3) {
float d = dist(mouseX, mouseY, xx, yy);
    if (d < 20) {
      scene = 4;
    }
    else scene = 3;
  }  
    else if (scene == 4) {
    float d = dist(mouseX, mouseY, xx, yy);
    if (d < 20) {
      scene = 5;
    }
    else scene = 4;
  }  
    else if (scene == 5) {
float d = dist(mouseX, mouseY, xx, yy);
    if (d < 20) {
      scene = 6;
    }
    else scene = 5;
  }
  else if (scene == 6) {
    scene = 0;
  }
}

