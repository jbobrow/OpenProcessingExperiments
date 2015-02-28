
ArrayList frames = new ArrayList();

PFont font;

void setup()
{
  size( 600, 400 );
  frameRate( 30 );  

  font = loadFont( "ArialMT-12.vlw" );
  textFont( font, 12 );

  frames.add( new f1() );
  frames.add( new f2() );
  frames.add( new f3() );
  frames.add( new f4() );
  frames.add( new f5() );
  frames.add( new f6() );
  frames.add( new f7() );
  frames.add( new f8() );
  frames.add( new f9() );
}

int time = 0;
int frameTime = 170;

void draw()
{
  background( 0 );
  time = (time + 1) % (frameTime * frames.size());
  ((Drawable)frames.get( (time/frameTime) )).draw();
}

public abstract class Drawable
{
  public abstract void draw();

  public void drawOrigin()
  {
    pushStyle();
    stroke( 255, 0, 0 );
    line( 0, -50, 0, 50 );
    stroke( 0, 255, 0 );
    line( -50, 0, 50, 0 );
    popStyle();
  } 
}

public class f1 extends Drawable
{
  public void draw()
  {
    drawOrigin();
    text( "Without any transformations, the origin \n is at the top left corner of the screen", 10, 20 );
  }
}

public class f2 extends Drawable
{
  public void draw()
  {
    pushMatrix();
    translate( 300, 200 );
    drawOrigin();
    text( "If I call translate( 300, 200 ) before I start drawing, \n the origin moves to the point 300, 200", 10, 20 );
    popMatrix();
  }
}

public class f3 extends Drawable
{
  public void draw()
  {
    pushMatrix();
    translate( 300, 200 );
    drawOrigin();
    ellipse( 20, 20, 10, 10 );
    text( "If I render something at the point 20, 20,\n it will be rendered at the 'new' 20,20,\n which before was 320,220", 10, -50 );
    popMatrix();
  }
}

public class f4 extends Drawable
{
  public void draw()
  {
    pushMatrix();
    translate( 300, 200 );
    translate( -100, -70 );
    drawOrigin();
    text( "If I translate again, it will move with respect to the new origin. \n(-100, -70) in this case)", 10, 20 );
    popMatrix();
  }
}

public class f5 extends Drawable
{
  public void draw()
  {
    pushMatrix();
    translate( 300, 200 );
    drawOrigin();
    text( "After a while, it can be confusing to know \nwhere the origin currently is. \n This is where pushMatrix() and popMatrix() come in. \n Don't let the names scare you, \n You'll never have to look at a Matrix.", 10, 20 );
    popMatrix();
  }
}

public class f6 extends Drawable
{
  public void draw()
  {
    pushMatrix();
    translate( 300, 200 );
    drawOrigin();
    text( "If I call pushMatrix(), the location of the origin and the \nrotation is saved. This infomation is stored in a \n'Transformation Matrix'", 10, 20 );
    popMatrix();
  }
}

public class f7 extends Drawable
{
  public void draw()
  {
    pushMatrix();
    translate( 300, 200 );
    drawOrigin();
    translate( 100, -100 );
    drawOrigin();
    translate( -200, 150 );
    drawOrigin();
    text( "I can translate and rotate around as much as I want,\nand then call popMatrix() when I want to \nget my original origin back.", 10, 20 );
    popMatrix();
  }
}

public class f8 extends Drawable
{
  public void draw()
  {
    pushMatrix();
    translate( 300, 200 );
    drawOrigin();
    text( "You can also call pushMatrix() as many times \nas you'd like. This is because \neach time you call pushMatrix,\n the transformation information is pushed\n onto a stack.", 10, 20 );
    popMatrix();
  }
}

public class f9 extends Drawable
{
  public void draw()
  {
    pushMatrix();
    translate( 300, 200 );
    drawOrigin();
    text( "Calling popMatrix() takes the value off the \ntop of the stack. Search online to find \nmore about stacks.", 10, 20 );
    popMatrix();
  }
}



