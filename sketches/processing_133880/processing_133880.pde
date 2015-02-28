
PFont font;
int ypos;
int xpos;
float opa;
int inc;
color col;
boolean el;

void setup(){
  col=color(0,0,200);
  font= loadFont("http://www.jaboston.com/agency.vlw");
  size(1000,100);
  smooth();
  textSize(60);
  ypos=70;//y position is 70
  frameRate(120);//fps
  el=false;
}

void draw(){
  background(255);
  if(el==true){
    col= color(int(random(255)),int(random(255)),int(random(255)));
    el=false;
  }
  inc++;
  xpos=inc/12;
  opa= mouseY*2.5;
  if(mousePressed){
    inc=0;
    el=true;
  }
  if(inc>1000){
//    fill(col,80);
    inc=1000;
    stroke(0,opa);
    line(100,ypos+20,450+xpos*4,ypos+20);
    fill(col,opa);
    ellipse(xpos*9,ypos-10,25,25);
  }
  else{
    fill(127,80);
    ellipse(mouseX,mouseY,25,25);
  }
  
  fill(col,opa);
  text("C",2*xpos,ypos);
  text("A",3*xpos,ypos);
  text("N",4*xpos,ypos);
  text("D",5*xpos,ypos);
  text("I",6*xpos,ypos);
  text("C",7*xpos,ypos);
  text("E",8*xpos,ypos);
  strokeWeight(5);
  line(100,ypos+20,450+xpos*4,ypos+20);
  println(inc);
}


