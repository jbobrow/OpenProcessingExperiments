
PFont font;
PImage starg;
PImage carn; 
PImage pop;

void setup() {
  smooth();
  size(640,480);
  background(253,218,198);
  starg=loadImage("stargazer.png");
  carn=loadImage("carnation.png");
  pop=loadImage("poppy.png");
 font=loadFont("Arwen-Regular-100.vlw");
   
 
}

void draw() {
pushMatrix();
  background(253,218,198);
  //translate(0,0);
  noFill();
  float x=random(0,width);
float y=random(0,height);
color ra= color((x*4),(x/2),(x*3),100);
  strokeWeight(x/1000);
  strokeCap(SQUARE);
  strokeJoin(BEVEL);
  rectMode(CENTER);
  rect(width/2,height/2,x,y);
  fill(ra);
  rect(width/2,height/2,y,x);
 //strokeWeight(x/10); 
  line(x,y,y,x);
  
  
  //flowers

  imageMode(CENTER);
 // filter(INVERT);

  image(starg, width/2,height/2,y/2,y/2);
  image(pop,135,height/2,x/2,x/2);
  image(carn,508,height/2,x/2,x/2);
  
  ellipse(width/2,height/2,200,200);
  ellipse(135,height/2,200,200);
  ellipse(508,height/2,200,200);
  strokeWeight(x/100);
  stroke(x/100);
  noFill();
    ellipse(width/2,height/2,300,300);
  ellipse(135,height/2,x/100,x/100);
  ellipse(508,height/2,x/100,x/100);
//   textFont(font,50);
//fill(0);
//textSize(50);
//  text("POOPER");
 popMatrix();
}
void mousePressed() {

  loop();
}

void mouseReleased() {
  
  noLoop();
}


