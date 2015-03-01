
int page = 1;
 
PFont andale;
String tyellow = "AMARILLO";
String tpurple = "MORADO";
String tlime = "VERDE LIMÓN";
String thotpink = "ROSA";
String tazure = "AZUL";
String ttangelo = "NARANJA";
String win = "¡FELICIDADES! PREDISTE TU TIEMPO :)";
 
//circ1
float radius = 30.0;
float x = 50.0;
float y = 50.0;
float speedX = 1.6;
float speedY = 2.0;
int directionX = 1;
int directionY = -1;
color c1color = color(255);
color backgroundColor = color(255);
 

float mx;
float my;
float targetX, targetY;
float easing = 0.09;
 

float vamarillo = 60;
boolean foundYellow = false;
int len1 = 20;
 

float vmorado = 280;
boolean foundPurple = false;


float vverdelimon = 90;
boolean foundLime = false;
int len3 = 35;
 

float vrosa = 320;
boolean foundHotpink = false;


float vazul = 170;
boolean foundAzure = false;
 

float vnaranja = 25;
boolean foundTangelo = false;
int len2 = 10;
 
void setup(){
  size(550, 400);
  smooth();
  noStroke();
  andale = loadFont("orangejuice-14.vlw");
  textFont(andale);
  ellipseMode(RADIUS);
  colorMode(HSB, 360, 100, 100);
}
 
void draw(){
   
   if (page == 1) {
    pageOne();
   }
   else if (page == 2) {
    pageTwo();
   }else if (page == 3) {
    pageThree();
  }else if (page == 4) {
    pageFour();
  }else if (page == 5) {
    pageFive();
  }else if (page == 6) {
    pageSix();
}
}
 
void mousePressed(){
    if(dist(x, y, mouseX, mouseY) < radius) {
    backgroundColor = c1color;
    }
   

    if (page == 1) {
      if ( vamarillo > hue(c1color) - len1 && vamarillo < hue(c1color) + len1) {
      foundYellow = true;
      }
      if (foundYellow == true) {
       page = 2;
       foundYellow = false;
    }
    }
    if(page == 2) {
      if ( vmorado > hue(c1color) - len1 && vmorado < hue(c1color) + len1) {
      foundPurple = true;
      }
      println("found purple true");
      if(foundPurple == true){
        page = 3;
        foundPurple = false;
    }  
    }
    if(page == 3){
      if ( vverdelimon > hue(c1color) - len3 && vverdelimon < hue(c1color) + len3) {
      foundLime = true;
      }
      if(foundLime == true){
        page = 4;
        foundLime = false;
    }
    }
    if(page == 4){
      if ( vrosa > hue(c1color) - len1 && vrosa < hue(c1color) + len1) {
      foundHotpink = true;
      }
      if(foundHotpink == true){
        page = 5;
        foundHotpink = false;
    }
    }
  if(page == 5){
      if ( vazul > hue(c1color) - len1 && vazul < hue(c1color) + len1) {
      foundAzure = true;
      }
      if(foundAzure == true){
        page = 6;
        foundAzure = false;
    }
    }
  if(page == 6){
      if ( vnaranja > hue(c1color) - len2 && vnaranja < hue(c1color) + len2) {
      foundAzure = true;
      }
      if(foundAzure == true){
        page = 7;
        foundAzure = false;
    }
    }
   

  }
   
 void pageOne(){
  background(backgroundColor);
  noCursor();
     
  //color change
  if (frameCount % 80 == 0){
    float r = random(0, 360);
    c1color = color(r, 100, 100);
  }
 
  //circle color and motion
  fill(c1color);
  noStroke();
  ellipse(x, y, radius, radius);
  x += speedX * directionX;
   
  if ((x > width-radius) || (x < radius)) {
    directionX = -directionX;
  }
  y += speedY * directionY;
  if ((y > height-radius) || (y < radius)){
    directionY = -directionY;
  }
 
  //mouse easing
  targetX = mouseX;
  mouseX = constrain(mouseX, 0, width); //mouse or target
  float dmx = targetX - mx;
  if(abs(dmx) > 1) {
    mx += dmx * easing;
  }
 
  targetY = mouseY;
  mouseY = constrain(mouseY, 0, height); //constrain either mouse or target
  float dmy = targetY - my;
  if(abs(dmy) > 1) {
    my += dmy * easing;
  }
   
  //cursor
  stroke(0);
  strokeWeight(2);
  strokeCap(SQUARE); 
  line(mx-20, my, mx+20, my);
  line(mx, my-20, mx, my+20);
   
  //yellow to purple
  if (foundYellow == true) {
   fill(0);
   text(tpurple, 400, 20, 70, 70);
  }else if (foundYellow == false){
    fill(0);
    text(tyellow, 400, 20, 70, 70);
  }
}
 
  void pageTwo(){
     
     background(backgroundColor);
  noCursor();
     
  //color change
  if (frameCount % 70 == 0){
    float r = random(0, 360);
    c1color = color(r, 100, 100);
  }
 
  //circle color and motion
  fill(c1color);
  noStroke();
  ellipse(x, y, radius, radius);
  x += speedX * directionX;
   
  if ((x > width-radius) || (x < radius)) {
    directionX = -directionX;
  }
  y += speedY * directionY;
  if ((y > height-radius) || (y < radius)){
    directionY = -directionY;
  }
 
  //mouse easing
  targetX = mouseX;
  mouseX = constrain(mouseX, 0, width); //mouse or target
  float dmx = targetX - mx;
  if(abs(dmx) > 1) {
    mx += dmx * easing;
  }
 
  targetY = mouseY;
  mouseY = constrain(mouseY, 0, height); //constrain either mouse or target
  float dmy = targetY - my;
  if(abs(dmy) > 1) {
    my += dmy * easing;
  }
   
  //cursor
  stroke(0);
  strokeWeight(2);
  strokeCap(SQUARE); 
  line(mx-20, my, mx+20, my);
  line(mx, my-20, mx, my+20);
   
  //purple to lime
   if (foundPurple == true) {
     fill(0);
   text(tlime, 400, 20, 70, 70);
  }else if (foundPurple == false){
    fill(0);
    text(tpurple, 400, 20, 70, 70);
  }
}
 
