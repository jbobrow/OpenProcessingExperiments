
//this is a composition i made using offset horizontal lines and corresponding random length cubes. 
//then the image is overlayed with a top left weighted series of ellipses. 


Boolean Snap;
float x, y;
float ranHeight2;
float ranHeight;
int Tries = 70;
//this setup counter of 70 is a good middle ground number for this random compositon.

void setup() {
  size(700, 700);
  background(50);
  Snap = true;
  x = height/2+height/4;
  y = height/2+height/4;
  frameRate(20);
}
//dark grey background for good contrast.

void draw() {
  ranHeight = random(height);
  ranHeight2 = random(50);

  if (Snap) {
    if (Tries > 0) {
      strokeWeight(1);
      stroke(121, 95, 45);
      line(0, ranHeight, random(width), ranHeight);
//this is the setup for the brown lines.

      noStroke();
      
      fill(ranHeight, ranHeight, ranHeight/5, random(255));
      rect(width/2, ranHeight, 20, ranHeight2);
      
      fill(255, ranHeight, ranHeight/5, random(255));
      rect(width/3, ranHeight, 20, ranHeight2);
      
      fill(random(255),random(255),random(255), random(255));
      rect(width/4, ranHeight, 20, ranHeight2);
      
      fill(Tries, ranHeight, Tries, random(255));
      rect(width/6, ranHeight, 20, ranHeight2);
      
      fill(20, Tries, ranHeight, random(255));
      rect(width/7, ranHeight, 20, ranHeight2);
    
     fill(20, random(255), ranHeight, random(255));  
     rect(width/10, ranHeight, 20, ranHeight2);
     
      fill(20, random(255), ranHeight, random(255));
      rect(width/10+width/2, ranHeight, 20, ranHeight2);
      
      //these are the setups for the rectangles that line up and match eachother.


      fill(ranHeight-20,Tries,random(255), random(255));
      rect(width/7+random(600), ranHeight, 20, ranHeight2);
      // this set of ractangles are completely random.
    }
  }
  //else {
    x = x + random(-15, 10);
    y = y + random(-15, 10);
    //this is part of the "random walk" compostion but i modified it to tend towards the top left hand of the screen.
    
    fill(0, ranHeight, random(200), random(255));
    ellipse(x, y, random(50), random(50));
    //these are the ellipses that move across the screen.
 // }


  Tries--;
}

//void mousePressed() {
  //if (Snap) {
  // Snap= false;
 // }
  //else {
  //  Snap= true;
 // }
//}

//the void mousepress is inculuded in the code but i removed it under the guidelines of the assignnment//


