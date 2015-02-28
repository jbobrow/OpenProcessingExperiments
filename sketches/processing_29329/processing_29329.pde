
import controlP5.*;
import java.util.Vector;
import java.awt.Color;


GUI gui;
Grid gr;
ControlP5 PrimaryP5;

public void setup()
{
  size(800, 800);
  //background(0 , 105 ,140);
  background(0);
  PrimaryP5 = new ControlP5(this);

  String[][] arg = {
    {
      "I", "actually", "need", "some", "help", "here"
    } 
    , {
      "pretty", "please"
    }
  };


  gr = new Grid(arg);
  gui = new GUI(PrimaryP5, gr);
  gui.drawGrid();
}

public void draw()
{
}

public void controlEvent(ControlEvent theEvent) 
{
  if ( theEvent.isController() )
  {
    if (theEvent.controller().name() == "Update")
    {
      gui.removeGrid();
      gr.resize(gui.getFieldX(), gui.getFieldY());
      gui.drawGrid();
      background(0);
      positionA();
      positionB();
      positionC();
      drawA();
      drawB();
      drawC();
    }

    if (theEvent.controller().name() == "A" )
    {
      gr.pointA.show = gui.ShowA.getState();
    }

    if (theEvent.controller().name() == "B" )
    {
      gr.pointB.show = gui.ShowB.getState();
    }

    if (theEvent.controller().name() == "C" )
    {
      gr.pointC.show = gui.ShowC.getState();
    }
  }
}

public void positionA()
{
  gui.getAX();
  gui.getAY();
}

public void positionB()
{
  gui.getBX();
  gui.getBY();
}

public void positionC()
{
  gui.getCX();
  gui.getCY();
}

public void drawA()
{
  if ( gr.pointA.show )
  {
    float x = gr.arr[gr.pointA.x][gr.pointA.y].text.position().x();
    float y = gr.arr[gr.pointA.x][gr.pointA.y].text.position().y();
    int w = gr.arr[gr.pointA.x][gr.pointA.y].text.getWidth();
    int l = gr.arr[gr.pointA.x][gr.pointA.y].text.getHeight();

    fill(gr.pointA.cl.getRed(), gr.pointA.cl.getGreen(), gr.pointA.cl.getBlue());
    rect(x - 2, y - 2, w + 4, l + 4 );
  }
}

public void drawB()
{
  if ( gr.pointB.show )
  {
    float x = gr.arr[gr.pointB.x][gr.pointB.y].text.position().x();
    float y = gr.arr[gr.pointB.x][gr.pointB.y].text.position().y();
    int w = gr.arr[gr.pointB.x][gr.pointB.y].text.getWidth();
    int l = gr.arr[gr.pointB.x][gr.pointB.y].text.getHeight();

    fill(gr.pointB.cl.getRed(), gr.pointB.cl.getGreen(), gr.pointB.cl.getBlue());
    rect(x - 2, y - 2, w + 4, l + 4 );
  }
}

public void drawC()
{
  if ( gr.pointC.show )
  {
    float x = gr.arr[gr.pointC.x][gr.pointC.y].text.position().x();
    float y = gr.arr[gr.pointC.x][gr.pointC.y].text.position().y();
    int w = gr.arr[gr.pointC.x][gr.pointC.y].text.getWidth();
    int l = gr.arr[gr.pointC.x][gr.pointC.y].text.getHeight();

    fill(gr.pointC.cl.getRed(), gr.pointC.cl.getGreen(), gr.pointC.cl.getBlue());
    rect(x - 2, y - 2, w + 4, l + 4 );
  }
}

public class GUI {

  ControlP5 controlP5;
  Textfield gridX;
  Textfield gridY;
  Toggle ArrayList;
  Toggle ShowA;
  Toggle ShowB;
  Toggle ShowC;
  Textfield AValueX;
  Textfield BValueX;
  Textfield CValueX;
  Textfield AValueY;
  Textfield BValueY;
  Textfield CValueY;
  Bang Update;
  Grid gr;

  public GUI(ControlP5 p5, Grid grid)
  {
    controlP5 = p5;
    gridX = controlP5.addTextfield("X - Size", 720, 20, 60, 20);
    gridY = controlP5.addTextfield("Y - Size", 720, 60, 60, 20);
    ShowA = controlP5.addToggle("A", false, 500, 20, 20, 20);
    ShowB = controlP5.addToggle("B", false, 500, 60, 20, 20);
    ShowC = controlP5.addToggle("C", false, 500, 100, 20, 20);
    AValueX = controlP5.addTextfield("A - X", 540, 20, 40, 20);
    AValueY = controlP5.addTextfield("A - Y", 600, 20, 40, 20);
    BValueX = controlP5.addTextfield("B - X", 540, 60, 40, 20);
    BValueY = controlP5.addTextfield("B - Y", 600, 60, 40, 20);
    CValueX = controlP5.addTextfield("C - X", 540, 100, 40, 20);
    CValueY = controlP5.addTextfield("C - Y", 600, 100, 40, 20);
    Update = controlP5.addBang( "Update", 360, 20, 100, 100 );
    gr = grid;

    setValue();

    makeTempA();
    makeTempB();
    makeTempC();
  }

