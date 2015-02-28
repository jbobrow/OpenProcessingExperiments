
/* @pjs preload="http://i.imgur.com/ahA0W.jpg"; */
/* @pjs preload="http://i.imgur.com/eKp3o.png"; */
/* @pjs preload="http://i.imgur.com/2dYfI.png"; */
/* @pjs preload="http://i.imgur.com/Q4R6B.png"; */


PImage backgr = loadImage("http://i.imgur.com/ahA0W.jpg");
PImage backgrB = loadImage("http://i.imgur.com/eKp3o.png");

PImage car = loadImage("http://i.imgur.com/2dYfI.png");
PImage truck = loadImage("http://i.imgur.com/Q4R6B.png");

float spring = 0.0005;
float springY = 0.00005;
float gravity = 0.06;
float friction = -0.4;
float groundFriction = 0.7;

int objectscounter = 0;
String grabbedBuilding = "nobuildinggrabbed";

int cntr = 0;
int border = 5;

Building[] buildings = new Building[13];
Actor[] actors = new Actor[2];


void setup()
{
  size(760,98);
  colorMode(RGB);
  background(230,230,230);
  image(backgr,0,0);

  actors[0]= new Actor(20,height-12,width-12,height-12,800,"car");
  actors[1]= new Actor(width-20,height-18,12,height-18,800,"truck");
  
  buildings[0] = new Building(228,0,46,41,"church");
  buildings[1] = new Building(493,0,50,35,"mosque");
  buildings[2] = new Building(128,0,45*1.5,37*1.5,"factory");
  buildings[3] = new Building(31,0,22,36,"facade");
  buildings[4] = new Building(53,0,22,36,"facade");
 // buildings[5] = new Building(162,0,22,36,"facade");
  buildings[5] = new Building(297,0,28,42,"tree");
  buildings[6] = new Building(330,0,28,42,"tree");
  buildings[7] = new Building(428,0,28,42,"tree");
    buildings[8] = new Building(592,0,22,36,"facade");
  buildings[9] = new Building(614,0,22,36,"facade");
    buildings[10] = new Building(642,0,28,42,"tree");
    buildings[11] = new Building(716,0,36,67,"officetower");
    // buildings[12] = new Building(716,0,22,36,"facade");
    buildings[12] = new Building(670,0,28,42,"tree");
}

void draw()
{
  for(int e=0; e<buildings.length(); e++){
      if(buildings[e].over()){
cursor(HAND); 
      } else{
       cursor(ARROW); 
      }
  }
  //backgr 1
  image(backgr,0,0);
  //animations
  cntr++;
  
  if(cntr % 2000==200){
   actors[0].active = true; 
  }
  if(cntr % 2000==1000){
   actors[1].active = true; 
  }
  
  for(int e=0; e<actors.length(); e++){
  actors[e].update();
  actors[e].display();
  }
  //backgr 2
  image(backgrB,0,0);

  if(mousePressed==true  && (mouseX>border && mouseX<width-border && mouseY>border && mouseY<height-border)){ 
    if(grabbedBuilding=="nobuildinggrabbed"){
    for(int i=0; i<buildings.length(); i++){
      if(buildings[i].over()){
        grabbedBuilding = String(buildings[i].no);
        colorMode(HSB,100);
        buildings[i].recolor();
        break;
      }
    }
        if(grabbedBuilding=="nobuildinggrabbed"){
      
    }
    }
  } else{
   grabbedBuilding = "nobuildinggrabbed";
   mousePressed = false;
  } 
  
  for(int i=0; i<buildings.length(); i++){
    buildings[i].collide();
    buildings[i].move();
    buildings[i].display();
  }
  
  colorMode(HSB,100);
  Cf = color(0,0,43);
  fill(Cf);
  rect(0,height-2,width,2);
} 

