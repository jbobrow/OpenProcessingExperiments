
// 48-527 Project #1 | Data Visualization
// Humaira Tasnim | htasnim | Copyright 2012
// Source: http://www.intel.com/content/www/us/en/communications/internet-minute-infographic.html
// Instruction: Click on the different balls and drag them

import fisica.*;

String youtube, google, facebook, twitter, flickr, linkedin, pandora,
  amazon, apps, mobile, email, identity, wikipedia, botnet;

PImage bg;
PFont gulim;
FWorld world;
FCircle ball;

color displaycolor;
String displaytext = "";

void setup()
{
  size(650, 350);
  smooth();
  
  bg = loadImage("one-minute.jpg");
  gulim = loadFont("Gulim-48.vlw");
  
  Fisica.init(this);
  
  world = new FWorld();
  world.setEdges(this, color(0, 0));
  world.setEdgesRestitution(0.0);
  world.left.setName("");
  world.right.setName("");
  world.top.setName("");
  world.bottom.setName("");
  
  youtube = "YouTube";
  displayInfo(youtube, 255, 51, 51, "30 Hours of video uploaded | 1.3 million Video views");
  
  google = "Google";
  displayInfo(google, 1, 162, 20, "2+ million Search queries");  
  
  facebook = "Facebook";
  displayInfo(facebook, 60, 92, 153, "277,000 Logins | 6 million Facebook views");
  
  twitter = "Twitter";
  displayInfo(twitter, 51, 204, 255, "100,000 New tweets | 320+ New Twitter accounts");
  
  flickr = "Flickr";
  displayInfo(flickr, 255, 0, 132, "3,000 Photo uploads | 20 million Photo views");
  
  linkedin = "LinkedIn";
  displayInfo(linkedin, 19, 156, 198, "100+ New LinkedIn accounts");
  
  pandora = "Pandora";
  displayInfo(pandora, 51, 102, 153, "61,141 Hours of music");
  
  amazon = "Amazon";
  displayInfo(amazon, 255, 153, 0, "$83,000 in sales");
  
  apps = "Apps";
  displayInfo(apps, 240, 155, 10, "47,000 App downloads");
  
  mobile = "Mobile";
  displayInfo(mobile, 128, 101, 132, "1,300 New mobile users");
  
  email = "Email";
  displayInfo(email, 185, 17, 163, "204 million Emails sent");
  
  identity = "Identity";
  displayInfo(identity, 255, 0, 0, "20 New victims of identity theft");
  
  wikipedia = "Wikipedia";
  displayInfo(wikipedia, 172, 173, 176, "6 New Wikipedia articles published");  

  botnet = "Botnet";
  displayInfo(botnet, 255, 0, 0, "135 Botnet infections");
}
 
void draw()
{
  prepScreen();
  showTitle();
  
  textFont(gulim, 20);

  fill(255);
  rect(0, 0, width, 50);
  fill(displaycolor);
  text(displaytext, 20, 30);
     
  world.step();
  world.draw();
}
 
void prepScreen()
{
  image (bg, 0, 0, width, height);
}

void showTitle()
{
  noStroke();
  fill(50, 112, 135);
  rect(0, 140, 300, 85);
  fill(255);
  textSize(24);
  text("What Happens in an", 30, 170);
  textSize(30);
  text("Internet Minute?", 30, 210);
}

void displayInfo(String company, int r, int g, int b, String info)
{
  ball = new FCircle(40);
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

