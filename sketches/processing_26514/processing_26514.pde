
// Created by Martin Höller

class Star
{
  float x;
  float y;
  float z;
  float velocity;
  float star_size;
  
  float screen_x;
  float screen_y;
  float screen_diameter;
  
  float old_screen_x;
  float old_screen_y;
  
  
  // Constructor  
  Star()
  {    
    randomizePosition(true);
  }
  
  void randomizePosition(boolean randomizeZ)
  {
    x = random(-width * 2, width * 2);
    y = random(-height * 2, height * 2);
    
    if(randomizeZ)
      z = random(100, 1000);
    else
      z = 1000;
      
    velocity = 3; //random(0.5, 5);
    star_size = random(2, 10);
  }
  
  void update()
  {
    
    if(mousePressed)
      z -= velocity * 10;
    else
      z -= velocity;
    
    screen_x = x / z * 100 + width/2;
    screen_y = y / z * 100 + height/2;
    screen_diameter = star_size / z * 100;
    
    if(screen_x < 0 || screen_x > width || screen_y < 0 || screen_y > height || z < 1)
    {
      randomizePosition(false);
    }
  }
  
  void display()
  {
    float star_color = 255 - z * 255 / 1000;
    fill(star_color);
    ellipse(screen_x, screen_y, screen_diameter, screen_diameter);   
  }
}

