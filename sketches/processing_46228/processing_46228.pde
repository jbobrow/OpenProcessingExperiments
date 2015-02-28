
/*
Hackpact Arte Generativo 2011
Dia 16

Martin Zumaya Hernandez
*/


float ang = 0;
float a = 200;
float b = 0.5;
float c = 1;

void setup() {
  size(600, 600);
  colorMode(HSB);
  smooth();
  background(0);
}

void draw() {
  
//  fill(0,10);
//  rect(0,0,width,height);
  translate(width/2, height/2);
  strokeWeight(c);
  
  rotate(radians(ang*50));    
  noFill();
  
  points(a);
  points(a/2);
  points(a/8);  

  ang += 0.05;
}

void points(float a){
  for (int i = 0; i < 500; i += 1) {
    stroke(68+i/3*sin(ang),255,255,100);
    float x = a*(1+b*cos(ang)+cos(b*ang));
    float y = a*(b*sin(ang)+sin(b*ang));
    point(x,y);
    point(-x,y);
    point(x,-y);
    point(-x,-y);
  }  
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

