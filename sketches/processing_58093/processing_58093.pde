
//computer arts for processing 60-257
//hw #12 data visualization
//copyright kyree 2012

PFont f;
PImage img;

//item array
String[] items = {"detergent", "softner", "washer", "dryer", 
"missing socks", "shrunken clothes", "lost wages"};

//cost to me array
int[] quarters = {28, 16, 18, 6, 6, 10, 2};


void setup()
{
  size(600,450);
  img = loadImage("laudromat.jpg");
  f = loadFont("DistroMix-30.vlw");
}

void draw()
{
//background picture
image(img,0,0); 

textFont(f,20);
//header
noStroke();
fill(0,255,0,130);
rect(0,10,400,50); 
textSize(24);
textAlign(CENTER);
fill(0);
text("kyree's dirty laundry ", 200, 35);
textSize(16);
text("(in quarters)", 195, 50);
  
//calls and displays items from the array on mouseover
int x = 100;
for(int i = 0; i < items.length; i++)
   {
      if(mouseX>x && mouseX<= x+40)
      {
       fill(0); 
       rectMode(CENTER);
       rect(mouseX +50, mouseY -5, 160, 25);
       
       //highlight bar on mouseover
       fill(255,0,0,150);
       textSize(20);
       text(items[i], mouseX+50, mouseY);

       //display cost in corner   
       textSize(40);
       text(quarters[i] + " quarters", 500, 122);  
       
 }
     //keeps bars faded if not chosen  
     else
     {
       fill(50,200);
     }

//sets bounds of graph
    float h = map(quarters[i], 0,40,0,400);
   
    noStroke();
    rectMode(CORNER);
   //displays bars equally incremented and according to values
    rect(x,400,15,-h);
    x+=60;
  }
}


