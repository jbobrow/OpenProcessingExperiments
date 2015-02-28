
//Julie Romano
//New Critter


float centerX = 250;
float centerY = 250;
 
int dir = 1;

  
void setup() {
  size (500, 500); //the size of perimeter
  smooth(); //turns on anit-alliasing, which smooths out some rough edges
}
  
void draw () {
  background(255);
  //background (51, 255, 204); //turquoise
    
  ellipseMode(CENTER);
    
  float a = random(0, 210);
  float b = random(250, 460);
  float c = random(40, 250);
  float d = random(290, 500); 

  
    
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
   noFill();
  stroke(0);
  //(center = 160, 130);
  //line(140, 160, 140, 345);
  //line(centerX-20, centerY+30, centerX-20, centerY+215);
  
  
  //arc1
  strokeWeight(1);
  //bezier(140, 160, 110, 160, 110, 200, 140, 200);
  bezier(centerX-20, centerY+30, a, centerY+30, a, centerY+70, centerX-20, centerY+70);  
  
  //arc2
  strokeWeight(1);
  //(140, 200, 170, 200, 170, 240, 140, 240);
  //bezier(centerX-20, centerY+70, centerX+10, centerY+70, centerX+10, centerY+110, centerX-20, centerY+110);
  bezier(centerX-20, centerY+70, b, centerY+70, b, centerY+110, centerX-20, centerY+110);
  
  //arc3
  strokeWeight(1);
  //(140, 240, 110, 240, 110, 280, 140, 280)
  //bezier(centerX-20, centerY+110, centerX-50, centerY+110, centerX-50, centerY+150, centerX-20, centerY+150);
  bezier(centerX-20, centerY+110, a, centerY+110, a, centerY+150, centerX-20, centerY+150);
  
  //arc4
  strokeWeight(1);
  //(140, 280, 170, 280, 170, 320, 140, 320)
  //bezier(centerX-20, centerY+150, centerX+10, centerY+150, centerX+10, centerY+190, centerX-20, centerY+190);
  bezier(centerX-20, centerY+150, b, centerY+150, b, centerY+190, centerX-20, centerY+190);
  
  //arc5
  strokeWeight(1);
  //(140, 320, 110, 320, 110, 360, 140, 360);
  //bezier(centerX-20, centerY+190, centerX-50, centerY+190, centerX-50, centerY+230, centerX-20, centerY+230);
  bezier(centerX-20, centerY+190, a, centerY+190, a, centerY+230, centerX-20, centerY+230);
  
 
  //Right foot
  //stroke(0); //black
  noStroke();
  fill(255, 102, 51); //Pick color!!!
  //ellipse(135, 360, 10, 10); the right foot stationary
  //ellipse(mouseX-25, mouseY+215, mouseX-150, mouseY-120); the right foot changing size
  ellipse(centerX-25, centerY+230, 10, 10);
    
    
    
    
    
    
    
    
  //Left leg
  stroke(0);
  strokeWeight(1);
  //line(180, 160, 180, 345);
  //line(centerX+20, centerY+30, centerX+20, centerY+215);
  
  //(center = 160, 130);
  //arc1
  noFill();
  strokeWeight(1);
  //bezier(180, 160, 150, 160, 150, 200, 180, 200);
  //bezier(centerX+20, centerY+30, centerX-10, centerY+30, centerX-10, centerY+70, centerX+20, centerY+70);  
  bezier(centerX+20, centerY+30, c, centerY+30, c, centerY+70, centerX+20, centerY+70);
  
  //arc2
  strokeWeight(1);
  //(180, 200, 210, 200, 210, 240, 180, 240);
  //bezier(centerX+20, centerY+70, centerX+50, centerY+70, centerX+50, centerY+110, centerX+20, centerY+110);
  bezier(centerX+20, centerY+70, d, centerY+70, d, centerY+110, centerX+20, centerY+110);
  
  //arc3
  strokeWeight(1);
  //(180, 240, 150, 240, 150, 280, 180, 280)
  //bezier(centerX+20, centerY+110, centerX-10, centerY+110, centerX-10, centerY+150, centerX+20, centerY+150);
  bezier(centerX+20, centerY+110, c, centerY+110, c, centerY+150, centerX+20, centerY+150);
  
  //arc4
  strokeWeight(1);
  //(180, 280, 210, 280, 210, 320, 180, 320)
  //bezier(centerX+20, centerY+150, centerX+50, centerY+150, centerX+50, centerY+190, centerX+20, centerY+190);
  bezier(centerX+20, centerY+150, d, centerY+150, d, centerY+190, centerX+20, centerY+190);
  
  //arc5
  strokeWeight(1);
  //bezier(180, 320, 150, 320, 150, 360, 180, 360);
  //bezier(centerX+20, centerY+190, centerX-10, centerY+190, centerX-10, centerY+230, centerX+20, centerY+230);
  bezier(centerX+20, centerY+190, c, centerY+190, c, centerY+230, centerX+20, centerY+230);
  
  
    
  //Left foot
  //stroke(0); //black
  noStroke();
  fill(255, 102, 51); //Pick color!!!
  //ellipse(185, 360, 10, 10); the left foot stationary
  //ellipse(mouseX+25, mouseY+215, mouseX-150, mouseY-120); the left foot changing size
  ellipse(centerX+25, centerY+230, 10, 10);
    
   
   
   
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
    

/*centerX = centerX+3*dir;
   
  if(centerX>500||centerX<0){
    dir=dir*-1;
  }*/
  
 
  
}

