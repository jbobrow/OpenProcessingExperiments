
String myString = "Spinning";
float myHeight = 28;
float myWidth;
PFont myFont;

void setup()
{
  size(250, 250);

    myFont = loadFont("Arial");
    textFont(myFont, myHeight);
    myWidth = textWidth(myString);
    colorMode(HSB);
}

void draw()
{
    background(128);

    translate(width/2,height/2);

    for (int n = 0; n < 12; ++n)
    {
        fill(n*255/12,255,255,150);
        pushMatrix();
        rotate((frameCount * 0.005) + (n*PI/6));
        translate((myWidth/2) * sin(frameCount*0.004), 0);
        text(myString, -(myWidth/2), (myHeight/4));
        popMatrix();
    }
}
