
import de.bezier.data.sql.*;

MySQL msql;
PImage bg;
String timeS;
int mX;
int mY;
int msqlX;
int msqlY;

void setup() {
  size(500, 450);
  bg = loadImage("nz.jpg");
  smooth();
  background(bg);
  fill(0);

  String user     = "ageofthe_aoti";
  String pass     = "aoti2011?";
  String dbHost   = "83.142.230.122";
  String database = "ageofthe_doodle";
  msql = new MySQL( this, dbHost, database, user, pass );
  
  if (msql.connect())
      {
        msql.query("SELECT XCoordinate, YCoordinate FROM collabdraw");
        while (msql.next ())
        {
          msqlX = msql.getInt ("XCoordinate");
          msqlY = msql.getInt ("YCoordinate");
          ellipse(msqlX, msqlY, 10, 10);
        }
      }
      else
      {
        println ("connection failed");
      }
}

void draw() 
{
  if (mousePressed) 
  {
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
      mX = mouseX;
      mY = mouseY;

      if (msql.connect())
      {
        msql.execute("INSERT INTO collabdraw (XCoordinate, YCoordinate) VALUES (" + mX + ", " + mY + ")");
        println (mX+" , "+mY);
        
        msql.query("SELECT XCoordinate, YCoordinate FROM collabdraw");
        while (msql.next ())
        {
          msqlX = msql.getInt ("XCoordinate");
          msqlY = msql.getInt ("YCoordinate");
          ellipse(msqlX, msqlY, 10, 10);
        }
      }
      else
      {
        println ("connection failed");
      }
    }
  }
}


