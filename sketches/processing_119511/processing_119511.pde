
float timer =0;
PImage light;
PImage dark;
PFont ariel;
float angle = 0;
float speed = 1;
float x = 0;
float xneg = 0;

void setup()
{
  size(400,600);
  ariel = createFont("Ariel", 30);
  dark= requestImage("b_yuno.jpg");
  light= requestImage("g_yuno.jpg");
}

void draw()
{
 timer += 0.05;
 if (timer> 20)
 {
   timer  = 0;
 }
 if (timer < 5)
 {
   if(light.width > 0)
   {
     image(light, 0,0,width,height);
     filter(BLUR, 3);
   }
   x += 2;
   if (timer > 2)
   {
    fill(255,0,0);
    textSize(40);
    text("Caring",100,275, width,500);
   }
   if (timer >3)
   {
     fill(150,240,70);
     textSize(25);
     text("Smart",10,100,width,150);
   }
   if (timer > 3)
    {
    fill(0);
    textFont(ariel);
    text("Loving", 70,350, width, 200);
    }
     
    fill(0);
    textSize(7);
    text("Kind", 25,25, width, 200);
    
   pushMatrix();
  translate(x, 200);
  textFont(ariel);
  textAlign(CENTER);
  fill(0);
  text("Adorable", 0, 0, width, 200);
  textAlign(LEFT);
  popMatrix();
  }
  if (timer > 7)
  {
    if (dark.width > 0)
    {
      image(dark, 0, 0, width, height);
    }
    xneg -= 2;
  angle += 0.05;
  x += speed;
  fill(0,0,255);
  textSize(70);
  pushMatrix();
  translate(180, 255);
  rotate(angle);
  text("Staker", 0,0);
  popMatrix();
   
  fill(255,0,0);
  textSize(40);
  pushMatrix();
  translate(200, 100);
  text("Obsessive", 0,0);
  popMatrix();
   
  if (timer > 15)
  {
  pushMatrix();
  translate(x, 200);
  scale(x / 300);

  textAlign(LEFT);
  fill(140, 255,20);
  text("Controling", 150, 400, width, 200);
  textAlign(LEFT);
  popMatrix();
  }
   if (timer > 15)
  {
  pushMatrix();
  textSize(40);
  fill(25, 0, 255);
  text("Scary", 250, 390, width, 200);
  popMatrix();
  }
  fill(255,150,120);
  text("GOD",150,350,width,200);
  }
}

    
    
    

 



