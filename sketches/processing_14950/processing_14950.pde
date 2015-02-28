
PImage homescreen;
PImage story2;

PImage left0;
PImage left1;
PImage left2;
PImage left3;
PImage leftend;

PImage right0;
PImage right1;
PImage right2;
PImage right3;
PImage rightend;


PFont example;


void setup()
{
  size(640,480);
  smooth();
  example = loadFont( "Serif-30.vlw");
  textFont (example);
story2 = loadImage("storyscreen2.gif");
homescreen = loadImage("Storyscreen1.gif");

//images left
left0 = loadImage("StoryLeft0.gif");
left1 = loadImage("StoryLeft1.gif");
left2 = loadImage("StoryLeft2.gif");
left3 = loadImage("StoryLeft3.gif");
leftend = loadImage("Storysendleft.gif");

//images right
right0 = loadImage("StoryRight0.gif");
right1 = loadImage("StoryRight1.gif");
right2 = loadImage("StoryRight2.gif") ;
 right3 = loadImage("StoryRight3.gif");
 rightend = loadImage("Storysendright.gif");
 
}


//111 = o

void draw()
{
  
image(homescreen,0,0, 640,480);

if(key == ENTER)
{
  image(story2 ,0,0, 640,480);
}
//all results for left side


if(key==97)
{
 image(left1,0,0,320,480);
image(right0,320,0,320,480); 

}


if(key==99)
{
image(left2  ,0,0, 320,480);
image(right0,320,0,320,480);
}

if(key==101)
{
  image(left3   ,0,0,320,480);
  image(right0,320,0,320,480);
}


if(key==103)
{
 image(leftend, 0,0, 640,480); 
  
}


//all results for right side

if(key==98)
{
 image(right1, 320,0, 320,480);
image( left0, 0,0, 320,480); 
}

if(key==100)
{
 image(right2, 320,0,  320,480); 
 image( left0, 0,0, 320,480); 
}


if(key==102)
{
  image(right3, 320,0,320,480);
  image( left0, 0,0, 320,480); 
}

if(key==104)
{
  image(rightend, 0,0,640,480);
}
}

