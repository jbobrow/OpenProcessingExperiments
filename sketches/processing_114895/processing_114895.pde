

SpriteObject[] myimage = new SpriteObject[10];
SpriteObject background = new SpriteObject("oceanfloor.jpg");
int index = 0;
float timer = 0;
int imageIndex = 0;
float i = 0;

// tweaked program from funprogramming.org
class Car {
  float x;
  float y;
  color c;
  
  Car(float carx, float cary, color carcolor ) {
    x = carx;
    y = cary;
    c = carcolor;
    
  }
  
  void drive(int speed) {
    x = x + speed;
    if(x > width) {
    x = 0;
    }
    fill(this.c);
    rect(x, y, 60, 35);
    fill(0, 0, 255);
    rect(x, y, 50, 20);
    fill(255, 255, 0);
    ellipse(x, y, 35, 15);
    
  }
}

Car[] cars = new Car[30];


void setup() {
  size(500, 400);
  for(int i =0; i<cars.length; i++)  {
cars[i] = new Car(20, random(height), color(random(255), random(255), random(255)));
}


size(500, 500);
myimage[0] = new SpriteObject ("oceanfloor.jpg");
myimage[1] = new SpriteObject ("skyfield.jpg");
myimage[2] = new SpriteObject ("volcano.jpg");
myimage[3] = new SpriteObject ("jungle.jpg");
myimage[4] = new SpriteObject ("narnia.jpg");
myimage[5] = new SpriteObject ("bikinibottom.jpg");
myimage[6] = new SpriteObject ("space.jpg");
myimage[7] = new SpriteObject ("bender.jpg");
myimage[8] = new SpriteObject ("arctic.jpg");
myimage[9] = new SpriteObject ("bolt.jpg");



background.w = width;
background.h = height;
background.x = width/2;
background.y = height/2;
  
for (int i = 0; i < 10; i += 1)
  {
    myimage[i].x = width / 2;
  }
  for (int i = 0; i < 10; i += 1)
  {
     myimage[i].y = height / 2;
  }
  for (int i = 0; i < 10; i += 1)
  {
     myimage[i].w = width;
  }
  for (int i = 0; i < 10; i += 1)
  {
     myimage[i].h = height;
  }
}

void keyReleased()
  {
    if (keyCode ==UP)
    {
      imageIndex += 1;
    }
    if(keyCode == RIGHT)
    {
      imageIndex -= 1;
   
    }
  }



 

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
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
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
       
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }

  
}

void draw() {
  background.render();
  if (imageIndex >= 10)
  { 
    imageIndex = 9;
  }
  if (imageIndex < 0)
  {
    imageIndex = 0;
  }
  myimage[imageIndex].render();
  frameRate(10);
  
  if (imageIndex == 0)
  {
    fill(255, 0, 0);
        textSize(55);
        text("Go!", 250, 250);
    for(int i=0; i<cars.length; i++) {
      cars[i].drive(i);
    }
   }
  if (imageIndex == 1)
  {
    for(int i=25; i<cars.length; i++) {
      cars[i].drive(i);
    }
  }
  if (imageIndex == 2)
  {
    fill(random(255), random(0), random(0));
        textSize(55);
        text("Everybody Burns!", 40, 250);
        fill(0, 50);
  
    for(int i=23; i< cars.length; i++) {
      cars[i].drive(i);
    }
    if (imageIndex == 3)
  {
    
    for(int i=17; i< cars.length; i++) {
      cars[i].drive(i);
    }
    
    if (imageIndex == 4)
    {
      for(int i=15; i< cars.length; i++) {
        cars[i].drive(i);
        
      }
         if (imageIndex == 5)
    {
      for(int i=13; i< cars.length; i++) {
        cars[i].drive(i);
      }
      
      if (imageIndex == 6)
    {
      for(int i=10; i< cars.length; i++) {
        cars[i].drive(i);
      }
        
           if (imageIndex == 7)
    {
      for(int i=7; i< cars.length; i++) {
        cars[i].drive(i);
      }
        
           if (imageIndex == 8)
    {
      for(int i=5; i< cars.length; i++) {
        cars[i].drive(i);
      }
        
           if (imageIndex == 9)
    {
      fill(255, 0, 0);
        textSize(35);
        text("Winner!", 250, 250);
      for(int i=3; i< cars.length; i++) {
        cars[i].drive(i);
        
        
      }


    }
    }
    }
    }
    }
    }
  }
  
  }
}



