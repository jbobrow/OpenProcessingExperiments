
void setup(){
  size(800,500);
  noFill();
}
 
void draw()
{
  background(50);
  for(int i=0; i<1; i=i+10){
    float ax = random(mouseX); 
    float ay = random(mouseY);
    float bx = random(mouseX); 
    float by = random(mouseY);

    stroke(250,250,250); //

    bezier(0,0,ax,ay,bx,by,mouseX,mouseY);


  }
}
                
                
