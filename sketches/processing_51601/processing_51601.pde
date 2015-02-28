

//Creates image "black" which is handled inside void setup
PImage black;

//Creates a random size for the ellipse
float varianceRadius = random(90);

//Creates a random x and y value for the ellipse
float varianceX = random(30);
float varianceY = random(30);

int count = 0;



void setup()
{
  size(1000,1000,P2D);
  background(0); 
  smooth();
  frameRate(50);
  
  //Creates the image "black" which is then called in to fade the screen to black
  black = createImage(width, height, RGB);
  black.loadPixels();

  for (int j = 0; j < black.pixels.length; j++) 
  {
    black.pixels[j] = color(0);
  }
  
  black.updatePixels();
}



void draw()
{
  noStroke();

  //If mouse is not pressed, images will begin to fade to black
  if (!mousePressed) 
  {
    tint(0, .001);
    image(black, 0, 0);
    filter(BLUR, 1);
   }

   //Creates a random opacity for the ellipse
   float varianceOpacity = random(70);
   
   
   //10% of the time the circle will be color, the other 90% it will be white
   float randomChance = random(100);
   
   if(randomChance <10)
   {
       fill(random(255),random(255),random(255),varianceOpacity);
   }
   
   else
   {
       fill(255,varianceOpacity);
   }
   
   
   //Creates a random size of the radius 
   float varianceRadius = random(90);

   if(pmouseX == mouseX && pmouseY == mouseY)
   {
       count++;
       
   }
   
    if(count == 3)
   {
       varianceX = random(500);
       varianceY = random(500);
       
       ellipse(mouseX + random(500), mouseY + random(500),varianceRadius,varianceRadius);
       ellipse(mouseX + random(500), mouseY - random(500),varianceRadius,varianceRadius);
       ellipse(mouseX - random(500), mouseY - random(500),varianceRadius,varianceRadius);
       ellipse(mouseX - random(500), mouseY + random(500),varianceRadius,varianceRadius);
         
       count = 0;
   }
   
   else
   {
      varianceX = random(30);
      varianceY = random(30);
      ellipse((mouseX+varianceX)-varianceX/2,(mouseY+varianceY)-varianceY/2,varianceRadius,varianceRadius); 
   }
   
   
  //If a key is pressed the screen will restart to black
   if(keyPressed == true)
   {
       background(0);
   }
   

}




//if mouse is dragged the cicle explosion is in color
void mouseDragged()
{
  for(int i = 0; i < random(2); i++)
  {
    float ranRadius = random(10,50);
    fill(random(255),random(255),random(255),random(50,100));
    ellipse(mouseX + random(100), mouseY + random(100),ranRadius,ranRadius);
    ellipse(mouseX + random(100), mouseY - random(100),ranRadius,ranRadius);
    ellipse(mouseX - random(100), mouseY - random(100),ranRadius,ranRadius);
    ellipse(mouseX - random(100), mouseY + random(100),ranRadius,ranRadius);
  }
}

void mousePressed()
{
    for(int i = 0; i < random(2); i++)
  {
    float ranRadius = random(10,70);
    fill(225,random(50,100));
    ellipse(mouseX + random(100), mouseY + random(100),ranRadius,ranRadius);
    ellipse(mouseX + random(100), mouseY - random(100),ranRadius,ranRadius);
    ellipse(mouseX - random(100), mouseY - random(100),ranRadius,ranRadius);
    ellipse(mouseX - random(100), mouseY + random(100),ranRadius,ranRadius);
  }
}


