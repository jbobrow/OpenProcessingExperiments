
Head[] myHead;
float xpos = 400;
float ypos = 400;
float displacement;
float angle;
float speed = 0.1;

void setup()
{
  myHead = new Head[500];
  size(800,800);
  smooth();
  imageMode(CENTER);
  for(int i = 0; i<500; i+=1)
  myHead[i] = new Head();
}

void draw()
{
  background(100);
  for(int i=0; i<500; i+=1)
  {
  //if(displacement > 100)
  //;
  //else
  {
  myHead[i].reaction();
  myHead[i].display();
  }
  }
}

