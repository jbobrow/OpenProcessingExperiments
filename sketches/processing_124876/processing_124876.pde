
//Copyright: Angela Kolosky, Carnegie Mellon University, Pittsburgh, PA

//Computing for the Arts with Processing, Project 1
//Lighting Demo

//for some reason the light would not work in another function. This is why everything is in draw(), SORRY! I moved what I could out of it.

//Instructions: Directional Light Controls: Red hue up: R, Red hue down: r
//                                          Green hue up: G, Green hue down: g
//                                          Blue hue up: B, Blue hue down: b
//              Light Specular Controls:    Red hue up: 1, Red hue down: 2
//                                          Green hue up: 3, Green hue down: 4
//                                          Blue hue up: 5, Blue hue down: 6
//              Shininess Controls:         Shine up: S, shine down: s
//Hover over each function for a description of the code.
//As you make changes to the variables, key comments will pop up.


int redHue;
int greenHue;
int blueHue;

int xValue;
int yValue;
int zValue;
int shineSphere;

int rspec;
int gspec;
int bspec;

void setup()
{
  size(600, 400, P3D);
  background(0);

  redHue=0;
  greenHue=0;
  blueHue=0;
  
  xValue=0;
  yValue=0;
  zValue=0;
  
  shineSphere=0;
  
  rspec=0;
  gspec=0;
  bspec=0;
}

void draw()
{
background(0);
fill(255);
drawText();
drawComments();

noStroke();
lightSpecular(rspec,gspec,bspec);
directionalLight(redHue, greenHue, blueHue, xValue, yValue, zValue);
translate(300,200,0);
shininess(shineSphere);
sphere(100);
}

void drawText()
{
textSize(20);
textAlign(CORNER);
  text("HOW TO CODE LIGHT  |",40,32,-30);
textSize(15);
  text("lightSpecular("+rspec+","+gspec+","+bspec+")",340,13,-30);
  text("directionalLight(" + redHue + "," + greenHue + "," + blueHue + "," + xValue + "," + yValue + "," + zValue + ")",340, 32,-30);
  text("shininess("+ shineSphere+")",340, 51,-30);
fill(100,100,100);
textAlign(CENTER);
  if (mouseX < 450 && mouseX > 300 && mouseY < 32 && mouseY > 13)
    { text("Light Specular is the color of light bouncing off the",300,360,-30);
      text("object or can be understood as the object's material color",300,377,-30);
      text("lightSpecular(RED HUE, GREEN HUE, BLUE HUE)",300,395,-30);
    }

  if (mouseX < 450 && mouseX > 300 && mouseY < 51 && mouseY > 32)
    { text("Directional Light is a light source that simulates shinning light ",300,360,-30);
      text("on an object from a specific direction in a specific color",300,377,-30);
      text("directionalLight(RED HUE, GREEN HUE, BLUE HUE, X COORD, Y COORD, Z COORD)",300,395,-30);
    }

  if (mouseX < 450 && mouseX > 300 && mouseY < 66 && mouseY > 51)
    { text("Shininess is the gloss of the material",300,360,-30);
      text("shininess(SHINE VALUE)",300,380,-30);
    }
}

void drawComments()
{
  textSize(15);
  fill(157,157,157);
  textAlign(CENTER);
  //directional light
  if (redHue == greenHue && greenHue == blueHue && redHue != 0) text("Combing equal amounts of RGB leads to White Light",300,340,-30);
  
  if (redHue > greenHue && redHue > blueHue) text("Higher red values produce a more red light",300,340,-30);
  
  if (greenHue > redHue && greenHue > blueHue) text("Higher green values produce a more green light",300,340,-30);
  
  if (blueHue > redHue && blueHue > greenHue) text("Higher green values produce a more yellow light",300,340,-30);
  
  if (redHue == greenHue && redHue != 0 && redHue != blueHue) text("Equal Red and Green Values creates Yellow Light through the 'Additive Color Model'",300,340,-30);
  
  if (redHue == blueHue && redHue != 0 && redHue != greenHue) text("Equal Red and Blue Values creates Magenta Light through the 'Additive Color Model'",300,340,-30);
  
  if (greenHue == blueHue && greenHue != 0 && greenHue != redHue) text("Equal Green and Blue Values creates Cyan Light through the 'Additive Color Model'",300,340,-30);

}

void keyPressed( )
{
  //light colors
    if ( key == 'R' ) redHue+=10;
    else if (key == 'r') redHue-=10;
    
    if ( key == 'B' ) blueHue+=10;
    else if (key == 'b') blueHue-=10;
    
    if ( key == 'G' ) greenHue+=10;
    else if (key == 'g') greenHue-=10;
   
  //coords
    if ( key == 'X' ) xValue+=10;
    else if (key =='x') xValue-=10;
    
    if ( key == 'Y' )  yValue+=10;
    else if (key =='y') yValue-=10;
    
    if ( key == 'Z' )  zValue+=10;
    else if (key =='z') zValue-=10;
    
    //spec
    if ( key == '1' ) rspec+=10;
    else if (key =='2') rspec-=10;
    
    if ( key == '3' )  gspec+=10;
    else if (key =='4') gspec-=10;
    
    if ( key == '5' )  bspec+=10;
    else if (key =='6') bspec-=10;
  
    //shininess
    if ( key == 'S' ) shineSphere+=1;
    else if (key =='s') shineSphere-=1;
}  


