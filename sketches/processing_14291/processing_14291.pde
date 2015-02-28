
int x=500;
int y=300;
int radius = 161;
int z = 400;

void setup() {
  size(600,600);
  smooth();
  ellipseMode(RADIUS);

}

void draw() {
  background(230);
    noStroke();
  fill(217,191,166);
  quad(z,630,z+345,-250,600,0,600,600);
  
for ( int i=0; i<=height; i +=60){
  for (int o =0; o<=width; o +=60){
    fill(255);
    noStroke();
    ellipse(i,o,30,30);
  }
}
  

  //right background
  noStroke();
  fill(230);
  quad(360,0,500,0,600,150,460,150);

  stroke(230);
  strokeCap(SQUARE);
  strokeWeight(30);
  line(300,120,440,0);
  strokeWeight(20);
  line(290,30,420,0);


  //right center square
  noFill();
  strokeWeight(30);
  stroke(255,228,182);
  quad(167.65,396.69,305.57,446.89,355.77,308.97,217.85,258.76);
  stroke(255,203,113);
  quad(371.74,317.06,234.72,381.96,296.75,514.99,429.78,452.96);
  stroke(255,194,88);
  quad(385.61,318,347.62,460.15,489.39,498.14,527.38,356.36);
    stroke(255,216,149);
  quad(380.49,279.51,507.60,206.12,434.21,79.01,307.10,152.4);
      stroke(255,189,75);
  quad(393.37,289.39,535.15,327.38,573.14,185.61,431.36,147.62);
  stroke(255,177,41);
  quad(393.37,310.61,431.36,452.38,573.14,414.39,535.15,272.62);
  stroke(255,162,0);
  quad(396.21,300,500,403.79,603.79,300,500,196.21);


  strokeWeight(3);
  noFill();
  stroke(170);
  quad(120,40,60,40,-20,230,160,180);
  strokeWeight(1);
  quad(120,40,65.56,65.22,72.83,271.25,215.14,150.22);
  quad(120,40,93.44,93.8,228.39,249.65,263.24,66.11);
  quad(120,40,131.58,98.87,333.44,140.71,249.65,26.26);
  quad(120,40,159.56,85.12,355.16,20.01,198.9,-82.37);
  quad(120,40,118.3,-19.98,-73.89,-94.55,-18.81,83.95);


  stroke(255,194,88);///////////////change!@!!!!!!!!!!
  strokeWeight(30);
  line(10,190,90,600);

  //Circle

  stroke(100,50,255);
  strokeWeight(80);
  noFill();
  float d=dist(x,y,mouseX,mouseY);
  if(d<radius) {
    radius++;
  }
  else {
    noFill();
  }
  ellipse(x,y,radius,radius);
  strokeWeight(1);
  {

    
    
strokeWeight(110);
stroke(50);
line(-30,400,630,550);

strokeWeight(15);
line(290,550,600,620);}




if(keyCode==RIGHT){
    z++;}
    else if(keyCode == LEFT){
      z--;}else{
      noFill();}
      
      strokeWeight(70);
      stroke(20);
    line(z,630,z+345,-250);
}
void mousePressed() {
  radius=161;
}




