
//PImage bg;
int mX;
int mY;

void setup() {  //setup function called initially, only once
  size(500, 450);
  //bg = loadImage("nz.jpg");
  smooth();
  background(255);
  fill(0);
}

void draw() {  //draw function loops 
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
    println ("test001");
      println ("test002");
      mX = mouseX;
      println ("test003");
      mY = mouseY;
      println ("test004");
      
      println (mouseX+" , "+mX);
      println (mouseY+" , "+mY);
      
      String url = "http://ageoftheinterface.com/Database/UploadValues.php?XCoordinate=" + mX + "&YCoordinate=" + mY;
      println ("test005");
      loadStrings(url);
      println ("test006");
    }
  }
}

