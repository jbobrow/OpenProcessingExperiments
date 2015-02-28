
SpriteObject[] images = new SpriteObject[11];
float timer = 0;
int imageIndex = 0;
int sphereCount = 50;

//used this float code from a topic page to start background. Changed colors and speed for my own since I couldn't get squares to work, this was a close second.
float [] sphereSize = new float [sphereCount];
float [] xPosition = new float [sphereCount];
float [] yPosition = new float [sphereCount];
float [] xSpeed = new float [sphereCount];
float [] ySpeed = new float [sphereCount];



void setup(){
 
 size(600,500);
 frameRate(3);
 for (int index = 0; index < 11; index += 1)
  {
    images[index] = new SpriteObject("image" + index + ".JPG");
  }

 for(int i=0; i<sphereCount; i++){
   sphereSize[i] = random(10,120);
   xPosition[i] = random(0,width);
   yPosition[i] = random(0, height);
   xSpeed [i] = random(-2,2);
   ySpeed [i] = random(-2,2);
   
       
  }
   
}

void draw()
{
  timer += 1;
  background(#667Df7);

for(int i=0; i<sphereCount; i++){
 xPosition[i] += xSpeed[i];
 yPosition[i] += ySpeed[i];
 
 if(xPosition[i]>width){
  xSpeed[i] *= -1;
}

if(xPosition[i]<0){
  xSpeed[i] *= -1;
}

if(yPosition[i]>height){
  ySpeed[i] *= -1;
}

if(yPosition[i]<0) {
  ySpeed[i] *= -1;
}

smooth();
fill(random(255));
noStroke();
ellipse(xPosition[i],yPosition[i],sphereSize[i],sphereSize[i]);

if (timer > 13)
  {
    imageIndex += 1;
    timer = 0;
  }
  
  if (imageIndex >= 10)
  {
    imageIndex = 0;
  }
  if (imageIndex < 0)
  {
    imageIndex = 10;
  }
    
  images[imageIndex].render();

}

}

void mousePressed()
{
if (mouseButton == LEFT)
  {
   imageIndex += 1;
  }
   
if (mouseButton == RIGHT)
{
  imageIndex -=1;
}
}


class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  PImage img;
  float rotation = 0.0;
  float s =.7;
  boolean loaded = false;
    
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
    
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width /2;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height /2;
      }
    }
       
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 450, 325, 750,500);
      popMatrix();
    }
  }
}


