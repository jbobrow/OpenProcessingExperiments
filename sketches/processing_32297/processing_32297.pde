
 float colour1=random(0,0);
 float colour2=random(100);

void setup(){
  
  background(0);
  size (500,500);
  smooth(); 
   
}

void draw(){
   
 stroke(colour2,random(mouseX,mouseY),random(mouseX/10,mouseY),20);


  if(mousePressed == true) {
  fill(0);
  }
  else
  {
  fill (colour2,random(mouseX/5,mouseY/5),random(mouseX/5,mouseY),15);
  line (mouseX,mouseY,colour1,colour1);
 
 }   
}
   

