




void setup() {
  size(500,500);
  smooth();
  colorMode(RGB);
 
}
 
void draw() {
  background(0);
  translate(width/2, height/2);
  
   
// 1
  fill(255,255,255);
  noStroke();
  
 ellipseMode(CENTER);
 ellipse(0,0,15,15);
 

// 2
  pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(40,0);
  
  fill(250,256,256);
  ellipse(0,0,15,15);
  popMatrix();

//3  
  pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(60,0);
  
  fill(250,256,256);
  ellipse(0,0,10,10);
  popMatrix();
  
//4  
  pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(80,0);
  
  fill(250,256,256);
  ellipse(0,0,5,5);
  popMatrix();

//5
   pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(100,0);
  
  fill(250,256,256);
  ellipse(0,0,5,5);
  popMatrix();
  
//6

  pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(120,0);
  
  fill(250,256,256);
  ellipse(0,0,3,3);
  popMatrix();
  
//2.1  
  pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(0,40);
  
  fill(250,256,256);
  ellipse(0,0,15,15);
  popMatrix();

//3.1 
  pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(0,60);
  
  fill(250,256,256);
  ellipse(0,0,10,10);
  popMatrix();
  
//4.1
  pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(0,80);
  
  fill(250,256,256);
  ellipse(0,0,5,5);
  popMatrix();

//5.1
   pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(0,100);
  
  fill(250,256,256);
  ellipse(0,0,5,5);
  popMatrix();
  
//6.1

  pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(0,120);
  
  fill(250,256,256);
  ellipse(0,0,3,3);
  popMatrix();
  
  
  //2.2  
  pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(0,-40);
  
  fill(250,256,256);
  ellipse(0,0,15,15);
  popMatrix();

//3.2 
  pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(0,-60);
  
  fill(250,256,256);
  ellipse(0,0,10,10);
  popMatrix();
  
//4.2
  pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(0,-80);
  
  fill(250,256,256);
  ellipse(0,0,5,5);
  popMatrix();

//5.2
   pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(0,-100);
  
  fill(250,256,256);
  ellipse(0,0,5,5);
  popMatrix();
  
//6.2

  pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(0,-120);
  
  fill(250,256,256);
  ellipse(0,0,3,3);
  popMatrix();
   
    
  //2.3  
  pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(-40,0);
  
  fill(250,256,256);
  ellipse(0,0,15,15);
  popMatrix();

//3.3
  pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(-60,0);
  
  fill(250,256,256);
  ellipse(0,0,10,10);
  popMatrix();
  
//4.3
  pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(-80,0);
  
  fill(250,256,256);
  ellipse(0,0,5,5);
  popMatrix();

//5.3
   pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(-100,0);
  
  fill(250,256,256);
  ellipse(0,0,5,5);
  popMatrix();
  
//6.3

  pushMatrix();
  rotate(millis() * 0.0001 * TWO_PI);
  translate(-120,0);
  
  fill(250,256,256);
  ellipse(0,0,3,3);
  popMatrix(); 

//7
  pushMatrix();
  rotate(millis() * -0.0003 * TWO_PI);
  translate(100,100);
  
  fill(250,256,100);
  ellipse(0,0,5,5);
  popMatrix(); 
   
//8
  pushMatrix();
  rotate(millis() * -0.0003 * TWO_PI);
  translate(20,20);
  
  fill(250,256,100);
  ellipse(100,100,5,5);
  popMatrix();     
  
  //7.1
  pushMatrix();
  rotate(millis() * -0.0003 * TWO_PI);
  translate(-100,-100);
  
  fill(250,256,100);
  ellipse(0,0,5,5);
  popMatrix(); 
   
//8.1
  pushMatrix();
  rotate(millis() * -0.0003 * TWO_PI);
  translate(-120,-120);
  
  fill(250,256,100);
  ellipse(0,0,5,5);
  popMatrix();     
}

