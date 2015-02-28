

final int MAX = 48;

PFont f;
PFont t;

int[] posX;
int[] posY;
int[] posZ;

color[] dotColor;

int sliderX, sliderY, sliderWd, sliderHt;
int barX, barWd;
int shift;

String [ ] allStrings;
int [ ]  money;
String [ ] programs;
int xLoc, yLoc;


void setup()
{
  size(800, 800, P3D);
  //smooth();

  allStrings = loadStrings("data.txt");
  //println( allStrings);
  //fill( 0 );

//  xLoc = 20;
//  yLoc = 20;

  money = new int[allStrings.length];
  programs = new String[allStrings.length];
  for ( int i = 0; i < allStrings.length; i++)
  { 
    String [ ] temp = split(allStrings[i], ',') ;
    money[i] = Integer.parseInt(temp[0] );
    programs[i] = temp[1];
  }

  //xLoc = 20;
  //yLoc += 30;
  //println(money);
  //println(programs);

  posX = new int [MAX];
  posY = new int [MAX];
  posZ = new int [MAX];
  dotColor = new int [MAX];

//  posX = initIntArray(int(.25*width), int(.75*width));
//  posY = initIntArray(int(.25*width), int(.75*height));
  posX = initIntArray(int(.2*width), int(.8*width));
  posY = initIntArray(int(.2*height), int(.8*height));
  posZ = initIntArray(-8000, -1000);
  //println(posZ);
  dotColor = initColorArray();
  
//  textAlign( CENTER, CENTER );
  rectMode( CENTER );
  f = loadFont("f.vlw");
  textFont(f);


  
  imageMode( CENTER );
  noStroke( );
  sliderX = width/2;
  sliderY = int(height*.9 );
  sliderWd = int( width*.7 );
  sliderHt = int( height*.05 );

  barWd = int(sliderWd*.03 );
  barX = sliderX ;
}

void draw()
{
  prepBack();
  //pushMatrix();
  drawDots();
  //popMatrix();
  showSlider( );
  checkSlider( );
  //changeZ();
}

//void changeZ()
//{
//  for (int i=0; i<posZ.length; i++)
//  {
//    posZ[i] = posZ[index];
//    
//  }
//}
void showSlider( )
{
  fill( 0, 0, 200, 10 );
  //rect( sliderX, sliderY, sliderWd, sliderHt);
  fill( 0, 200, 0, 10 );
  //rect(barX, sliderY, barWd, sliderHt );
}

void checkSlider( )
{
  if ( //mouseY >= sliderY- sliderHt/2 && 
    //mouseY <= sliderY+ sliderHt/2 &&
    mouseX >= sliderX- sliderWd/2 &&
    mouseX <= sliderX+ sliderWd/2 
    )  // The mouse is on the slider bar
  {
    barX = constrain(    mouseX, 
    sliderX- sliderWd/2, 
    sliderX+ sliderWd/2 );
    shift = constrain(
    int( 
    map( mouseX, sliderX-sliderWd/2, sliderX+sliderWd/2, 0, posZ.length)
      ), 
    0, posZ.length-1)*175;
  }
  //println(shift);
}
//void mouseMoved()
//{
// println(index+"  "+posZ[index]); 
//}
void drawDots()
{
  for (int i=0; i<posX.length; i++)
  //for (int i=0; i<2; i++)
  {
    pushMatrix();
    noStroke();
    translate(posX[i], posY[i], posZ[i]+shift);
    
    if (money[i] >= 1000)
    {
    //println (money[1]*.05);
    fill(0);  
    textMode(MODEL);
    textAlign( CENTER, CENTER );
    textSize(48);
    text(programs[i], 0, money[i]*.06, 0);
    }
    
    else 
    {
    fill(0);
//    textMode(MODEL);
    textAlign( CORNER, CENTER );
    textSize(12);
    text(programs[i], money[i]*.05+10, 0, 0);
    }
    
    //fill(0);
    //textMode(MODEL);
    //text(programs[i], money[i]*.05+10, 0, 0);
    
    fill(dotColor[i]);
    sphere(money[i]*.05);
    //ellipse(0,0, money[i]*.05, money[i]*.05);
    popMatrix();
  }
}


void prepBack()
{
  background(255);
  lights();
  pushStyle();
  fill(0,10);
  t = loadFont("t.vlw");
  textFont(t);
  textAlign( CENTER, CENTER );
  textSize(800);
  text("2009", width*.5, height*.5, -1000);
  //fill(255,10);
  //rect(0, 0, width, height);
  popStyle();
}


int[] initIntArray(int low, int high)
{
  int[] temp = {
  };
  for (int i = 0; i<MAX; i++)
  {
    temp = append(temp, int(random(low, high)));
  }
  return temp;
}

color[] initColorArray()
{
  color[] temp = {
  };
  for (int i = 0; i<MAX; i++)
  {
    temp = append(temp, color(random(255), random(255), random(255)));
  }
  return temp;
}


