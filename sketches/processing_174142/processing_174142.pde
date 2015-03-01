
float diam;
int num_objects = 50;
Star[] star_array = new Star[num_objects]; 

void setup() 
{
   size (500, 500);
   background(255);
   mouseX = (width/2);
   mouseY =(height/2);
   for(int i = 0; i< num_objects; i++)
  {
    star_array[i] = new Star();
  }
}
 
void draw() 
{
  
   stroke(200);
  for(int i = 0; i < num_objects; i++)
 {
   star_array[i].update();
   star_array[i].display();
 }
  
  
  diam = (random(5,20));
  stroke(200);
  line(mouseX, mouseY, (width/2), (height/2));
  ellipse(mouseX, mouseY, diam, diam);

}



class Star
{
  float x,y, vx,vy, grav, diam;
  float bounciness;
  
    Star()
    {
      x = random(width);
      y = random(height);
      diam = random(5,10);
      vx = random (0);
      vy = random(0);
      grav = 0;
    }
    


void update()
{
    vx += grav;
    x += vx;
    y += vy;    
}


void display()
{
  pushMatrix();
  translate(x,y);
  ellipse(0,0,diam,diam);
  popMatrix();
}


}
