
int numLights = 100;
Light[] lights = new Light[numLights];
   
void setup() {
  size(640, 360);
  noStroke();
  back();
  for (int i = 0; i < numLights; i++)
  {
     lights[i] = new Light();
  }
}


void back()
{
  background(0);
  fill(0,20,50);
  rect(0,5*height/10+10,width,height);
  fill(8,8,8);
  ellipse(100,50,150,150);
  fill(10,10,10);
  ellipse(100,50,120,120);
  fill(15,15,15);
  ellipse(100,50,90,90);
  fill(20,20,20);
  ellipse(100,50,60,60);
  fill(25,25,25);
  ellipse(100,50,40,40);
  fill(150,150,140);
  ellipse(100,50,20,20);
}

void draw() 
{ 
  back();
  for (int i = 0;i<numLights;i++)
  {
    lights[i].round();     
  }
}

class Light {
  float x, y, radius, c;
  boolean open = false;
  
  Light() 
  {
    radius = 2;
    x = random(6*width/10)+ width/10;
    y = random(height/10)+ 4*height/10;
  }
  
  void round()
  {
    change();
    if (open)
      display();
  }
  
  void display()
  {
    fill(50,50,0);
    ellipse(x,y,5,5);
    fill(200,200,0);
    ellipse(x,y,2,2);
    fill(250,250,250);
    ellipse(x,y,1,1);
    
    fill(40,40,40);
    ellipse(x,height/2+15,6,3);
    ellipse(x,height/2+25,8,2);
    ellipse(x,height/2+30,9,1);
    ellipse(x,height/2+32,11,1);
  }
  
  void change()
  {
      if ( open && random(1) > 0.9999)
        open = false;
      if ( !open && random(1) > 0.9999)
        open = true;
  }
  
}



