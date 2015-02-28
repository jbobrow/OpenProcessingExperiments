
int a = 15;

void setup(){
  size(500,500);
  background(#FFE7B7);
  smooth();
  noStroke();
}
 
void draw()
{
      
  for(int x=20;x <= width-20;x +=20)
    {
  for(int y=20;y <= height-20;y += 20)
      {
       
    ellipse(x,y,a,a);
    
    if(mousePressed == true){
      
    fill(random(mouseX),random(mouseY),random(255));
    
}
      }  
    }
}

