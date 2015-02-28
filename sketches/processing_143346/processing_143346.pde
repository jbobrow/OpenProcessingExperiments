
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: YOU chahee
// ID: 201420092



float xW = 10; 
float direction = 5; 





void setup() { 
  size(600, 600); 
  background(600, 600, 600); 
  colorMode(RGB, 600);


  //  noLoop();
} 


void draw() { 

  noStroke(); 
  fill(255, 0, 0); // adds more transparency 
  rect(0, 0, width, height);  


  // grid filled with ellipses 




  translate(width/2, height/2);
  for (int i = 75; i < width-25; i = i + 50) { 
    for (int j = 75; j < height-25; j = j + 50) { 

       rotate(3.0);
      rect(-26, -26, 50, 50);
      rotate(6.0);
      rect(i, j, 50, 50);

      stroke(600, 600, 600); 
      strokeWeight(10); 
      noFill(); 
      ellipse(i, 30, 30, 30);
      strokeWeight(xW/10); 
      ellipse(i, 10, 30, 30);
      ellipse(i, 50, 30, 30);
    }
  }
} 
