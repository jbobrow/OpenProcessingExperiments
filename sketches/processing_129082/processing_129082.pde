
//-------------------------------------------------------------------------------------------------------------------------------//
ArrayLists arrayListsA = new ArrayLists();
Player player = new Player(color(0,0,0,150-(mouseY/5)),500,500,30,30,7);
StringDicts stringDictA = new StringDicts();
int score;

boolean sketchFullScreen()
{return true;}

int hour=hour();
/*
This block of code is initializing various different objects for different classes.
First is the arrayListsA object which will be used to enable use, display, etc for the different ArrayLists in the sketch.
Then there's the player (self-explanatory) it will be what you control and it has various values to be sent through the constructor.
Then there's the stringDictA object which will be used to enable use, display, etc for the different Strings in the sketch.
A variable is initialized to hold the current score throughout the game.
Then there's a boolean to put the game into fullscreen.
Then there's an integer being initialized as the equivalent of the value of the hour() function.
*/
//-------------------------------------------------------------------------------------------------------------------------------//
void setup()
{
  size(displayWidth,displayHeight);
  smooth();
  background(20);
}
/*
All code in the setup block is run once.
This code sets the size of the sketch based on the display size.
It also enables anti-aliasing for the various primitives used.
Sets the background to a dark gray color.
*/
//-------------------------------------------------------------------------------------------------------------------------------//
void draw()
{
  arrayListsA.display();
  stringDictA.display();
  player.display();
  player.move();
  userinterface();
  messageControl();
  noCursor();//Hides the mouse cursor.
}
/*
All code put into draw is run over and over again as long as the sketch runs. (Essentially looping)
In the draw, we have various different functions (some for objects, some for the sketch) that control display of things, etc.
*/
//-------------------------------------------------------------------------------------------------------------------------------//
class ArrayLists  //The initialization of a new class. All the code for the class will be within this.
{
  ArrayList <EnemyA> enemyAArrayList; //The initialization of a new ArrayList <> tells the ArrayList what type of object it will hold.
  ArrayList <EnemyB> enemyBArrayList; //The final part ("enemyBArrayList" for this example) is the name of the ArrayList.
  ArrayList <Particles> p;
  
  ArrayLists()  //The constructor of the class. Arguments are sometimes passed through here to allow different instance to have variation.
  {
    enemyAArrayList = new ArrayList<EnemyA>();  //Explaining that ("enemyAArrayList" for this example) is a new ArrayList and that it holds whatever object is in <>.
    enemyBArrayList = new ArrayList<EnemyB>();
    p = new ArrayList<Particles>();
  }
  
  void display()  //The beginning of a function for this class.
  {
    if(score<1000)  //An "if" conditional will check an argument and if it's true it carries out its instructions.
    {
      enemyAArrayList.add(new EnemyA(color(mouseY/4,0,0),random(width),random(height),30,30,random(1,3)));  //Adding an object to the ArrayList with some variables set for the object.
      for(int i=0;i<enemyAArrayList.size();i++)  //This for loop runs a test and if true runs its instructions.
      {
        EnemyA enemya = enemyAArrayList.get(i); //Gets a specific element from the ArrayList.
        enemya.display();  //A function to be applied to all elements within the ArrayList.
        enemya.move();
        enemya.collision();
      }
    
      if (enemyAArrayList.size() > 100)  //If the ArrayLists size goes over 100 then remove the 0th element from it.
      {enemyAArrayList.remove(0);}
    }
    /*
    Each ArrayList behaves the same as the one above it, with only variation in some of the variable values of each and the names.
    */
    if(score>=1000)
    {
      enemyBArrayList.add(new EnemyB(color(random(0,255),random(0,255),random(0,255),mouseY/4),random(width),random(height),30,30,random(1,3)));
      for(int i=0;i<enemyBArrayList.size();i++)
      {
        EnemyB enemyb = enemyBArrayList.get(i);
        enemyb.display();
        enemyb.move();
        enemyb.collision();
      }
    
      if(enemyBArrayList.size()>100)
      {enemyBArrayList.remove(0);}
    }

    if (score>=2000)
    {
      p.add(new Particles(color(random(0,255),random(0,255),random(0,255),random(0,255)),random(width),random(height),10,10));
      for(int i=0;i<p.size();i++)
      {
        Particles particle = p.get(i);
        particle.display();
      }
    
      if(p.size()>50)
      {p.remove(0);}
    }
  }
}
/*
This is the ArrayLists class which holds the several different ArrayLists of the sketch. These are used to display the enemies in
the sketch as well as some particle effects. Whether they are displayed or not is based on whether you have enough score. This
essentially acts as a difficulty system, where the more score you have the harder the game gets.
The color of some of these objects like the enemies is quite randomized and in some cases uses calculations like the position of
the mouse to obtain a value.
*/
//-------------------------------------------------------------------------------------------------------------------------------//
class EnemyA
{
  color c;
  float x;
  float y;
  float w;
  float h;
  float s;
  boolean co = false;
  //Various variables are listed above that can be used to control the instances created for this class.
  EnemyA (color c_,float x_,float y_,float w_, float h_, float s_) //This constructor has variables that can be used to give each instance variation.
  {
    c = c_;
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    s = s_;
    //These are pass-through variables which are passed through the constructor temporarily allowing each instance to have variation.
  }
  
