
//tryin to be interactive
//maria fang



int leftX=50;
int rightX=750;


void setup() {
  
  size(800,500);
  frameRate(10);
  smooth();
  
}


void draw() {

  background(255);
  
  //Left person
  if((keyPressed == true) && (key == 'z') && (leftX<400)) {
     leftX= leftX+20;
   }
  strokeWeight(6);
  stroke(0);
  line(leftX,370,leftX,400);
  fill(0);
  triangle(leftX,338,leftX-15,370,leftX+15,370);
  stroke(0);
  strokeWeight(4);
  noFill();
  ellipse(leftX,315,30,30);
  
  //Right person
  if((keyPressed == true) && (key == 'z') && (rightX>400)) {
     rightX= rightX-20;
   }
  
  strokeWeight(6);
  stroke(0);
  line(rightX,370,rightX,400);
  fill(0);
  triangle(rightX,338,rightX-15,370,rightX+15,370);
  stroke(0);
  strokeWeight(4);
  noFill();
  ellipse(rightX,315,30,30);
  
    
  //surprise
  if(dist(leftX, 315, rightX, 315) < 300 && dist(leftX, 315, rightX, 315)>=200) {
    fill(0);
    textSize(20);
    text("!", leftX, 280);
    text("!", rightX, 280);
  }
  
  //heart
  if(dist(leftX,315,rightX,315) <50 && dist(leftX, 315, rightX, 315) >=0) {
    fill(247,47,47);
    smooth();
    noStroke();
    fill(255,0,0);
    beginShape();
    vertex(400, 220); 
    bezierVertex(450, 155, 480, 220, 400, 270); 
    vertex(400, 220); 
    bezierVertex(350, 155, 320, 220, 400, 270); 
    endShape();
  }
  
  //text
  if(dist(leftX,315,rightX,315) <50 && dist(leftX, 315, rightX, 315) >=0) {
    for(int i=10; i<30; i +=5) {
      for(int j=30; j<190; j +=25) {
        if((j+25) >10) {
          i=i+5;
        }
          fill(247,47,47);
          strokeWeight(2);
          stroke(0);
          textSize(i);
          text("Happy Valentine's Day", 360-j, j);
    }
  }
 }
  
}


