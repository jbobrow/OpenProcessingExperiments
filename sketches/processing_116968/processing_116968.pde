
float fall = 0;
PImage land;
  
class SideJumper
{
  PImage image;
  PImage pic;
  PVector position;
  PVector position2;
  float direction;
  float direction2;
  PVector velocity;
  PVector velocity2;
  float jumpSpeed;
  float jumpSpeed2;
  float walkSpeed;
  float walkSpeed2;
}
 
SideJumper mustacheMan;
float left;
float right;
float up;
float down;

SideJumper bunnyGirl;
float left2;
float right2;
float up2;
float down2;
 
float gravity = .5;
float gravity2 = .5;
 
float bottom = 482;
 
void setup()
{
  size(800, 500);
   
  mustacheMan = new SideJumper();
  mustacheMan.image = loadImage("mustache dude.png");
  mustacheMan.position = new PVector(200, bottom);
  mustacheMan.direction = 1;
  mustacheMan.velocity = new PVector(0, 0);
  mustacheMan.jumpSpeed = 10;
  mustacheMan.walkSpeed = 5;
  
  bunnyGirl = new SideJumper();
  bunnyGirl.pic = loadImage("bunny firegirl.png");
  bunnyGirl.position2 = new PVector(450, bottom);
  bunnyGirl.direction2 = 1;
  bunnyGirl.velocity2 = new PVector(0, 0);
  bunnyGirl.jumpSpeed2 = 11;
  bunnyGirl.walkSpeed2 = 10;
  

}

 
void draw()
{ 
  land = loadImage("temple.png");
  image(land,width/2,height/2,width,height);
  
  fill(#3B1A00);
  rect(100,fall+300,200,10);
  rect(400,fall+420,50,10);
  rect(500,fall+100,20,10);
  rect(500,fall+300,100,10);
  rect(0,fall+350,80,10);
  rect(0,fall+150,80,10);
  rect(550,fall+500,20,10);
  rect(600,fall+400,85,10);
  rect(200,fall+100,60,10);
  rect(550,fall+200,90,10);
  fill(#D6A365);
  rect(700,100,70,10);
  rect(700,70,10,40);
  rect(770,70,10,40);
  //fall += 2;
  //if ( fall >= 800)
  //{
    //fall = 0;
  //}
  
   updatemustacheMan();
  updatebunnyGirl();
  
}
 
void updatemustacheMan()
{
  if (mustacheMan.position.y < bottom)
  {
    mustacheMan.velocity.y += gravity;
  }
  else
  {
    mustacheMan.velocity.y = 0;
  }
   
  if (mustacheMan.position.y >= bottom && up != 0)
  {
    mustacheMan.velocity.y = -mustacheMan.jumpSpeed;
  }
  
  if (mustacheMan.position.y > fall+400 && mustacheMan.position.y < 430 && mustacheMan.position.x > 400  && mustacheMan.position.x < 450) //400,fall+420,50,10
  {
    mustacheMan.position.y = 400; 
    gravity = 0;
  }
   else
  {
    gravity = 0.5;
  }


 if (mustacheMan.position.y >= 400 && up != 0)
  {
    mustacheMan.velocity.y = -mustacheMan.jumpSpeed;
    bottom = 480;
  }
  
  while (mustacheMan.position.y > fall+280 && mustacheMan.position.y < 300 && mustacheMan.position.x > 100  && mustacheMan.position.x < 300) //100,fall+300,200,10
  {
    mustacheMan.position.y = 280; 
    gravity = 0;
  }
  

 if (mustacheMan.position.y >= 280 && up != 0)
  {
    mustacheMan.velocity.y = -mustacheMan.jumpSpeed;
    bottom = 472;
  }
  
   if (mustacheMan.position.y > fall+80 && mustacheMan.position.y < 100 && mustacheMan.position.x > 500  && mustacheMan.position.x < 530) //500,fall+100,20,10
  {
    mustacheMan.position.y = 280; 
    gravity = 0;
  }
  
  if (mustacheMan.position.y >= 80 && up != 0)
  {
    mustacheMan.velocity.y = -mustacheMan.jumpSpeed;
    bottom = 472;
  }
  
  
 
  mustacheMan.velocity.x = mustacheMan.walkSpeed * (left + right);
   
  PVector nextPosition = new PVector(mustacheMan.position.x, mustacheMan.position.y);
  nextPosition.add(mustacheMan.velocity);
   
  float offset = 0;
  if (nextPosition.x > offset && nextPosition.x < (width - offset))
  {
    mustacheMan.position.x = nextPosition.x;
  }
  if (nextPosition.y > offset && nextPosition.y < (height - offset))
  {
    mustacheMan.position.y = nextPosition.y;
  }
   
  pushMatrix();
   
  translate(mustacheMan.position.x, mustacheMan.position.y);
   
  
  scale(mustacheMan.direction, 1);
   
  imageMode(CENTER);
  image(mustacheMan.image, 0, 0);
   
  popMatrix();
}

void updatebunnyGirl()
{
  if (bunnyGirl.position2.y < bottom)
  {
    bunnyGirl.velocity2.y += gravity2;
  }
  else
  {
    bunnyGirl.velocity2.y = 0;
  }
   
  if (bunnyGirl.position2.y >= bottom && up2 != 0)
  {
    bunnyGirl.velocity2.y = -bunnyGirl.jumpSpeed2;
  }
   
  bunnyGirl.velocity2.x = bunnyGirl.walkSpeed2 * (left2 + right2);
   
  PVector lastPosition = new PVector(bunnyGirl.position2.x, bunnyGirl.position2.y);
  lastPosition.add(bunnyGirl.velocity2);
   
  float offset2 = 0;
  if (lastPosition.x > offset2 && lastPosition.x < (width - offset2))
  {
    bunnyGirl.position2.x = lastPosition.x;
  }
  if (lastPosition.y > offset2 && lastPosition.y < (height - offset2))
  {
    bunnyGirl.position2.y = lastPosition.y;
  }
   
  pushMatrix();
   
  translate(bunnyGirl.position2.x, bunnyGirl.position2.y);
   
  
  scale(bunnyGirl.direction2, 1);
   
  imageMode(CENTER);
  image(bunnyGirl.pic, 0, 0);
   
  popMatrix();
}
 
void keyPressed()
{
  if (key == 'd')
  {
    right = 1;
    mustacheMan.direction = 1;
  }
  if (key == 'a')
  {
    left = -1;
    mustacheMan.direction = -1;
  }
  if (key == 'w') //the jump
  {
    up = -1;
  }
  if (key == 's')
  {
    down = 1;
  }
  if (key == CODED)
  {
    if (keyCode == RIGHT)
    {
      right2 = 1;
      bunnyGirl.direction2 = 1;
    }
    if (keyCode == LEFT)
    {
    left2 = -1;
    bunnyGirl.direction2 = -1;
    }
    if (keyCode == UP) // the jump
    {
      up2 = -1;
    }
    if (keyCode == DOWN)
    {
      down2 =1;
    }
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
  if (key == 'w')
  {
    up = 0;
  }
  if (key == 's')
  {
    down = 0;
  }
   if (key == CODED)
  {
    if (keyCode == RIGHT)
    {
      right2 = 0;
    }
    if (keyCode == LEFT)
    {
    left2 = 0;
    }
    if (keyCode == UP)
    {
      up2 = 0;
    }
    if (keyCode == DOWN)
    {
      down2 = 0;
    }
  }
}



