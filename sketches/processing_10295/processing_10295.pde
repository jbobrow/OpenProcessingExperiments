
/*
Recursive tree
author: 
Ricky Lai
concept:
"SAKURA" during night time

Main Constructor refered from:
"tree_recursion" by "mitchell whitelaw" 
on OpenProcessing
url: http://www.openprocessing.org/visuals/?visualID=8752

Change some parameters for visual effect.

Add bloom on the end of the branch.
ideas from "Branching" by "Jed Savage"
on OpenProcessing
url: http://www.openprocessing.org/visuals/?visualID=5918

*/

void setup(){
  size(600,600);
  colorMode(RGB, 255);
  smooth();
  noLoop();
}

void draw(){
  background(0);
  strokeWeight(5);
  pushMatrix();// save position (0,0)
  translate(width/2,height-20);// the position of the root
  branch(0);
  //popMatrix();
  //noStroke();
  //fill(255,50);
  //rect(0,0,width,height);
  //printMatrix();
}

void branch(int depth){
  int[][] position = new int[99][99];
  if (depth == 12) {// add bloom
    float bloomSize = random(10,100);
    float colorGB = random(50,100);
    float colorALPHA = random(100,220);
    color c = color(random(50,255), colorGB, colorGB);
    noStroke();
    fill(c, colorALPHA); 
    ellipse(0, 0, bloomSize, bloomSize); 
  }
  if (depth < 12) {
    /*
    color[] c = new color[3];
    c[0] = color(255,100,100);
    c[1] = color(100,100,100);
    c[2] = color(100,100,100);
    int result = int(random(0,2));
    */  
    //color a = int(random(100,255));
    stroke(255,150); 
    line(0, 0, 0, -height/10);// draw a branch
    {
      translate(0,-height/10);
      rotate(random(-0.2,0.2)); 

      if (random(1.0) < 0.7){ // branching
        float angle = random(0.2, 0.4);
        //float angle = 0.3;  
        rotate(angle);
        scale(0.8);
        pushMatrix();
        // save position 
        // the end of last branch, start point for new branch.
        branch(depth + 1);
        popMatrix();
        // restore position 
        // restore position to generate new branch at other side.    
        rotate(-2 * angle);
        pushMatrix();
        branch(depth + 1);   
        popMatrix();        
      }
      else { // continue  
        branch(depth);
      }
    }
  }
}


void mouseReleased(){
  redraw(); 
}



