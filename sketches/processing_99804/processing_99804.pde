
void setup(){
size(400,400);
background(245,245,220);
}
void draw(){
  if(mousePressed==true){

float w = random(250);
float e = random(100);
float r = random(50);
float t = random(20);
  fill(w,e,r,100);  
  ellipse(mouseX,mouseY,15,15);
  noStroke();


  line(mouseX,mouseY,mouseX,mouseY);

  fill(w,e,r,100);  
  ellipse(mouseX,mouseY,15,15);

  if(keyPressed==true){
    fill(w,e,r,75);

   triangle(mouseX,mouseY,mouseX+40, mouseY+40,mouseX*2,mouseY*2);
   
  }
}
}
