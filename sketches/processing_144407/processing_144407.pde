
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Jieun
// ID: 201420072

PFont font; 
int s = second();  
int m = minute();  
int h = hour();    

void setup() {
  size (600, 600);
  smooth();
  frameRate(10);
}

void draw() {
  line(s, 0, s, 30); 
  line(m, 30, m, 66); 
  line(h, 66, h, 100); 

  background (230); 
  noStroke (); 
  translate (width/2, height/2); 

  for (int i=0; i<360; i+=30) { 
    //draw a circle
    pushMatrix(); 
    fill(25, 25, 25); 
    ellipse (0, 0, 200, 200);
    popMatrix (); 

    //draw a min circle
    pushMatrix(); 
    rotate (radians(i)); 
    translate (0, 150); 
    fill(0); 
    ellipse (0, 0, 30, 30); 
    popMatrix (); 

    //draw a second
    pushMatrix(); 
    fill (255); 
    rotate (radians(6*second()-90)); 
    rect (0, 0, 100, 2, s); 
    popMatrix (); 
    //draw a min
    pushMatrix();
    fill (150); 
    rotate (radians(6*minute()-90)); 
    rect (0, 0, 120, 3, m); 
    popMatrix (); 
    //draw a hour
    pushMatrix(); 
    fill(255);
    rotate (radians(30*(hour()+minute()/60.0)-90));
    rect (0, 0, 90, 5, h); 
    popMatrix (); 

    //draw a center circle
    pushMatrix(); 
    fill (255, 255, 255);
    ellipse (0, 0, 20, 20); 
    popMatrix ();

    //Text 'time'
    noStroke(); 
    fill(random(255)); 
    textSize(random(250)); 
    textAlign(CENTER, CENTER); 
    text("Time", random(width), random(height));
  }
}
