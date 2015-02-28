
Box cube;
Slider sliderX;
Slider sliderY;
Slider sliderZ;
Button reset;
Dial dial;
Statusbar sbar;

void setup()
{
  size(800, 600, OPENGL);
  cube = new Box();
  sliderX = new Slider(150, 50, 200, 30, "X Speed");
  sliderY = new Slider(150, 100, 200, 30, "Y Speed");
  sliderZ = new Slider(150, 150, 200, 30, "Z Speed");
  reset = new Button(150, 200, 120, 30, "Reset Values");
  dial = new Dial(150, height/2, 100);
  sbar = new Statusbar();
}

void draw()
{
  background(255);
  cube.draw();
  hint(DISABLE_DEPTH_TEST);
  dial.draw();
  sliderX.draw();
  sliderY.draw();
  sliderZ.draw();
  sbar.draw();
  hint(ENABLE_DEPTH_TEST);
  reset.draw();
  
  println(dial.getValue() + " / " + dial.getD() + " / " + dial.getDD());
}

void mousePressed()
{
  if (sliderX.contains(mouseX, mouseY))
  {
    sliderX.setUpdate(true);
  }
  if (sliderY.contains(mouseX, mouseY))
  {
    sliderY.setUpdate(true);
  }
  if (sliderZ.contains(mouseX, mouseY))
  {
    sliderZ.setUpdate(true);
  }
  if (dial.contains(mouseX, mouseY))
  {
    dial.setUpdate(true);
  }
}

void mouseDragged()
{
  if (sliderX.isUpdating() && mouseX > sliderX.getLeftBounds() && mouseX < sliderX.getRightBounds())
  {
    sliderX.setSX(mouseX);
    cube.setSpeedX(mouseX-sliderX.getX());
  }
  if (sliderY.isUpdating() && mouseX > sliderY.getLeftBounds() && mouseX < sliderY.getRightBounds())
  {
    sliderY.setSX(mouseX);
    cube.setSpeedY(mouseX-sliderY.getX());
  }
  if (sliderZ.isUpdating() && mouseX > sliderZ.getLeftBounds() && mouseX < sliderZ.getRightBounds())
  {
    sliderZ.setSX(mouseX);
    cube.setSpeedZ(mouseX-sliderZ.getX());
  }
  // && mouseX > dial.getLeftBounds() && mouseX < dial.getRightBounds()
  if (dial.isUpdating())
  {
    dial.setD(dial.getDist());
    cube.setSize(dial.getValue());
  }
}

void mouseReleased()
{
  if ( reset.contains(mouseX, mouseY) )
  {
    sliderX.setSX(sliderX.getX());
    sliderY.setSX(sliderY.getX());
    sliderZ.setSX(sliderZ.getX());

    cube.setStartX(0);
    cube.setStartY(0);
    cube.setStartZ(0);

    cube.setSpeedX(0);
    cube.setSpeedY(0);
    cube.setSpeedZ(0);
    
    dial.setD(dial.getD()/6);
  }

  if (sliderX.isUpdating())
    sliderX.setUpdate(false);
  if (sliderY.isUpdating())
    sliderY.setUpdate(false);
  if (sliderZ.isUpdating())
    sliderZ.setUpdate(false);
  if (dial.isUpdating())
    dial.setUpdate(false);
}

class Box 
{
  private float boxSize = 200;
  private float startX, startY, startZ;
  private float speedX, speedY, speedZ;

  Box()
  {
    startX = 0;
    startY = 0;
    startZ = 0;

    speedX = 0;
    speedY = 0;
    speedZ = 0;
  }

  void draw()
  {
    noStroke();

    //Directional Lighting on the 3D Box
    directionalLight(255, 0, 0, -1, 0, 0);
    directionalLight(0, 255, 0, 0, -1, 0);
    directionalLight(0, 0, 255, 0, 0, -1);
    directionalLight(255, 0, 0, 1, 0, 0);
    directionalLight(0, 255, 0, 0, 1, 0);
    directionalLight(0, 0, 255, 0, 0, 1);

    //3D Box
    pushMatrix();
    fill(200);
    translate(width/3*2, height/2, 0);
    rotateX(startX+=speedX/2);
    rotateY(startY+=speedY/2);
    rotateZ(startZ+=speedZ/2);
    box(boxSize);
    popMatrix();
  }
  
  void setSize(float _x)
  {
    boxSize = _x;
  }

  void setStartX(float _f)
  {
    startX = radians(_f);
  }

  void setStartY(float _f)
  {
    startY = radians(_f);
  }

  void setStartZ(float _f)
  {
    startZ = radians(_f);
  }

  void setSpeedX(float _f)
  {
    speedX = radians(_f)/10;
  }

  void setSpeedY(float _f)
  {
    speedY = radians(_f)/10;
  }

  void setSpeedZ(float _f)
  {
    speedZ = radians(_f)/10;
  }

  float getSpeedX()
  {
    return speedX;
  }

  float getSpeedY()
  {
    return speedY;
  }

  float getSpeedZ()
  {
    return speedZ;
  }
}

class Button
{
  private int x, y, w, h;
  private String buttonText;

