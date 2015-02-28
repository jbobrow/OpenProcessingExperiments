
//splater inspired by http://www.openprocessing.org/sketch/44709


void setup () {
size (500, 600);
 
}
float speed;
 
void draw () {
  
  speed=abs(mouseX*1.15-pmouseX);
  println(speed);
 smooth();
 noStroke();
  float first_ellipse=speed;
  
   
  if (!mousePressed){
    
    fill (10, 10, 10, 10);
    ellipse (mouseX, mouseY, first_ellipse, first_ellipse);
  };
  
  if (mousePressed && (mouseButton == RIGHT)) {
  
 fill(random(225),50,random(150),random(150 ));
  ellipse(mouseX+random(-40,40),mouseY+random(-40,40), first_ellipse,first_ellipse);
  }
  noStroke();
   
  if(keyPressed){
    background(200) ;}
  
  if (mousePressed && (mouseButton == LEFT)) {
   
  stroke (10) ;
  fill(random(150),50,random(250),25);
  
  
 noStroke ();
 
 rect (250, 300, mouseX - 250, mouseY - 300) ;
 
  
 }
 
 }
