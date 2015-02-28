
//Kevin Martin Jose
//Buckets and Apples. June 2013


//Define a class Protagonist to lay down the properties of our basket
class Protagonist {
  int posx, posy;  //Current position of the basket
  PImage pic;  //The picture of the basket

  int w, h;  //width and height of the basket
  Protagonist()  //The constructor. This function is invoked every time a new object of the class Protagonist is created.
  {
    pic=loadImage("basket.jpeg");
    w=70;
    h=65;
    posx=mouseX-w/2;
    posy=height-h;
  }

  void display()  //Draw everything on to the screen
  {
    posx=mouseX-w/2;
    image(pic, posx, posy, w, h);
  }
}

class Antagonist {
  int posx, posy, rad, speed;
  color c;
  Antagonist()
  {
    posx=(int)random(0, width);
    posy=0;
    rad=10;
    speed=(int)random(1, 5);
    c=color(180, 0, 0);
  }
  void display()
  {
    fill(c);
    ellipse(posx, posy, rad, rad);
  }
  void update_pos()
  {
    posy+=speed;
  }
  void check_bounds()
  {
    if (posy>=height)  //If the apples go off the screen, reset their position and assign them a new speed.
    {
      reset_pos();  //Reset the position and speed of the apple
      score-=5;  //Decrement the score by 5 if an apple slips through
    }
  }
  void reset_pos()
  {
    posy=0;
    posx=(int)random(0, width);
    speed=(int)random(1, 5);
  }
}
PFont font;    //Holds the font we use to display the score
boolean game_over=false; //Either true or false. Game is over when this becomes true
Protagonist basket;  //Declares an object of the type protagonist
Antagonist apples[];  //We need several apples. The [] denots that we are using an array of objects.
int apple_no=5;    //Holds the number of apples we want on the screen.
int score=0;
void setup()
{
  size(400, 400);
  //background(128);
  smooth();  //Turn on anti-aliasing. Make lines look a lot smoother
  frameRate(30);
  font=loadFont("font.vlw");
  textFont(font, 16);
  basket=new Protagonist();  //Initialize our object.
  apples=new Antagonist[apple_no];  
  for (int i=0;i<apple_no;i++)  //Initialize each apple.
  {
    apples[i]=new Antagonist();
  }
}

void draw()
{
   background(255);
   
  if (!game_over)
  {
    basket.display();              //Displays the basket.
    for (int i=0;i<apple_no;++i)   //For every apple there is, this loop executes its display, update_pos and check_bounds functions.
    {
      apples[i].display();
      apples[i].update_pos();
      apples[i].check_bounds();
      check_collision(apples[i]);
    }
    score_display();
  }
  else
  {
    fill(255,0,0);
    text("Game over",width/2-textWidth("Game over")/2,height/2);  //Display the game over message. textWidth() is used to position the message in the centre
    noFill();
  }
    
}

void check_collision(Antagonist temp_apple)
{
  //In the below if statement, there's a +50 in the final comparison because we need the apple to be considered caught even if we catch it a bit late
  // First 2 comparisons check if the basket is positioned correctly. That is, whether the apple is within the width (2 x coordinates) of the basket
  // The 3rd comparison checks if the apple has yet reached the basket (y coordinate)
  // The 4th comparison is to see 
  if (temp_apple.posx>basket.posx && temp_apple.posx < basket.posx+basket.w && temp_apple.posy>basket.posy && temp_apple.posy<basket.posy-basket.h/2+50)  
  {
    temp_apple.reset_pos();
    score = score +1; //Increment the score by 1 if an apple is caught.
  }
}

void score_display()
{
  fill(0, 0, 160, 80);  //80 is the transparency value associated with the display. The higher the value, the more opaque the object. Ranges from 0 (completely trans) to 100 (opaque)
  text("Score: "+score, 0, height);
  noFill();
  if (score<=-10)
    game_over=true;
}



