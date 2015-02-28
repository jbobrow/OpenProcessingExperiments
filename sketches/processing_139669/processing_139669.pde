
//All code and commenting by Zach Cummings. Dinner party simulation idea and code invention by Zach Cummings. Help from Natalie Freed. Also code that allows characters to stay inside the party was partially developed by Sonia Martin. Random colors by Dixon Layton.
//code simulates a fancy dinner party in a ballroom, etc. The guests walk around and mingle with eachother, and stay within the room. The guests move randomly and they tend to stay in a group. 
//Have fun and welcome to the party!

Monocle topHat, topHat2, topHat3, topHat4, topHat5, topHat6, topHat7, topHat8, topHat9; //defines variables
Monocle[] party;
int height1 = 1;
int width1 = 1;
void setup()
{
  size(1000, 700); //set size of screen
  background(102, 0, 0); //set backgorund color to burgundy


  party = new Monocle[10]; //sets up array

  //THIS IS THE DISPLAY FUNCTION BEFORE I ADDED AN ARRAY.
  //  topHat=new Monocle(width/2, height/2); //adds a figure to screen at center
  //  topHat2=new Monocle(width/4, height/4);//adds another figure  
  //  topHat3=new Monocle(width/6, height/6);//adds another figure
  //  topHat4=new Monocle(width/3,height/2);//adds another figure
  //  topHat.display();//displays figure on background
  //  topHat2.display();
  //  topHat3.display();
  //  topHat4.display();
  for (int i= 0; i< party.length; i++)//goes through all topHat variables
  {
    party[i]=new Monocle (450, 0, random(10)); //puts them on screen at the "door"
  }
}


void draw() //loop that draws continuously
{
  background(102, 0, 0); //sets background after each movement to avoid streaking trail behind movng figures
  fill(204, 102, 0);
  ellipse(150, 150, 80, 80); //draws table
  ellipse(250, 350, 80, 80);
  rect(450, 0, 10, 40);//door
  rect(540, 0, 10, 40);
  for (int i= 0; i< party.length; i++)
  {
    party[i].moveRandomX(width1); //move X, moveY, and display inside array
    party[i].moveRandomY(height1);
    party[i].display();


    if ((party[i].x > width-140) || (party[i].x < 0)) { //keeps character within boundaries by turning them at the pixel value of the width

      width1 = -1* width1;
    }
    if ((party[i].y > height-200) || (party[i].y < 0)) { //keeps character within boundaries by turning them at the pixel value of the height

      height1 = -1* height1;
    }
  }


  //THIS IS THE OLD MOVE LOOP BEFORE I ADDED AN ARRAY. YOU CAN USE THIS IN SUBSITUTION OF THE ARRAY.

  //  topHat.display(); //displays the character in the void draw loop  
  ////  topHat.moveX(1);//character moves one step in X direction
  ////  topHat.moveY(1);//character moves one step in y direction
  //  topHat2.display();
  //  topHat2.moveX(1);
  //  topHat2.moveY(1); 
  //  topHat3.display();
  //  topHat3.moveX(int(random(1)));
  //  topHat3.moveY(1);
  //  topHat4.display();
  //  topHat4.moveX(-1);
  //  topHat4.moveY(-1);
}

class Monocle //sets up class for character, "monocle" because the avatar has a monocle on one eye. What a gentleman
{
  float x; //sets variables
  float y;
  int bowtieColour= color(int(random(255)), int(random(255)), int(random(255)));
  float bias; 
  //
  int shoeColour = color(int(random(100, 255)), int(random(100, 255)), int(random(100, 255)));                //PROBLEM

  Monocle(int tempX, int tempY, float tempB)//
  {
    x=tempX;
    y=tempY;
    bias = tempB;
  }
  void display() //instructions for drawing character
  {
    strokeWeight(0); //line width
    pushMatrix(); //allows scale to take affect
    translate(x, y); //IMPORTANT! Allows character to be reapeatedly moved around screen
    scale(.2); //makes figure much smaller

    //the following code lines are instructions for drawing the character

    strokeJoin(BEVEL);
    fill(0);
    rect(257, 425, 82, 130); //body
    fill(255);
    rect(290, 425, 20, 130); //middle of body and pants
    rect(257, 555, 25, 130);
    rect(315, 555, 25, 130);
    fill(255, 204, 153);
    ellipse(300, 300, 220, 250); //regular eye and face
    ellipse(345, 280, 20, 20);
    fill(bowtieColour);//bowtie                               PROBLEM
    ellipse(300, 425, 30, 30);
    strokeWeight(0);
    triangle(310, 425, 342, 445, 340, 405);
    triangle(290, 425, 258, 445, 260, 405);
    strokeWeight(5);
    line(255, 325, 345, 325);
    strokeWeight(0);
    fill(102, 178, 255);
    ellipse(255, 280, 50, 50);
    fill(40, 40, 40);
    rect(165, 210, 270, 25);
    rect(225, 10, 150, 200);
    fill(shoeColour);                         //PROBLEM
    rect(315, 675, 50, 20);
    rect(233, 675, 50, 20);
    popMatrix();
  }
  void moveX(float steps)//void move loop for x direction
  {
    x = x+steps;//you can define how quickly it moves in the void draw loop
  }
  void moveY(float steps)//void move loop for y direction
  {
    y = y+steps;//you can define how quickly it moves in the void draw loop
  }
  void moveRandomX(float steps)
  {
    int rand = int(random(0, 10));
    if (rand > bias)
    {
      x+= steps;
    }
    else
    {
      x-=steps;
    }
  }
  void moveRandomY(float steps)
  {
    int rand = int(random(1, 10));
    if (rand > bias)
  {
      y+= steps;
  }
else
{
  y-= steps;
}
}
}

