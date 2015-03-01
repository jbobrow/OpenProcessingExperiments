
PImage buzz_bg;
PImage buzz_cropped;
float counter;
boolean lsd = false;

void setup()
{
  size(500,500);
  buzz_bg = loadImage("nasa_buzz.jpg"); 
  buzz_cropped = loadImage("nasa_buzz_cropped.png");
  colorMode(HSB);
}

void draw() 
{
  
  float amplitude = map(sin(counter), -1, 1, -50, 50);
  counter  += 0.01;
  if (lsd == true)
  {
   tint(random(255),250,250); 
   
  }  
  else {
   noTint(); 
  }
 
  
  image(buzz_bg, 0,0);
  
  //tint(100 ,100,300);
  if (mouseX >200 && mouseX < 320 && mouseY <300)
  {
  lsd = true;
  translate(width/2,height/2);
  for(int i=1; i<10; i++)
  {
  pushMatrix();
  //buzz_bg.filter(BLUR, i);
  //tint(i*30,360,300);
  scale(i/2);
  rotate(radians(30+counter*4*i*mouseX/40));
  //buzz_bg.filter(GRAY);
  image(buzz_cropped,0,0);
  popMatrix();
  }
  }
   else {
    lsd = false; 
  }
 
 

}


