

PFont font;

void setup ()
{
size(400,400);
noCursor();
colorMode(HSB,100);//easier to move with ..creates nice rainbows ;-)
smooth();
background(0,0,20);
font = loadFont("urania_czech-21.vlw"); 

 
}

void draw()
{
  //this creates the fade effect
  noStroke();
  fill(0,0,20,30);
  rect(0,0, width, height);
  
  //the black lines (task 1)
  stroke(0);
  line(0,height/2,width,height/2);
  line(width/2,0,width/2,height);
  //calculates the color depending on the mouse position
  int h= int (map(mouseX,0,width,0,100));
  stroke(h,100,100);
  //draw the crosshair
  line((mouseX-10),mouseY,mouseX+10,mouseY);
  line(mouseX,mouseY-10,mouseX,mouseY+10);
  //draw the line/trail, visible when the mouse moves faster
  line(mouseX, mouseY,pmouseX,pmouseY);

//to display the text
fill(h,100,100);
textFont(font, 21); 
text("x ",20,30);
text("y ",20,50);
text(mouseX,40,30);
text(mouseY, 40, 50);
  
}



