
PFont myFont;
PFont myFont2;
String myText;
import processing.pdf.*;

boolean exportePDF = true;

void setup()
{
 String[] fontList = PFont.list();
  println(fontList);
  smooth();
  size(425,600);
  /*if (exportePDF==true)
    beginRecord(PDF, "motif.pdf");
  */

//  myFont = loadFont("AGaramondPro-Italic-48.vlw");
//  myFont2 = loadFont("HelveticaNeue-Light-48.vlw");
  myFont = createFont("AGaramondPro-Italic",48);
  myText= "";

}

void draw()
{
  background(0);
  pushMatrix();
  rotate(radians(45));
  // Grille
  //x
   for(int i=-400;i<600;i = i+10)
  {
    stroke(abs(i),0,0);
    line(0,i,200,i);
  }
  //y
 for(int i=-400;i<600;i = i+10)
  {
    stroke(abs(i),0,0);
    line(i,-600,i,600);

  }

  popMatrix();
      //Cercle
  noStroke();
  fill(0);
  ellipse(width/2,height/2,75,75);
  //Rectangle
  rect(width-210,height-80,185,30);
  fill(255);
  //Triangle  
  triangle((width/2)-33,(height/2)+20,(width/2)+33,(height/2)+20,(width/2),(height/2)-35);
  // Text
  fill(233);
  textFont(myFont,30);
  text("Processing Paris",width-200,height-55);
  textFont(myFont,50);
  text("'10",width-90,height-15);
//  textFont(myFont2,20);
  fill(0);
  pushMatrix();
  //Rotation du text
  for (int i=0;i<10;i++)
  {
    rotate(radians(10));
    text(myText,100,20);
  }
  popMatrix();

}

void keyPressed()
{
  if(keyCode == BACKSPACE)
  {
    if(myText.length()>0)
    {
      myText = myText.substring(0,myText.length()-1);
    }
  }
  else
  {
    myText = myText + key;
  }
}

/*void stop()
{
  if (exportePDF==true)
    endRecord();
  super.stop();
}*/


