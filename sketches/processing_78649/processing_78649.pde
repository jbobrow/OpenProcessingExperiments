
void setup () {
size (800, 700);
  
}
float speed;
  
void draw () {
   
  speed=abs(mouseX*2.15-pmouseX);
  println(speed);
 smooth();
  float first_ellipse=speed;
   
    
  if (!mousePressed){
     
    fill (234, 135, 50, 189);
    ellipse (mouseX, mouseY, first_ellipse, first_ellipse);
  };
   
  if (mousePressed && (mouseButton == LEFT)) {
   
 fill(random(68),205,random(155),random(255 ));
  ellipse(mouseX+random(-20,20),mouseY+random(-50,50), first_ellipse,first_ellipse);
  }
  noStroke();
    
  if(keyPressed){
    background(0) ;}
   
  if (mousePressed && (mouseButton == RIGHT)) {
    
  stroke (20) ;
  fill(random(150),34,random(222),120);
   
   
 noStroke ();
  
 rect (250, 225, mouseX - 130, mouseY - 130) ;
  
   
 }
  
 }

