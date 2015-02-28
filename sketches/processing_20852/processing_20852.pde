
//Julie Romano
//New Critter


float centerX = 0;
float centerY = 250;
 
int dir = 1;

  
void setup() {
  size (500, 500); //the size of perimeter
  smooth(); //turns on anit-alliasing, which smooths out some rough edges
}
  
void draw () {
  background (51, 255, 204); //turquoise
    
  ellipseMode(CENTER);
    
  //Body
  //stroke(0); //black
  noStroke();
  fill(245, 184, 0); //mango
  //ellipse(160, 130, 80, 80);
  ellipse(centerX, centerY, 80, 80);
    
  //Right eye
  stroke(0); //black
  fill(50); //almost black
  //ellipse(145, 125, 10, 10);
  ellipse(centerX-15, centerY-5, 10, 10);
    
  //Left eye
  stroke(0); //black
  fill(50); //almost black
  //ellipse(175, 125, 10, 10);
  //ellipse(175, 125, 10, 10);
  ellipse(centerX+15, centerY-5, 10, 10);
    
    
    
  //Beak
  //stroke(0);
  noStroke();
  fill(255, 102, 51); //purpley = 204, 51, 255
  //triangle(160, 160, 170, 140, 150, 140);
  triangle(centerX, centerY+30, centerX+10, centerY+10, centerX-10, centerY+10);
    
    
  //Hat
  //stroke(0);
  noStroke();
  fill(204, 255, 51); //lime
  //triangle(130, 100, 190, 100, 160, 50);
  triangle(centerX-30, centerY-30, centerX+30, centerY-30, centerX, centerY-80);
    
    
   
    
  //Right arm
  stroke(0);
  strokeWeight(1);
  //line(120, 130, 100, 150);
  line(centerX-40, centerY, centerX-60, centerY+20);
    
  //Right hand
  //stroke(0); //black
  noStroke();
  fill(255, 102, 51); //Pick color!!!
  //ellipse(95, 155, 10, 10); the right hand stationary
  //ellipse(mouseX-65, mouseY+25, mouseX-150, mouseY-120); the right hand changing size
  ellipse(centerX-65, centerY+25, 10, 10);
    
  //Left arm
  stroke(0);
  strokeWeight(1);
  //line(200, 130, 220, 150);
  line(centerX+40, centerY, centerX+60, centerY+20);
    
  //Left hand
  //stroke(0); //black
  noStroke();
  fill(255, 102, 51); //Pick color!!!
  //ellipse(225, 155, 10, 10); the left hand stationary
  //ellipse(mouseX+65, mouseY+25, mouseX-150, mouseY-120); the left hand changing size
  ellipse(centerX+65, centerY+25, 10, 10);
    
    
   
    
    
  //Right leg
  stroke(0);
  strokeWeight(1);
  //line(140, 160, 140, 345);
  line(centerX-20, centerY+30, centerX-20, centerY+215);
    
  //Right foot
  //stroke(0); //black
  noStroke();
  fill(255, 102, 51); //Pick color!!!
  //ellipse(135, 345, 10, 10); the right foot stationary
  //ellipse(mouseX-25, mouseY+215, mouseX-150, mouseY-120); the right foot changing size
  ellipse(centerX-25, centerY+215, 10, 10);
    
  //Left leg
  stroke(0);
  strokeWeight(1);
  //line(180, 160, 180, 345);
  line(centerX+20, centerY+30, centerX+20, centerY+215);
    
  //Left foot
  //stroke(0); //black
  noStroke();
  fill(255, 102, 51); //Pick color!!!
  //ellipse(185, 345, 10, 10); the left foot stationary
  //ellipse(mouseX+25, mouseY+215, mouseX-150, mouseY-120); the left foot changing size
  ellipse(centerX+25, centerY+215, 10, 10);
    
   
   
   
  //Star
  noStroke();
  beginShape();
  //vertex(150, 60); //A
  vertex(centerX-10, centerY-70);
  //vertex(160, 40); //B
  vertex(centerX, centerY-90);
  //vertex(170, 60); //C
  vertex(centerX+10, centerY-70);
  //vertex(150, 50); //D
  vertex(centerX-10, centerY-80);
  //vertex(170, 50); //E
  vertex(centerX+10, centerY-80);
  endShape(CLOSE);
    

centerX = centerX+3*dir;
   
  if(centerX>500||centerX<0){
    dir=dir*-1;
  }
  
}