  void display()
  {
    fill(c); //The fill value of the enemy is set to the value of the variable c which allows each to have a unique color.
    rect(x,y,w,h);  //Variables are used to give each instance different positions and sizes.
  }
  
  void move()
  {
    if(!co) //Tets if the boolean is false. If it is then its instructions are run.
    {y-=s;}  //Sets y = y - s.
    
    if (y <= height) //A boundary. If y is less than or equal to height then..
    {y += height;}   //y = y + height. (Pretty much loops rather than disappearing off the screen edge.)
    
    if (y >= height)
    {y -= height;}
  }
  
  void collision()
  {
    if (dist(x,y,player.x,player.y)<=20)  //Checks if the distance between the x & y of the enemy and player is < or = 20.
    {
      co = true;  //If it is then this boolean is set to true..
      x=x;        //x = x
      y=y;        //y = y (Essentially stopping movement.
      score++;    //Score is incremented by 1.
      println("Score:"); //This piece of text is printed in the console.
      println(score);    //And the value of the score variable is printed to the console.
    }
  }
}
//-------------------------------------------------------------------------------------------------------------------------------//
class EnemyB
{
  color c;
  float x;
  float y;
  float w;
  float h;
  float s;
  boolean co = false;
  
  EnemyB (color c_,float x_,float y_,float w_, float h_, float s_)
  {
    c = c_;
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    s = s_;
  }
  
  void display()
  {
    fill(c);
    rect(x,y,w,h);
  }
  
  void move()
  {
    if(!co)
    {y+=s;}
    
    if (y <= height)
    {y += height;}
    
    if (y >= height)
    {y -= height;}
  }
  
  void collision()
  {
    if (dist(x,y,player.x,player.y)<=20)
    {
      co = true;
      x=x;
      y=y;
      score++;
      println("Score:");
      println(score);
    }
  }
}
//EnemyB is the same as the EnemyA class with slight variations in its values (such as the direction it's meant to go, etc.)
//-------------------------------------------------------------------------------------------------------------------------------//
class Player
{
  color c;
  float x;
  float y;
  float w;
  float h;
  float s;
  
  Player (color c_,float x_,float y_,float w_, float h_, float s_)
  {
    c = c_;
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    s = s_;
  }
  
  void display()
  {
    fill(c);
    rectMode(CENTER); //Sets the mode of the rectangle (kind of like the pivot point) to Centered.
    rect(x,y,w,h);
  }
  
  void move()
  {
    x=mouseX;
    y=mouseY;
  }
}
//-------------------------------------------------------------------------------------------------------------------------------//
class Particles
{
  color c;
  float x;
  float y;
  float w;
  float h;
  
  Particles(color c_,float x_,float y_,float w_,float h_)
  {
    c=c_;
    x=x_;
    y=y_;
    w=w_;
    h=h_;
  }
  
