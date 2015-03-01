
import de.bezier.guido.*;

OrGate or;
AndGate and;
NotGate not;
NandGate nand;
NorGate nor;
XnorGate xnor;
XorGate xor;
SimpleButton or1, or2, and1, and2, not1, nand1, nand2, nor1, nor2, xnor1, xnor2, xor1, xor2;

int X=120, Y=100;

void setup ()
{
  size(1146, 800);
  textFont(createFont("Courier New", 25));

  // start interactive "manager"
  Interactive.make( this );

  or=new OrGate(X, Y+40);
  and=new AndGate(X+340, Y+40);
  not=new NotGate(X+700, Y+40);
  nand=new NandGate(X+340, Y+270);
  nor=new NorGate(X, Y+270);
  xnor=new XnorGate(X+700, Y+270);
  xor=new XorGate(X, Y+500);

  // create button instances
  or1 = new SimpleButton(X-60, Y+100, 20, 20);
  or2=new SimpleButton(X-60, Y+60, 20, 20);
  and1 = new SimpleButton(X+280, Y+60, 20, 20);
  and2 = new SimpleButton(X+280, Y+100, 20, 20);
  not1 = new SimpleButton(X+640, Y+80, 20, 20);
  nand1 = new SimpleButton(X+280, Y+290, 20, 20);
  nand2 = new SimpleButton(X+280, Y+330, 20, 20);
  nor1 = new SimpleButton(X-60, Y+290, 20, 20);
  nor2 = new SimpleButton(X-60, Y+330, 20, 20);
  xnor1 = new SimpleButton(X+640, Y+290, 20, 20);
  xnor2 = new SimpleButton(X+640, Y+330, 20, 20);
  xor1 = new SimpleButton(X-60, Y+520, 20, 20);
  xor2 = new SimpleButton(X-60, Y+560, 20, 20);
}

void draw ()
{
  background( 0 );
  stroke(255);
  line(X-90, Y-70, X-90, Y+670);
  line(X-90, Y+670, X+996, Y+670);
  line(X+996, Y+670, X+996, Y-70);
  line(X+996, Y-70, X-90, Y-70);
  line(X-90, Y-20, X+996, Y-20);
  stroke(100);
  line(X-90, Y+200, X+996, Y+200);
  line(X-90, Y+430, X+996, Y+430);
  line(X+265, Y-20, X+265, Y+670);
  line(X+625, Y-20, X+625, Y+430);
  textAlign(CENTER);
  textSize(35);
  fill(255);
  text("LOGIC GATES", X+453, Y-35);
  textAlign(LEFT);
  textSize(20);
  text("* Use mouse to change the inputs and",X+275,Y+460);
  text("  verify the output with truth table.",X+275,Y+490);

  or.setOutput(or1.getinp(), or2.getinp());
  or.showOutput();
  or.showOrGate();

  and.setOutput(and1.getinp(), and2.getinp());
  and.showOutput();
  and.showAndGate();

  not.setOutput(not1.getinp());
  not.showOutput();
  not.showNotGate();

  nand.setOutput(nand1.getinp(), nand2.getinp());
  nand.showOutput();
  nand.showNandGate();

  nor.setOutput(nor1.getinp(), nor2.getinp());
  nor.showOutput();
  nor.showNorGate();

  xnor.setOutput(xnor1.getinp(), xnor2.getinp());
  xnor.showOutput();
  xnor.showXnorGate();

  xor.setOutput(xor1.getinp(), xor2.getinp());
  xor.showOutput();
  xor.showXorGate();
}

class AndGate
{ 
  boolean a, b, output;
  int x, y;

  AndGate(int x, int y)
  { 
    a=false;
    b=false;
    output=false;
    this.x=x;
    this.y=y;
  }

  void setOutput(boolean p, boolean q)
  {
    a=p;
    b=q;
    if (a && b)
      output=true;
    else
      output=false;
  }

  void showOutput()
  { 
    if (output)
      fill( 0, 255, 0 );
    else
      fill( 255, 0, 0 );
    noStroke();
    rect(x+130, y+40, 20, 20);
    fill(255);
    textSize(25);
    text("|A|B|Y|", x+170, y+20);
    text("|0|0|0|", x+170, y+40);
    text("|0|1|0|", x+170, y+60);
    text("|1|0|0|", x+170, y+80);
    text("|1|1|1|", x+170, y+100);

    switch(2*(a?1:0)+(b?1:0))
    {
    case 0:
      fill(0, 255, 0);
      text("|0|0|0|", x+170, y+40);
      break;
    case 1:
      fill(0, 255, 0);
      text("|0|1|0|", x+170, y+60);
      break;    
    case 2:
      fill(0, 255, 0);
      text("|1|0|0|", x+170, y+80);
      break;    
    case 3:
      fill(0, 255, 0);
      text("|1|1|1|", x+170, y+100);
      break;
    }
  }

