
float angleTerre;
float angleLune;
float angleMercure;

void setup() {
  size(400,400);
  smooth();
  frameRate(30);
  
  angleTerre = 0;
  angleLune = 0;
  angleMercure = 0;
}


void draw() {
  background(0);
  
  translate(width/2,height/2);
  fill(245,158,17);
  ellipse(0,0,50,50); // soleil 
  
  pushMatrix();
  rotate( radians( angleMercure ) );
  translate(35,0);
  fill(18,152,2);
  ellipse(0,0,10,10);
  popMatrix();
  
  rotate( radians ( angleTerre ) );
  translate(150,0);
  fill(17,197,245);
  ellipse(0,0,25,25); // terre
  rotate( radians( angleLune ) );
  translate(25,0);
  fill(173,187,191);
  ellipse(0,0,10,10);
  
  angleTerre = angleTerre + 1;
  angleLune = angleLune + 2;
  angleMercure = angleMercure -1;
}