  public void drawGrid()
  {
    for (int X = 0; X < gr.arr.length ; X++)
      for (int Y = 0; Y < gr.arr[X].length ; Y++)
      {
        gr.arr[X][Y].text = controlP5.addTextfield(X + "-" + Y, ( X + 1) * 80, (Y + 3) * 80, 50, 50);
        gr.arr[X][Y].text.setValue( gr.arr[X][Y].value +  " ");
      }
  }

  public void setValue()
  {
    gridX.setValue(gr.xRow + "");
    gridY.setValue(gr.yRow + "");
    AValueX.setValue(0+ "");
    BValueX.setValue(0+ "");
    CValueX.setValue(0+ "");
    AValueY.setValue(0+ "");
    BValueY.setValue(0+ "");
    CValueY.setValue(0+ "");
  }

  public int getFieldX()
  {
    int original = gr.xRow;
    String x = gridX.getText().trim();
    boolean isNumber = true;

    for (int i = 0; i < x.length(); i++)
      if (! Character.isDigit(x.charAt(i)) )
        isNumber = false;

    if (isNumber) 
    {
      int X = Math.abs( Integer.parseInt(x) );

      if (X < -1)
        X = Math.abs( X );

      if (X > gr.xRow)
        X = gr.xRow;



      gridX.setValue(X + "");
      return X;
    }
    else
    {
      gridX.setValue(original + "");
      return original;
    }
  }

  public int getFieldY()
  {

    int original = gr.yRow;

    String y = gridY.getText().trim();
    boolean isNumber = true;

    for (int i = 0; i < y.length(); i++)
      if (! Character.isDigit(y.charAt(i)) )
        isNumber = false;

    if (isNumber) 
    {
      int Y =Integer.parseInt(y);
      if (Y < -1)
        Y = Math.abs( Y );

      if (Y > gr.yRow)
        Y = gr.yRow;

      gridY.setValue(Y + "");
      return Y;
    }
    else
    {
      gridY.setValue(original + "");
      return original;
    }
  }

  public int getAX()
  {
    int original = gr.pointA.x;
    String x = AValueX.getText().trim();
    boolean isNumber = true;

    for (int i = 0; i < x.length(); i++)
      if (! Character.isDigit(x.charAt(i)) )
        isNumber = false;

    if (isNumber) 
    {
      int X = Math.abs( Integer.parseInt(x) );

      if (X < 0)
        X = Math.abs( X );

      if (X > gr.xRow)
        X = gr.xRow - 1 ;



      AValueX.setValue(X + "");
      gr.pointA.x = X;
      return X;
    }
    else
    {
      AValueX.setValue(original + "");
      return original;
    }
  }

  public int getAY()
  {

    int original = gr.pointA.y;

    String y = AValueY.getText().trim();
    boolean isNumber = true;

    for (int i = 0; i < y.length(); i++)
      if (! Character.isDigit(y.charAt(i)) )
        isNumber = false;

    if (isNumber) 
    {
      int Y =Integer.parseInt(y);
      if (Y < 0)
        Y = Math.abs( Y );

      if (Y > gr.yRow)
        Y = gr.yRow - 1;

      AValueY.setValue(Y + "");
      gr.pointA.y = Y;
      return Y;
    }
    else
    {
      AValueY.setValue(original + "");
      return original;
    }
  }

  public int getBX()
  {
    int original = gr.pointB.x;
    String x = BValueX.getText().trim();
    boolean isNumber = true;

    for (int i = 0; i < x.length(); i++)
      if (! Character.isDigit(x.charAt(i)) )
        isNumber = false;

    if (isNumber) 
    {
      int X = Math.abs( Integer.parseInt(x) );

      if (X < 0)
        X = Math.abs( X );

      if (X > gr.xRow)
        X = gr.xRow - 1;



      BValueX.setValue(X + "");
      gr.pointB.x = X;
      return X;
    }
    else
    {
      BValueX.setValue(original + "");
      return original;
    }
  }

  public int getBY()
  {

    int original = gr.pointB.y;

    String y = BValueY.getText().trim();
    boolean isNumber = true;

    for (int i = 0; i < y.length(); i++)
      if (! Character.isDigit(y.charAt(i)) )
        isNumber = false;

    if (isNumber) 
    {
      int Y =Integer.parseInt(y);
      if (Y < 0)
        Y = Math.abs( Y );

      if (Y > gr.yRow)
        Y = gr.yRow - 1;

      BValueY.setValue(Y + "");
      gr.pointB.y = Y;
      return Y;
    }
    else
    {
      BValueY.setValue(original + "");
      return original;
    }
  }

