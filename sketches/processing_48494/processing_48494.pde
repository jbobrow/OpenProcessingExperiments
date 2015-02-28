
import interfascia.*;
import controlP5.*; // library I found on http://www.sojamo.de/libraries/controlP5/index.html#about

//ControlP5 controlP5;

// Project 2 (Prototype1 for my thesis)
// Copyright Kinnari Thakker 2011 Pittsburgh, 15224

final int MAX = 100;
//String textValue = "";
//Textfield myTextfield;

float[] ellipseXvalue;
float[] ellipseYvalue;
int ellipseCount;

float startEllipseX, startEllipseY, ellipseWidth;
float mouseReleasedX, mouseReleasedY;
float prevX, prevY;
int value;
color color1, color2, color3, color4;


GUIController c;
IFTextField t;
IFLabel l;


void setup()
{
  c = new GUIController(this);

  size(1000,600);
  ellipseWidth = 60;
  
  color1 = color(206,50,50);
  color2 = color(12,114,33);
  color3 = color(22,50,153);
  color4 = color(144,22,147);
  
  textMode(SCREEN);
  //textAlign(LEFT);
  //textSize(14);
  
  ellipseXvalue = new float[MAX];
  ellipseYvalue = new float[MAX];
  ellipseCount = 0;
  
  backgrounder();
  colorPalette();
  instructions();
    
}

void draw(){
//saveFrame("screenshot.jpg");
}

void backgrounder()
{
  background(200);
  noStroke();
  fill(color1);
  ellipse(width/2, height/2, ellipseWidth,ellipseWidth);
  ellipseXvalue[ellipseCount] = width/2;
  ellipseYvalue[ellipseCount] = height/2;
  ellipseCount++;
  prevX = width/2;
  prevY = height/2;
}

void colorPalette()
{
  stroke(160);
  fill(200);
  rect(0,0, width/8, height);
  
  noStroke();
  rectMode(CORNER);
  
  fill(color1);
  rect(width/30, height/9, 30,30);
  fill(color2);
  rect(width/30+40, height/9, 30,30);
  fill(color3);
  rect(width/30, height/9+40, 30,30);
  fill(color4);
  rect(width/30+40, height/9+40, 30,30);
}

void resetPrev ()
{
  prevX=-1;
  prevY=-1;
}


boolean inEllipse ()
{
    float distance;

  for (int i=0; i < ellipseCount; i++)
  {
     distance = dist(mouseX,mouseY,ellipseXvalue[i], ellipseYvalue[i]);
     if(distance <= ellipseWidth/2)
     {
       println("you have clicked on an ellipse");
       prevX = mouseX;
       prevY = mouseY;
       return true;
     }
  }
  return false;
}

void mousePressed()
{
    mouseReleasedX = mouseX;
    mouseReleasedY = mouseY;
    
  
  if(mouseX > width/8)
  {
    
    println("prevX:" + prevX + "boolean:"+inEllipse());
    
    if (prevX != -1 && !inEllipse()) {
      
      stroke(230);
      line(prevX, prevY,mouseReleasedX, mouseReleasedY);
      
      noStroke();

      ellipse(mouseReleasedX, mouseReleasedY, ellipseWidth, ellipseWidth);
      t = new IFTextField("Text Field", (int)mouseReleasedX, (int)mouseReleasedY+5, 150);
      c.add(t);      
      //t.addActionListener(this);
    
      ellipseXvalue[ellipseCount] = mouseReleasedX;
      ellipseYvalue[ellipseCount] = mouseReleasedY;
      ellipseCount ++;
      resetPrev();
    }
  }
  
  value = get(mouseX, mouseY);
  println("color: " + value);
    
  if( value == color1 && mouseX < width/8 )
  {
    println("red");
    fill(color1);

  }
  else if (value == color2 && mouseX < width/8)
  {
    println("green");
    fill(color2);
  }
  else if (value == color3 && mouseX < width/8)
  {
    println("blue");
    fill(color3);
  }
  else if (value == color4 && mouseX < width/8)
  {
    println("purple");
    fill(color4);
  }
  
   
}

void instructions()
{
  fill(0);
  textSize(20);
  text("Color Palette", width/30, height/9-10);
  
  
  text("Connect your ideas--Visually!!", width/30, height*.85);
  textSize(14);
  text("Click on an existing ellipse and then", width/30, height*0.89);
  text("somewhere else to make a new connection", width/30, height*0.915);
  text("Label your idea in the white textfield", width/30, height*0.94);
  
  textSize(14);
  text("by Kinnari Thakker (v-0.5) (very rough)", width/30, height*.98);
}

