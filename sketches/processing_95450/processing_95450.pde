
int x = 150;
int z= (x-30);
int y= 50;

size(400,400);
smooth();
PFont Heading;
PFont Sleep;
 Sleep = loadFont("GoudyOldStyleT-Italic-32.vlw");
 Heading = loadFont("Helvetica-Bold-32.vlw");
 
 textFont(Heading);
 textSize(10);
 fill(0,10);
 textAlign(LEFT);
 text("Good morning...", x,20, 100, 50);
  
 textFont(Sleep);
 textSize(10);
 fill(0,80);
 textAlign(LEFT);
 text("mmmmmm", z ,35, 100, 25);
 
 textFont(Sleep);
 textSize(12);
 fill(0,100);
 textAlign(LEFT);
 text("yaaaawwnn...mornin...", z,90, 200, 15);
 
 textFont(Heading); 
 textSize(12);
 fill(0,80);
 textAlign(LEFT);
 text("Hey, hey....good moooorning...",x,60, 200, 55);
 
 textFont(Sleep);
 textSize(10);
 fill(0,80);
 textAlign(LEFT);
 text("mmmmmm...?", z ,150, 100, 25);
  
  
 textFont(Heading);
 textSize(14);
 fill(0,40);
 textAlign(LEFT);
 text("Are you awake, sleepy head?", x,120, 200, 55);
 
 textFont(Heading);
 textSize(20);
 fill(0,25);
 textAlign(LEFT);
 text("Hello???", x,180, 200, 55);
 
 textFont(Sleep);
 textSize(20);
 fill(0,30);
 textAlign(LEFT);
 text("...", z ,210, 100, 25);
 fill(0,20);
 text("...", z+15 ,210, 100, 25);
   
 textFont(Heading);
 textSize(10);
 fill(0,25);
 text( "are you drifting off on me again?",x, 250,200, 55);
 
 
 textFont(Sleep);
 textSize(20);
 fill(0,30);
 textAlign(LEFT);
 text("...", z ,270, 100, 25);
 fill(0,20);
 text("...", z+15 ,270, 100, 25);
 
textSize(30);
fill(0,100);
text("SNNNOOOORREEE", 60 ,320, 1000, 200);
