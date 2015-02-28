
void setup()
{
  size(500, 500);
  smooth();

}

void draw()
{
  background(255);
  noStroke();
  translate(width/2,height/2);
  
for (int i=0;i<360;i+=40) {


        float y = sin (radians(i))*100;//other than circle, ref to math equations!!
        float x = cos (radians(i))*100;
        
        x+=random(-1, 1);
        y+=random(-1, 1);
        
        fill(255, 0, 0);
        ellipse(x,y,10,10);
}        
}

