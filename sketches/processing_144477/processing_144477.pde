

// Konkuk University  


 // Department of Dynamic Media  


 // SOS iDesign  


// Name: LEE Daeun   


 // ID: 201420095  


int h;
int m,x,y;
int s,k;

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
  rotate(radians(90));
  smooth();
  noFill();
  frameRate(60);
}

void draw() {

  s = second(); 
  m = minute(); 
 h = hour(); 


  if (s == 0) 


    s = 1; 


  if (m == 0) 


    m = 1; 


  if (h == 0) 


    h = 1; 


  background(255);

  fill(255); 


  text(hour() + ":" + minute() + ":" + second(),100,100); 

  if (h > 12) {
    h  -= 12;
  }    

  background(0);
  translate(500,250);
  ellipse(width/2,height/2, 50, 50);


  stroke(15);
  for (int i = 450; i<1200; i+= 100) {
    ellipse(0, 0, i, i);
  }

  for (int i = 0; i<12; i++) {
    line(0,-175,0,-225);
    rotate(radians(30));
  }

  hourcircle();
  minutecircle();
  secondcircle();
}

void hourcircle() {
  strokeWeight(10);
  strokeCap(SQUARE);
  stroke(25);
  noFill();
  pushMatrix();
  rotate(radians(30 * h));
  ellipse(width/2,height/2, 350, 350);
  line(0, -175, 0, -125);
  popMatrix();
}

void minutecircle() {
  strokeWeight(10);
  strokeCap(SQUARE);
  stroke(50);
  noFill();
  pushMatrix();
  rotate(radians(6 * m));
  ellipse(width/2,height/2, 250, 250);
  line(0, -125, 0, -75);
  popMatrix();
}

void secondcircle() {
  strokeWeight(10);
  strokeCap(SQUARE);
  stroke(75);
  noFill();
  pushMatrix();
  rotate(radians(6 * s));
  ellipse(width/2,height/2, 150, 150);
  line(0, -75, 0, -25);
  popMatrix();
  
  
int s = second(); 


  int m = minute(); 


  int h = hour(); 


  


  if (h<12 || h==12) 


  { 


    k = h; 


  } 


  else 


  { 


    k = h-12; 


  } 

textAlign(CENTER); 


  if (m<10) 


  { 


    textSize(100); 

    fill(0); 
    text(k+":0"+m, x, y+20); 


  } 


  else { 


    textSize(55); 

    fill(0); 
    text(k+":"+m, x, y+20); 


  } 


  if (h<12 || h==12) { 


    textSize(20); 


    text("AM", x, y+40); 


  } 


  else 


  { 


    textSize(20); 


    fill(0); 


    text("PM", x, y+40); 


  } 


  


  textSize(50); 


  text(second(), 400, 325); 


} 







