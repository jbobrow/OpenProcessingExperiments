
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Na me: JU Hwiyeon
// ID: 201420109

void setup() {  
  size(600, 600);
  smooth();
}

void draw() {  
 
   println(mouseX + " : " + mouseY);
 fill(0);
ellipse(188,174,20,20);
  
  background (0);
  //  ellipses  
  for (int i = -310; i < width; i = i +50) {  
  for (int j = -310; j < height; j = j +50 ) {  
      stroke(255);  
      strokeWeight(6);  
      noFill();  
      ellipse(i, j, 100, 100);
      ellipse(i, j, 50, 50);
    }
  }
 

  strokeWeight(100);
  fill(mouseX,mouseY,mouseY);
  stroke(255,128,192); 
  arc(width/2, height/2, 500, 400, 0, radians(15*hour()));


  
  fill(mouseY,mouseX,mouseX);
 strokeWeight(20);
  stroke(mouseY,mouseY,mouseX);
  arc(width/2, height/2, 130, 300, 0, radians(6*minute()));
 
  
  fill(255,255,0);
  strokeWeight(0);
  stroke(255,255,0);
  arc(width/4, height/4, 200, 200, 0, radians(6*second()));

//eye
 fill(0);
ellipse(188,174,20,20);

fill(255);
ellipse(276,429,20,20);
ellipse(317,435,20,20);
fill(0);
ellipse(274,423,10,10);
ellipse(316,431,10,10);

fill(255);
ellipse(562,273,15,15);
ellipse(559,292,15,15);
ellipse(191,176,5,5);

fill(0);
ellipse(557,269,7,7);
ellipse(553,290,7,7);


}

  
