
float timer=0.0;

//so far the horizontal movement is in, as are the vertical asteroids...

class Asteroid
{
  //randomizes falling objects on the x
 float x = random(10,width-10);
 float y = random(10,height-10);
 float radius = 20; 
 float size = 20.0;
 float speed = 0.0005;
 PVector position= new PVector(random(10,width-10),random(height-10));
 
 Asteroid()
 {
   ellipse(this.x,this.y,10,10);
 }
 
 void draw(float tx, float ty)
  {
    float toX= tx+this.position.x;
    float toY= ty-this.position.y;

    PVector direction= new PVector(toX,toY);
    direction.normalize();
    this.position.x += direction.x*this.speed;
    this.position.y += direction.y*this.speed;
   
  
  }
}

class Player
{
 float x = 350;
 float y = 350; 
 float w = 50;
 float h = 50;
 float speed = 5;
 float size = 50;
 PVector position= new PVector(350,350);
 
 void update()
    {
      float toX= x-this.position.x;
      float toY= y-this.position.y;
      if (dist(x,y,this.position.x,this.position.y)<200)
        {
          this.speed=4;
        }
      PVector direction= new PVector(toX,toY);
      direction.normalize();
      this.position.x += direction.x*this.speed;
      this.position.y += direction.y*this.speed;
    }

 void draw()
    {
      this.x+= this.speed;
    }

}

boolean isLeftDown = false;
boolean isRightDown = false;
boolean isUpDown = false;
boolean isDownDown = false;

Asteroid[] myasteroids = new Asteroid[20];
Player myplayer = new Player();





void setup()
{
  size(700, 700);
  timer=0.0;
  for (int i = 0; i < myasteroids.length; i +=1)
  {
  myasteroids[i] = new Asteroid();
  }
}





void draw()
{ 
  timer=timer+(1.0/30.0);
  background(#e09919);
  
    
//movement works fine  
  if (isRightDown == true)
    {
        myplayer.x -= myplayer.speed;
    }
    
  if (isLeftDown == true)
    {
        myplayer.x += myplayer.speed;
    }
  if (isDownDown == true)
    {
        myplayer.y -= myplayer.speed;
    }
  if (isUpDown == true)
    {
        myplayer.y += myplayer.speed;
    }
    
    
 //player and asteroids... not so much. 
  rect(myplayer.x, myplayer.y, myplayer.w, myplayer.h);
    for (int i = 0; i < myasteroids.length; i +=1)
  {
    
    float distanceToPlayer= dist(myplayer.x,myplayer.y,myasteroids[i].x,myasteroids[i].y);
  
 if (distanceToPlayer < 200)
   {
     myasteroids[i].draw(myplayer.x, myplayer.y);
    myasteroids[i] = new Asteroid(); 
   }
   
//asteroids head for center always   
   if (myasteroids[i].x < 350)
   {
      myasteroids[i].x += myasteroids[i].speed;
   }
   if (myasteroids[i].x > 350)
   {
      myasteroids[i].x += myasteroids[i].speed;
   }
   if (myasteroids[i].y < 350)
   {
     myasteroids[i].y += myasteroids[i].speed;
   }
   if (myasteroids[i].y > 350)
   {
     myasteroids[i].y -= myasteroids[i].speed;
   }
   
  //code for collisions... not working right
if (rectRectIntersect(myplayer.x, myplayer.y, myplayer.x+myplayer.w, myplayer.y+myplayer.h,
  myasteroids[i].x, myasteroids[i].y, myasteroids[i].x+myasteroids[i].radius, myasteroids[i].y+ myasteroids[i].radius))
    {
      fill(random(500));
      myplayer.size= myplayer.size-10;
    }
    ellipse(myasteroids[i].position.x,myasteroids[i].position.y, myasteroids[i].radius, myasteroids[i].radius); 
  }
   

  
  
  
}





















void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      isLeftDown = true;
    }
    if (keyCode == RIGHT)
    {
      isRightDown= true;
    }
    if (keyCode == UP)
    {
      isUpDown = true;
    }
    if (keyCode == DOWN)
    {
      isDownDown = true;
    }
  }
}
 
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      isLeftDown = false;
    }
    if (keyCode == RIGHT)
    {
      isRightDown = false;
    }
    if (keyCode == UP)
    {
      isUpDown = false;
    }
    if (keyCode == DOWN)
    {
      isDownDown = false;
    }
  }
}


boolean rectRectIntersect(float left, float top, float right, float bottom,
float otherLeft, float otherTop, float otherRight, float otherBottom)
{return !(left>otherRight ||right < otherLeft || top > otherBottom || bottom < otherTop);}



