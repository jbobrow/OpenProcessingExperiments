
/*
Code by Pauline Unietis
Help from Natalie Freed

This code is meant to imitate the falling of drops onto leaves. By clicking, the user
creates a new drop that can hit the leaves and slide down them to the bottom.
You can make as many drops as you want.

Reference from http://processing.org/ including but not limited to:
http://processing.org/reference/PVector.html
http://processing.org/reference/mousePressed_.html
http://www.processing.org/examples/circlecollision.html

Inspiration from the following videos:
http://www.youtube.com/watch?v=uiP56jKiSpE
http://www.youtube.com/watch?v=eIOCCAvjiAE
http://www.youtube.com/watch?v=yuQmJsIqK8w
*/

ArrayList<DewDrop> drops; //arraylist of drops
Leaf[] leaves = new Leaf[100]; //array of leaves


void setup() 
{
  size(400, 400);
  smooth();
  rectMode(CENTER);
  for (int i = 0; i < leaves.length; i++) //goes through the array
  {
    leaves[i] = new Leaf(random(399), random(399), 20); //creates new leaves at random positions
  }
  drops = new ArrayList<DewDrop>(); //creates the arraylist of drops 
}

void draw() 
{
  background(204, 255, 255);
  for (int i = 0; i < leaves.length; i++) //goes through the array
  {
    leaves[i].display(); //displays all the leaves
  }
  for (int i = drops.size() - 1; i >=0; i--) //goes through the array
  {
    DewDrop drop = drops.get(i); //for each specific drop
    drop.display(); //display it
    drop.drop(); //make it fall
    drop.checkLeafCollision(leaves); //check to see if it's colliding with leaves
    drop.checkFloorCollision(); //check to see if it's colliding with the floor
  }
}

void mousePressed() //if the mouse is pressed
{
  drops.add(new DewDrop(mouseX, mouseY, 5, 1)); //make a new drop
}




class DewDrop
{
  PVector droppos; //vector for the drop's position
  int size; //size of drop
  float speed; //speed at which it's falling initially   
  DewDrop(float x, float y, int tempsize, float tempspeed)
  {
    droppos = new PVector(x, y); 
    speed = tempspeed; 
    size = tempsize;
  }
  void drop() //makes the drop fall
  {
    droppos.y = droppos.y + speed;
  }
  void checkFloorCollision() //checks if the drop is at the bottom
  {
    if (droppos.y >= 397)
    {
      speed = 0;
    }
  }
  void checkLeafCollision(Leaf leaves[]) //checks if the drop is hitting a leaf
  {
    for (int i = 0; i < leaves.length; i++)
    {
      float rate = abs(leaves[i].angle * 1.5); //rate of the sliding (faster for steeper angle)
      if (leaves[i].leafpos.x - leaves[i].size / 2 <= droppos.x &&  
      droppos.x <= leaves[i].leafpos.x + leaves[i].size / 2 && 
      leaves[i].leafpos.y - leaves[i].size / 7 <= droppos.y && 
      droppos.y <= leaves[i].leafpos.y + leaves[i].size / 7) //if it is colliding a leaf
      { 
        if (leaves[i].angle > 0) //if the leaf is facing right
        {
            droppos.x = droppos.x + rate; //move drop right
            droppos.y = droppos.y - leaves[i].size/7; //stay above leaf
        }
        else if (leaves[i].angle < 0) //if the leaf is facing left
        {
            droppos.x = droppos.x - rate; //move drop left
            droppos.y = droppos.y - leaves[i].size/7; //stay above leaf
        }
      }
    }
  }
  void display() //draw the drop
  { 
    stroke(196, 355, 354);
    fill(0, 255, 255);
    ellipse(droppos.x, droppos.y, size, size);
  }
}

class Leaf
{
  PVector leafpos; //vector for leaf's position
  int size; //size of leaf
  float angle = random(radians(-30), radians(30)); //angle of leaf
  Leaf(float x, float y, int tempsize)
  {
    leafpos = new PVector(x, y); 
    size = tempsize;
  }  
  void display() //draw the leaf
  {
    stroke(0, 51, 0);
    fill(0, 204, 0);
    pushMatrix();
    translate(leafpos.x, leafpos.y);
    rotate(angle);
    rect(0, 0, size, size/7);
    popMatrix();
  }
}


