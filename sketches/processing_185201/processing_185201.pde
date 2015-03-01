
//week 2 - assignment 
//All code by James Lamb 
//Slight start from https://processing.org/tutorials/p3d/ 

int blink = 0;
int x = 0;

void setup(){
  size(800,800,P3D);
}
void draw(){
  translate(width/2, height/2, 0);
  background(0);
  //text
  textSize(64);
  text("END OF LINE", -700, 0, 200);
  //blinking cursor
  strokeWeight(0);
  translate(0, 0, 200);
  if (x % 2 == 1){
  rect(-280, -52, 45, 55);
  }
  if (blink % 30 == 1){ 
  rect(-280, -52, 45, 55);
  x += 1;
  }
  blink += 1;
  
  //model settings
  strokeWeight(4);
  stroke(0,80,100,120);
  fill(0,36,71,100);
  scale (.5,.5,.5);
  lights();
  frameRate(60);
  //mouse track
  camera(-mouseX+400,-mouseY + 400,1000, 0,0,0,0,1,-1);
  
//2  
  beginShape();
  vertex(-100,-350,-100);
  vertex(-100,-250,100);
  vertex(100,-250,100);
  vertex(100,-350,-100);
  vertex(-100,-350,-100);
  endShape();
//1
  beginShape();
  vertex(-100,-350,-100);
  vertex(-100,-250,100);
  vertex(-250,-150,0);
  vertex(-300,-250,-200);
  vertex(-100,-350,-100);
  endShape();
//3
  beginShape();
  vertex(100,-350,-100);
  vertex(100,-250,100);
  vertex(250,-150,0);
  vertex(300,-250,-200);
  vertex(100,-350,-100);
  endShape();
//6
  beginShape();
  vertex(50,-50,200);
  vertex(-50,-50,200);
  vertex(-100,-250,100);
  vertex(100,-250,100);
  vertex(50,-50,200);
  endShape();
//7
  beginShape();
  vertex(100,-250,100);
  vertex(250,-150,0);
  vertex(250,0,50);
  vertex(50,-50,200);  
  vertex(100,-250,100);
  endShape();
//5
  beginShape();
  vertex(-100,-250,100);
  vertex(-250,-150,0);
  vertex(-250,0,50);
  vertex(-50,-50,200);
  vertex(-100,-250,100);
  endShape();
//8
  beginShape();
  vertex(250, -150,0);
  vertex(300,-250,-200);
  vertex(350, 50, -200);
  vertex(250, 50, 0);
  vertex(250,0,50);
  vertex(250, -150,0);
  endShape();
//4
  beginShape();
  vertex(-250, -150,0);
  vertex(-300,-250,-200);
  vertex(-350, 50, -200);
  vertex(-250, 50, 0);
  vertex(-250,0,50);
  vertex(-250, -150,0);
  endShape();
//11
  beginShape();
  vertex(250,50,0);
  vertex(250,0,50);
  vertex(50,-50,200);
  vertex(0,0,150);
  //note
  vertex(20,50,100);
  vertex(250,50,0);
  endShape();
//9
  beginShape();
  vertex(-250,50,0);
  vertex(-250,0,50);
  vertex(-50,-50,200);
  vertex(-0,0,150);
  //note
  vertex(-20,50,100);
  vertex(-250,50,0);
  endShape();
//10
  beginShape();
  vertex(-50,-50,200);
  vertex(50,-50,200);
  vertex(0,0,150);
  vertex(-50,-50,200);
  endShape();
//17
  beginShape();
  vertex(350,50,-200);
  vertex(250,50,0);
  vertex(200,200,0);
  vertex(300,250,-150);
  vertex(350,50,-200);
  endShape();
//12
  beginShape();
  vertex(-350,50,-200);
  vertex(-250,50,0);
  vertex(-200,200,0);
  vertex(-300,250,-150);
  vertex(-350,50,-200);
  endShape();
//16
  beginShape();
  vertex(250,50,0);
  vertex(200,200,0);
  vertex(50,200,100);
  vertex(20,50,100);
  vertex(250,50,0);
  endShape();
//13
  beginShape();
  vertex(-250,50,0);
  vertex(-200,200,0);
  vertex(-50,200,100);
  vertex(-20,50,100);
  vertex(-250,50,0);
  endShape();
//20
  beginShape();
  vertex(-100,250,100);
  vertex(100,250,100);
  vertex(50,300,50);
  vertex(-50,300,50);
  vertex(-100,250,100);
  endShape();
//18
  beginShape();
  vertex(-100,250,100);
  vertex(100,250,100);
  vertex(50,200,100);
  vertex(-50,200,100);
  vertex(-100,250,100);
  endShape();
//19
  beginShape();
  vertex(0,150,200);
  vertex(50,200,100);
  vertex(-50,200,100);
  vertex(0,150,200);
  endShape();
//15
  beginShape();
  vertex(0,0,150);
  vertex(0,150,200);
  vertex(50,200,100);
  vertex(20,50,100);
  vertex(0,0,150);
  endShape();
//14
  beginShape();
  vertex(0,0,150);
  vertex(0,150,200);
  vertex(-50,200,100);
  vertex(-20,50,100);
  vertex(0,0,150);
  endShape();
//end1
  beginShape();
  vertex(300,250,-150);
  vertex(200,200,0);
  vertex(150,350,-50);
  vertex(300,250,-150);
  endShape();
//end-1
  beginShape();
  vertex(-300,250,-150);
  vertex(-200,200,0);
  vertex(-150,350,-50);
  vertex(-300,250,-150);
  endShape();
//end2
  beginShape();
  vertex(150,350,-50);
  vertex(200,200,0);
  vertex(50,200,100);
  vertex(100,250,100);
  vertex(100,300,50);
  vertex(150,350,-50);
  endShape();
//end-2
  beginShape();
  vertex(-150,350,-50);
  vertex(-200,200,0);
  vertex(-50,200,100);
  vertex(-100,250,100);
  vertex(-100,300,50);
  vertex(-150,350,-50);
  endShape();
//end3
  beginShape();
  vertex(-50,300,50);
  vertex(-100,250,100);
  vertex(-100,300,50);
  vertex(-150,350,-50);
  vertex(150,350,-50);
  vertex(100,300,50);
  vertex(100,250,100);
  vertex(50,300,50);
  
  
  endShape();
  
  
  
  
  
}


