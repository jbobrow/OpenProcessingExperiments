
int num = 12;
int radiusKreis = 200;
int radiusKreis2 = 195;
int s = 0;
int m = 0;
int h = 0;
int num2 = 60;
PFont f;
PImage b;

void setup() {
  size(500,500);
  rectMode(CENTER);
   f = loadFont("Helvetica-Bold-20.vlw");
   b = loadImage("hintergrund_grau.jpg");
   smooth();
  
}

void draw() {
  background(255);
  translate(width/2, height/2);  
  imageMode(CENTER);
  tint(255,127); 
  image(b,0,0);

    // STRICHLI
  for(int f = 0; f < num2; f++) {
    pushMatrix();  
      rotate(TWO_PI / num2 * f);
      translate(0, radiusKreis2);   
      stroke(0);
      strokeWeight(1);
      line(0,0,0,8);
    popMatrix();   
    
  }
  
  
     /// KREIS
    for(int i = 0; i < num; i++) {
    pushMatrix();  
      rotate(TWO_PI / num * i);
      translate(0, radiusKreis);  
      fill(#0705A5);
      noStroke();
      ellipseMode(CENTER);
      ellipse(0,0,32,40);
    popMatrix();  
  }
  
    // ZAHLEN
  textAlign(CENTER, CENTER);
  for(int k = 0; k < num; k++) {
    pushMatrix(); 
      rotate(TWO_PI / num * k);
      translate(0, -202);  
      fill(225);
      textFont(f,20);
     text(k==0? 12 : k, 0, 0);  // versteh ich nicht! und wo ist f???
    popMatrix();  
  }
   
 
  
  s = second();
  
    pushMatrix(); 
      rotate(TWO_PI / 60*s);
      strokeWeight(1);
      stroke(225,0,0);
      line(0,0,0, -190);
      stroke(0);
    
    popMatrix();  
    
    
 m = minute();
      
    pushMatrix(); 
      rotate(TWO_PI / 60*m);
      fill(0);
      triangle(-7, 10, 0, -190, 7, 10);
    
    popMatrix(); 
   
   
 h = hour();
      
    pushMatrix(); 
      rotate(TWO_PI / 12*h);
      rotate(TWO_PI / 12 / 60*m);
       fill(0);
      triangle(-7, 10, 0, -140, 7, 10);
    
    popMatrix();  
    

  }
  

  

