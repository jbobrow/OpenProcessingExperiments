
 /* 
   Model Experiments
   Recursive example, 3D Tree of sorts
   
   Natalia Monroy-Lopez
   Master of Digital Design
   University of Canberra
   
   */

import superCAD.*;  // library for importing obj files


int maxdepth = 10;  //max value for depth in the tree
float branchangle = 0.5;  // value of the angle at which the brnaches will grow
float scalefactor =0.92;  //the scale to be used in the sketch

void setup(){
  size(1280,720,P3D);  //screen size with a 3D rendering
  smooth();          // smooth is cool
  noLoop();          // calls no loop in order to have one tree at a time
}

void draw(){
  background(255);  // background colour
  lights();        //the light which will shade the 3D object
  translate(width/2,height/2); // moves all to the middle
  rotateX(5);  //it rotates in the x axis by 1
  rotateY(5);  //it rotates in the y 
  rotateZ(10); //it rotates in the z
  //beginRaw("superCAD.ObjFile","recursion_" + millis() +".obj");
  branch(0);  // calling the branch
  //endRaw();
}

void branch( int depth ){  // draws the branch
  if (depth < maxdepth){    // if the depth is lower than the maxdepth value grow a branch
    float branchlength = 50 + random(-20,100);  //the value for the length of the branches
 fill(255,random(100),random(200),50);        // colour of the branches
    strokeWeight(2);                        //thickness of the stroke
    stroke(100);                          //colour of the stroke
    box(branchlength);                // drawing a box (branch) with the branchlength
    translate(0,branchlength*0.9);   //translates the branches by the branchlength
    scale(scalefactor);              // scales the branches by the scale value

    if (random(1) < 0.8){    // if this value is true
     // rotateZ(0.05);
      branch(depth+1);      //grow a branch with the depth value plus 1
    } 
    
    else {                // otherwise run the following statements
      // branch
      rotateZ(branchangle);  //rotate in z the angle value
      rotateX(HALF_PI);      //rotate x the 1/2 pi value
      pushMatrix(); // save our place in the transform stack
      branch(depth + 1);
      popMatrix(); // restore our place in the stack
      // second branch
      rotate(branchangle); //rotate by the branchangle
      rotateX(PI);      //rotate x by the branchangle by pi
      pushMatrix(); // save our place in the transform stack
      branch(depth + 1);
      popMatrix(); // restore our place in the stack
   rotate(branchangle*-1);  //rotate by the branchangle time -1, for seconf branch to grow in the opposite direction
      rotateX(-HALF_PI/6);  //rotate x by negative 1/2 pi dived by 6
      pushMatrix(); // save our place in the transform stack
      branch(depth + 5);
      popMatrix();  
  }
  }
}

void mouseDragged(){    //when the mouse is dragged run the following 
  redraw();            //redraw the sketch because noLoop was called at the top
 //  scale(scalefactor);   // scale the tree with by the scalefactor value

}