  void showAndGate()
  {
    stroke(255);
    noFill();
    line(x-40, y+70, x+10, y+70);
    line(x-40, y+30, x+10, y+30);
    line(x+10, y, x+10, y+100);
    line(x+10, y, x+50, y);
    line(x+10, y+100, x+50, y+100);
    arc(x+50, y+50, 100, 100, -PI/2, PI/2);
    line(x+100, y+50, x+130, y+50);

    textSize(25);
    textAlign(CENTER);
    fill(255);
    text("AND GATE", x+130, y-20);
    textAlign(LEFT);
  }
}

class NandGate
{ 
  boolean a, b, output;
  int x, y;

  NandGate(int x, int y)
  {
    a=false;
    b=false;
    output=true;
    this.x=x;
    this.y=y;
  }

  void setOutput(boolean p, boolean q)
  {
    a=p;
    b=q;
    if (!(a && b))
      output=true;
    else
      output=false;
  }

  void showOutput()
  { 
    if (output)
      fill( 0, 255, 0 );
    else
      fill( 255, 0, 0 );
    noStroke();
    rect(x+130, y+40, 20, 20);
    fill(255);
    textSize(25);
    text("|A|B|Y|", x+170, y+20);
    text("|0|0|1|", x+170, y+40);
    text("|0|1|1|", x+170, y+60);
    text("|1|0|1|", x+170, y+80);
    text("|1|1|0|", x+170, y+100);

    switch(2*(a?1:0)+(b?1:0))
    {
    case 0:
      fill(0, 255, 0);
      text("|0|0|1|", x+170, y+40);
      break;
    case 1:
      fill(0, 255, 0);
      text("|0|1|1|", x+170, y+60);
      break;    
    case 2:
      fill(0, 255, 0);
      text("|1|0|1|", x+170, y+80);
      break;    
    case 3:
      fill(0, 255, 0);
      text("|1|1|0|", x+170, y+100);
      break;
    }
  }

  void showNandGate()
  {
    stroke(255);
    noFill();
    line(x-40, y+70, x+10, y+70);
    line(x-40, y+30, x+10, y+30);
    line(x+10, y, x+10, y+100);
    line(x+10, y, x+50, y);
    line(x+10, y+100, x+50, y+100);
    arc(x+50, y+50, 100, 100, -PI/2, PI/2);
    ellipse(x+105, y+50, 10, 10);
    line(x+110, y+50, x+130, y+50);

    textSize(25);
    textAlign(CENTER);
    fill(255);
    text("NAND GATE", x+130, y-20);
    textAlign(LEFT);
  }
}

class NorGate
{ 
  boolean a, b, output;
  int x, y;

  NorGate(int x, int y)
  {
    a=false;
    b=false;
    output=true;
    this.x=x;
    this.y=y;
  }

  void setOutput(boolean p, boolean q)
  {
    a=p;
    b=q;
    if (!(a || b))
      output=true;
    else
      output=false;
  }

  void showOutput()
  { 
    if (output)
      fill( 0, 255, 0 );
    else
      fill( 255, 0, 0 );
    noStroke();
    rect(x+110, y+40, 20, 20);
    fill(255);
    textSize(25);
    text("|A|B|Y|", x+150, y+20);
    text("|0|0|1|", x+150, y+40);
    text("|0|1|0|", x+150, y+60);
    text("|1|0|0|", x+150, y+80);
    text("|1|1|0|", x+150, y+100);

    switch(2*(a?1:0)+(b?1:0))
    {
    case 0:
      fill(0, 255, 0);
      text("|0|0|1|", x+150, y+40);
      break;
    case 1:
      fill(0, 255, 0);
      text("|0|1|0|", x+150, y+60);
      break;    
    case 2:
      fill(0, 255, 0);
      text("|1|0|0|", x+150, y+80);
      break;    
    case 3:
      fill(0, 255, 0);
      text("|1|1|0|", x+150, y+100);
      break;
    }
  }

