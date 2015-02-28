
/**
 * ControlP5 RadioButton
 * by andreas schlegel, 2009
 */

import controlP5.*;

ControlP5 controlP5;
RadioButton r;

PGraphics bg;
int       posx, posy;
int       opcao;

void setup() 
{
  size(400,400);
  smooth();
  controlP5 = new ControlP5(this);
  r = controlP5.addRadioButton("radioButton",20,160);
  r.setColorForeground(color(120));
  r.setColorActive(color(255));
  r.setColorLabel(color(255));
  r.setItemsPerRow(5);   
  r.setSpacingColumn(50); 

  bg = createGraphics(400,400, P2D);

  addToRadioButton(r,"camera",1);
  addToRadioButton(r,"zoomIn",2);
  addToRadioButton(r,"zoomOut",3);

  //daí é só repetição...
  //addToRadioButton(r,"planoGer",4);
  //addToRadioButton(r,"planoDet",5);
  //(...)
  //e por aí vai
}

void draw() 
{
  image(bg, 0, 0);
  
  /////////////////////////////////////////////
  // se é camera... ///////////////////////////
  /////////////////////////////////////////////
  if (opcao == 1) //
  {
    fill(255, 0, 0);
    stroke(0, 200, 0);
    rect(posx-5,posy-5,10,10);
    triangle(posx,posy,posx+15,posy-5,posx+15,posy+5);
    if (mousePressed)
    {
      println("ae!");
      bg.beginDraw();     
      bg.fill(255, 0, 0);
      bg.stroke(0, 200, 0);
      bg.ellipse(posx,posy,14,14);
      bg.line(posx-3,posy,posx+3,posy);
      bg.line(posx,posy-3,posx,posy+3);
      bg.endDraw();
    }
  }
  
  /////////////////////////////////////////////
  //se é zoomIn.../////////////////////////////
  /////////////////////////////////////////////
  if (opcao == 2) 
  {
    fill(255, 0, 0);
    stroke(0, 200, 0);
    ellipse(posx,posy,14,14);
    line(posx-3,posy,posx+3,posy);
    line(posx,posy-3,posx,posy+3);
    if (mousePressed)
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
 
  /////////////////////////////////////////////
  //se é zoomIn.../////////////////////////////
  /////////////////////////////////////////////
  if (opcao == 3)
  {
    fill(255, 0, 0);
    stroke(0, 200, 0);
    ellipse(posx,posy,14,14);
    line(posx-3,posy,posx+3,posy);
    if (mousePressed)
    {
      bg.beginDraw();     
      bg.fill(255, 0, 0);
      bg.stroke(0, 200, 0);
      bg.ellipse(posx,posy,14,14);
      bg.line(posx-3,posy,posx+3,posy);
      bg.endDraw();
    }
  }
  
  /////////////////////////////////////////////
  /////////////////////////////////////////////
  // daí é só repetição... 
  // para o zoomOut == 3, "planoGer" == 4, o "planoDet" ==5, etc...
  /////////////////////////////////////////////
}


void mousePressed()
{
  posx = mouseX;
  posy = mouseY;
}

void addToRadioButton(RadioButton theRadioButton, String theName, int theValue ) 
{
  Toggle t = theRadioButton.addItem(theName,theValue);
  t.captionLabel().setColorBackground(color(80));
  t.captionLabel().style().movePadding(2,0,-1,2);
  t.captionLabel().style().moveMargin(-2,0,0,-3);
  t.captionLabel().style().backgroundWidth = 46;
}

void controlEvent(ControlEvent theEvent) 
{
  opcao = (int) theEvent.group().value();
}