class Actor{

float x1,y1,x2,y2;
float x = 0;
float y = 0;
int steps;
String sprite;
boolean active = false;

Actor(float x1,float y1,float x2,float y2, int steps, String sprite){
  this.x = x1;
  this.y = y1;
  this.x1 = x1;
  this.y1 = y1;
  this.x2 = x2;
  this.y2 = y2;
  this.sprite = sprite;
  this.steps = steps;
}

void update(){
  if(active){
  x+= (x2-x1)*pow(steps,-1);
  y+= (y2-y1)*pow(steps,-1);
  if((x2>x1 && x>x2) || (y2>y && y>y2) || (x2<x1 && x<x2) || (y2<y && y<y2)){
    x=x1;
    y=y1;
    active = false;
  }
  }
}

void display(){
 switch(sprite){
    
 case "car":   
 image(car,x,y); 
 break;
 
 case"truck":
 image(truck,x,y);
 break;
}
}
  
}
class Building{

float vx = 0;
float vy = 0;
float throwX = 0;
  
float x,y;
int boxW,boxH;
String bType;
int no;

color C;
int Cage = 0;

Building(float iX, float iY, int iboxW, int iboxH, String ibType){
  boxW=iboxW;
  boxH=iboxH;
  x=iX;
  y=height-boxH-iY;
  bType = ibType;
  no = objectscounter;
  colorMode(HSB,100);
  C = color(0,0,43);
  objectscounter++;
} 

void collide() {
  for(int i = 0; i < buildings.length(); i++){
   if(i!=no){
     //horizontal
     if (x<(buildings[i].x+buildings[i].boxW) && (x+boxW)>buildings[i].x) {
      if (y<(buildings[i].y+buildings[i].boxH) && (y+boxH)>buildings[i].y+5) { 
        float targetX = 0;
        if(x>buildings[i].x){
          targetX = x + (boxW*05 +buildings[i].boxW*05);
        } else{
          targetX = x - (boxW*05 +buildings[i].boxW*05);
        }
        float ax = (targetX - buildings[i].x) * spring;
        vx += ax;
        buildings[i].vx -= ax;
      }
      }
     
         //vertical
     if (y<(buildings[i].y+buildings[i].boxH) && (y+boxH)>buildings[i].y){
       if (x<(buildings[i].x+buildings[i].boxW) && (x+boxW)>buildings[i].x){  
        vy *= friction;
        vx *= groundFriction;
      }
      }
    } 
  }
}

void move() { 
  if(grabbedBuilding.equals(String(no))){
  vx=0;
  vy=0;
  float frac = 0.35;
  throwX = frac*(mouseX-pmouseX);
  
  x = constrain(mouseX-boxW/2,0,width-boxW);
  y = constrain(mouseY-boxH/2,0,height-boxH);
  } else{
    /*physics*/
    vy += gravity;
    vx += throwX;
      x += vx;
      y += vy;
      
       if (x + boxW > width) {
        x = width - boxW;
        vx *= friction;
      }
      else if (x  < 0) {
        x = 0;
        vx *= friction;
      }
      if (y + boxH > height) {
        y = height-boxH;
        vy *= friction;
        vx *= groundFriction;
      } 
      else if (y < 0) {
        y = 0;
        vy *= friction;
      }
      throwX = 0;
  }    
}

boolean over(){
  if((mouseX > x && mouseX < x+boxW && mouseY > (y) && mouseY < (y+boxH)) && 
  (mouseX>border && mouseX<width-border && mouseY>border && mouseY<height-border)){
    return true;
  } else{
    return false;
  }
}

void recolor(){
 Cage = cntr;
  
 colorMode(HSB,355);
 int i = int(random(0,5));
 switch(i){   
 case 0: 
 C = color(2,81*3.55,89*3.55);
 break;
 
 case 1:   
 C = color(34,93*3.55,93*3.55);
 break;
 
 case 2:   
 C = color(117,85*3.55,80*3.55);
 break;
 
 case 3:   
 C = color(205,85*3.55,80*3.55);
 break;
 
 case 4:   
 C = color(279,85*3.55,80*3.55);
 break;   
 }
}

void display() {
  //update color
  if(cntr-Cage>400){
    colorMode(HSB,100);
    float S = saturation(C);
    float H = hue(C);
    float B = brightness(C);
    
    S = constrain(S-2,0,100);
    B = constrain(B-2,43,100);
    if(S==0){
    H = constrain(H-2,0,100);
    }
    C = color(H,S,B);
  }
  
    fill(C);
    noStroke();
    if(over() && !(grabbedBuilding.equals(String(no))) && saturation(C)==0){
      colorMode(HSB,100);
     fill(hue(C),saturation(C),37);
    }
  
  //image(img,x,y);
  if(bType.equals("factory")){
   beginShape();
   vertex(x,y+37*1.5);
   vertex(x,y+24*1.5);
   vertex(x+7*1.5,y+19*1.5);
   vertex(x+7*1.5,y+24*1.5);
   vertex(x+14*1.5,y+19*1.5);
   vertex(x+14*1.5,y+24*1.5);
   vertex(x+21*1.5,y+19*1.5);
   vertex(x+21*1.5,y+24*1.5);
   vertex(x+28*1.5,y+19*1.5);
   vertex(x+28*1.5,y+24*1.5);
   vertex(x+35*1.5,y+19*1.5);
   vertex(x+35*1.5,y+24*1.5);
   vertex(x+37*1.5,y+24*1.5);
   vertex(x+40*1.5,y);
   vertex(x+43*1.5,y);
   vertex(x+45*1.5,y+37*1.5);
   endShape();
  }
  
  if(bType.equals("church")){
   beginShape();
   vertex(x,y+42);
   vertex(x,y+29);
   vertex(x+7,y+22);
   vertex(x+36,y+22);
   vertex(x+36,y+7);
   vertex(x+41,y);
   vertex(x+46,y+7);
   vertex(x+46,y+42);
   endShape();
  }
  
  if(bType.equals("mosque")){
   beginShape();
   vertex(x,y+35);
   vertex(x,y+4);
   vertex(x+2,y);
   vertex(x+4,y+4);
   vertex(x+4,y+19);
   //curveVertex(x+25,y+12);
   bezierVertex(x+22,y+8,x+28,y+8,x+46,y+19);
   vertex(x+46,y+4);
   vertex(x+48,y);
   vertex(x+50,y+4);
   vertex(x+50,y+35);
   endShape();
  }
  
  if(bType.equals("facade")){
   beginShape();
   vertex(x,y+36);
   vertex(x,y+12);
   vertex(x+2,y+12);
   vertex(x+2,y+9);
   vertex(x+5,y+9);
   vertex(x+5,y+6);
   vertex(x+7,y+6);
   vertex(x+7,y+3);
   vertex(x+9,y+3);
   vertex(x+9,y);
   vertex(x+13,y);
   vertex(x+13,y+3);
    vertex(x+15,y+3);
   vertex(x+15,y+6);
   vertex(x+17,y+6);
   vertex(x+17,y+9);
   vertex(x+20,y+9);
   vertex(x+20,y+12);
   vertex(x+22,y+12);
   vertex(x+22,y+36);
   endShape();
  }
  
   if(bType.equals("tree")){
   beginShape();
   vertex(x+10,y+42);
   vertex(x+12,y+39);
   vertex(x+12,y+26);
   vertex(x+7,y+22);
   vertex(x+4,y+14);
   vertex(x+7,y+19);
   vertex(x+7,y+16);
   vertex(x+8,y+21);
   vertex(x+12,y+24);
   vertex(x+9,y+14);
   vertex(x+5,y+8);
   vertex(x,y+2);
    vertex(x+5,y+6);
   vertex(x+5,y);
   vertex(x+6,y+7);
   vertex(x+9,y+12);
   vertex(x+10,y+7);
   vertex(x+8,y+2);
   vertex(x+10,y+7);
   vertex(x+12,y+1);
     vertex(x+12,y+6);
   vertex(x+10,y+12);
   vertex(x+10,y+13);
   vertex(x+13,y+23);
   vertex(x+16,y+18);
   vertex(x+13,y+12);
   vertex(x+13,y+6);
   vertex(x+15,y+12);
       vertex(x+18,y+7);
   vertex(x+16,y+13);
   vertex(x+17,y+16);
   vertex(x+21,y+11);
   vertex(x+18,y+2);
   vertex(x+21,y+7);
   vertex(x+26,y+3);
   vertex(x+22,y+8);
        vertex(x+23,y+11);
   vertex(x+28,y+8);
   vertex(x+21,y+13);
   vertex(x+16,y+22);
   vertex(x+14,y+27);
   vertex(x+14,y+37);
   vertex(x+16,y+42);
   endShape();
  }
  
    if(bType.equals("officetower")){
   beginShape();
   vertex(x,y+67);
   vertex(x,y+38);
   vertex(x+11,y+33);
   vertex(x+11,y);
   vertex(x+36,y+10);
   vertex(x+36,y+67);
   endShape();
  }
} 
}