  void showNorGate()
  {
    stroke(255);
    noFill();
    line(x-40, y+70, x+18, y+70);
    line(x-40, y+30, x+18, y+30);
    curve(x-150, y, x, y, x, y+100, x-150, y+100);
    curve(x-90, y, x, y+100, x+75, y+50, x-50, y-30);
    curve(x-50, y+30, x+75, y+50, x, y, x-90, y+100);
    line(x+85, y+50, x+110, y+50);
    ellipse(x+80, y+50, 10, 10);

    textSize(25);
    textAlign(CENTER);
    fill(255);
    text("NOR GATE", x+110, y-20);
    textAlign(LEFT);
  }
}

class NotGate
{
  boolean a, output;
  int x, y;

  NotGate(int x, int y)
  {
    a=false;
    output=true;
    this.x=x;
    this.y=y;
  }

  void setOutput(boolean p)
  {
    a=p;
    if (!a)
      output=true;
    else
      output=false;
  }

  void showOutput()
  { 
    if (output)
      fill( 0, 255, 0 );
    else
      fill( 255, 0, 0 );
    noStroke();
    rect(x+130, y+40, 20, 20);
    fill(255);
    textSize(25);
    text("|A|Y|", x+170, y+20);
    text("|0|1|", x+170, y+40);

    text("|1|0|", x+170, y+60);
    switch((a?1:0))
    {
    case 0:
      fill(0, 255, 0);
      text("|0|1|", x+170, y+40);
      break;
    case 1:
      fill(0, 255, 0);
      text("|1|0|", x+170, y+60);
      break;
    }
  }

  void showNotGate()
  {
    stroke(255);
    noFill();
    line(x-40, y+50, x+10, y+50);
    line(x+100, y+50, x+10, y+100);
    line(x+10, y+100, x+10, y);
    line(x+10, y, x+100, y+50);
    line(x+100, y+50, x+130, y+50);

    textSize(25);
    textAlign(CENTER);
    fill(255);
    text("NOT GATE", x+130, y-20);
    textAlign(LEFT);
  }
}

class OrGate
{
  boolean a, b, output;
  int x, y;

  OrGate(int x, int y)
  {
    a=false;
    b=false;
    output=false;
    this.x=x;
    this.y=y;
  }

  void setOutput(boolean p, boolean q)
  {
    a=p;
    b=q;
    if (a || b)
      output=true;
    else
      output=false;
  }

  void showOutput()
  { 
    if (output)
      fill( 0, 255, 0 );
    else
      fill( 255, 0, 0 );
    noStroke();
    rect(x+100, y+40, 20, 20);
    fill(255);
    textSize(25);
    text("|A|B|Y|", x+150, y+20);
    text("|0|0|0|", x+150, y+40);
    text("|0|1|1|", x+150, y+60);
    text("|1|0|1|", x+150, y+80);
    text("|1|1|1|", x+150, y+100);

    switch(2*(a?1:0)+(b?1:0))
    {
    case 0:
      fill(0, 255, 0);
      text("|0|0|0|", x+150, y+40);
      break;
    case 1:
      fill(0, 255, 0);
      text("|0|1|1|", x+150, y+60);
      break;    
    case 2:
      fill(0, 255, 0);
      text("|1|0|1|", x+150, y+80);
      break;    
    case 3:
      fill(0, 255, 0);
      text("|1|1|1|", x+150, y+100);
      break;
    }
  }

  void showOrGate()
  {
    stroke(255);
    noFill();
    line(x-40, y+70, x+18, y+70);
    line(x-40, y+30, x+18, y+30);
    curve(x-150, y, x, y, x, y+100, x-150, y+100);
    curve(x-90, y, x, y+100, x+75, y+50, x-50, y-30);
    curve(x-50, y+30, x+75, y+50, x, y, x-90, y+100);
    line(x+75, y+50, x+100, y+50);

    textSize(25);
    textAlign(CENTER);
    fill(255);
    text("OR GATE", x+100, y-20);
    textAlign(LEFT);
  }
}

class SimpleButton extends ActiveElement
{
  boolean on;

  SimpleButton ( float x, float y, float w, float h ) 
  {
    // this registers this button with the "manager" and sets "hot area"
    super( x, y, w, h );
  }

  // one possible callback, automatically called 
  // by manager when button clicked

  boolean getinp()
  {
    return on;
  }

  void mousePressed () 
  {
    on = !on;
  }

