
//PImage bg;
String timeS;
int mX;
int mY;

void setup() {
  size(500, 450);
  //bg = loadImage("/Users/void/Documents/Processing/doodleValues3/nz.jpg");
  smooth();
  background(255);
  fill(0);
}

void draw() 
{
  if (mousePressed) 
  {
    ellipse(mouseX, mouseY, 10, 10);
    
    /*
    line(mouseX, mouseY, pmouseX, pmouseY);
     fill(125);
     line(mouseX-2, mouseY-2, pmouseX, pmouseY);
     fill(5);
     line(mouseX-3, mouseY+2, pmouseX, pmouseY);
     fill(155);
     line(mouseX-2, mouseY-2, pmouseX, pmouseY);
     fill(25);
     line(mouseX-3, mouseY+2, pmouseX, pmouseY);
     //round(mouseX,mouseY,100,100);
     */

    if (mouseX != mX || mouseY != mY)
    {
      timeS = timestamp();
      mX = mouseX;
      mY = mouseY;
      
      println (timeS);
      println (mouseX+" , "+mX);
      println (mouseY+" , "+mY);
      
      String url = "http://ageoftheinterface.com/Database/UploadValues.php?XCoordinate=" + mX + "&YCoordinate=" + mY;
      loadStrings(url);
    }
  }
}

String timestamp() 
{
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS%1$tL", now);
}

