
void setup()
{
  size(400,400);
  

}
 
void draw()
{ 
    float g=random(50,70);
    float q=random(100,190);
    float s=random(180,250);
    float r=random(width);
    frameRate(2);
    noStroke();
    smooth();
    background(g,q,s);
    goldFish();
         for (int i=0; i<width; i+=20)
            {
              stroke(46,139,87);
              strokeWeight(10);
              float t=random(width);
              float h=random(200);
              bezier(t,400,t-15,h-50,t+15, h-75,t-15,t-200);
            } 


}

void goldFish()
{
    fill(238,154,0);
    ellipse(r,r,100,50);
    triangle((r+40),r,r+70,r-30,r+70,r+30);
    fill(g,q,s);
    triangle(r-25,r+10,r-70,r,r-55,r+10);
    stroke(0);
    strokeWeight(7);
    point(r-25,r-10);
}