  void display()
  {
    fill(c);
    rect(x,y,w,h);
  }
}
//-------------------------------------------------------------------------------------------------------------------------------//
void userinterface()
{

  fill(20);  //Sets the fill value to 20.
  rect(0,0,displayWidth*2,displayHeight/10);  //Creates a rectangle that varies in size based on the display size.
  textSize(displayHeight/70);  //Sets the text size to vary depending on the display size.
  fill(255);
  text("Score:",displayWidth-200,30);  //Displays the text "Score:" at x,y.
  text(score,displayWidth-150,30);  //Displays the value of score at x,y.
  text(hour(),displayWidth/2,30);   //Displays the current hour at x,y.
  text(":",(displayWidth/2)+16,30);
  text(minute(),(displayWidth/2)+20,30);  //Displays the current minute at x,y.
  //This method is used to create a user interface that tells time and shows the score.
}
//-------------------------------------------------------------------------------------------------------------------------------//
void messageControl()
{
  if (hour==0)  //If the current hour is 0 then...
  {
    String texts = stringDictA.text.get("0");  //Gets the string at "0" in the Texts StringDict and sets the String texts equal to it...
    textSize(displayHeight/70);  //Sets the text size based on the display height.
    fill(255);  //Sets the text color.
    text(texts,displayWidth/15,30);  //Displays the value of the String texts at x,y.
  }
  else  //else if the current hour isn't 0 then...
  if (hour==1) //and so on...
  {
    String texts = stringDictA.text.get("1");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==2)
  {
    String texts = stringDictA.text.get("2");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==3)
  {
    String texts = stringDictA.text.get("3");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==4)
  {
    String texts = stringDictA.text.get("4");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==5)
  {
    String texts = stringDictA.text.get("5");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==6)
  {
    String texts = stringDictA.text.get("6");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==7)
  {
    String texts = stringDictA.text.get("7");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==8)
  {
    String texts = stringDictA.text.get("8");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==9)
  {
    String texts = stringDictA.text.get("9");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==10)
  {
    String texts = stringDictA.text.get("10");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==11)
  {
    String texts = stringDictA.text.get("11");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==12)
  {
    String texts = stringDictA.text.get("12");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==13)
  {
    String texts = stringDictA.text.get("13");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==14)
  {
    String texts = stringDictA.text.get("14");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==15)
  {
    String texts = stringDictA.text.get("15");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==16)
  {
    String texts = stringDictA.text.get("16");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==17)
  {
    String texts = stringDictA.text.get("17");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==18)
  {
    String texts = stringDictA.text.get("18");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==19)
  {
    String texts = stringDictA.text.get("19");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==20)
  {
    String texts = stringDictA.text.get("20");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==21)
  {
    String texts = stringDictA.text.get("21");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==22)
  {
    String texts = stringDictA.text.get("22");
    text(texts,displayWidth/15,30);
  }
  else    
  if (hour==23)
  {
    String texts = stringDictA.text.get("23");
    text(texts,displayWidth/15,30);
  }
  
  
}
//This class is used to display a message based on what time of day it is.
//-------------------------------------------------------------------------------------------------------------------------------//
class StringDicts
{
  StringDict text;  //Creating a new StringDict (String Dictionary) called "text".
  StringDicts()
  {
  text = new StringDict();  //So text is a new StringDict.
  }
  
  void display()
  {
    text.set("0","Man, it's a little late to be up, eh?");  //Sets a string at "0" (doesn't have to be "0", could be "potato" or whatever).
    text.set("1","I think I'm gonna hit the hay. :S");      //Sets a string at "1" 
    text.set("2","I think I'm blind..wait..maybe not..");   //and so on...
    text.set("3","I'm actually kinda hungry..hm..");
    text.set("4","Well sir, I don't like it.");
    text.set("5","Early day for me..hehe..I'm tired..");
    text.set("6","What is today anyways..I've lost track of time, lol");
    text.set("7","Man, I could go for some bacon and eggs about now..");
    text.set("8","I should probably get ready to face the day.");
    text.set("9","Time for me to hit the road! :D");
    text.set("10","I wonder what kinda craic will be had today? :P");
    text.set("11","I'm kinda bored..need something to do..");
    text.set("12","Hm, getting close to lunch time..:D");
    text.set("13","I'm getting hungry again. You hungry?");
    text.set("14","Lunch time, hell yeah! XD");
    text.set("15","Well, I think I'm gonna do some drawing.");
    text.set("16","Approaching dinner time, good thing too.");
    text.set("17","Alright, dinner time. Wait..where's all the food?");
    text.set("18","Found some bread in the freezer; toast today I guess, lol");
    text.set("19","We should talk; it could be fun. :/");
    text.set("20","I think I'll watch a movie now.");
    text.set("21","I'm getting kinda tired.");
    text.set("22","Well, the day's almost over. Good thing I had fun.");
    text.set("23","Yup, time for bed...:|");
    fill(0);
    textAlign(LEFT);  //Aligns all text to the left.
  }
}
/*
String Dictionaries are essentially arrays that hold Strings.
This one is being used to hold different messages. Thse are the
messages used for the hourly message.

I know they're kind of random, lol :P
*/
//-------------------------------------------------------------------------------------------------------------------------------//


