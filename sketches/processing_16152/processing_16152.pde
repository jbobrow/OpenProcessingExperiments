
/* array of 20 Fireflies
   the flies are bouncing around and into eachother
   if you press a key, the body color will change
   if you click on the mouse, the flies will stop
   if you release the mouse, the flies will continue flying.
*/
Firefly [] Fireflies = new Firefly[20];

void setup()
{
  size(500,500);
  // noStroke();
  for(int i = 0; i<Fireflies.length; i++) 
  {
    Fireflies[i] = new Firefly (color(255,250,0), int(random(0,1000)), int(random(0,1000)), int(random(5,10)), int(random(5,10)));
  }
}

void draw() 
{
  background(30,62,30);
  scale(0.3);

  //The bouce between the Fireflies
  for (int i = 0; i < Fireflies.length; i++) 
  {
    Fireflies[i].move();
    Fireflies[i].display();
    for (int j = 0; j < Fireflies.length; j++) 
    {
      float distance = 
        dist(Fireflies[i].x_position,Fireflies[i].y_position,Fireflies[j].x_position,Fireflies[j].y_position);
      if (i!=j && distance < Fireflies[i].s*1.2+Fireflies[j].s*1.2)     //radius = 1.2
      {  
        float xi = Fireflies[i].x_speed;
        float yi = Fireflies[i].y_speed;

        Fireflies[i].x_speed = Fireflies[j].x_speed;
        Fireflies[i].y_speed = Fireflies[j].y_speed;

        Fireflies[j].x_speed = xi;
        Fireflies[j].y_speed = yi;
      }
    }
  }
}


