
int pelota_x = 200;
int pelota_y = 150;
int pelota_dx = 2;
int pelota_dy = 2;
int pelota2_x;
int pelota2_y;

void setup()
{ 
  size (400, 300);
  background (255);
  smooth();
  
}

void draw()
{

  if (mousePressed) {
    stroke(255);
    fill(255);
    ellipse(mouseX, mouseY, 80, 80);
  } else {
    fill(random(255), random(255), random(255));
     ellipse(mouseX, mouseY, 50, 50);
   stroke(0);
   fill(random(255), random(255), random(255));
   ellipse(mouseX, mouseY, 30, 30);
  }
 

  
  
  pelota_x += pelota_dx;
  
  if (pelota_x > 400) 
  { 
    pelota_dx *= -1;
  }
  
   if (pelota_x < 0) 
  { 
    pelota_dx *= -1;
  }
  
   pelota_y += pelota_dy;
  if ((pelota_y > 300) ||(pelota_y < 0))
  { 
    pelota_dy *= -1;
   
  } 
   stroke(0);
   fill(random(255), random(255), random(255));
   ellipse(pelota_x, pelota_y, 20, 20);
   
  
}

void mouseClicked()
{
   pelota2_x += pelota_dx;
  
  if (pelota2_x > 400) 
  { 
    pelota_dx *= -1;
  }
  
   if (pelota2_x < 0) 
  { 
    pelota_dx *= -1;
  }
  
   pelota2_y += pelota_dy;
  if ((pelota2_y > 300) ||(pelota2_y < 0))
  { 
    pelota_dy *= -1;
   
  } 
 
}


