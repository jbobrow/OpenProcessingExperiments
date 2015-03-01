
float rectX, rectY, rectW, rectH;
float circle1X, circle1Y, circle2X, circle2Y;
float easing = 0.1;
float diam = 60;
PFont font ;
float a;
String t, f1, f2;
String typing = "";
String saved = "";
boolean state1, state2;
float diX;
float diY;
float offset = 0.05;
float l = 0;
float l2 = 0;
float r = 255;
float r2 = 255;


void setup(){
  size(600 ,600);
  smooth();
  font = loadFont ("agency.vlw");
  //font = creatFont ("AGENCYR.TTF");
  rectX = width/2;
  rectY = 2*height/5;
  a = 10;
  rectW = a * 40;
  rectH = a * 10;
  
  
  circle1X = width/4;
  circle1Y = 2*height/3;
  circle2X = 3*width/4;
  circle2Y = 2*height/3;

  t ="";
  
  r = 255;
  
  
}


void draw(){
  
  
  background(255);
  
  
  diX = width/2 - mouseX;//distance from mouse to center
  diY = height/2 - mouseY;
   
  //if (diX < 0) {//make negative positive
  //  diX = -diX; }
  //if (diY < 0) {
  //  diY = -diY; }
  
  
  fill(255);
  rectMode (CENTER);
  if (mouseX > width/2){
    rectX += ((width/2 - diX*offset) - rectX)*easing;} else {
      rectX += ((width/2 - diX*0.05) - rectX)*easing;}
  if (mouseY > width/2){
    rectY += ((width/2 - diY*offset) - rectY)*easing;} else {
      rectY += ((width/2 - diY*offset) - rectY)*easing;}
      
 
  rect(rectX, rectY, rectW, rectH);
  fill(0);
  textFont(font, 26);
  text("THE ULTIMATE ANSWER TO UNIVERSE", rectX, rectY - rectH);
  

 

  circle1X = width/30 + rectX/2;
  circle1Y = rectY*1.5;
  circle2X = width/11*5 + rectX/2;
  circle2Y = rectY*1.5;
  
  
  ellipse(circle1X, circle1Y,diam,diam);
  ellipse(circle2X, circle2Y,diam,diam);
  
  fill(255);
  textFont(font, 14);
  text("VERIFY", circle1X, circle1Y + circle1Y/80);
  text("RESET", circle2X, circle2Y + circle2Y/80);

  
  f1 = "ACCESS GRANTED";
  f2 = "SYSTEM RESET COMPLETE";
  
  
  
 
  
  if (state1 == true && state2 == false ){
    t = f1;} else if (state1 == false && state2 == true){
      t = f2;} 
  fill(0);
  textAlign(CENTER);
  textFont(font, 30);
  fill(255,0);
  noStroke();
  if (state1 == true ){r = r - 5;fill(0, 255, 0, r);} else{
    r = 255; }
  if (state2 == true ){r2 = r2 - 5;fill(255, 0, 0, r2);} else{
    r2 = 255; }
  rect(rectX, rectY, 2*width, rectH/3*2);
  
  if (state1 == true ){l = l + 5;fill(l);} else{
    l = 0; }
  // if (state2 == true ){l = l + 5;} else{
  //  l = 0;}
  if (state2 == true ){l2 = l2 + 5;fill(l2);} else{
    l2 = 0;}
  if (l == l2){ t = "";}
 // fill(l);
  text(t, rectX, rectY + height/80 );
  stroke(0);
  
  
  println(state1, state2, t, saved, l , l2, r, r2);
  
  fill(0);
   text(typing, rectX, rectY);
  
  
  
  
}

void mousePressed(){
  if(dist(mouseX, mouseY, circle1X, circle1Y) < diam/2){
     state1 = true; typing = "" ; saved = typing; l = l2 =0;  r = r2 = 255;
  }else{ state1 = false ;}
  
  
  
  if(dist(mouseX, mouseY, circle2X, circle2Y) < diam/2){
    state2 = true; typing = "";
  }else{ state2 = false ;}

}

void keyPressed(){
  

    typing = typing + key; 
 
  
}