  void draw () 
  {
    noStroke();

    if ( on ) 
      fill( 0, 255, 0 );
    else 
      fill( 255, 0, 0 );
    rect(x, y, width, height);
  }
}

class XnorGate
{
  boolean a, b, output;
  int x, y;

  XnorGate(int x, int y)
  {
    a=false;
    b=false;
    output=true;
    this.x=x;
    this.y=y;
  }

  void setOutput(boolean p, boolean q)
  {
    a=p;
    b=q;
    if ((a && b)||((!a) && (!b)))
      output=true;
    else
      output=false;
  }

  void showOutput()
  { 
    if (output)
      fill( 0, 255, 0 );
    else
      fill( 255, 0, 0 );
    noStroke();
    rect(x+120, y+40, 20, 20);
    fill(255);
    textSize(25);
    text("|A|B|Y|", x+170, y+20);
    text("|0|0|1|", x+170, y+40);
    text("|0|1|0|", x+170, y+60);
    text("|1|0|0|", x+170, y+80);
    text("|1|1|1|", x+170, y+100);

    switch(2*(a?1:0)+(b?1:0))
    {
    case 0:
      fill(0, 255, 0);
      text("|0|0|1|", x+170, y+40);
      break;
    case 1:
      fill(0, 255, 0);
      text("|0|1|0|", x+170, y+60);
      break;    
    case 2:
      fill(0, 255, 0);
      text("|1|0|0|", x+170, y+80);
      break;    
    case 3:
      fill(0, 255, 0);
      text("|1|1|1|", x+170, y+100);
      break;
    }
  }

  void showXnorGate()
  {
    stroke(255);
    noFill();
    line(x-40, y+70, x+8, y+70);
    line(x-40, y+30, x+8, y+30);
    curve(x-160, y, x-10, y, x-10, y+100, x-160, y+100);
    curve(x-150, y, x, y, x, y+100, x-150, y+100);
    curve(x-90, y, x, y+100, x+75, y+50, x-50, y-30);
    curve(x-50, y+30, x+75, y+50, x, y, x-90, y+100);
    line(x+85, y+50, x+120, y+50);
    ellipse(x+80, y+50, 10, 10);

    textSize(25);
    textAlign(CENTER);
    fill(255);
    text("XNOR GATE", x+120, y-20);
    textAlign(LEFT);
  }
}

class XorGate
{
  boolean a, b, output;
  int x, y;

  XorGate(int x, int y)
  {
    a=false;
    b=false;
    output=false;
    this.x=x;
    this.y=y;
  }

  void setOutput(boolean p, boolean q)
  {
    a=p;
    b=q;
    if ((!a && b)||(a && !b))
      output=true;
    else
      output=false;
  }

  void showOutput()
  { 
    if (output)
      fill( 0, 255, 0 );
    else
      fill( 255, 0, 0 );
    noStroke();
    rect(x+110, y+40, 20, 20);
    fill(255);
    textSize(25);
    text("|A|B|Y|", x+150, y+20);
    text("|0|0|0|", x+150, y+40);
    text("|0|1|1|", x+150, y+60);
    text("|1|0|1|", x+150, y+80);
    text("|1|1|0|", x+150, y+100);

    switch(2*(a?1:0)+(b?1:0))
    {
    case 0:
      fill(0, 255, 0);
      text("|0|0|0|", x+150, y+40);
      break;
    case 1:
      fill(0, 255, 0);
      text("|0|1|1|", x+150, y+60);
      break;    
    case 2:
      fill(0, 255, 0);
      text("|1|0|1|", x+150, y+80);
      break;    
    case 3:
      fill(0, 255, 0);
      text("|1|1|0|", x+150, y+100);
      break;
    }
  }

  void showXorGate()
  {
    stroke(255);
    noFill();
    line(x-40, y+70, x+8, y+70);
    line(x-40, y+30, x+8, y+30);
    curve(x-160, y, x-10, y, x-10, y+100, x-160, y+100);
    curve(x-150, y, x, y, x, y+100, x-150, y+100);
    curve(x-90, y, x, y+100, x+75, y+50, x-50, y-30);
    curve(x-50, y+30, x+75, y+50, x, y, x-90, y+100);
    line(x+75, y+50, x+110, y+50);

    textSize(25);
    textAlign(CENTER);
    fill(255);
    text("XOR GATE", x+110, y-20);
    textAlign(LEFT);
  }
}

