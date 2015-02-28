
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
     
    fill (random (255), random(255),random(255));
    ellipse (mouseX, mouseY, first_ellipse, first_ellipse);
    fill (random(140),random(100),random(150));
    triangle(mouseX,mouseY, 75, 58, 20, 86, 75);
  };
   
  noStroke();
    
  if(keyPressed){
    background(200) ;}
   
  if (mousePressed && (mouseButton == LEFT)) {
    
  stroke(20);  
  text("Juju", 30, 570); 
   
  stroke (10);
  
line (mouseX, mouseY, mouseX - 250, mouseY - 300) ;
stroke(#FA4E6E);
 line (mouseX, mouseY, mouseX + 250, mouseY - 300) ; 
   
 }
  
 }



