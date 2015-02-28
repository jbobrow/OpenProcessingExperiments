
PFont myFont;
PFont myFont2;
PFont myFontItalic;
//PFont tryFont;

size(500,500);
background(255,180,68);

myFont = createFont("Helvetica",32,true);
myFont2 = createFont("Helvetica",14,false);
myFontItalic = createFont("Georgia-Italic",14,false);

//tryFont = loadFont("Helvetica-60.vlw);

  textFont (myFontItalic);
  text("This is a message for Sam:",30,30);
  textFont (myFont);
  text("DEAR SAM,",50,100);
  textFont (myFont2);
  text("Inspired by your Spiral,",50,125);
  text("i copy -> pasted your code",50,145);
  text("and now, instead of this ugly spiral:",50,165);
  text("i managed to sketch",50,300);
  text("this piece of art! -->",50,320);
  textFont (myFontItalic);
  text("Thanks!",50,400);
  


  
  PImage myImage = loadImage("before.jpg");
image(myImage ,50,180);



//Spiral code edited from a forum post http://processing.org/discourse/yabb2/YaBB.pl?num=1223582667
noFill();
smooth();
translate(250,360);
strokeWeight(2);
beginShape();
for(int i=0;i<60;i++)
{
 curveVertex((i*2)*cos(i/3.0), (i)*sin(i/3.0));
}
endShape();


