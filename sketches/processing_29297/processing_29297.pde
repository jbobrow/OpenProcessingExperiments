
import controlP5.*;

ControlP5 controlP5;

Textfield myTextfield;

int cnt = 0;
int posx, posy;
int estado;
int estadoCurva;
//PImage bg;
PGraphics bg;

boolean camerA = false;
boolean zoomIn = false;
boolean zoomOut = false;
boolean planoGer = false;
boolean planoDet = false;
boolean planoSeq = false;
boolean dancer = false;
boolean cai = false;
boolean pula = false;
boolean rola = false;
boolean torce = false;
boolean gira = false;
boolean trajeto = false;
boolean texto = false;
boolean borracha = false;

int tX[] = new int[100];
int tY[] = new int[100];

void setup() {
  size(900,600);
  frameRate(30);
  posx = posy = 0;
  estado = 0;
  controlP5 = new ControlP5(this);
  controlP5.addToggle("camerA");//,0,1,1,80,19);
  controlP5.addToggle("zoomIn");//,255,1,21,80,19);
  controlP5.addToggle("zoomOut");//,128,1,41,80,19);
  controlP5.addToggle("planoGer");
  controlP5.addToggle("planoDet");//,255,1,81,80,19);
  controlP5.addToggle("planoSeq");//,0,1,61,80,19);
  controlP5.addToggle("dancer");//,128,1,101,80,19);
  controlP5.addToggle("cai");
  controlP5.addToggle("pula");
  controlP5.addToggle("rola");
  controlP5.addToggle("torce");
  controlP5.addToggle("gira");
  controlP5.addToggle("trajeto");//,0,1,121,80,19);
  controlP5.addToggle("texto");//,255,1,141,80,19);
  controlP5.addToggle("borracha");//,128,1,161,80,19);
  stroke(0, 205, 0);
  fill(255, 0, 0);
  //save("temp.png");
  //bg = loadImage("temp.png");
  bg = createGraphics(900,600, P2D);
  bg.beginDraw();
  bg.background(100);
  bg.endDraw();
}

void controlEvent(ControlEvent theEvent) {
  // PulldownMenu is if type ControlGroup.
  // A controlEvent will be triggered from within the ControlGroup.
  // therefore you need to check the originator of the Event with
  if (theEvent.isGroup())
    // to avoid an error message from controlP5.

    if (theEvent.isGroup()) {
      // check if the Event was triggered from a ControlGroup
      println(theEvent.group().value()+" from "+theEvent.group());
    } 
    else if(theEvent.isController()) {
      println(theEvent.controller().value()+" from "+theEvent.controller());
    }
}

