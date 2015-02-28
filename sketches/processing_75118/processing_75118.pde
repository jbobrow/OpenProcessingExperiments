
void setup() {
  size (600,600,P3D);
}
 
void draw() {
  
  //general stuff
  smooth();
  
  //color background
  background(17, 166, 173);
  lights();

  //float x = mouseX;
  //float y = mouseY;
  noFill(); 
  
  pushMatrix ();
  stroke (204, 255, 51, 150);
  translate(mouseX,mouseY,-150);
  for (int diam = 10; diam < 2000; diam += 5) {
    rotate(radians(diam*2));
      ellipse (0, 0, diam, diam);
   // }
  }
  popMatrix();
  

  
  //start TESSERACT(s)
  pushMatrix();
  noStroke();
  //number of cubes
  int boxnum = 1;
  //spacing cubes
  int spacing = height / (boxnum);
  //size of box
  int boxsize = height / (boxnum + 5);
  //for: i starts at 0 and increases at every iteration until it becomes the boxnumber
  for (int i = 0 ; i < boxnum ; i ++) {
    // for: j starts at 0 and grows until it is like the boxnumber
    for (int j = 0 ; j < boxnum ; j++) {
      pushMatrix();
      //track where the mouse is...
      translate(mouseX, mouseY);
      //and move object according to that
      rotateY(radians(frameCount));
      rotateX(radians(frameCount));
      //rotateY(-float(height)/mouseX * PI);
      //rotateX(float(width)/mouseY * PI);
      fill(256*float(mouseX)/width,256-256*float(mouseX)/width,256/12*i, 100);
      //fill (80, 70, 40, 50);
      box(boxsize);
      //and move object against it
      rotateY(radians(frameCount/2));
      rotateX(radians(frameCount/2));
      fill(256*float(mouseX)/width,256-256*float(mouseX)/width,256/12*i, 200);
      box(boxsize - height/2);
      //finish cube
      popMatrix();
      
      //upon mouseclick tesseract is surrounded by energy sphere
      if (mousePressed == true) {
      //open sphere around tesseract
      pushMatrix(); 
      //track where the mouse is...
      translate(mouseX, mouseY);
      //and move object according to that
      rotateY(radians(frameCount));
      rotateX(radians(frameCount));
      //fill(256*float(mouseX)/width,256-256*float(mouseX)/width,256/12*i, 100);
      fill (256, 150, 100, 100);
      sphere (boxsize + height/8);
      popMatrix();
      }
      
    //finish Tesseract(s)
    popMatrix();
   }
  }
}
