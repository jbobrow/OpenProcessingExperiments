
//Loading image files
PImage img,ukraine_image, slovakia_image, scotland_image, northern_ireland_image, potato_image;
Flag ukraine_flag, slovakia_flag, scotland_flag, northern_ireland_flag , potato;

//Libraries used for Minim (to play audio file)
//This code had to be commented out for upload due to Processing 2.0 dropping the support for applet exports, and a bug in 1.5 not recognising the Minim library.
//import ddf.minim.spi.*;
//import ddf.minim.signals.*;
//import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.ugens.*;
//import ddf.minim.effects.*;
 
//Initialising player and minim
//AudioPlayer player;
//Minim minim;

void setup () 
{
  //Playing audio file
  //minim = new Minim(this);
  //player = minim.loadFile("starsandstripes.mp3", 2048);
 //player.play();
   
  //Setting images
  ukraine_image = loadImage("UKRF.png");
  slovakia_image = loadImage ("Slovakia_flag_300.png");
  scotland_image = loadImage ("scotland_4.jpg");
  northern_ireland_image = loadImage ("Northern_Ireland_Flag_big.jpg");
  potato_image = loadImage ("EditPotato.png");
 
  //Initialise screen and FPS
  frameRate(60);
  size(600,600);
  
  ukraine_flag = new Flag(100,200,8,10,"UKRF.png"); //The flags in all of their glory. First 2 parameters are starting x,y locations and the 2nd 2 set of parameters are starting axis speeds
  scotland_flag = new Flag(200,300,1,1,"scotland_4.jpg");
  slovakia_flag = new Flag(400,500,2,-7,"Slovakia_flag_300.png");
  northern_ireland_flag = new Flag(250,100,-2,5,"Northern_Ireland_Flag_big.jpg");
  potato = new Flag(300,50,6,2,"EditPotato.png");
  
}



void draw ()
{  
  //Setting up background
  noStroke();
  background(46, 204, 240);
  
  //Creating hills
  //This had to be put into Draw rather than Setup as the hills would have been overwritten every time the background refreshed
  fill(76, 207, 102);
  ellipse(300, 600, 1000, 400);
  fill(50, 227, 85);
  ellipse(150, 600, 900, 400);
  
  //Call method to draw clouds
  cloudDraw();
  
  //Show flags on screen called
  ukraine_flag.display();
  scotland_flag.display();
  slovakia_flag.display();
  northern_ireland_flag.display(); 
  potato.display();
  
  //Move flags method called
  ukraine_flag.move();
  scotland_flag.move();
  slovakia_flag.move();
  northern_ireland_flag.move();
  potato.move();
  
  textdisplay(50,100,200,300);    //first 2 parameters are x,y positions of group text and 2nd 2 parameters are positions of potato text
   
}

void cloudDraw()
{
  //Creates fluffy clouds
  //Colour - white
  fill(255);
 
  for (int i=0; i<20; i++)
  {
    //Creates a group of 20 ellipses close to one another to form a cloud
    //Cloud 1
    float randomX;
    float randomY;
    randomX = random(100);
    randomY = random(50);
    ellipse(400+randomX, 160+randomY, 55, 55);
    
    //Cloud 2
    randomX = random(100);
    randomY = random(50);
    ellipse(75+randomX, 100+randomY, 55, 55); 
    
  }  
}

/*
Flag - Artur
This class is used for the creation of flags which all are given starting speeds and positions.
Display uses the specified flag name to load the flag image into the screen using the coordinates given
Flags also have modifiable widths and heights
Move moves the flags according to their speed and has some simple colition detection done using if statements.
*/

class Flag         
{
  int flagwidth = 150, flagheight = 100; //Changing this will change the size of all flags
  float xPos, yPos;
  int xspeed, yspeed;
  String flag_name;
  int xSpeedchange = 10, ySpeedchange = 10;
  
  
  Flag(float temp_xPos, float temp_yPos, int temp_xspeed, int temp_yspeed, String temp_flag_name){
      xPos = temp_xPos;
      yPos = temp_yPos;
      xspeed = temp_xspeed;
      yspeed = temp_yspeed;
      flag_name = temp_flag_name;
    }  
  void display() {
      imageMode(CENTER);
      img = loadImage (flag_name);
      image (img, xPos ,yPos, flagwidth, flagheight);
    }
  void move () 
  {
    yPos = yPos + yspeed;
    xPos = xPos + xspeed;
    if((xPos+flagwidth/2)>width)
    { 
      
      xspeed += xSpeedchange;
      xspeed = xspeed *(-1); 
    }
    if(xPos<flagwidth/2)
    {
      xspeed -= xSpeedchange;
      xspeed = xspeed*(-1);
    }
    if((yPos)>(height-flagheight/2))
    { 
      yspeed = yspeed *(-1); 
      yspeed -= ySpeedchange;
    }
    if(yPos<flagheight/2)
    {
      
      yspeed = yspeed*(-1);
      yspeed += ySpeedchange;
    }
  }
}

void textdisplay(int group_text_pos_x, int group_text_pos_y, int potato_text_x, int potato_text_y)
{
float c1=random(255);
float c2=random(255);
float c3=random(255);

//Sets fill to random colours and displays text at 32pt
fill(c1,c2,c3);
textSize(32);
text("group 23",group_text_pos_x,group_text_pos_y);
text("in potato we trust",potato_text_x,potato_text_y);
}

//void stop()
//{
  //Ends the song once it has played all the way through
  //player.close();
  //minim.stop();
  //super.stop();
//}

/* PLEASE NOTE: This was Peter's code, initally to be used within the Draw function to rotate the image of a potato.
However, there was some difficulty implementing this into the program. Therefore, although the flags and rotating potato
worked as planned independently of one another, we were not able to have both. The code has been left here, commented out,
to show the work that had been done.

  translate(width/2,height/2); 
  float angle = 1*i*0.01;  
  rotate(angle);
  imageMode(CENTER);
  image(img, 0, 0, 200, 200); 
  i++;   
  
  */

