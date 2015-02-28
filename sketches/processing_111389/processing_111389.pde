
//Code-Objects: For loops: Points3
//VIIRJ.COM, 2013 


void setup() {
  size(600, 600, P3D);
  fill(204);
  lights();
  smooth();
}


void draw() {


  //Camera control & Spinning !!!!
background(0);
 
  translate(width , height / 2, -width);
  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, -PI, PI));
  rotateZ(frameCount * 0.01);
  /* 
    
    rotateY(map(mouseX, 0, 700, height/2-47, height/2-50));
  rotateX(map(mouseY, 0, 900, width/2-50, width/2-47));
  // rotateZ(mouseX);
  //rotateZ(frameCount * 0.02);
*/

  //Change color on Click
  if (mousePressed) {
    fill(5);
    strokeWeight(0.7);
  } else {
    strokeWeight(2);
    fill(200);
  }
 



  // drawing points grid in scene
  for (float i=0; i<=width; i=i+22) {
    for (int j=0; j<=height;j=j+22) {
  for (float x=0; x<=600;x=x+10){
      stroke(255);
      //translate(i, j, i);
      point(i, j, x);
  
   
    }
    }
  }
 
}