  Button(int x, int y, int w, int h, String btext)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    buttonText = btext;
  }

  void draw()
  {
    noLights();
    rectMode(CENTER);
    textAlign(CENTER, BOTTOM);
    noStroke();
    
    //Background
    fill(165);
    stroke(0);
    pushMatrix();
    translate(x, y, 0);
    rect(0, 0, w, h);
    popMatrix();
    
    //Label
    hint(DISABLE_DEPTH_TEST);
    fill(0);
    text(buttonText, x, y, 0);
    hint(ENABLE_DEPTH_TEST);
  }

  boolean contains(int _x, int _y)
  {
    if ( (_x >= x-w/2) && (_x <= x+w/2) && (_y >= y-h/2) && (_y <= y+h/2) )
      return true;
    else
      return false;
  }
}

class Dial
{
  int x, y, d, dd;
  private boolean update = false;

  Dial(int x, int y, int d)
  {
    this.x = x;
    this.y = y;
    this.d = d;
    dd = d/3;
  }

  void draw()
  {
    noLights();
    ellipseMode(CENTER);
    textAlign(CENTER);
    textSize(10);

    //Background
    pushMatrix();
    fill(0);
    translate(x, y, 0);
    ellipse(0, 0, d, d);
    popMatrix();

    //Expanding Ellipse
    pushMatrix();
    fill(255);
    translate(x, y, 0);
    ellipse(0, 0, dd, dd);
    popMatrix();
    
    //Label
    pushMatrix();
    fill(0);
    text("Change the Size", x, y, 0);
    popMatrix();
  }
  
  int getD()
  {
    return d;
  }
  
  int getDD()
  {
    return dd;
  }

  int getDist()
  {
    return (int) dist(x, y, mouseX, mouseY);
  }

  void setD(int _x) 
  {
    dd = _x*2;
    if (dd > d)
      dd = d-10;
  }
  
  float getValue()
  {
    float value = norm(dd, x, d);
    return value*100;
  }

  boolean contains(int _x, int _y)
  {
    if ( (_x >= x - d/2) && (_x <= x + d/2) && (_y >= y - d/2) && (_y <= y + d/2) )
      return true;
    else
      return false;
  }

  boolean isUpdating() 
  {
    return update;
  }

  void setUpdate(boolean _b) 
  {
    update = _b;
  }
}

class Slider
{
  private int x, y, sX, w, h;
  private String label;
  private boolean update = false;

  Slider (int _x, int _y, int _w, int _h, String _label) 
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    sX = x;
    label = _label;
  }

  void draw()
  {
    noLights();

    rectMode(CENTER);
    textAlign(CENTER);
    textSize(16);
    
    //Slider Background
    pushMatrix();
    fill(0);
    translate(x,y,0);
    rect(0, 0, w, h);
    popMatrix();

    //Label
    pushMatrix();
    fill(255);
    text(label, x, y, 0);
    popMatrix();
    
    //Slider
    pushMatrix();
    noStroke();
    fill(200);
    translate(sX,y,0);
    rect(0, 0, 10, h);
    popMatrix();
    
  }

  void setSX(int _x) 
  {
    sX = _x;
  }

  int getX()
  {
    return x;
  }

  int getLeftBounds()
  {
    return x-w/2+4;
  }

  int getRightBounds()
  {
    return x+w/2-4;
  }

  boolean contains(int _x, int _y)
  {
    if ( (_x >= x - w/2) && (_x <= x + w/2) && (_y >= y - h/2) && (_y <= y + h/2) )
      return true;
    else
      return false;
  }

  boolean isUpdating() 
  {
    return update;
  }

  void setUpdate(boolean _b) 
  {
    update = _b;
  }
}

class Statusbar
{
  final static String textSpeedX = "Speed of x-axis: ";
  final static String textSpeedY = "Speed of y-axis: ";
  final static String textSpeedZ = "Speed of z-axis: ";

  void draw()
  {
    noLights();
    noStroke();
    rectMode(CORNER);
    textSize(16);
    
    //Background
    pushMatrix();
    fill(0);
    translate(0, height-30, 0);
    rect(0, 0, width, 30);
    popMatrix();

    //Text for Speed X
    fill(255);
    textAlign(LEFT, CENTER);
    text(textSpeedX + boxSpeedX(), 10, height-15, 0);

    //Text for Speed Y
    fill(255);
    textAlign(CENTER, CENTER);
    text(textSpeedY + boxSpeedY(), width/2, height-15, 0);

    //Text for Speed Z
    fill(255);
    textAlign(RIGHT, CENTER);
    text(textSpeedZ + boxSpeedZ(), width-10, height-15, 0);
  }

  float boxSpeedX()
  {
    int temp = (int) (cube.getSpeedX() * 100);
    float temp2 = (float) temp/100;
    return temp2;
  }

  float boxSpeedY()
  {
    int temp = (int) (cube.getSpeedY() * 100);
    float temp2 = (float) temp/100;
    return temp2;
  }

  float boxSpeedZ()
  {
    int temp = (int) (cube.getSpeedZ() * 100);
    float temp2 = (float) temp/100;
    return temp2;
  }
}