void draw() 
{
  image(bg,0,0);
  posx = mouseX;
  posy = mouseY;

  if(camerA)
  {
    fill(255, 0, 0);
    stroke(0, 200, 0);
    rect(posx-5,posy-5,10,10);
    triangle(posx,posy,posx+15,posy-5,posx+15,posy+5);
    if (mousePressed && mouseButton == RIGHT)
    {
      bg.beginDraw();      
      bg.fill(255, 0, 0);
      bg.stroke(0, 200, 0);
      bg.rect(posx-5,posy-5,10,10);
      bg.triangle(posx,posy,posx+15,posy-5,posx+15,posy+5);     
      bg.endDraw();
    }
  }
  else if(zoomIn) 
  {
    fill(255, 0, 0);
    stroke(0, 200, 0);
    ellipse(posx,posy,14,14);
    line(posx-3,posy,posx+3,posy);
    line(posx,posy-3,posx,posy+3);
    if (mousePressed && mouseButton == RIGHT)
    {
      bg.beginDraw();      
      bg.fill(255, 0, 0);
      bg.stroke(0, 200, 0);
      bg.ellipse(posx,posy,14,14);
      bg.line(posx-3,posy,posx+3,posy);
      bg.line(posx,posy-3,posx,posy+3);
      bg.endDraw();
    }
  }
  else if(zoomOut) 
  {
    fill(255, 0, 0);
    stroke(0, 200, 0);
    ellipse(posx,posy,14,14);
    line(posx-3,posy,posx+3,posy);
    if (mousePressed && mouseButton == RIGHT)
    {
      bg.beginDraw();      
      bg.fill(255, 0, 0);
      bg.stroke(0, 200, 0);
      bg.ellipse(posx,posy,14,14);
      bg.line(posx-3,posy,posx+3,posy);
      bg.endDraw();
    }
  }  
  else if(planoSeq)
  {
    fill(255, 0, 0);
    stroke(0, 255, 0);
    triangle(posx,posy,posx,posy-10,posx+10,posy-5);//(10,15,15,5,20,15)
    triangle(posx+11,posy,posx+11,posy-10,posx+21,posy-5);
    if (mousePressed && mouseButton == RIGHT)
    {
      bg.beginDraw();      
      bg.fill(255, 0, 0);
      bg.stroke(0, 255, 0);
      bg.triangle(posx,posy,posx,posy-10,posx+10,posy-5);//(10,15,15,5,20,15)
      bg.triangle(posx+11,posy,posx+11,posy-10,posx+21,posy-5);
      bg.endDraw();
    }
  }
  else if(planoDet)
  {
    fill(255, 0, 0);
    stroke(0, 190, 0);
    ellipse(posx,posy,12,12);
    ellipse(posx,posy,5,5);
    line(posx-6,posy+6,posx-10,posy+10);
    if (mousePressed && mouseButton == RIGHT)
    {
      bg.beginDraw();      
      bg.fill(255, 0, 0);
      bg.stroke(0, 190, 0);
      bg.ellipse(posx,posy,12,12);
      bg.ellipse(posx,posy,5,5);
      bg.line(posx-6,posy+6,posx-10,posy+10);
      bg.endDraw();
    }
  }
  else if(planoGer)
  {
    fill(255, 0, 0);
    stroke(0, 255, 0);
    triangle(posx,posy,posx,posy-10,posx+10,posy-5);
    triangle(posx-10,posy-5,posx-1,posy-10,posx-1,posy);
    if (mousePressed && mouseButton == RIGHT)
    {
      bg.beginDraw();      
      bg.fill(255, 0, 0);
      bg.stroke(0, 255, 0);
      bg.triangle(posx,posy,posx,posy-10,posx+10,posy-5);
      bg.triangle(posx-10,posy-5,posx-1,posy-10,posx-1,posy);
      bg.endDraw();
    }
  }
  else if(dancer)
  {
    noFill();
    stroke(255,0,0);
    ellipse(posx,posy,15,15);
    if (mousePressed && mouseButton == RIGHT)
    {
      bg.beginDraw();      
      bg.noFill();
      bg.stroke(255,0,0);
      bg.ellipse(posx,posy,15,15);
      bg.endDraw();
    }
  }
  else if(cai)
  {
    fill(0, 255, 0);
    stroke(255, 0, 0);
    triangle(posx,posy,posx+5,posy+10,posx+10,posy);
    if (mousePressed && mouseButton == RIGHT)
    {
      bg.beginDraw();      
      bg.fill(0, 255, 0);
      bg.stroke(255, 0, 0);
      bg.triangle(posx,posy,posx+5,posy+10,posx+10,posy);
      bg.endDraw();
    }
  }
  else if(pula)
  {
    fill(0, 255, 0);
    stroke(255, 0, 0);
    triangle(posx,posy,posx+5,posy-10,posx+10,posy);
    if (mousePressed && mouseButton == RIGHT)
    {
      bg.beginDraw();      
      bg.fill(0, 255, 0);
      bg.stroke(255, 0, 0);
      bg.triangle(posx,posy,posx+5,posy-10,posx+10,posy);
      bg.endDraw();
    }
  }
  else if(rola)
  {
    fill(0, 255, 0);
    stroke(255, 0, 0); 
    ellipse(posx,posy,5,5);
    ellipse(posx+2,posy+2,5,5);
    ellipse(posx+4,posy+4,5,5);
        if (mousePressed && mouseButton == RIGHT)
    {
      bg.beginDraw();      
      bg.fill(0, 255, 0);
      bg.stroke(255, 0, 0); 
      bg.ellipse(posx,posy,5,5);
      bg.ellipse(posx+2,posy+2,5,5);
      bg.ellipse(posx+4,posy+4,5,5);     
      bg.endDraw();
    }
  }
  else if(torce)
  {
    fill(0, 255, 0);
    stroke(255, 0, 0);
    ellipse(posx,posy,5,5);
    ellipse(posx+4,posy+3,5,5);
      if (mousePressed && mouseButton == RIGHT)
    {
      bg.beginDraw();      
      bg.fill(0, 255, 0);
      bg.stroke(255, 0, 0); 
      bg.ellipse(posx,posy,5,5);
      bg.ellipse(posx+4,posy+3,5,5);     
      bg.endDraw();
    }
  }
  else if(gira)
  {
    fill(0, 255, 0);
    stroke(255, 0, 0);
    ellipse(posx,posy,10,10);
    ellipse(posx,posy,5,5);
     if (mousePressed && mouseButton == RIGHT)
    {
      bg.beginDraw();      
      bg.fill(0, 255, 0);
      bg.stroke(255, 0, 0); 
      bg.ellipse(posx,posy,10,10);
      bg.ellipse(posx,posy,5,5);    
      bg.endDraw();
    }
  }
  else if(texto)
  {
    controlP5 = new ControlP5(this);
    myTextfield = controlP5.addTextfield("",850,550,100,20);
    myTextfield.setFocus(true);
  }
  else if(trajeto)
  {
    if(mousePressed) {
      stroke(255);
      line(mouseX, mouseY, pmouseX, pmouseY);
      bg.beginDraw();
      bg.stroke(255);
      bg.line(mouseX, mouseY, pmouseX, pmouseY);
      bg.endDraw();
      //save("temp.png");
      //bg = loadImage("temp.png");
    }
  }
  else if(borracha)
  {
    fill(100);
    stroke(100);
    ellipse(posx,posy,30,30);
          if (mousePressed && mouseButton == RIGHT)
    {
      bg.beginDraw();      
      bg.fill(100);
      bg.stroke(100); 
      bg.ellipse(posx,posy,30,30);     
      bg.endDraw();
    }
  }
}
//void mousePressed()
//{
//  if (mouseButton == RIGHT) {
    //save("temp.png");
    //bg.copy(0, 0, 900, 600, 0, 0, 900, 600);
    //bg = loadImage("temp.png");
//  }
//}

