
/*
Hackpact Arte Generativo 2011
Dia 5

Martin Zumaya Hernandez
*/

float r = 20;
int R = 5;
color c1;
color c2;

void setup() {
  size(700, 400, P3D );
  colorMode(HSB);   
  background(30);
  c1 = color(90, 250, 250,65);
  c2 = color(150, 250, 250,65);
}

void draw() {

  lights();
  
  camera(0.0,20.0,165.0,
  0.0,0.0,0.0,
  0.0,0.0,-1.0);

  noStroke();

  for ( int i = 0; i < 10; i++) {  
    pushMatrix();  
    translate(20*r*cos(r), 20*r*sin(r), -30*i); 
    fill(c1);
    sphere(R);
    popMatrix();
  }
  
    for ( int i = 0; i < 10; i++) {  
    pushMatrix();  
    translate(20*r*cos(r), -20*r*sin(r), -30*i); 
    fill(c1);
    sphere(R);
    popMatrix();
  }

  
   for ( int i = 0; i < 10; i++) {  
    pushMatrix();  
    translate(-20*r*cos(r), 20*r*sin(r), -30*i); 
    fill(c2);
    sphere(R);
    popMatrix();
  }
  
   for ( int i = 0; i < 10; i++) {  
    pushMatrix();  
    translate(-20*r*cos(r), -20*r*sin(r), -30*i); 
    fill(c2);
    sphere(R);
    popMatrix();
  }

if( r >= 0){
  r -= 0.01;
}
  
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

