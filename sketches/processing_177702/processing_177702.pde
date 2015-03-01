
color c;
float xpos;
float ypos;
float xspeed;
ArrayList<Car> carz = new ArrayList<Car>();
//boolean sketchFullScreen() {
//  return true;
//}

void setup()
{
 size(1920,1200);
xpos = 0;
ypos = width/2;
xspeed = 1;
for(int i = 1;i < 1000;i++){
  carz.add(new Car(int(random(width)),int(random(height)),int(xspeed + random(2))));
}
}

void draw()
{
  background(0);
 //background(255);
 //background(random(255),random(255),random(255));
 for (int i = 0; i < carz.size(); i++)
  {
    Car ca = carz.get(i);
    ca.drive();
    ca.display();
  }
}

class Car{
  color c = color(random(255),random(255),random(255));
  float xpos;
  float ypos;
  float xspeed;
  int lec = 1;
   Car(float x, float y, float sp)
   {
    xpos = x;
    ypos = y;
    xspeed = sp; 
   }
   void drive()
  {
   xpos = xpos + xspeed;
   if(xpos > width)
   {
    xpos = 0; 
   }
   if(xpos < 0)
   {
    xpos = width; 
   }
   
  }
  void display()
  {
    rectMode(CENTER);
    //fill(c);
   // fill(color(random(255),random(255),random(255)));
    fill(255);
    //fill(0);
    //fill(lec);
    stroke(255);
    lec += lec;
    if(lec > 255 || lec < 0){
      lec *= -1;
    }
    rect(xpos,ypos,xspeed,xspeed/2); 
    xspeed+=.1;
  }
}
