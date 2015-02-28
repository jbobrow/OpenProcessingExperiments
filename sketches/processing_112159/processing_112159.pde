
//Composition (No.3)
// Su Hsiu Pai

void setup() {
   //canvas
   size(800,800);
   background(255); 
  
}

void draw() {
   //draw black vertical long lines
   stroke(0);
   strokeWeight(12);
   line(370,0,370,800);
   
   //draw black vertical short lines
   strokeWeight(12);
   line(80,510,80,800);
   
   strokeWeight(12);
   line(610,510,610,800);
   
   //draw b1ack horizontal long lines 
   
   stroke(0);
   
   strokeWeight(16);
   line(0,325,800,325);
   
   strokeWeight(16);
   line(0,510,800,510);
   
   //draw b1ack horizontal short lines 
   
   strokeWeight(14);
   line(372,750,605,750);
   
   
   //draw rectangles 
   
   //Red
   noStroke();
   fill(210,0,0);
   rect(0,0,364,317); 
     
   //Yellow
   noStroke();
   fill(255,219,0);
   rect(0,518,74,800); 
   
   //Blue
   noStroke();
   fill(25,25,112);
   rect(376,518,228,225);     

} 



