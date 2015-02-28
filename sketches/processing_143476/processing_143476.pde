
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Lee Sungbum
// ID: 201420097

float a = 50; 
float d = 1; 
float angle;

void setup() { 

  size(600, 600); 
  background(255); 

  //  noLoop();
} 

void draw() { 
  angle += 0.001;
  noStroke(); 
  fill(#e7f950, 100);
  rect(0, 0, width, height);  
  translate(width/2, height/2);
  for (int i = 75; i < width-25; i = i + 50) { 
    for (int j = 75; j < height-25; j = j + 50) { 
      rotate(angle);
      stroke(#23F73D); 
      strokeWeight(5); 
      noFill(); 
      ellipse(i, i, a, a);
    }
  }  

  a = a + d;
  if (a > 100) { 
    d = d * -1;
  } 
  if (a < 1) { 
    d = d * -1;
  }
} 


