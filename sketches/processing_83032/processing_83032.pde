

import fisica.*;


String Protestant, Catholic, Jewish, OtherFaiths, Unaffiliated, Mormon;

PImage bg;
PFont gulim;
FWorld world;
FCircle ball;


color displaycolor;
String displaytext = "";

void setup()
{
  size(749, 800);
  smooth();
  rect(-80, 20, 2000, 55);
  
  bg = loadImage("http://img.allvoices.com/thumbs/image/609/609/91510700-obama-vs-romney.jpg");
  gulim = loadFont("Gulim-48.vlw");


  
  
  Fisica.init(this);
  
  world = new FWorld();
  world.setEdges(this, color(0, 0));
  world.setEdgesRestitution(0.0);
  world.left.setName("");
 
  
 
  
  Protestant = "Protestant";
  displayInfo(Protestant, 228, 62, 44, "Obama 42%");
  
   Protestant = "Protestant";
  displayInfo(Protestant, 39, 96, 170, "Romney 42%");
  
  Catholic = "Catholic";
  displayInfo(Catholic, 228, 62, 44, "Obama 50%");

  Catholic = "Catholic";
  displayInfo(Catholic, 39, 96, 170, "Romney 48%");   
  
  Jewish = "Jewish";
  displayInfo(Jewish, 228, 62, 44, "Obama 69%");
  
  Jewish = "Jewish";
  displayInfo(Jewish, 39, 96, 170, "Romney 30%");
  
  OtherFaiths = "OtherFaiths";
  displayInfo(OtherFaiths, 228, 62, 44, "Obama 74%");
  
  OtherFaiths = "OtherFaiths";
  displayInfo(OtherFaiths, 39, 96, 170, "Romney 23%");
  
  Unaffiliated = "Unaffiliated";
  displayInfo(Unaffiliated, 228, 62, 44, "Obama 70%");
  
  Unaffiliated = "Unaffiliated";
  displayInfo(Unaffiliated, 39, 96, 170, "Romney 26%");
  
  Mormon = "Mormon";
  displayInfo(Mormon, 228, 62, 44, "Obama 21%");
  
  Mormon = "Mormon";
  displayInfo(Mormon,39, 96, 170, "Romney 78%");
 
  
  
}
 
void draw()
{
  background(255);
  prepScreen();
  showTitle();
  
  textFont(gulim, 30);

  fill(255);
  rect(0, 0, width, 50);
  fill(25);
  text(displaytext, 340, 180);
     
  world.step();
  world.draw();
}
 
void prepScreen()
{
  image (bg, -24, 100, height, width);
  
  
}

void showTitle()
{
  noStroke();
  fill(50, 112, 135);
  rect(10, 140, 300, 85);
  fill(255);
  textSize(24);
  text("Presidential Vote", 30, 170);
  textSize(30);
  text("By Religion 2012", 30, 210);
  rect(110, -400, 400, 85);
  fill(255);
}

void displayInfo(String company, int r, int g, int b, String info)
{
  ball = new FCircle(100);
  ball.setName(company + " — " + info);
  ball.setPosition(random(300,width-300), random(100,150));
  ball.setNoStroke();
  ball.setFill(r, g, b);
  world.add(ball);
}

void mouseMoved()
{
  FBody hovered = world.getBody(mouseX, mouseY);
  if(hovered != null)
  {
    displaytext = hovered.getName();
    displaycolor = hovered.getFillColor();
  }
  else
    displaytext = "";
}

