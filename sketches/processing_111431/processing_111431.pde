
float a,b,ainc,binc,weight,l;
 
void setup(){
  size(500,400);
  frameRate(5);
  ainc=random(.001,.2);
  binc=random(.001,.08);
  weight=random(.9,.9);
  l=200;
  strokeWeight(weight);
  smooth();
  background(174);
}
 
void draw(){
  translate(width/2,height/3);
  rotate(b);
  line(0+l*cos(a),0,0,0+l*sin(a));
  a=a+ainc;
  b=b+binc; 
}
 
void keyPressed(){
  a=0;
  b=0;
    ainc=random(.003,.4);
  binc=random(.005,.01);
  weight=random(.9,.6);
  l=200;
  strokeWeight(weight);
  background(500);
}



