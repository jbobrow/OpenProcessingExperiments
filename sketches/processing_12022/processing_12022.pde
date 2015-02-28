
PImage img;

void setup(){
  size(400,400);
  smooth();
  frameRate(30);
  img = loadImage ("rainbow.png");
}
void draw(){
  ellipseMode(CENTER);
  rectMode(CENTER);
  //Bg sky
  background(141,211,235);
  //sky,sun,rain,rainbow
  if(mouseY > 300) {
    background(0);
    for (int i = 5; i < 400; i +=15) {
      for (int j = 5; j < 400; j +=15) {
        stroke(random(255));
        strokeWeight(1);
        line(i, j, i+5, j+5);
      }
    }
  }
    else {
        image(img, 0,55,400,180);
        filter(BLUR,1);
        stroke(255,213,50);  
        fill(230+random(25),50,50);
        line (315,60,385,120);
        line (315,120,385,60);
        ellipse(350,90,55+random(10),55+random(10));
        line (300,90,330,90);
        line (370,90,400,90);
        line (350,70,350,40);
        line (350,110,350,140);
        strokeWeight(3);
        stroke(255);
        strokeWeight(1); 
      }
  //rope
  fill(255,150,150);
  stroke(255,213,150);
  strokeWeight(2);
  line(mouseX,mouseY+43,100,0);
  //body
  fill(255,150,150);
  stroke(255,213,150);
  strokeWeight(2);
  fill(255);
  triangle(mouseX,mouseY+30,mouseX+60,mouseY+180,mouseX-60,mouseY+180);
  //head
  ellipse(mouseX,mouseY,80,80);
  //tie
  strokeWeight(3);
  line(mouseX+3,mouseY+43,pmouseX+5,pmouseY+83);
  fill(255,15,15);
  stroke(255,213,150);
  strokeWeight(2);
  triangle(mouseX,mouseY+43,mouseX+12,mouseY+35,mouseX+12,mouseY+51);
  triangle(mouseX,mouseY+43,mouseX-12,mouseY+35,mouseX-12,mouseY+51);
  ellipse(mouseX,mouseY+43,10,10);
  
  //eye,mouth
  stroke(0);
  strokeWeight(2);
  fill(255);
  if(mouseY < 300){
    arc(mouseX-15,mouseY-5,20,20,radians(200),radians(340));
    arc(mouseX+15,mouseY-5,20,20,radians(200),radians(340));
    arc(mouseX,mouseY,60,60,radians(20),radians(160));
  }
  else{
    line(mouseX-25,mouseY-10,mouseX-5,mouseY-10);
    line(mouseX+5,mouseY-10,mouseX+25,mouseY-10);
    
  }
}

