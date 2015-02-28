
PImage android;
PImage battery;
PImage light;
boolean drawApllied = false;

void setup()
{
  size(300, 300);
  android = requestImage("Android.jpg");
  battery = requestImage("battery.jpg");
  light = requestImage("light.jpg");
}

void draw()
{
   if (android.width>0)
   {
     image(android, 0, 0, width, height);
   }
    filter(GRAY);
     
     for(int x = 0; x < width; x += 25)
     {
      line(x, 0, x, height); 
     }
     
     for (int y = 0; y < height; y += 25)
     {
      line (0,y,height,y); 
     }
     
     if (android.width>0)
     {
       image(battery, 0, 230, width/3, height/4);
       image(light, 0, 0, width/3, height/4);
     }
      //if (drawApllied == false)
        {
          float x = 50;
          float y = 55;
          float prevX = x;
          float prevY = y;
          strokeWeight(1);
          while (y < 300)
          {
            y += 10;
            x += random(-10,10);
            line(prevX, prevY, x, y);
            prevX = x;
            prevY = y;
          }
         // drawApllied = true;
         }
}


