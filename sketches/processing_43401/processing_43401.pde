
/*
Mr Potato Head v0.1
Todo:
  Nose wiggles on click
  Fix Billboarding
  Add slinky connector
*/

Potato P = null;
Slider S = null;
Menubar M = null;

float xr=0, yr=0, zr=0;
Stack myStack;
boolean place_flag = false;  //so that only one thing gets placed at a time

/* hair parameters */
float K = 0.35;    //stiffness
float D = 0.85;    //dampening
float A = 1.0001;  //bow
float St = 0.2;     //spline step
float T = 0.2;      //stability threshold

float y_rot = 0.0;
float prev_rot;
float proximity_threshold = 75.0;

PFont meta;

void setup()
{
  size(500,500,P3D);
  init_memo_trig();
  ellipseMode(CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
  P = new Potato();
  S = new Slider(width/2,height-50, 300, 40);
  M = new Menubar();
  prev_rot = y_rot;
  myStack = new Stack();
  meta = loadFont("meta.vlw.gz");
  textAlign(CENTER);
  textFont(meta,20);
}

void draw()
{
  background(0,0,0);
  place_flag = false;

  xr=0; yr=0; zr=0;

  M.update();
  S.update();

  //enter 3D mode
  WpushMatrix();
  loadIdentity();
  scale(.85);
  WrotateY(1.2*y_rot);
  translate(0,-35);
  P.update_render();
  WpopMatrix();
  //exit 3D mode and draw 2D foreground elements
  M.render();
  S.render();

  prev_rot = y_rot;
}

void mousePressed()
{
  M.mouseDown();
  S.mouseDown();
  P.mouseDown();
}

void mouseReleased()
{
  P.mouseUp();
  M.mouseUp();
  S.mouseUp();
}

//  rotateX(-((250.0-(float)mouseY)/250.0)*PI/2.0);
//  rotateY(-((250.0-(float)mouseX)/250.0)*PI/2.0);

/*****************************************************************************************
** The Big Kahuna                                                                      **
*****************************************************************************************/
class Potato extends Mount
{
  float myRad, portRad, iota;
  int selected;

  Potato()
  {
    myRad = 100.0;
    portRad = 20.0;
    iota = 0.0;
    myHandle = new Handle[7];
    myHandle[0] = new Handle(50.000015,-70.71068,-49.999985,5.4977875,2.3561945);
    myHandle[1] = new Handle(50.0,-70.71068,50.0,0.7853982,2.3561945);
    myHandle[2] = new Handle(95.10565,61.803394,0.0,0.0,1.3566371);
    myHandle[3] = new Handle(72.08395,117.55705,-36.728603,5.8119464,1.1471976);
    myHandle[4] = new Handle(72.08395,117.55705,36.728603,0.47123894,1.1471976);
    myHandle[5] = new Handle(30.901701,190.2113,0.0,0.0,0.49906587);
    myHandle[6] = new Handle(-95.95496,  -28.15395,   0, 3.14159, 1.85619);
    selected = -1;
  }

  void mouseDown()
  {
    if (selected >= 0 && (!M.draggingItem() && myHandle[selected].item != null))
    {
      M.drag_row    = myHandle[selected].item.menu_row;
      M.drag_column = myHandle[selected].item.menu_column;
      myHandle[selected].item = null;
    }
  }

  void mouseUp()
  {
    for (int i=0; i<myHandle.length; i++)
    if (myHandle[i].item instanceof Connector)
    ((Connector)myHandle[i].item).mouseUp();

    if (selected >= 0 && (M.draggingItem() && myHandle[selected].item == null))
    myHandle[selected].item = placeItem(M.drag_row, M.drag_column);
  }

  void update_render()
  {
    color c = color(255,255,0);
    color s = color(255,100,100);

    WpushMatrix();
    noStroke();
    WrotateY(-HALF_PI);
    drawHemisphere(myRad);
    drawHemillipsoid(myRad, 2.0*myRad);

    //state is based on current modelling matrix
    update();
    update_mounts();

    for (int i=0; i<7; i++)
    {
      if (i == selected &&
      (( M.draggingItem() && myHandle[i].item == null) ||
      (!M.draggingItem() && myHandle[i].item != null)))
      drawHandle(s,i);
      else
      drawHandle(c,i);
    }

    render_mounts();
    WpopMatrix();
  }

  void update()
  {
    float dist;
    float min_dist = 0;
    selected = -1;
    float x,y;
    int i;
    for (i=0; i<7; i++)
    {
      x = screenX(myHandle[i].x, myHandle[i].y, myHandle[i].z);
      y = screenY(myHandle[i].x, myHandle[i].y, myHandle[i].z);

      dist = abs(x-mouseX) + abs(y-mouseY);
      if (dist < proximity_threshold)
      {
        if (selected == -1 || dist < min_dist)
        {
          selected = i;
          min_dist = dist;
        }
      }
    }
  }

  void drawHandle(color rgb, int i)
  {
    float u, un;
    float v, vn;
    float c = 20.0;
    float a = 5.0;
    fill(rgb);
    WpushMatrix();
    translate(myHandle[i].x,myHandle[i].y,myHandle[i].z);
    WrotateY(-myHandle[i].t);
    WrotateZ(-myHandle[i].p);
    beginShape(QUADS);
    for (u=0; u<TWO_PI; u+=2.0*memo_step)
    for (v=0; v<TWO_PI; v+=4.0*memo_step)
    {
      un = u + 2.0*memo_step;
      vn = v + 4.0*memo_step;
      vertex((c+a*Cos(v))*Cos(u), a*Sin(v), (c+a*Cos(v))*Sin(u));
      vertex((c+a*Cos(v))*Cos(un), a*Sin(v), (c+a*Cos(v))*Sin(un));
      vertex((c+a*Cos(vn))*Cos(un), a*Sin(vn), (c+a*Cos(vn))*Sin(un));
      vertex((c+a*Cos(vn))*Cos(u), a*Sin(vn), (c+a*Cos(vn))*Sin(u));
    }
    endShape();
    WpopMatrix();
  }

  float getR(float p)
  {
    p %= TWO_PI;
    if (PI/2.0 <= p && p <= 3.0*PI/2.0)
    return myRad;
    return 2.0*myRad;
  }

  void drawHemisphere(float r)
  {
    float tn, pn;
    beginShape(QUADS);
    for (float t=0; t<TWO_PI; t+=memo_step)
    for (float p=HALF_PI; p<PI-memo_step; p+=memo_step)
    {
      tn = t+memo_step;
      pn = p+memo_step;
      fill(chooseColor(t));
      vertex(r*Cos(t)*Sin(pn),  r*Cos(pn),   r*Sin(t)*Sin(pn));
      vertex(r*Cos(t)*Sin(p),   r*Cos(p),    r*Sin(t)*Sin(p));
      fill(chooseColor(tn));
      vertex(r*Cos(tn)*Sin(p),  r*Cos(p),    r*Sin(tn)*Sin(p));
      vertex(r*Cos(tn)*Sin(pn), r*Cos(pn),   r*Sin(tn)*Sin(pn));
    }
    endShape();
    pn = PI-memo_step;
    beginShape(POLYGON);
    for (float t=0; t<TWO_PI; t+=memo_step)
    {
      fill(chooseColor(t));
      vertex(r*Cos(t)*Sin(pn),  r*Cos(pn),   r*Sin(t)*Sin(pn));
    }
    endShape();
  }

  void drawHemillipsoid(float r, float l)
  {
    float tn, pn;
    beginShape(QUADS);
    for (float t=0; t<TWO_PI; t+=memo_step)
    for (float p=memo_step; p<HALF_PI; p+=memo_step)
    {
      tn = t+memo_step;
      pn = p+memo_step;
      fill(chooseColor(t));
      vertex(r*Cos(t)*Sin(pn),  l*Cos(pn),   r*Sin(t)*Sin(pn));
      vertex(r*Cos(t)*Sin(p),   l*Cos(p),    r*Sin(t)*Sin(p));
      fill(chooseColor(tn));
      vertex(r*Cos(tn)*Sin(p),  l*Cos(p),    r*Sin(tn)*Sin(p));
      vertex(r*Cos(tn)*Sin(pn), l*Cos(pn),   r*Sin(tn)*Sin(pn));
    }
    endShape();
    pn = memo_step;
    beginShape(POLYGON);
    for (float t=0; t<TWO_PI; t+=memo_step)
    {
      fill(chooseColor(t));
      vertex(r*Cos(t)*Sin(pn),  l*Cos(pn),   r*Sin(t)*Sin(pn));
    }
    endShape();
  }

  color chooseColor(float t)
  {
    t = abs(t-PI);
    int r = 70  + (int)(55.0*(t/PI));
    int g = 105 + (int)(65.0*(t/PI));
    int b = 140 + (int)(105.0*(t/PI));
    return color(r,g,b);
  }
}

/*****************************************************************************************
** Abstract Classes                                                                    **
*****************************************************************************************/

float hackx, hacky, hackz;

class Handle
{
  Mountable item;

  float x, y, z, t, p;
  Handle(float a, float b, float c, float d, float f)
  {
    x=a;
    y=b;
    z=c;
    t=d;
    p=f;
    item = null;
  }

  void render()
  {
    WpushMatrix();
    if (item.menu_column == 0 && item.menu_row == 0)
    {
      translate(x,y,z);
      WrotateY(HALF_PI);
      item.render();
    }
    else
    {
      translate(x,y,z);
      WrotateY(-t);
      WrotateZ(-p);
      scale(-1);
      item.render();
    }
    WpopMatrix();
  }
}

abstract class Mount
{
  Handle[] myHandle;

  void update_mounts()
  {
    for (int i=0; i<myHandle.length; i++)
    if (myHandle[i].item != null)
    myHandle[i].item.update();
  }

  void render_mounts()
  {
    for (int i=0; i<myHandle.length; i++)
    if (myHandle[i].item != null)
    myHandle[i].render();
  }
}

abstract class Mountable
{
  int menu_column, menu_row;
  abstract void render();
  abstract void update();
}

abstract class Connector extends Mountable
{
  Handle myHandle;
  abstract void mouseUp();
}

/*****************************************************************************************
** Translating from Menu IDs to actual Item Data                                    **
*****************************************************************************************/
Mountable placeItem(int item_row, int item_column)
{
  if (place_flag)
  return null;

  place_flag = true;
  if (item_column == 0)
  {
    if (item_row == 0) return new Eye();
    else if (item_row == 1) return new Undefined();
    else if (item_row == 2) return new Piston();
    else if (item_row == 3) return new Rotor();
  }
  else if (item_column == 1)
  {
    if (item_row == 0) return new Boot();
    else if (item_row == 1) return new Mop(40,40);
    else if (item_row == 2) return new Nose();
    else if (item_row == 3) return new Moustache();
  }
  return null;
}

class Undefined extends Mountable
{
  Undefined()
  {
    menu_column = 0;
    menu_row = 1;
  }

  void update()
  {
  }

  void render()
  {
    stroke(255);
    fill(255);
    line (0,0,0,-50);
    pushMatrix();
    translate(0,-50);
    rotateY(HALF_PI);
    rotateX(-HALF_PI);
    scale(-1,1);
    text("unimplemented",0,0);
    popMatrix();

  }

}

/*****************************************************************************************
** The Moustache Mountable                                                             **
*****************************************************************************************/
class Nose extends Mountable
{
  Nose()
  {
    menu_row = 2;
    menu_column = 1;
  }

  void update()
  {
    //todo: wiggles when you click him like in Bewitched :)
  }

  void render()
  {
    noStroke();
    pushMatrix();
    fill(0,255,0);
    sphere(20);
    translate(0,-10,0);
    scale(0.35);
    rotateX(PI);
    rotateY(HALF_PI);
    translate(0,0,-100);
    noStroke();
    beginShape(QUADS);
    fill(0,200,0);
    vertex( -25,  150,  0);
    vertex(  25,  150,  0);
    fill(0,155,0);
    vertex( 100,  0,  0);
    vertex(-100,  0,  0);
    fill(0,255,0);
    vertex( -25,  150,  0);
    vertex(  25,  150,  0);
    vertex(  25,  150,  50);
    vertex( -25,  150,  50);
    vertex(  25,  150,  0);
    vertex(  25,  150, 50);
    fill(0,200,0);
    vertex( 100,  0,  50);
    vertex( 100,  0,  0);
    vertex( 100,  0,  0);
    vertex(-100,  0,  0);
    vertex(-100,  0,  50);
    vertex( 100,  0,  50);
    fill(0,255,0);
    vertex( -25,  150, 0);
    fill(0,155,0);
    vertex(-100,  0,  0);
    vertex(-100,  0,  50);
    fill(0,255,0);
    vertex( -25,  150, 50);
    vertex( -25,  150,  50);
    fill(0,200,0);
    vertex( -25,    0,  250);
    vertex(  25,    0,  250);
    fill(0,255,0);
    vertex(  25,  150,  50);
    fill(0,200,0);
    vertex(  25,    0,  250);
    vertex( -25,    0,  250);
    vertex(-100,  0,  50);
    vertex(100,  0, 50);
    endShape();

    beginShape(TRIANGLES);
    vertex(  25,    0,  250);
    vertex( 100,  0,  50);
    vertex(  25,  150,  50);
    vertex( -25,    0,  250);
    vertex(-100,  0,  50);
    vertex(  -25,  150,  50);
    endShape();
    popMatrix();
  }
}

/*****************************************************************************************
** The Moustache Mountable                                                             **
*****************************************************************************************/
class Moustache extends Mountable
{
  float gamma = 0.0;

  Moustache()
  {
    menu_row = 3;
    menu_column = 1;
  }

  void update()
  {
    gamma = HALF_PI-3.0*y_rot;
  }

  void render()
  {
    noStroke();
    fill(0,255, 0);
    sphere(20);
    fill(0,0,255);
    pushMatrix();
    rotateY(HALF_PI);
    rotateX(-HALF_PI);
    translate(0,0,-20);
    scale(1.25);
    rotateX(gamma);
    translate(0,-20,0);
    rotateX(-HALF_PI);
    torus(3, 40, 20);
    popMatrix();
  }

  void torus(float a, float b, float c)
  {
    pushMatrix();
    float ac = a;
    float u, un;
    float v, vn;
    beginShape(QUADS);
    for (u=0; u<PI; u+=2.0*memo_step)
    for (v=0; v<TWO_PI; v+=4.0*memo_step)
    {
      un = u + 2.0*memo_step;
      vn = v + 4.0*memo_step;
      a = ac + 5*(HALF_PI-abs(HALF_PI-u));
      vertex((b+a*Cos(vn))*Cos(u),   a*Sin(vn), (c+a*Cos(vn))*Sin(u));
      vertex((b+a*Cos(v))*Cos(u),    a*Sin(v),  (c+a*Cos(v))*Sin(u));
      a = ac + 5*(HALF_PI-abs(HALF_PI-un));
      vertex((b+a*Cos(v))*Cos(un),   a*Sin(v),  (c+a*Cos(v))*Sin(un));
      vertex((b+a*Cos(vn))*Cos(un),  a*Sin(vn), (c+a*Cos(vn))*Sin(un));
    }
    endShape();
    translate(-b, 0, 0);
    sphere(a);
    translate(2*b,0,0);
    sphere(a);
    popMatrix();
  }
}

/*****************************************************************************************
** The Piston Connector                                                                **
*****************************************************************************************/
class Piston extends Connector
{
  float gamma = 0.0, a = 5.0, b = 25.0, c = 20.0, g = 2.0, x, y;
  boolean out = true, selected = false;

  Piston()
  {
    menu_column = 0;
    menu_row    = 2;
    myHandle = new Handle(0,0,0,0,0);
  }

  void mouseUp()
  {
    if (myHandle.item instanceof Connector)
    ((Connector)myHandle.item).mouseUp();

    if(selected && M.draggingItem() && myHandle.item == null)
    myHandle.item = placeItem(M.drag_row, M.drag_column);
  }

  void update()
  {
    if (out)
    {
      gamma += g;
      out = gamma < b;
    }
    else
    {
      gamma -= g;
      out = !(gamma > 0.0);
    }

    if (myHandle.item != null)
    myHandle.item.update();

  }

  void render()
  {
    WpushMatrix();
    noStroke();
    float u, un;
    float v, vn;

    fill(255,255,0);
    translate(0,-10-gamma);
    x = screenX(0,0,0);
    y = screenY(0,0,0);
    selected = ( abs(x-mouseX) + abs(y-mouseY) < proximity_threshold ) && M.draggingItem();
    if (selected)
    fill(255,100,100);

    beginShape(QUADS);
    for (u=0; u<TWO_PI; u+=2.0*memo_step)
    for (v=0; v<TWO_PI; v+=4.0*memo_step)
    {
      un = u + 2.0*memo_step;
      vn = v + 4.0*memo_step;
      vertex((c+a*Cos(v))*Cos(u), a*Sin(v), (c+a*Cos(v))*Sin(u));
      vertex((c+a*Cos(v))*Cos(un), a*Sin(v), (c+a*Cos(v))*Sin(un));
      vertex((c+a*Cos(vn))*Cos(un), a*Sin(vn), (c+a*Cos(vn))*Sin(un));
      vertex((c+a*Cos(vn))*Cos(u), a*Sin(vn), (c+a*Cos(vn))*Sin(u));
    }
    endShape();

    fill(0,255,0);
    beginShape(QUADS);
    for (u=0; u<TWO_PI; u+=2.0*memo_step)
    {
      un = u+2.0*memo_step;
      vertex(c*Cos(u), 0, c*Sin(u));
      vertex(c*Cos(u), gamma+10, c*Sin(u));
      vertex(c*Cos(un), gamma+10, c*Sin(un));
      vertex(c*Cos(un), 0, c*Sin(un));
    }
    endShape();

    beginShape(POLYGON);
    for (u=0; u<TWO_PI; u+=2.0*memo_step)
    vertex(c*Cos(u), 0, c*Sin(u));
    endShape();

    if (myHandle.item != null)
    {
      if (!(myHandle.item instanceof Eye))
      myHandle.item.render();
      else
      {
        WpushMatrix();
        scale(-1);
        WrotateY(HALF_PI);
        WrotateX(-HALF_PI);
        myHandle.item.render();
        WpopMatrix();
      }
    }
    WpopMatrix();
  }
}

/*****************************************************************************************
** The Rotor Connector                                                                 **
*****************************************************************************************/
class Rotor extends Connector
{
  float gamma = 0.0, c=20.0, a = 5.0;
  boolean selected;

  Rotor()
  {
    myHandle = null;
    menu_column = 0;
    menu_row = 3;
    myHandle = new Handle(0,0,0,0,0);
  }

  void mouseUp()
  {
    if (myHandle.item instanceof Connector)
    ((Connector)myHandle.item).mouseUp();

    if(selected && M.draggingItem() && myHandle.item == null)
    myHandle.item = placeItem(M.drag_row, M.drag_column);
  }

  void render()
  {
    float u, un;
    float v, vn;
    float x, y;
    boolean on = true;
    WpushMatrix();
    WrotateY(gamma);
    translate(0,-10);

    x = screenX(0,0,0);
    y = screenY(0,0,0);
    selected = ( abs(x-mouseX) + abs(y-mouseY) < proximity_threshold ) && M.draggingItem();

    noStroke();
    beginShape(QUADS);
    for (u=0; u<TWO_PI; u+=2.0*memo_step)
    {
      if (on)
      {
        if (selected)
        fill(255,100,100);
        else
        fill(255,255,0);
      }
      else
      fill(0,255,0);
      on = !on;
      for (v=0; v<TWO_PI; v+=4.0*memo_step)
      {
        un = u + 2.0*memo_step;
        vn = v + 4.0*memo_step;
        vertex((c+a*Cos(v))*Cos(u), a*Sin(v), (c+a*Cos(v))*Sin(u));
        vertex((c+a*Cos(v))*Cos(un), a*Sin(v), (c+a*Cos(v))*Sin(un));
        vertex((c+a*Cos(vn))*Cos(un), a*Sin(vn), (c+a*Cos(vn))*Sin(un));
        vertex((c+a*Cos(vn))*Cos(u), a*Sin(vn), (c+a*Cos(vn))*Sin(u));
      }
    }
    endShape();

    if (myHandle.item != null)
    {
      if (!(myHandle.item instanceof Eye))
      myHandle.item.render();
    }
    WpopMatrix();

    if (myHandle.item != null && (myHandle.item instanceof Eye))
    {
      WpushMatrix();
      translate(0,-10);
      WrotateY(HALF_PI);
      WrotateX(-HALF_PI);
      scale(-1);
      ((Eye)myHandle.item).rest = gamma;
      myHandle.item.render();
      WpopMatrix();
    }

  }

  void update()
  {
    gamma+=PI/100.0;

    if (myHandle.item != null)
    myHandle.item.update();
  }
}

/*****************************************************************************************
** The Boot Mountable                                                                  **
*****************************************************************************************/
class Boot extends Mountable
{
  float H = 70;
  float R = 20;
  float W = 40;
  float L = 50;

  Boot()
  {
    menu_column = 1;
    menu_row = 0;
  }

  void render()
  {
    float t, tn, p, pn;
    WpushMatrix();
    WrotateZ(PI);
    WrotateY(PI);
    noStroke();
    fill(0,255,0);

    beginShape(QUADS);
    for (t=0; t<TWO_PI; t+=memo_step+memo_step)
    {
      tn = t+memo_step+memo_step;
      vertex(R*Cos(t),  0, R*Sin(t));
      vertex(R*Cos(tn), 0, R*Sin(tn));
      vertex(R*Cos(tn), H, R*Sin(tn));
      vertex(R*Cos(t),  H, R*Sin(t));
    }
    endShape();

    translate(0,H);
    WrotateX(PI);
    beginShape(QUADS);
    for (t=0; t<HALF_PI; t+=memo_step+memo_step)
    for (p=0; p<PI; p+=memo_step+memo_step)
    {
      tn = t+memo_step+memo_step;
      pn = p+memo_step+memo_step;
      vertex(L*cos(t)*sin(pn),   R*sin(t)*sin(pn),  R*cos(pn));
      vertex(L*cos(t)*sin(p),    R*sin(t)*sin(p),   R*cos(p));
      vertex(L*cos(tn)*sin(p),   R*sin(tn)*sin(p),  R*cos(p));
      vertex(L*cos(tn)*sin(pn),  R*sin(tn)*sin(pn), R*cos(pn));
    }
    endShape();

    translate(0,-.5*R+5);
    fill(255,255,0);
    beginShape(QUADS);
    p = 0;
    pn = memo_step;
    for (t=-HALF_PI; t<HALF_PI; t+=memo_step+memo_step)
    {
      tn = t+memo_step+memo_step;
      vertex(L*cos(t),   0, R*sin(t));
      vertex(L*cos(tn),  0, R*sin(tn));
      vertex(L*cos(tn), 5, R*sin(tn));
      vertex(L*cos(t),  5, R*sin(t));
    }
    for (t=HALF_PI; t<3*HALF_PI; t+=memo_step+memo_step)
    {
      tn = t+memo_step+memo_step;
      vertex(R*cos(t),   0, R*sin(t));
      vertex(R*cos(tn),  0, R*sin(tn));
      vertex(R*cos(tn), 5, R*sin(tn));
      vertex(R*cos(t),  5, R*sin(t));
    }
    endShape();

    stroke(0,255,0);
    beginShape(POLYGON);
    p = 0;
    pn = memo_step;
    for (t=-HALF_PI; t<HALF_PI; t+=memo_step+memo_step)
    vertex(L*cos(t),   0, R*sin(t));
    for (t=HALF_PI; t<3*HALF_PI; t+=memo_step+memo_step)
    vertex(R*cos(t),   0, R*sin(t));
    endShape();

    WpopMatrix();
  }

void update() {}
}

/************************************************************************************
**  Mop Mountable                                                                 **
************************************************************************************/
class Mop extends Mountable
{
  Hair[] H;

  Mop(int num, float len)
  {
    H = new Hair[num];
    for (int i=0; i<num; i++)
    H[i] = new Hair(len, random(.6,HALF_PI));
    menu_column = 1;
    menu_row = 1;
    disturb(.6);
  }

  void update()
  {
    if (abs(y_rot-prev_rot) > T)
    disturb(.6);
    for (int i=0; i<H.length; i++)
    H[i].update();
  }

  void render()
  {
    float tn, pn, r = 20.0;
    WpushMatrix();

    fill(0,255,0);
    noStroke();
    sphere(20.0);

    stroke(0,0,255);
    for(int i=0; i<H.length; i++)
    {
      WrotateY(TWO_PI/(float)H.length);
      H[i].render();
    }
    WpopMatrix();
  }

  void disturb(float level)
  {
    for (int i=0; i<H.length; i++)
    H[i].disturb(level);
  }

}

/************************************************************************************
**  Eye Mountable                                                                 **
************************************************************************************/
class Eye extends Mountable
{
  float r = 20, r2 = 10;
  float a, v, rest;

  float cx, cy, cz;

  Eye()
  {
    a = 30*memo_step;
    rest = a;
    menu_column = 0;
    menu_row = 0;
  }

  void update()
  {
    if (abs(y_rot-prev_rot) > T)
    disturb(PI);
    v = 0.9*(v-0.05*(a-rest));
    a += v;
  }

  void render()
  {
    pushMatrix();

    noStroke();
    fill(0,255,0);
    sphere(20.0);

    translate(0,0,20+r);

    //    rotateX(-xr);
    rotateY(-yr);
    rotateZ(-zr);

    noStroke();
    fill(255);
    beginShape(POLYGON);
    for (float t=0; t<TWO_PI; t+=memo_step)
    vertex(r*Cos(t), r*Sin(t));
    endShape();

    translate(r2*cos(a),r2*sin(a),0.1);
    fill(0);
    beginShape(POLYGON);
    for (float t=0; t<TWO_PI; t+=2.0*memo_step)
    vertex(r2*cos(t), r2*sin(t));
    endShape();

    popMatrix();
  }

  void disturb(float disp)
  {
    a = rest+disp;
  }
}

/************************************************************************************
** The Menubar Class                                                              **
************************************************************************************/
class Menubar
{
  int selected_row, selected_column, drag_row, drag_column;
  PImage[][] icons;
  PImage[][] yicons;
  PImage[][] dicons;

  Menubar()
  {
    PImage m;

    selected_row = -1;
    selected_column = -1;
    drag_row = -1;
    drag_column = -1;

    icons = new PImage[2][4];
    icons[0][0] = loadImage("eye.gif");
    icons[0][1] = loadImage("spring.gif");
    icons[0][2] = loadImage("piston.gif");
    icons[0][3] = loadImage("rotor.gif");
    icons[1][0] = loadImage("boot.gif");
    icons[1][1] = loadImage("hair.gif");
    icons[1][2] = loadImage("nose.gif");
    icons[1][3] = loadImage("smile.gif");

    yicons = new PImage[2][4];
    yicons[0][0] = loadImage("yeye.gif");
    yicons[0][1] = loadImage("yspring.gif");
    yicons[0][2] = loadImage("ypiston.gif");
    yicons[0][3] = loadImage("yrotor.gif");
    yicons[1][0] = loadImage("yboot.gif");
    yicons[1][1] = loadImage("yhair.gif");
    yicons[1][2] = loadImage("ynose.gif");
    yicons[1][3] = loadImage("ysmile.gif");

    dicons = new PImage[2][4];
    dicons[0][0] = loadImage("yellow.gif");
    m = loadImage("meye.gif");
    dicons[0][0].mask(m);
    dicons[0][1] = loadImage("yellow.gif");
    m = loadImage("mspring.gif");
    dicons[0][1].mask(m);
    dicons[0][2] = loadImage("yellow.gif");
    m = loadImage("mpiston.gif");
    dicons[0][2].mask(m);
    dicons[0][3] = loadImage("yellow.gif");
    m = loadImage("mrotor.gif");
    dicons[0][3].mask(m);
    dicons[1][0] = loadImage("yellow.gif");
    m = loadImage("mboot.gif");
    dicons[1][0].mask(m);
    dicons[1][1] = loadImage("yellow.gif");
    m = loadImage("mhair.gif");
    dicons[1][1].mask(m);
    dicons[1][2] = loadImage("yellow.gif");
    m = loadImage("mnose.gif");
    dicons[1][2].mask(m);
    dicons[1][3] = loadImage("yellow.gif");
    m = loadImage("msmile.gif");
    dicons[1][3].mask(m);

  }

  void update()
  {
    hoverColumn();
    hoverRow();
  }

  void hoverColumn()
  {
    selected_column = -1;

    if (!draggingItem())
    {
      if (abs(mouseX-(25+37)) < 38)
      selected_column = 0;
      else if (abs(mouseX-(width-25-37)) < 38)
      selected_column = 1;
    }
  }

  void hoverRow()
  {
    selected_row = -1;
    if (abs(mouseY-250) < 150)
    selected_row = (mouseY-100)/75;
  }

  void mouseDown()
  {
    if (selected_row >= 0 && selected_column >= 0)
    {
      drag_row = selected_row;
      drag_column = selected_column;
    }
  }

  void mouseUp()
  {
    drag_row = -1;
    drag_column = -1;
  }

  boolean draggingItem()
  {
    return drag_row >= 0 && drag_column >= 0;
  }

  void render()
  {
    int i;
    int x_disp=0, y_disp=0;

    noFill();
    stroke(100,100,255);
    x_disp = 25+37;
    y_disp = 100+37;
    for (i=0; i<4; i++)
    {
      rect(x_disp,y_disp,75,75);
      if (selected_column == 0 && selected_row == i)
      image(yicons[0][i], x_disp, y_disp);
      else
      image(icons[0][i], x_disp, y_disp);
      y_disp+=75;
    }
    x_disp = width-25-37;
    y_disp = 137;
    for (i=0; i<4; i++)
    {
      rect(x_disp,y_disp,75,75);
      if (selected_column == 1 && selected_row == i)
      image(yicons[1][i], x_disp, y_disp);
      else
      image(icons[1][i], x_disp, y_disp);
      y_disp+=75;
    }

    if (draggingItem())
    {
      stroke(255,255,100);
      rect(mouseX, mouseY, 75, 75);
      image(dicons[drag_column][drag_row], mouseX, mouseY);
    }
  }
}

/************************************************************************************
** Slider Class                                                                   **
************************************************************************************/
class Slider
{
  int center_x, center_y, range_len, ctrl_height;
  float pos;
  boolean dragging;

  Slider(int x, int y, int w, int h)
  {
    center_x = x;
    center_y = y;
    range_len = w;
    ctrl_height = h;
    pos = 0.0;
  }

  void render()
  {
    noStroke();
    fill(80,80,180);
    rect(center_x, center_y, range_len,10);
    fill(255);
    fill(255, 255,100);
    rect(center_x + range_len*0.5*pos, center_y, 10, ctrl_height);
  }

  void update()
  {
    if (dragging)
    {
      pos = 2*(mouseX - center_x)/(float)range_len;
      pos = min(pos,1.0);
      pos = max(pos,-1.0);
      y_rot = pos*PI/2.0;
    }
  }

  void mouseDown()
  {
    if (hovering())
    {
      dragging = true;
    }
  }

  void mouseUp()
  {
    dragging = false;
  }

  boolean hovering()
  {
    //encapsulating otherwise cryptic code
    return ( abs(mouseX - (center_x+range_len*0.5*pos)) <= 5 ) &&
    ( abs(mouseY - center_y) <= ctrl_height/2.0 );
  }
}

/*****************************************************************************************
** Hair Mechanics                                                                       **
*****************************************************************************************/

class Hair
{
  //Because there may be many instances,
  //I'm trying to be parsimonious with memory
  // (x1,y1) = (0,0)
  float x2, x3, y2, y3, rest, v, r, s;

  Hair (float len, float sprout)
  {
    //invariant: sprout ~ [0,PI/2]
    //op count = 5 Mpy, 4 Trig, 1 Exp
    //Longer hairs have greater overall droop
    float droop = HALF_PI*(1-pow(A,-len));

    x2 = len*cos(sprout);
    y2 = -len*sin(sprout);
    x3 = x2 + len*cos(droop);
    y3 = y2 + len*sin(droop);

    rest = y3;
    v = 0;
    r = len;
    s = sprout;
  }

  void update()
  {
    //hooke's law, op count = 2 Mpy
    v  = D*(v-K*(y3-rest));
    y3 += v;
  }

  void render()
  {
    noFill();
    beginShape();
    for (float t=0; t<=1.0; t+=St)
    {
      //2D quadratic bezier, op count = 8 Mpy
      vertex(t*( t*(x3-2.0*x2) + 2.0*x2 ),
      t*( t*(y3-2.0*y2) + 2.0*y2 ));
    }
    endShape();
  }

  void disturb(float level)
  {
    //op count, 1 Mpy
    y3 = rest - r*level;
  }
}

/*****************************************************************************************
** General Helper Functions                                                            **
*****************************************************************************************/

void loadIdentity()
{
  translate(width/2,height/2);
  scale(1,-1);
}

float fdist( float dx, float dy )
{
  float mn, mx, approx;
  mx = max(dx,dy);
  mn = min(dx,dy);
  approx = ( mx * 1007.0 ) + ( mn * 441.0 );
  if ( mx < ( mn * 16.0 ))
  approx -= ( mx * 40.0 );
  return approx/1024.0;
}

/*****************************************************************************************
** Billboarding Stuff - still buggy???                                                 **
*****************************************************************************************/

void WrotateX(float t)
{
  xr += t;
  rotateX(t);
}

void WrotateY(float t)
{
  yr += t;
  rotateY(t);
}

void WrotateZ(float t)
{
  zr += t;
  rotateZ(t);
}

void WpushMatrix()
{
  myStack.spushMatrix(xr,yr,zr);
  pushMatrix();
}

void WpopMatrix()
{
  StackItem i = myStack.spopMatrix();
  xr = i.x;
  yr = i.y;
  zr = i.z;
  popMatrix();
}

class StackItem
{
  StackItem next;
  float x, y, z;
  StackItem(float x0, float y0, float z0, StackItem n)
  {
    x=x0; y=y0; z=z0;
    next = n;
  }
}

class Stack
{
  StackItem head = null;

Stack() {}

  void spushMatrix(float x, float y, float z)
  {
    head = new StackItem(x, y, z, head);
  }

  StackItem spopMatrix()
  {
    if (head == null)
    {
      println("bad pop!");
      return new StackItem(0,0,0,null);
    }
    StackItem rval = head;
    head = head.next;
    return rval;
  }
}

/*****************************************************************************************
** Memoized Trig Functions                                                             **
*****************************************************************************************/
float[] Sines   = null;
float[] Cosines = null;
float memo_step = PI/20.0;

void init_memo_trig()
{
  int i;

  Sines = new float[40];
  Cosines = new float[40];

  for (i=0; i<40; i++)
  {
    Sines[i] = sin(i*memo_step);
    Cosines[i] = cos(i*memo_step);
  }
}

float Sin(float theta)
{
  theta = (theta % TWO_PI);
  int hash = (int)((theta+0.00001)/memo_step);
  return Sines[hash];
}

float Cos(float theta)
{
  theta = (theta % TWO_PI);
  int hash = (int)((theta+0.00001)/memo_step);
  return Cosines[hash];
}