void pageThree(){
     
     background(backgroundColor);
  noCursor();
     
  //color change
  if (frameCount % 60 == 0){
    float r = random(0, 360);
    c1color = color(r, 100, 100);
  }
 
  //circle color and motion
  fill(c1color);
  noStroke();
  ellipse(x, y, radius, radius);
  x += speedX * directionX;
   
  if ((x > width-radius) || (x < radius)) {
    directionX = -directionX;
  }
  y += speedY * directionY;
  if ((y > height-radius) || (y < radius)){
    directionY = -directionY;
  }
 
  //mouse easing
  targetX = mouseX;
  mouseX = constrain(mouseX, 0, width); //mouse or target
  float dmx = targetX - mx;
  if(abs(dmx) > 1) {
    mx += dmx * easing;
  }
 
  targetY = mouseY;
  mouseY = constrain(mouseY, 0, height); //constrain either mouse or target
  float dmy = targetY - my;
  if(abs(dmy) > 1) {
    my += dmy * easing;
  }
   
  //cursor
  stroke(0);
  strokeWeight(2);
  strokeCap(SQUARE); 
  line(mx-20, my, mx+20, my);
  line(mx, my-20, mx, my+20);
   
  //lime to hotpink
   if (foundLime == true) {
     fill(0);
   text(thotpink, 400, 20, 70, 70);
  }else if (foundLime == false){
    fill(0);
    text(tlime, 400, 20, 70, 70);
  }
}
 
