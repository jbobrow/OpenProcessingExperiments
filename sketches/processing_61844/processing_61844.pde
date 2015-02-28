
PFont minhafonte;
float h12;
PImage img;

void setup(){
  size(500,500);
  smooth();

minhafonte = createFont("AgencyFB-Reg-48", 50);
textFont(minhafonte, 10); 
img = loadImage("Timehand.jpg");
} 

void draw() {
  
  translate (width/3, height/2);
  
  
  background(255,255,255);
 image(img, -400, -600);
  

  float s = second();  
  float m = minute();  
  float h = hour();    
  h12 = h % 12;
  fill(100,40,90);
  text( h, 340-60, height/05);
  fill(20,150,255);
  text( m, 340-60, height/04);
  fill(30,100,200);
  text( s, 340-60, height/03.3);
   
   
  int escala = 360;
  
  s =   map (s, 0,59, 0, escala); 
  m =   map (m, 0,59, 0, escala);
  h =   map (h12, 0,12, 0, 360);
  
  // segundos
noStroke();
  float angleSeconds = radians(s);
  
pushMatrix(); 
  rotate(angleSeconds);
  fill(30,100,200,90);
  ellipse (10,50,20,-20);
popMatrix();

 // minutos
  
 
  float angleMinuts = radians(m);
pushMatrix();
  rotate(angleMinuts);
  fill(20,150,255,90);
  ellipse (100,5, 70, -70);
popMatrix();  


  // horas
  noStroke();
  int hH = (int) map (h,0,escala,0,360); 
  
  
   float angleHours = radians(h);
pushMatrix();
  rotate(angleHours);
  fill(100,40,90,90);
  ellipse (0,0, 40, -40);
  
  
popMatrix();  
  
}

