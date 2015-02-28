
//Assignment 2.5  - Interactive Portrait w/variables

//portrait variable
int X = int(random(0,255));

//raindrop variable
int rainX = int(random(0,400));     //random position of raindrop
int rainY = 0;                      //initial position
int rainLength = int(random(1,80)); //random length of raindrop
int rainStroke = int(random(1,15));  //random width of raindrop
int rainAlpha = 128;
int rainSpeed = int(random(1,30));  //random speed of raindrop


void setup(){
  //set size, smooth it all and set framerate.
  size(400,400);
  smooth();
  frameRate(60);
}

void draw(){
  
  //paint background
  background(250,220,180);
  
  //real background with changing colours on blue-green palette
  noStroke();
  fill(frameCount/2,frameCount/4,X);
  beginShape();
  vertex(122,400);
  vertex(100,300);
  vertex(98,301);
  vertex(61,222);
  vertex(52,216);
  vertex(35,153);
  vertex(0,140);
  vertex(0,400);
  endShape();
  
  beginShape();
  vertex(320,400);
  vertex(304,297);
  vertex(327,216);
  vertex(334,221);
  vertex(368,167);
  vertex(400,167);
  vertex(400,400);
  endShape();
  
  //neck
  noStroke();
  fill(200,170,130);
  beginShape();
  vertex(100,300);
  vertex(170,360);
  vertex(230,355);
  vertex(300,300);
  vertex(240,370);
  vertex(120,400);
  endShape();
  
  //chasquilla 
  fill(0);
  beginShape();
  vertex(240,0);
  vertex(100,40);
  vertex(90,0);
  endShape();

  //hair left side
  stroke(0);
  fill(0);
  beginShape();
  vertex(100,0);
  vertex(60,180);
  vertex(50,140);
  endShape();
  
  beginShape();
  vertex(100,0);
  vertex(0,320);
  vertex(0,0);
  endShape();
  
  //hair right side
  beginShape();
  vertex(300,0);
  vertex(340,180);
  vertex(350,140);
  endShape();
  
  beginShape();
  vertex(300,0);
  vertex(400,320);
  vertex(400,0);
  endShape();
  
  //nose
  fill(200,170,130);
  noStroke();
  beginShape();
  vertex(230,230);
  vertex(200,245);
  vertex(190,240);
  endShape();
  
  //mouth
  fill(255);
  noStroke();
  float boca = map(mouseY,100,400,0,84);      //map function
  arc(200,290,70,boca,0,PI);  
  fill(255,0,0);
  float tongue = map(mouseX,80,320,0,120);
  arc(200,290,40,tongue,0,PI);
  
  
  //eyes
 
  //leftEye
  
  noFill();
  stroke(200,170,130);
  strokeWeight(2);
  arc(140,160,100,60,0,1.3);
 
  fill(255);
  float m = map(mouseX,0,400,164,195);      //map function
  triangle(140,160, m-10,130, 190,160);
 
  //rightEye
  noFill();
  stroke(200,170,130);
  strokeWeight(2);
  arc(260,160,100,60,1.7,3.1);
 
  fill(255);
  float y = map(mouseX,0,400,214,252);      //map function
  triangle(260,160, y+10,130, 210,160);
  
  //raindrop
  
  strokeWeight(rainStroke);
  fill(255);
  line(rainX,rainY,rainX,rainY+rainLength);
  
  
  if (rainY>399) {                        //rain flowing
    rainY=0;} else if (rainY < 399) {
      rainY=rainY+rainSpeed;}
  
}

//void rain(){
//  fill(0,0,255,127);
//  strokeWeight(3);
// line(10,10,10,30);
//}
  
  


