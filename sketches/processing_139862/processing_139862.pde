
//Written by Asher Guthertz
//Used example code from Reas,Casey and Ben Fry. "Arrays." Getting Started with Processing. Beijing: O'Reilly, 2010. 141-152. Print.

//For my motion experiment, I wanted to play with little creatures that moved around on their own. I first created identical little balls that bounced off each other and the walls. I introduced a larger ball to interact with the other balls.
//I decided to make them play a never ending game of tag. It is a mixture of freeze and blob tag. It is like blob tag in that the little balls follow the bigger ones once tagged, but it is like freeze tag in that they can be
//untagged by free floating little balls. Sadly, I think it is way too easy for the little balls, and the big ball can probably never win. All of the balls are the same object, and all the little balls are an array of one object.
//While my final project really deviated from this, my original inspiration for a lot of balls following one ball was this video of sheep: https://www.youtube.com/watch?v=2sJYa8epIII 


Fish[] swimmy = new Fish[33]; //create 33 objects from the fish class.

int blue = color(20, 75, 200);
int  white = color(255);
int green = color(25, 250, 100);   //now these words store the numbers that correspond to their color

Fish afish = new Fish (200, 100, 30, blue);  //creates an aobkect from fish class that is blue




void setup() {
  size(500, 500);
  background(200);
  for (int i = 0; i < swimmy.length; i++) {
    int temptempx = int(random(width));
    //       int temptempy=40;
    int temptempy=int(random(height));
    int temptempradius = int(random(0, 30));
    swimmy[i] = new Fish(temptempx, temptempy, temptempradius, white);
  }  //for all 33 swimmys, create a Fish object with a random x and y coordinate (that is valdi inside the screen) and a random radius, and make it white.
}


void draw() {
  background(200);
  for (int i = 0; i <swimmy.length;i++)
  {
    noStroke();
    swimmy[i].display(); //makes the swimmys appear on the screen
    swimmy[i].follow(afish); //this is misleading, but it is telling the swimmys to have the CAPACITY to follow afish, which they will only do if they are touching the blue fish.
    if (swimmy[i].iscloseto(afish))
    {

      swimmy[i].blob(); //blob both turns the fish green, and makes following true, so that the the following capcacity is now unlocked.
      swimmy[i].follow(afish);
      swimmy[i].move();
    }
    else
    {
      swimmy[i].display();
      swimmy[i].move(); //move is a combination of all 6 methods that swimmy needs to move across the screen





      for (int j = 1; j <swimmy.length;j++) //the second for loop starting at one means that swimmy[i] and swimmy[j] will never be the same swimmy at the same time, so I can have two swimmys interact this way.
      {
        if (swimmy[i].istouching(swimmy[j]))
        {

          swimmy[i].switchdirection();
          swimmy[i].switchdirectiony();
        }

        if (swimmy[j].istouching(swimmy[i]))
        {
          swimmy[j].switchdirection();
          swimmy[j].switchdirectiony();
        }

        //those two if statements above tell swimmys to switch directions when they touch each other.
      }


      for (int l = 2; l<swimmy.length;l++)
      {

        if (swimmy[i].istouching(swimmy[l]))
        {

          swimmy[i].unblob();
        }

        //again, a for loop for cross-swimmy interaction, this one saying that if two simmys are touching, swimmy i unblobs, and if swimmy i was previously blobbed, this means it will go from green back to white and following will no longer be true.
      }
    }
  }






  afish.display();
  afish.swimleft();
  afish.swimright();
  afish.hitwallx();
  afish.swimup();
  afish.swimdown();
  afish.hitwally();


  //makes a fish move around and bounce off walls.
}
class Fish 

{

  float x;
  float y;
  int diameter;
  int direction = 1;
  int directiony = 1;
  int colour;
  boolean following;
  //variables that only exist inside the fish class needed for methods.


  Fish (int tempX, int tempY, int tempradius, int tempcolor)
  {
    colour = tempcolor;
    x=tempX;
    y=tempY;
    diameter=tempradius;
  } //this is the operation that creates a fish, with color, location, and size properties.



  boolean istouching(Fish other) {

    if (dist(x, y, other.x, other.y) <= diameter/2 + other.diameter/2) 
    {
      return true;
    }

    else
    {
      return false;
    }
  } //if the distance between one ball and another is less than the two radii, then the balls are touching and the boolean is considered true.

  boolean iscloseto (Fish other)
  {


    if (dist(x, y, other.x, other.y) <= (diameter/2 + other.diameter/2)+20)  
    {
      return true;
    }

    else
    {
      return false;
    }
  } //virtually the same as touching, but this says that if the distance between the two is less that the two radii + 20, so if they are w/i twenty of eachother it's returned as true. 

  void display ()
  {
    fill (colour);
    ellipse(x, y, diameter, diameter);
  } //this is what makes the fish appear. It creates an ellipse out of the propetries declared in the fish class with the colour declared in the fish class.




  void swimup ()
  {
    if (directiony == 1) 
    {
      //       y=y+int(random(0,3));
      y=y+1;
    }
  }
  void swimdown ()
  {
    if (directiony == -1)
    {
      y=y-1;
      //      y=y-int(random(0,3));
    }
  } //if the variable for y direction is 1, then the fish is adding 1 to its y location, if not, its subtracting one.


  void swimright()
  {
    if (direction==1) {
      x=x+1;
      //    x=x+int(random(0,3));
    }
  }

  void swimleft()
  {
    if (direction==-1) {
      x=x-1;

      //   x=x-int(random(1,3));
    }
  } //if the variable for x direction is 1, then the fish is adding 1 to its x location, if not, its subtracting 1.

  void switchdirection()
  {
    direction = - direction;
  } //switches the x direction (there's another one for y).



  void hitwallx()
  {
    constrain (x, 0, width);

    if (x<=0)
    {
      direction=1;
    }

    else if (x>=width) 
    {
      direction=-1;
    }
  } //the method that has the direction variable be positive until the right wall is hit, and negative until the left wall is hit.



  void blob ()
  {
    colour=green;
    following= true;
  } //discussed in draw.

  void switchdirectiony()
  {
    directiony = - directiony;
  }

  void follow (Fish other)
  {
    if (following==true)
    {


      if (x- other.x >= 0)
      {

        x=x-.4;
      }
      if (x-other.x <0)
      {

        x=x+.4;
      }

      if (y-other.y>=0)
      {

        y=y-.4;
      }

      if (y-other.y<0)
      {

        y=y+.4;
      }
    }
  } //The method that is accesed if following is true, and says that if swimmy is below a fish, than it adds a little bit to its location, if it's above a fish, it subtracts a little bit, etc.

  void move ()
  {

    if (following==false)
    {




      swimup();
      swimdown();
      swimright();
      swimleft();

      hitwallx();
      hitwally();
    }
  }

  void unblob()
  {

    colour=white;
    following= false;
  }




  void hitwally()
  {
    constrain (y, 0, width);

    if (y<=0)
    {
      directiony=1;
    }

    else if (y>=height) 
    {
      directiony=-1;
    }
  }
}







