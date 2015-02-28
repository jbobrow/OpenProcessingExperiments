
InMate i;
Soap s;
ArrayList<Friend> friends = new ArrayList<Friend>();
ArrayList<ShowerHead> showers = new ArrayList<ShowerHead>();
int numOfFriends = 10;
int numOfShowers = 15;
int difficulty = 10;
int difficulty2 = 10;

void setup(){
  size(600, 600);
  smooth();
  //initiliaze
  i = new InMate();
  s = new Soap();  
  for(int n = 0; n<numOfFriends;n++)
  {
    friends.add(new Friend());
  }
  //this is where each shower head is initialized
  for(int n=0; n<numOfShowers; n++)
  {
    showers.add(new ShowerHead());  
  }
}

void draw(){
  // background(255);
  s.run();
  s.move(i.getX());
  
  for(int n = 0; n<friends.size(); n++)
  {
  friends.get(n).run();
  
  //shows them getting a new soap bar which causes each friend to leave
  if(
  s.getX() > friends.get(n).getX() -difficulty &&
  s.getX() < friends.get(n).getX() +difficulty &&
  s.getY() > friends.get(n).getX() -difficulty &&
  s.getY() < friends.get(n).getY() +difficulty)
    {
    friends.get(n).gotSoap();
    friends.remove(n);
    }
    //shows the end of the game when all friends are clean
  if (friends.size() == 0)
  {
    println("your friends have left the showers");
  }
  
  //allows each showerhead to display and work
  for (int i = 0; i<showers.size(); i++)
  {
    showers.get(i).run();
  }
  
  //this decides if the soap hit a showering spot in order to change
  //direction
  for (int j=0; j<showers.size();j++)
  {
    if(
  s.getX() > showers.get(j).getX() -difficulty2 &&
  s.getX() < showers.get(j).getX() +difficulty2 &&
  s.getY() > showers.get(j).getX() -difficulty2 &&
  s.getY() < showers.get(j).getY() +difficulty2)
  {
    s.hitShower(showers.get(j).getX());
  }
  
  }
  
  i.display();
  }
  
}

class InMate{
  
  PVector location;
  PVector velocity;
  PVector right;
  PVector left;
  //initialize
  InMate(){
    location = new PVector(width/2, height-50);
    velocity = new PVector(0, 0);
    right = new PVector(0.05,0);
    left = new PVector(-0.05,0);
    
  }
  
  void display()
  {
    // the inmate is green
    fill(0, 100, 0);
    //this location will be close to the bottom
    //the shape will be a person
    ellipse(location.x, height-50, 15, 15);
    line (location.x, height-43, location.x, height-25);
    line(location.x, height-25, location.x-5, height-15);
    line(location.x, height-25, location.x+5, height-15);
    line(location.x-5, height-35, location.x+5, height-35);
    
    //addes acceleration to the right when the right key is pressed
    if (keyCode == RIGHT)
    {
      velocity.add(right);
      velocity.sub(left);
    }
    
    //adds acceleration ot the left when the left key is pressed
    if (keyCode == LEFT)
    {
      velocity.add(left);
      velocity.sub(right);
    }
    
    //makes sure that the location doesn't go too far to the right
    if(location.x>width)
    {
      location.x = width;
    }
    //makes sure that the location doesn't go too far to the left
    if (location.x<0)
    {
      location.x = 0;
    }
    //this is what moves the inmate to the left and right
    location.add(velocity);
    velocity.limit(0.7);
     
  } 
  
  //this method is in order to find where the inmate
 Float getX()
{
  return location.x;
} 
}

class Soap
{
  PVector location;
  PVector velocity;
  PVector stream;
  PVector right;
  PVector left;
  boolean a;  
  boolean b;
  
  //initialize
  Soap()
  {
    location = new PVector(width/2, height-50);
    velocity = new PVector(0, -15);
    stream = new PVector(random(-1, 1), 0);
    right = new PVector(1, 0);
    left = new PVector(-1, 0);
  }
  
  void display()
  {
   fill(255);
   ellipse(location.x,location.y, 4, 7);   
  }
  
  void move(float s)
  {if(key != ' ')
  {
    location.x = s;
  }}
  void run()
  {
   fill(0);
   
   //this allows the soap to start back at the bottom after reaching
   //the top
    if ( key == ' ' && location.y > 0 && location.x < width && location.x >0)
    {
    display();
    }    
    else
    {
      display();
      velocity.x = 0;
      location.y = height-50;
      key = 'x';
    } 
        location.add(velocity);

    if (b == true && location.y >0 && location.x <width && location.x>0)
    {
      stream();
    }
    else{
      b = false;
      velocity.x = 0;
    }    
  }
  float getX()
  {
    return location.x;
  }
   float getY()
   {
     return location.y;
   }   
   void hitShower(Float s)
   {
     b = true;
     location.x = s;
     
   } 
  void stream()
  {
    velocity.add(stream);
  }
}
class ShowerHead{
 PVector location; 
ShowerHead(){
  location = new PVector(random(width-50), random(10, height)-100);
}

void run()
{
  display();
}
void display()
{ 
  //this draws the shower head
  fill(0);
ellipse(location.x, location.y, 10, 10);
line(location.x-2.5, location.y, location.x-2.5, location.y+30);
for(int i = 0; i< 3; i++)
{
  //the shower lines are turned to make the shower visual effect
  pushMatrix();
  translate(location.x, location.y);
  rotate(-radians(35*i));
  line(0, 0, 0, 10);
  popMatrix();
}
}

Float getX()
{
  return location.x;
}

Float getY()
{
  return location.y;
}
}


class Friend
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  boolean hasSoap;
  
  //initialize friend
  Friend()
  {
   location = new PVector(random(0,width), random(40,height-100));
   velocity = new PVector(0, 0);
   acceleration = new PVector(random(-1,1)/10,random(-1,1)/10);
   topspeed = 3;
  }
  
  void display()
  {
    //this draws the friends as people with green faces
    fill(0, 100, 0);
    ellipse(location.x, location.y-50, 15, 15);
    line (location.x, location.y-43, location.x, location.y-25);
    line(location.x, location.y-25, location.x-5, location.y-15);
    line(location.x, location.y-25, location.x+5, location.y-15);
    line(location.x-5, location.y-35, location.x+5, location.y-35);
  }
  
  void run()
  {
    //this is how they disappear
    if(hasSoap == true)
    {
    }
    else
    {
    display();
    update();
    }
  }
  
  void update()
  {
    acceleration = new PVector(random(-1,1)/10,random(-1,1)/10);
    velocity.limit(topspeed);
    location.add(velocity);
    velocity.add(acceleration);
    
    if(location.x>width-10 || location.x<0)
    {
      velocity.x = -velocity.x;
      acceleration.x = - acceleration.x;
      //acceleration.y = -acceleration.y;
    } 
    if (location.y >height-50 || location.y<50)
    {
      velocity.y = -velocity.y;
      acceleration.y = -acceleration.y;
      //acceleration.y = -acceleration.y;
    }
  }

void gotSoap()
{
  hasSoap = true;
}
  
  float getX()
  {
    return location.x;
  }
  float getY()
  {
    return location.y;
  }
}

