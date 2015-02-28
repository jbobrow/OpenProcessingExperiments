
//   P = (A -> C B A-B-C),(C-> C B A-B-C),(B-> C B A-B-C),(-B -> C B A-B-C),(-C -> C B A-B-C) 



//http://processing.org/learning/topics/tree.html

float theta;   
float s = 100; 
void setup() {
  size(640, 640,P2D);
  smooth();
}

void draw() {
  background(0);
  frameRate(30);
  
  // angle 0 to 540 degrees based on the mouse position
  float a = (mouseX / (float) width) * 540f;
  // Convert it to radians
  theta = radians(a);
  //color determined by theta and random functions
 stroke(a,255-a,random(255)); 
  // Start the tree from:
  translate(width/2,height/1.50);
  // Draw a line 100 pixels
  
  line(0,0,0,-100);
  // Move to the end of that line
  translate(0,-100);
  // Start the recursive branching
  if(s<=200){
    //increase tree size
  if(key=='z'){
   s=s+1;
   //decrease tree size
   }else if (key=='x') {
     s=s-1;
   } 
   //pause at desired size
   if(key=='c'){
   s=s;
   }
  }
  branch(s);

}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one   
    h *=0.66;

  //exit condition when the length of the branch is 10 pixels or less
  if (h > 10) {
    pushMatrix();   
    rotate(theta);   // Rotate by theta
      //color determined by branch size and random functions
     stroke(h,255-h,random(255));
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches
    popMatrix();    
    
    // Repeat the same thing, only branch off to different sides
    pushMatrix();
    rotate(-theta/3);
    //color determined by branch size and random functions
    stroke(h,255,random(255));
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
     pushMatrix();
    rotate(-theta);
    //color determined by branch size and random functions
    stroke(255-h,h,random(255));
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
   
    pushMatrix();
    rotate(theta/3);
    //color determined by branch size and random functions
    stroke(h,random(255),255-h);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
   
    pushMatrix();
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}


