
//Michael Yu- Colored Squares

float width, length;

void setup()
{
 size(1300,800);
 background(255); 
 smooth();
  noStroke();
  width= 50;
  length=50;
  mousePressed=false;
}




void draw()
{
  fill(random(200,255), random(200,255), random(200,255), random(0,100));
  rect(mouseX,mouseY,width,length);
  //if (mousePressed= true)
  //{
    //width=width+0.2;
    //length=length+0.2;
  //}
  //else {width=length=50;
  //}
  
  
 
}

