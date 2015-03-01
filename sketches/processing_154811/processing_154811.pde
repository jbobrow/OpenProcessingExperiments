
void setup(){
 
  size(500,500);

}
int a=85;
void draw(){
  
  background(0);
  
  translate(mouseX,mouseY);
  if(mousePressed == true)
  {
    a++;
    rotate(radians(-90));
    ellipse(a,4,19,19);
  }
  
  rect(0,0,20,50);
  rect(-1,-5,100,20);
 
 
}