  public int getCX()
  {
    int original = gr.pointC.x;
    String x = CValueX.getText().trim();
    boolean isNumber = true;

    for (int i = 0; i < x.length(); i++)
      if (! Character.isDigit(x.charAt(i)) )
        isNumber = false;

    if (isNumber) 
    {
      int X = Math.abs( Integer.parseInt(x) );

      if (X < 0)
        X = Math.abs( X );

      if (X > gr.xRow)
        X = gr.xRow - 1;



      CValueX.setValue(X + "");
      gr.pointC.x = X;
      return X;
    }
    else
    {
      CValueX.setValue(original + "");
      return original;
    }
  }

  public int getCY()
  {

    int original = gr.yRow;

    String y = CValueY.getText().trim();
    boolean isNumber = true;

    for (int i = 0; i < y.length(); i++)
      if (! Character.isDigit(y.charAt(i)) )
        isNumber = false;

    if (isNumber) 
    {
      int Y =Integer.parseInt(y);
      if (Y < 0)
        Y = Math.abs( Y );

      if (Y > gr.yRow)
        Y = gr.yRow - 1;

      CValueY.setValue(Y + "");
      gr.pointC.y = Y;
      return Y;
    }
    else
    {
      CValueY.setValue(original + "");
      return original;
    }
  }

  public void removeGrid()
  {

    for (int X = 0; X < gr.xRow; X++)
      for (int Y = 0; Y < gr.yRow; Y++)
        controlP5.remove(X + "-" + Y);
  }

  public void makeTempA()
  {
    gr.tempA.text = controlP5.addTextfield("TEMPA", 40, 20, 50, 50);
  }

  public void makeTempB()
  {
    gr.tempB.text = controlP5.addTextfield("TEMPB", 130, 20, 50, 50);
  }

  public void makeTempC()
  {
    gr.tempC.text = controlP5.addTextfield("TEMPC", 220, 20, 50, 50);
  }
}

public class Grid
{
  int xRow;
  int yRow;
  boolean isArrayList;
  Box[][] arr = new Box [xRow][yRow];
  Pointer pointA = new Pointer(0, 0, Color.GREEN);
  Pointer pointB = new Pointer(0, 0, Color.RED);
  Pointer pointC = new Pointer(0, 0, Color.BLUE);
  Box tempA = new Box ("TEMP", 0, 0); 
  Box tempB = new Box ("TEMP", 0, 0); 
  Box tempC = new Box ("TEMP", 0, 0); 

  void resize(int x, int y)
  {
    Box[][] temp = arr;
    xRow = x;
    yRow = y;
    arr = new Box [xRow][yRow];
    makeGrid();
    for (int i = 0; i < temp.length && i < arr.length; i++)
    {
      for (int k = 0; k < temp[i].length && k < arr[0].length ; k++)
      {
        arr[i][k] = temp [i][k];
      }
    }
  }

  public void makeGrid()
  {
    for (int x = 0; x < arr.length ; x++)
      for (int y = 0; y < arr[0].length; y ++)
        arr[x][y] = new Box(x, y);
  }

  public void removeGrid()
  {
  }

  public Grid()
  {
    xRow = 1;
    yRow = 1;
    arr = new Box [xRow][yRow];
    makeGrid();
  }

  public Grid(String[] given)
  {
    xRow = given.length;
    yRow = 1;
    arr = new Box [xRow][yRow];
    makeGrid();

    for (int x = 0; x < given.length; x++)
      arr [x][0].value = given[x] ;
  }

  public Grid(String[][] given)
  {
    xRow = given.length;
    yRow = given[0].length;
    arr = new Box [xRow][yRow];
    makeGrid();

    for (int x = 0; x < given.length; x++)
      for (int y = 0 ; y < given[x].length; y++)
        arr [x][y].value = given[x][y];
  }
}

public class Box
{
  String value;
  Textfield text = null;
  int x;
  int y;

  public Box(int tempx, int tempy)
  { 
    value = ""; 

    x = tempx;
    y = tempy;
  }

  public Box(String str, int tempx, int tempy)
  { 
    value = str; 

    x = tempx;
    y = tempy;
  }

  public String toString()
  {
    if (value == null)
      return "null";
    else
      return value;
  }
}


public class Pointer
{
  int x;
  int y;
  Color cl;
  boolean show;

  public Pointer(int X, int Y, Color COL)
  {
    x = X;
    y = Y;
    cl = COL;
  }
}


