
String myname = "Devon";
color red = color(255, 0, 0);
float mynumber = 0;
boolean shouldBeRed = false;

void setup()
{
  size(500, 500);
  
  // Set frameRate to 30 times a second
  frameRate(30);
}

void draw()
{
  // set background white
  background(255);
  
  //println("x: " + mouseX + " y: " + mouseY);
  //println(myname);
  
  // example of functions returning
  float result = addFiveMultPI(2);
  mynumber = addFiveMultPI(mynumber);
  //println(mynumber);
  
  // if the mouse position is less than 1/3 of screen make circle red,
  // less than 2/3 make circle blue
  // else black
  if (mouseX <= (width/3))
  {
    // example of storing true false value in a boolean variable
    shouldBeRed = true;
  }
  else if (mouseX <= (width/3) * 2)
  {
    fill(0,0,255);
    shouldBeRed = false;
  }
  else
  {
    fill(0);
    shouldBeRed = false;
  }
  
  // check our stored boolean variable to change the fill now
  if (shouldBeRed == true)
  {
    fill(red);
  }
  
  // draw the circle using whatever fill color was set
  ellipse(width/2, height/2, mouseX, 200);
  
  // draw a red line down the screen in the y every 10 pixels over in the x
  stroke(red);     
  int xoffset = 0;
  while (xoffset < width)
  {
    //xoffset = xoffset + 10;
    xoffset += 10;
    line(xoffset, 0, xoffset, height);
  }
  
  // draw a red line across the screen in the x every 20 pixels down in the y
  for (int yoffset = 0; yoffset < height; yoffset += 20)
  {    
    line(0, yoffset, width, yoffset);
    
    // draw a random colored line down 20 pixels from yoffset every 20 pixels over in the x
    for (int xoffset2 = 0; xoffset2 < width; xoffset2 += 20)
    {
      stroke(random(255), random(255), random(255));
      line(xoffset2, yoffset, xoffset2, yoffset+20);
    }
  }

  // draw concentric circles with increasing diameter by 20 in the corner
  for (int diameter = 0; diameter < width; diameter += 20)
  {
    stroke(0,0,255);
    noFill();
    ellipse(0,0,diameter,diameter);
  }
}

// function we defined
float addFiveMultPI(float x)
{
  return (x + 5) * 3.14;
}

