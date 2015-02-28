
void setup () {
size (500, 600);

}
float speed;

void draw () {
 
  speed=abs(mouseX-pmouseX);
  println(speed);

 noStroke();
  float first_ellipse=speed;
 
 fill(random(0),50,random(150),250);
  ellipse(mouseX+random(-20,20),mouseY+random(-20,20), first_ellipse,first_ellipse);
 
  noStroke();
  
  if(keyPressed){
    background(200) ;}
 
  if (mousePressed) {
  
  stroke (10) ;
  fill(random(250),50,random(250),50);
 
 
 noStroke ();
 ellipse (mouseX,mouseY,40,40) ;
 
 if (mousePressed == true) {
    
    stroke(0, 50);
    
    line(mouseX, mouseY, width, mouseX);
    line(mouseX, mouseY, 0, mouseX);
    stroke(0);

    line(pmouseX, pmouseY, mouseX, mouseY);
  }
 
 }

 }



