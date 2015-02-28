

/*
Hackpact Arte Generativo 2011
Dia 17

Martin Zumaya Hernandez
*/

float a = 0;
float k = 5;
float C = 50;
float A = 50;
color cl,cl1,cll,cll1;
boolean ok = false;

void setup() {
  size(700, 700);  
  background(255);
  smooth();
  cl = color(C,A);
  cl1 = color(150,A);
  cll = color(C,A/4);
  cll1 = color(150,A/4);
}


void draw() {
  
  strokeWeight(1.5);
    
  pushMatrix();
  translate(width/2,height/2);
  lines(a, cl, cl1,60);
  popMatrix();
    
  pushMatrix();
  translate(width/4,height/4);
  lines(a, cll, cll1,40);
  popMatrix();
  
  pushMatrix();
  translate(3*width/4,height/4);
  lines(a, cll, cll1,40);
  popMatrix();
  
  pushMatrix();
  translate(3*width/4,3*height/4);
  lines(a, cll, cll1,40);
  popMatrix();
  
  pushMatrix();
  translate(width/4,3*height/4);
  lines(a, cll, cll1,40);
  popMatrix();
  
  a += 1;

  if ( radians(a) % TWO_PI == 0) {
    if( k > 2 ){
    k -= 1; 
    }
    if ( k <= 3){
      cl = color(255,0,0,220);
      cl1 = color(255,20);
     
      cll = color(255,0,0,150);
      cll1 = color(255,20);

    }
    a = 0;
  }
} 

void lines(float a, color cl, color cl1, float r2){
  
  float r1 = k*r2;
  float p = r1/r2;
  
  float r1p = -r1;
  float pp = r1p/r2;

  
  float x = (r1-r2)*sin(radians(a))-r2*sin(radians(a)*(p-1));
  float y = (r1-r2)*cos(radians(a))+r2*cos(radians(a)*(p-1));
  
  float x1 = (r1p-r2)*sin(radians(a))-r2*sin(radians(a)*(pp-1));
  float y1 = (r1p-r2)*cos(radians(a))+r2*cos(radians(a)*(pp-1));

  stroke(cl1);
  line(x1, y1, -x1, -y1);
  stroke(cl);
  line(x, y, -x, -y);
  
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

