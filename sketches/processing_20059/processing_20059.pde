
//Note: Click the mouse to change between types. 
int option = 3;
void setup()
{
  
  size(500,500);
  frameRate(30);
}

void draw()
{
  
  if(option ==1)
  {
    for(int i = 1; i <=500; i+=10)
    {
      for(int j = 1; j<=500; j+=10)
      {
        stroke(mouseX/2, (255-mouseX)/2, mouseY);
        ellipse(i,j, (.8*dist(i,j, mouseX,mouseY)), (.8*dist(i,j,mouseX,mouseY)));
        //ellipse(i,j, 250-mouseY, 5+((j-mouseY)/5+mouseY));
        strokeWeight(1);
      }
    }
  }
  if (option ==2)
  {
    //Inspiring Source: http://formandcode.com/code-examples/embedded-iteration
    background(200);
    for(int k=20; k<=width-20; k+=40)
    {
      for(int l=20; l<height-20; l+=40)
      {
        line(k,l, mouseX, mouseY);
      }
    }
  }
  if (option ==3)
  {
   // background(255);
   //float m = mouseX
  float mappedX =  map(mouseX, 0, width, 0,TWO_PI);
  background(200);
    for(int m=20; m<= width-20; m+=40)
    {
      for(int n=20; n<= height-20; n+=40)
      {
        //println(mouseX);
        //background(200);
        //line(m,n, mouseX, mouseX);
        float mouseDistance = dist(mouseX, mouseY, m,n);
        //println(mouseDistance + "is mouse distance");
        float translateDistance = map(mouseDistance, 0, 500, 0,TWO_PI);
        arc(m,n, 10,10, 0,translateDistance);
      }
    }
  }
}

void mousePressed()
{
  option++;
  if(option ==4)
  {
    option = 1;
  }
}


