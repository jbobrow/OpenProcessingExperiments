
//CMU Computing arts with Processing
//All right reserved to Chia-Fang Lue
//Original information comes from: http://www.theguardian.com/environment/interactive/2012/sep/03/extinct-and-endangered-species-interactive
//World map comes from: http://commons.wikimedia.org/wiki/File:World_map_blank_without_borders.svg

int [ ] data1 = { 261, 50, 30, 33, 30, 16, 21, 97, 36, 7, 20, 180};
int [ ] data2 = { 303, 242, 383, 659, 398, 52, 122, 663, 745, 32, 189, 324};
int [ ] x = {180, 243, 158, 285, 643, 535, 715, 620, 875, 865, 988, 1080};
int [ ] y = {139, 247, 279, 404, 111, 213, 198, 388, 307, 87, 241, 433};

                      
PFont font;

PImage p;

void setup()
{
  size(1280, 592);
  p = loadImage("worldMap1.jpg");
  image( p, 0, 0);
  ellipseMode( CENTER );
  textSize( 18 );
  textAlign( CENTER, CENTER );
  
  
 
}

void draw()
{
  image( p, 0, 0);
  prepWindow();
  //drawData();
  checkMouse();
  
}

void prepWindow()
{
  pushStyle();
    noStroke();
    fill( 224, 154, 23, 180);
    ellipse( 1070, 100, 20, 20);
    fill( 232, 58, 14, 180);
    ellipse( 1070, 140, 20, 20);
    textSize(12);
    fill( 0 );
    textAlign( LEFT);
    text( "Number of endangered species", 1085, 105);
    text( "Number of extinct species", 1085, 145);
  popStyle();
  
  pushStyle();
    font = loadFont( "DINEngschriftStd-48.vlw");
    textFont( font, 32);
    textAlign( LEFT);
    fill(0);
    text( "The number of endangered and extinct species in the world.", 30, 565);
  popStyle(); 
}
//void drawData()
//{
//  pushStyle();
//    for ( int i = 0; i < data1.length; i++)
//    {
//      noStroke();
//      fill( 224, 154, 23, 200);
//      ellipse( x[i], y[i], data2[i]/4, data2[i]/4);
//      fill( 232, 58, 14, 200);
//      ellipse( x[i]-data2[i]/8-data1[i]/8, y[i], data1[i]/4, data1[i]/4); 
//      
//    }
//  popStyle();
//}

void checkMouse()
{
  for ( int i = 0; i < data1.length; i++)
  {
    if ( dist( mouseX, mouseY, x[i], y[i]) < 50)
    {
      noStroke();
      fill( 224, 154, 23, 180);
      ellipse( x[i], y[i], data2[i]/3, data2[i]/3);
      fill( 232, 58, 14, 180);
      ellipse( x[i]-data2[i]/6-data1[i]/6, y[i], data1[i]/3, data1[i]/3); 
      
    }
  }
}

void mousePressed()
{
  for ( int i = 0; i < data1.length; i++)
  {
    if ( dist( mouseX, mouseY, x[i], y[i]) < 50)
    {
      
      if ( data2[i]/6+data1[i]/6 < 30)
      {
        fill( 50 );
        text( data1[i], x[i]-data2[i]/6-data1[i]/6-15, y[i]);
        text( data2[i], x[i], y[i]);
        noLoop();
      }
      
      else
      {
        fill( 50 );
        text( data1[i], x[i]-data2[i]/6-data1[i]/6, y[i]);
        text( data2[i], x[i], y[i]);
        noLoop(); 
      }
    }
  }
//  point( mouseX, mouseY);
//  println( "  vertex( "  + mouseX + ", " + mouseY + ");" );
  
}

void mouseReleased()
{
  loop();
}


