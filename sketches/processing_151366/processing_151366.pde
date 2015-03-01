
class SideJumper

{
  PImage image;
  PVector position;
  float direction;
  PVector velocity;
  float jumpSpeed;
  float walkSpeed;
  float moveSpeed;
 

  
}
   
   
SideJumper blobDude;
SideJumper blueBar;
boolean hits;
float left;
float right;
float up;
float down; 
float gravity = .5;
PImage imgBar;
PImage LoseScreen;
Bar Bara;
Bar Barb;
   
float ground = 700;
   
void setup()
{
  size(800, 800);
  
     
  blobDude = new SideJumper();
  blobDude.image = loadImage("blobDude.png");
  blobDude.position = new PVector(400, ground);
  blobDude.direction = 1;
  blobDude.velocity = new PVector(0, 0);
  blobDude.jumpSpeed = 10;
  blobDude.walkSpeed = 4;
  
  imgBar = loadImage("BlueBar.png");
  LoseScreen = loadImage("LoseScreen.png");
  
  Bara = new Bar (800, 750, 6,0);
  Barb = new Bar (random (760), 0,0,6);

}
   
void draw()
{ if (hits==false){
  background(255);
  updateblobDude();
  Bara.draw();
  Bara.move();
  Barb.draw();
  Barb.move();
}
}




void updateblobDude()

{
   
  if (blobDude.position.y < ground)
  {
    blobDude.velocity.y += gravity;
  }
  else
  {
    blobDude.velocity.y = 0;
  }
     
  if (blobDude.position.y >= ground && up != 0)
  {
    blobDude.velocity.y = -blobDude.jumpSpeed;
  }
     
  blobDude.velocity.x = blobDude.walkSpeed * (left + right);
     
  PVector nextPosition = new PVector(blobDude.position.x, blobDude.position.y);
  nextPosition.add(blobDude.velocity);
     
  float offset = 0;
  if (nextPosition.x > offset && nextPosition.x < (width - offset))
  {
    blobDude.position.x = nextPosition.x;
  }
  if (nextPosition.y > offset && nextPosition.y < (height - offset))
  {
    blobDude.position.y = nextPosition.y;
  }
     
  pushMatrix();
     
  translate(blobDude.position.x, blobDude.position.y);
     
  scale(blobDude.direction, 1);
     
  imageMode(CENTER);
  image(blobDude.image, 0, 0);
     
  popMatrix();
}
   
void keyPressed()
{
  if (key == 'd')
  {
    right = 1;
    blobDude.direction = -1;
  }
  else if (key == 'a')
  {
    left = -1;
    blobDude.direction = 1;
  }
  else if (key == ' ')
  {
    up = -1;
  }
  else if (key == 's')
  {
    blobDude.image=loadImage("BlobSplat.png");
    down = 1;
  }
  
}
   
void keyReleased()
{
  if (key == 'd')
  {
    right = 0;
  }
  if (key == 'a')
  {
    left = 0;
  }
  if (key == ' ')
  {
    up = 0;
  }
  if (key == 's')
  {
    blobDude.image=loadImage("blobDude.png");
    down = 0;
  }
}


class Bar { 
  float x; 
  float y; 
  float hspeed; 
  float vspeed;

    
  Bar (float X,float Y,float Hspeed,float Vspeed) { 
   x=X; 
   y=Y; 
   hspeed=Hspeed;
   vspeed=Vspeed; 
  } 
  void updateBar() { 
    
    pushMatrix(); 
    
    translate(x,y);  
    imageMode(CENTER); 
    image(imgBar,0,0,40,35); 
    
    popMatrix(); 
     
     
  } 
  void draw()
{
  updateBar();
  if((Bara.x+10)>=(blobDude.position.x - 90) && ((Bara.y-10)<=(blobDude.position.y + 70)) && (Bara.x)<(blobDude.position.x)
  || (Barb.y+17.5f) >= (blobDude.position.y - 17.5f) && (Barb.x+40) >= (blobDude.position.x - 90) && (Barb.x - 17.5f) < (blobDude.position.x + 90))
  {
    if (key == 's')
    {
      hits=false;
    }
    else {
   hits=true;
   image(LoseScreen,400,400,800,800); }
  }
   
  else { 
   hits=false;
  }

}
  void move() { 
    Bara.x += hspeed; 
    if (Bara.x < -10) { 
      Bara.x = width + 10; 
    } 
    if (Bara.x > width + 10) { 
      Bara.x = -10; 
    } 
    
    Barb.y += vspeed; 
    if (Barb.y < -10) { 
      Barb.y = height + 10; 
    } 
    if (Barb.y > height + 10) { 
      Barb.y = -10; 
    }
 }
}



