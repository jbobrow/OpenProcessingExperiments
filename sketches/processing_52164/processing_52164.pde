
void setup() {
size(800,800);
background(150);
smooth();

int x = -80;
int y = -80;

for(x=-60; x < 800; x += 80){
  for(y=-60; y < 800; y+= 80){

line(x,y, x,y+800);
line(x,y, x+800,y);

  float fat = random(75,115); //90
  float tall = random(75,115); //90
  
  float centerX = 200; //200
  float centerY = 200; //200
  float nose = random(15,40); //25
  float button = random(5,25); //15
  float shoeWidth = random(60,80); //70
  float shoeHeight = random(7,18); //15
  centerX = width/2;
  centerY = height/2;
  float rightHandX = random(centerX-150,centerX-50); //100
  float rightHandY = random(centerY-40,centerY+40); //180
  float leftHandX = random(centerX+50,centerX+150); //300
  float leftHandY = random(centerY-40,centerY+40); //180


pushMatrix();
translate(x,y);
scale(.25);

  //body
  noStroke();
  fill(25,19,19);
  ellipseMode(CENTER);
  ellipse(centerX,centerY,fat,tall);
  
  //hat
  bezier(centerX-25, centerY-fat/2-55, centerX-35, centerY-fat/2-105, centerX+35, centerY-fat/2-105, centerX+25, centerY-fat/2-55);
  rectMode(CENTER);
  rect(centerX,centerY-fat/2-50,70,10);
  noFill();
  stroke(25,19,19);
  strokeWeight(.5);
  arc(centerX-40,centerY-fat/2-85,40,30,PI,TWO_PI);
  
  
  //right arm
  stroke(25,19,19);
  noFill();
  strokeWeight(7);
  beginShape();
  curveVertex(centerX-fat/2+5,centerY-20);
  curveVertex(centerX-fat/2+5,centerY-20);
  curveVertex(centerX-fat/2-30,centerY);
  curveVertex(rightHandX,rightHandY);
  curveVertex(rightHandX,rightHandY);
  endShape();
  
  // right hand
   fill(25,19,19);
   line(rightHandX,rightHandY,rightHandX+10,rightHandY-15);
  line(rightHandX,rightHandY,rightHandX-10,rightHandY-20);
  line(rightHandX,rightHandY,rightHandX-21,rightHandY-13);
  line(rightHandX,rightHandY,rightHandX-23,rightHandY);
  line(rightHandX,rightHandY,rightHandX-15,rightHandY+10);
  ellipse(rightHandX,rightHandY,15,15);
 
  
  //left arm
    noFill();
  beginShape();
  curveVertex(centerX+fat/2-5,centerY-20);
  curveVertex(centerX+fat/2-5,centerY-20);
  curveVertex(centerX+fat/2+25,centerY);
  curveVertex(leftHandX,leftHandY);
  curveVertex(leftHandX,leftHandY);
  endShape();
  
  //left hand
  fill(25,19,19);
  line(leftHandX,leftHandY,leftHandX-10,leftHandY-15);
  line(leftHandX,leftHandY,leftHandX+10,leftHandY-20);
  line(leftHandX,leftHandY,leftHandX+21,leftHandY-13);
  line(leftHandX,leftHandY,leftHandX+23,leftHandY);
  line(leftHandX,leftHandY,leftHandX+15,leftHandY+10);
  ellipse(leftHandX,leftHandY,15,15);
  
  //nose
  noStroke();
  fill(175,10,24);
  ellipse(centerX, (centerY-fat/2-25), nose,nose);
  
  //pants
  fill(18,36,56);
  arc(centerX,centerY+5,fat+6,tall+10,0,PI);
 
  quad(centerX-fat/2+40,centerY+tall/2-25,centerX-fat/2+15,centerY+tall/2-25,centerX-fat/2+15,centerY+fat/2+50,centerX-fat/2+40,centerY+fat/2+50);//(170,220,195,220,195,295,170,295);
  quad(centerX+fat/2-40,centerY+tall/2-25,centerX+fat/2-15,centerY+tall/2-25,centerX+fat/2-15,centerY+fat/2+50,centerX+fat/2-40,centerY+fat/2+50);

  
  //palet: dirty pool towel
  //Buttons
  fill(224,240,255);
  stroke(25,19,19);
    strokeWeight(1);
  ellipse(centerX-fat/2+22, centerY+8, button,button);
  ellipse(centerX+fat/2-22,centerY+8,button,button);
  
 
  //shoes
  
  fill(224,240,200);
  noStroke();
  ellipseMode(CENTER);

  ellipse(centerX-fat/2+3,centerY+fat/2+50,shoeWidth,shoeHeight);
  ellipse(centerX+fat/2-3,centerY+fat/2+50,shoeWidth,shoeHeight);
  
  //palet: boom
    
    //sparkle
    noStroke();
    fill(42,232,12);
    beginShape();
    vertex(centerX-60,centerY-130);
    vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    endShape();

    fill(13,255,54);
    beginShape();
    vertex(centerX-60,centerY-130);
   vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    endShape();
    
    fill(124,255,0);
    beginShape();
    vertex(centerX-60,centerY-130);
   vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    endShape();
    
    fill(196,232,12);
    beginShape();
    vertex(centerX-60,centerY-130);
   vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    endShape();
    
    fill(255,242,13);
    beginShape();
    vertex(centerX-60,centerY-130);
    vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    vertex(random(centerX-80,centerX-40),random(centerY-150,centerY-110));
    endShape();


  
  

 
  popMatrix();

  }
}
}

