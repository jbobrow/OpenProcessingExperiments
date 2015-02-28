
float theta = 25.0;                   // branch deformation per recursive loop
float minLength = 3.0;                // minimum branch length (connected to exit maneuvre)
float reduction = 0.66;               // reduce next step by amount (0.0 - 1.0)
int firstBranch = 250;                // length of first branch
int randomDeviation = 25;             // amount of deviation each recursive loop

PFont font;

void setup() {
  size(900, 900);
  smooth();
  stroke(1, 255, 40);
  strokeWeight(0.8);
  noLoop();
  background(0);
  font = loadFont("garamond.vlw");
  textFont(font);
}

void draw() {
  float firstBranchDev = random(-randomDeviation, randomDeviation);
  theta = radians(theta);
  translate(width/2, height);
  line(0, 0, firstBranchDev, -firstBranch); 
  translate(firstBranchDev, -firstBranch);
  branch(firstBranch);  
  resetMatrix();
  
  text("angle each step: " + round(degrees(theta)) + " degrees", width-250, height-100);
  text("branch reduct. / step: " + reduction, width-250, height-80);
  text("minimum branch length: " + minLength, width-250, height-60);
  text("deviation per recursion (x-coordinate): " + randomDeviation, width-250, height-40);
 
  save("l-system_t" + round(degrees(theta)) + "rd" + randomDeviation + ".jpg");
}

void branch(float h) {
  float xRight = random(-randomDeviation, randomDeviation); 
  float xLeft = random(-randomDeviation, randomDeviation);
  
  h *= reduction; 

  if (h > minLength) { 

    // make branches to the right 
    pushMatrix();                      
    rotate(theta);                    
    line(0, 0, xRight, -h);          
    translate(xRight, -h);          
    branch(h);                      
    xRight = 0;
    popMatrix();  
    
    // make branches to the left
    pushMatrix();                    
    rotate(-theta);                   
    line(0, 0, xLeft, -h);            
    translate(xLeft, -h);            
    branch(h);                       
    xLeft = 0;
    popMatrix();  
  }
}



