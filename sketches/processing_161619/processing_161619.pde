
void setup(){
  
 size(1500,1500);
 background(0);
 
}

void draw()
{
  float x = mouseX ;
  float y = mouseY;
  translate(0,0);
  noStroke();
  fill(random(255),0,random(255), random(100));
  triangle(random(0,1500),random(0,1500),x-20,y+50,x+20,y+50);
  
  

}
