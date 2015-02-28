
//Code-Objects: For loops: Points2
//VIIRJ.COM, 2013

void setup() {
  size(600, 600, P3D);
  smooth();
 


}

void draw() {
background(255);
  strokeWeight(55);
 
  // float fillVal = random(2);



  //camera movement
    
  rotateY(map(mouseY, 0, 700, height/2-47, height/2-50));
  rotateX(map(mouseX, 0, 900, width/2-50, width/2-47));
  // rotateZ(mouseX);
  //rotateZ(frameCount * 0.02);


  //Change point on Click
  if (mousePressed) {
 

    strokeWeight(35);
  } else {
 
    strokeWeight(5);

  }




  for (int i = 100; i<550; i=i+60) {
    for (int j = 100; j<550; j=j+60) {
      for (int x = 100; x<550; x = x+60) {
       
       fill(50);
          point(i, j, x);
 
      }
    }
  }
 
}



