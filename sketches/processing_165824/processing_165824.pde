
void setup()
{
  size(800,800);
  float x3=random(0,255);
  background(130,255,255);

}
 
void draw()
{

  for(int y=0; y<=height*2; y+=60){
    for (int x= 0; x<=width*2; x+=60) {
noStroke();

      fill(255,x/4,x);       
triangle(x,y,x-15,y+15,x+15,y+15);
triangle(x+30,y,x+15,y+15,x+45,y+15);
triangle(x-15,y+15,x+15,y+45,x+45,y+15);

   
 
  }
}
}

