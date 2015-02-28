
//This is my charachter for Interactive digital media 2.4.14
int a=230;
int b=200;//center 
int c=195;
int d=184;
int e=300;
int f=188;
int g=320;

int bWidth = 80;
int bHeight = 121;
int eWidth = 13;
int eHeight= 13;
int hWidth=50;
int hHeight=50;
//int width;
//int height;
//Oliver Olive
void setup() { 
  size(400, 400);//size of playing feild
  smooth();
  rectMode(CENTER);
}

void draw() {
  background(225);
  noStroke();
  fill(0);

  beginShape();//legleft
  vertex(a, b+3);//far up right
  vertex(c-2, b+3);//far up left
  vertex(d-4, e+5);//knee
  vertex(f-1, g+7);//bottom left
  vertex(192-2, g+7);//bottom right
  vertex(190-3, 290+9);//knee inside
  endShape();


  beginShape(); //left foot
  vertex(f-3, g+3);//top left
  vertex(180-5, 323+3);//bottom left
  vertex(192-3, 323+3);//bottom right
  vertex(192-3, g+3);//Top right
  endShape();


  beginShape();//legright
  vertex(170+6, b+6);//left top
  vertex(205+6, 170+6);//right top
  vertex(216+8, e+7);//knee
  vertex(212+6, g+8);//right bottom 
  vertex(210+6, g+9);//left bottom
  vertex(210+6, 290+9);//inside knee
  endShape();


  beginShape(); //Right foot
  vertex(212+6, g+6);
  vertex(220+10, 323+6);
  vertex(210+6, 323+6);
  vertex(210+6, g+6);
  endShape();


  fill(165, 159, 38);//shirt color

  ellipse(200, 220, bWidth, bHeight);//body 

  fill(255);
  ellipse(b, b, hHeight, hWidth);//head
  smooth();
  stroke(1);
  strokeWeight(1.5);

  ellipse(190, 200, eWidth, eHeight);//Left eye 
  ellipse(210, 200, eWidth, eHeight);//right eye

  fill(0);
  strokeWeight(1);
  ellipse(190, 200, 2, 2); //Eye ball left
  ellipse(210, 200, 2, 2);//Eye ball right
  //if(mouseX < c+8 && mouseX > 185-8){
  //ellipse(mouseX,b,3+1,3+1);//Moving Eye ball right
  //ellipse(mouseX+20+5,b,3+1,3+1);//moving left*
  //}else if(mouseX > c+4){
  //ellipse(c+4,b,3+1,3+1);
  //ellipse(215+4, b, 3+1,3+1);
  //}else if(mouseX < 185-4){
  //ellipse(186-4,b,3+1,3+1);
  //ellipse(206-4, b, 3+1, 3+1);
  //}


  beginShape();
  vertex(a, 210);//right arm 
  vertex(a, 240);
  vertex(210, 250);
  vertex(225, 235);
  endShape();
  beginShape();
  vertex(170, 210);//left arm 
  vertex(170, 240);
  vertex(190, 250);
  vertex(175, 235);
  endShape();
  fill(160, 17, 10);
  ellipse(b, 182, 40, 16);
  strokeWeight(1.5);
  line(b, 167, b, 180);

  if (mousePressed == true) {
    bWidth += 5;
    bHeight += 5;
 
    eWidth =20;
    eHeight =20;
    
    hWidth =60;
    hHeight =60;
    //fill(
    
  }
}




