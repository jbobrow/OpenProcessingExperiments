
Julie julie;

void setup() {
  size (500, 500);
  smooth();
  
  //Initialize Julie object
  julie = new Julie(); //Initialize julie object in setup() by call constructor
}

void draw() {
  background(255);
  //operate Julie object
  julie.wiggleLegs();
  julie.display();
}

class Julie {    //Define a class below the rest of the program
  
  //Variables
  float centerX, centerY, distance, llegcX, rlegcX;
  int dir, ldir, rdir;
  
  
  Julie() {      //Constructor
  
  centerX = 250;
  centerY = 250;
  dir = 1;
   
  distance = 30;
   
  llegcX = centerX-20;
  ldir = 2; 
  rlegcX = centerX+20;
  rdir = 2;
  
  }
  
  void display() {
    ellipseMode(CENTER);
    
  /////////Body/////////////////////////////////////
  
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
      
  //Star
  noStroke();
  fill(255, 102, 51);
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

  
     
  ///////Arms & Legs///////////////////////////////////
  
  //Right arm
  stroke(0);
  strokeWeight(1);
  //line(120, 130, 100, 150);
  //line(centerX-40, centerY, centerX-60, centerY+20);
  line(centerX-40, centerY, centerX-60, constrain(mouseY, 150, 350));
      
  //Right hand
  //stroke(0); //black
  noStroke();
  fill(255, 102, 51); //Pick color!!!
  //ellipse(95, 155, 10, 10); the right hand stationary
  //ellipse(mouseX-65, mouseY+25, mouseX-150, mouseY-120); the right hand changing size
  //ellipse(centerX-65, centerY+25, 10, 10);
  ellipse(centerX-65, constrain(mouseY, 150, 350), 10, 10);
  
  /////////////////////
      
  //Left arm
  stroke(0);
  strokeWeight(1);
  //line(200, 130, 220, 150);
  //line(centerX+40, centerY, centerX+60, centerY+20);
  line(centerX+40, centerY, centerX+60, constrain(mouseY, 150, 350));
      
  //Left hand
  //stroke(0); //black
  noStroke();
  fill(255, 102, 51); //Pick color!!!
  //ellipse(225, 155, 10, 10); the left hand stationary
  //ellipse(mouseX+65, mouseY+25, mouseX-150, mouseY-120); the left hand changing size
  //ellipse(centerX+65, centerY+25, 10, 10);
  ellipse(centerX+65, constrain(mouseY, 150, 350), 10, 10);  
      
     
  
  /////////Legs & Feet/////////////////////////////////////    
      
  //Right leg
   noFill();
  stroke(0);
  //(center = 160, 130);
  //line(140, 160, 140, 345);
  //line(centerX-20, centerY+30, centerX-20, centerY+215);
    
    
  //arc1
  strokeWeight(1);
  //bezier(140, 160, 110, 160, 110, 200, 140, 200);
  bezier(llegcX, centerY+30, llegcX-distance, centerY+30, llegcX-distance, centerY+70, llegcX, centerY+70);
    
  //arc2
  strokeWeight(1);
  //(140, 200, 170, 200, 170, 240, 140, 240);
  //bezier(centerX-20, centerY+70, centerX+10, centerY+70, centerX+10, centerY+110, centerX-20, centerY+110);
  bezier(llegcX, centerY+70, llegcX+distance, centerY+70, llegcX+distance, centerY+110, llegcX, centerY+110);
    
  //arc3
  strokeWeight(1);
  //(140, 240, 110, 240, 110, 280, 140, 280)
  //bezier(centerX-20, centerY+110, centerX-50, centerY+110, centerX-50, centerY+150, centerX-20, centerY+150);
  bezier(llegcX, centerY+110, llegcX-distance, centerY+110, llegcX-distance, centerY+150, llegcX, centerY+150);
    
  //arc4
  strokeWeight(1);
  //(140, 280, 170, 280, 170, 320, 140, 320)
  //bezier(centerX-20, centerY+150, centerX+10, centerY+150, centerX+10, centerY+190, centerX-20, centerY+190);
  bezier(llegcX, centerY+150, llegcX+distance, centerY+150, llegcX+distance, centerY+190, llegcX, centerY+190);
    
  //arc5
  strokeWeight(1);
  //(140, 320, 110, 320, 110, 360, 140, 360);
  //bezier(centerX-20, centerY+190, centerX-50, centerY+190, centerX-50, centerY+230, centerX-20, centerY+230);
  bezier(llegcX, centerY+190, llegcX-distance, centerY+190, llegcX-distance, centerY+230, llegcX, centerY+230);
    
   
  //Right foot
  //stroke(0); //black
  noStroke();
  fill(255, 102, 51); //Pick color!!!
  //ellipse(135, 360, 10, 10); the right foot stationary
  //ellipse(mouseX-25, mouseY+215, mouseX-150, mouseY-120); the right foot changing size
  ellipse(centerX-25, centerY+230, 10, 10);
      
  ////////////////////////////////////////////////////   
    
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
  //bezier(centerX+20, centerY+30, c, centerY+30, c, centerY+70, centerX+20, centerY+70);
  bezier(rlegcX, centerY+30, rlegcX-distance, centerY+30, rlegcX-distance, centerY+70, rlegcX, centerY+70);
    
  //arc2
  strokeWeight(1);
  //(180, 200, 210, 200, 210, 240, 180, 240);
  //bezier(centerX+20, centerY+70, centerX+50, centerY+70, centerX+50, centerY+110, centerX+20, centerY+110);
  bezier(rlegcX, centerY+70, rlegcX+distance, centerY+70, rlegcX+distance, centerY+110, rlegcX, centerY+110);
    
  //arc3
  strokeWeight(1);
  //(180, 240, 150, 240, 150, 280, 180, 280)
  //bezier(centerX+20, centerY+110, centerX-10, centerY+110, centerX-10, centerY+150, centerX+20, centerY+150);
  bezier(rlegcX, centerY+110, rlegcX-distance, centerY+110, rlegcX-distance, centerY+150, rlegcX, centerY+150);
    
  //arc4
  strokeWeight(1);
  //(180, 280, 210, 280, 210, 320, 180, 320)
  //bezier(centerX+20, centerY+150, centerX+50, centerY+150, centerX+50, centerY+190, centerX+20, centerY+190);
  bezier(rlegcX, centerY+150, rlegcX+distance, centerY+150, rlegcX+distance, centerY+190, rlegcX, centerY+190);
    
  //arc5
  strokeWeight(1);
  //bezier(180, 320, 150, 320, 150, 360, 180, 360);
  //bezier(centerX+20, centerY+190, centerX-10, centerY+190, centerX-10, centerY+230, centerX+20, centerY+230);
  bezier(rlegcX, centerY+190, rlegcX-distance, centerY+190, rlegcX-distance, centerY+230, rlegcX, centerY+230);
    
      
  //Left foot
  //stroke(0); //black
  noStroke();
  fill(255, 102, 51); //Pick color!!!
  //ellipse(185, 360, 10, 10); the left foot stationary
  //ellipse(mouseX+25, mouseY+215, mouseX-150, mouseY-120); the left foot changing size
  ellipse(centerX+25, centerY+230, 10, 10);  
}
  
  void wiggleLegs() {
    distance = distance-ldir;
    if(distance>30||distance<-30) {
      ldir=ldir*-1;
    }
   
  distance = distance-rdir;
    if(distance>30||distance<-30) {
      rdir=rdir*-1;
    }  
   }
}