void pageFour(){
     
     background(backgroundColor);
  noCursor();
     
  //color change
  if (frameCount % 50 == 0){
    float r = random(0, 360);
    c1color = color(r, 100, 100);
  }
 
  //circle color and motion
  fill(c1color);
  noStroke();
  ellipse(x, y, radius, radius);
  x += speedX * directionX;
   
  if ((x > width-radius) || (x < radius)) {
    directionX = -directionX;
  }
  y += speedY * directionY;
  if ((y > height-radius) || (y < radius)){
    directionY = -directionY;
  }
 
  //mouse easing
  targetX = mouseX;
  mouseX = constrain(mouseX, 0, width); //mouse or target
  float dmx = targetX - mx;
  if(abs(dmx) > 1) {
    mx += dmx * easing;
  }
 
  targetY = mouseY;
  mouseY = constrain(mouseY, 0, height); //constrain either mouse or target
  float dmy = targetY - my;
  if(abs(dmy) > 1) {
    my += dmy * easing;
  }
   
  //cursor
  stroke(0);
  strokeWeight(2);
  strokeCap(SQUARE); 
  line(mx-20, my, mx+20, my);
  line(mx, my-20, mx, my+20);
   
  //lime to hotpink
   if (foundHotpink == true) {
     fill(0);
   text(tazure, 400, 20, 70, 70);
  }else if (foundHotpink == false){
    fill(0);
    text(thotpink, 400, 20, 70, 70);
  }
}
 
void pageFive(){
     
     background(backgroundColor);
  noCursor();
     
  //color change
  if (frameCount % 40 == 0){
    float r = random(0, 360);
    c1color = color(r, 100, 100);
  }
 
  //circle color and motion
  fill(c1color);
  noStroke();
  ellipse(x, y, radius, radius);
  x += speedX * directionX;
   
  if ((x > width-radius) || (x < radius)) {
    directionX = -directionX;
  }
  y += speedY * directionY;
  if ((y > height-radius) || (y < radius)){
    directionY = -directionY;
  }
 
  //mouse easing
  targetX = mouseX;
  mouseX = constrain(mouseX, 0, width); //mouse or target
  float dmx = targetX - mx;
  if(abs(dmx) > 1) {
    mx += dmx * easing;
  }
 
  targetY = mouseY;
  mouseY = constrain(mouseY, 0, height); //constrain either mouse or target
  float dmy = targetY - my;
  if(abs(dmy) > 1) {
    my += dmy * easing;
  }
   
  //cursor
  stroke(0);
  strokeWeight(2);
  strokeCap(SQUARE); 
  line(mx-20, my, mx+20, my);
  line(mx, my-20, mx, my+20);
   
  //lime to hotpink
   if (foundAzure == true) {
     fill(0);
   text(ttangelo, 400, 20, 70, 70);
  }else if (foundAzure == false){
    fill(0);
    text(tazure, 400, 20, 70, 70);
  }
}
 
void pageSix(){
     
     background(backgroundColor);
  noCursor();
     
  //color change
  if (frameCount % 40 == 0){
    float r = random(0, 360);
    c1color = color(r, 100, 100);
  }
 
  //circle color and motion
  fill(c1color);
  noStroke();
  ellipse(x, y, radius, radius);
  x += speedX * directionX;
   
  if ((x > width-radius) || (x < radius)) {
    directionX = -directionX;
  }
  y += speedY * directionY;
  if ((y > height-radius) || (y < radius)){
    directionY = -directionY;
  }
 
  //mouse easing
  targetX = mouseX;
  mouseX = constrain(mouseX, 0, width); //mouse or target
  float dmx = targetX - mx;
  if(abs(dmx) > 1) {
    mx += dmx * easing;
  }
 
  targetY = mouseY;
  mouseY = constrain(mouseY, 0, height); //constrain either mouse or target
  float dmy = targetY - my;
  if(abs(dmy) > 1) {
    my += dmy * easing;
  }
   
  //cursor
  stroke(random(255), random(255), random(255));
  strokeWeight(6);
  strokeCap(SQUARE); 
  line(mx-20, my, mx+20, my);
  line(mx, my-20, mx, my+20);
   
  //lime to hotpink
   if (foundTangelo == true) {
     fill(0);
   text(win, 400, 20, 70, 70);
  }else if (foundTangelo == false){
    fill(0);
    text(ttangelo, 400, 20, 70, 70);
  }
}



