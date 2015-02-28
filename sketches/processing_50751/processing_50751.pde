
float angle = 0;
float x = 40;
 
  
void setup() {
 
  size(600, 600);
  smooth();
  background(255);
  frameRate(25);
  fill(random(50),random(45),random(193),120);
  strokeWeight(.3);
  
}
 
 
void draw() {
  translate(mouseX, mouseY);
  rotate(angle);
  ellipse(1,mouseY/3, x, x);
  angle += random(1);
  x-=1;
  if (x<0){
    x=50;
    }
    
    if (keyPressed == true) {
    background(255);
  }
}



void mouseDragged() {
  fill(random(255),random(255),random(255),175);
   triangle(mouseX+random(30),mouseY+random(30),random(40), random(40), random(40), random(40));
     fill(random(255),random(255),random(255),175);
  triangle(mouseX+random(30),mouseY+random(30),random(40), random(40), random(40), random(40));
  stroke(random(10,50),random(10,50),random(10,50),130);
  line(mouseX,mouseY+20,mouseX+50,mouseY+50);

   frameRate(150);
   
   
   if (mouseX>350 && mouseY> 350){
   frameRate(1500);
    strokeWeight(40);}
   else {
     strokeWeight(0.5);}

}
 

