
float a=0;
float aS=0.0174;
float b=0.361;
float bS=0.0223;

void setup(){
  size(1000, 1000);
  smooth();
  background(255);
  noFill();
  colorMode(HSB);
  
}
  


void draw(){
  translate(width/2, height/2);
  //translate(cos(a)*500, sin(b)*500);
  
  rotate(a*5);
 scale(sin(a*.1)*2); //ohne dem schaut es auch gut aus
  
  //ellipse(0, 0, 100+80*tan(b), 100); //ist auch toll
  ellipse(0,0,300+80*cos(pow(b,2)),100); 
  stroke(150,155,155, BLUR*2);
  a += aS;
  b += bS;
}

