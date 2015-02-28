
void setup(){

  size (900,700,P3D);
  background (0);
  
}

void sunearth(){
 //sun
  translate (450,350);
  fill(250,200,0);
  noStroke();
  sphere(75);
  //ellipse(0,0,75,75);
  rotateY(radians(millis()/20));
  rotateX(radians(millis()/20));
  //fill (0,0,200);
  //ellipse(150,100,50,50);
  
}

void earthMoon(){
  
  translate(200,150);
  fill (0,0,200);
  noStroke();
  sphere(50);
  //ellipse(0,0,50,50);
  rotateY(radians(millis()/10));
  rotateX(radians(millis()/10));
 // fill(255);
  //ellipse(50,10,15,15);  
}

void moonsat(){
  translate (50,150);
  fill(255);
  noStroke();
  sphere(15);
//  ellipse(0,0,15,15);
  rotateY(radians(millis()/5));
  rotateX(radians(millis()/5));
  //fill (0,250,200);
  //ellipse(50,10,5,5);
}

void sat(){
translate(50,10);
fill (0,250,200);
noStroke();
sphere(5);
}

void draw() {
  
  background (0);
  sunearth();
  earthMoon();
  moonsat();
  sat();
}

