
String myString = "Creative Technologies"; //Creating the text
float myHeight = 28; //Creating the Floats
float myWidth;
PFont myFont;
 
void setup()
{
  size(400, 400); //Stating the size of the sketch window
 
    myFont = loadFont("Utsaah-BoldItalic-48.vlw"); //Loading the font of the text
    textFont(myFont, myHeight); //Creating the size of the text
    myWidth = textWidth(myString);
    colorMode(HSB);
}
 
void draw()
{
    background(0);
 
    translate(width/2,height/2);
 
    for (int n = 0; n < 12; ++n)
    {
        fill(n*255/12,255,255,150); //Creates a rainbow colour effect with the text
        pushMatrix(); //allows the objects to spin
        rotate((frameCount * 0.005) + (n*PI/6)); //rotates the objects and a speed of the frame count time 0.005
        translate((myWidth/2) * sin(frameCount*0.004), 0);//allows the onjects to spin and move independantly
        text(myString, -(myWidth/2), (myHeight/4));
        popMatrix();
    }
}


