

//import java.awt.Frame;
//import java.awt.event.WindowEvent;
import java.awt.Frame;
//import java.awt.Color;
//import java.awt.event.WindowListener;
//import java.awt.event.MouseListener;
//import java.awt.event.MouseMotionListener;
//import java.awt.Insets;
//import java.awt.event.ComponentListener;
//import java.awt.event.ComponentEvent;
//import java.awt.event.KeyEvent;
//import java.awt.Component;
//import java.lang.reflect.InvocationTargetException;
//import java.lang.reflect.Method;
//import java.awt.GraphicsDevice;
//import java.awt.GraphicsEnvironment;
//import java.awt.MouseInfo;

int z=0;
int buttonSize = 40;     // Diameter vd buttons
int AantalPalletBlokjes = 5; //Aantal blokjes in kleurenpallet button
PFrame f;
secondApplet s;

int buttonX, buttonY;

int[] buttons;
color[][]KopieScherm;
color background=color(50, 0, 0);
color drawColor=(255);
color buttonColor=(0);
color buttonHighlight=(100);
color wisColor=color(50, 0, 0);
color oudColor=color(0, 0, 0);
color buttonTekening=color(255, 100, 0);
boolean MuisLosgelaten=false;
boolean[] buttonOver;
boolean TekenLijn = false;
boolean TekenRechthoek = false;
boolean TekenEllipse = false;
boolean TekenPallet = false;
boolean TekenWissen = false;
boolean NieuwFrame = false;
boolean InPalletFrame = false;

int l;
int rectX;
int rectY;
int ellX, ellY, ellXoud, ellYoud;
int rectXoud, rectYoud;

int i = 0; 
int j; 
int k;
int nrButtons = 5;

void setup() {
  fill(background);
  size(1200, 600);
  buttonX=0;
  buttonY=height-buttonSize;
  buttonOver = new boolean[nrButtons];
  KopieScherm = new color[width][height];

  stroke(buttonTekening);
  rectMode(CORNER);
  rect(0, 0, width, height);
  TekenLijn = true;
  fill(buttonHighlight);
  rect(buttonX, buttonY, buttonSize, buttonSize); //zet Tekenlijn vast aan
  buttonOver[0] = true;
  rect(buttonX, (buttonY+buttonSize/2), buttonSize, 2); /* lijn button */


  for (i=1; i<nrButtons; i++) {
    fill(buttonColor);
    stroke(buttonColor);
    rect((buttonX+(buttonSize*i)), buttonY, buttonSize, buttonSize);
    buttonOver[i] = false;
  } 
  stroke(buttonTekening);
  fill(buttonColor);

  rect(buttonX+(buttonSize*1.25), buttonY+buttonSize/4, buttonSize/2, buttonSize/4); /* rechthoek button 2e button*/
  ellipse(buttonX+(2.5*buttonSize), buttonY+buttonSize/2, buttonSize/2, buttonSize/4); //ellipse button 3e 

  //Teken pallet button
  fill(drawColor);
  rect(buttonX+(buttonSize*3), buttonY, buttonSize, buttonSize);
  for (i=1;i<(buttonSize/5)-1;i++) {
    for (j=1; (j < (buttonSize/5)-1);j++) {
      fill (i*70, i*50, (i+j)*50);
      rect(buttonX+(i*buttonSize/AantalPalletBlokjes)+(buttonSize*3), buttonY+(j*buttonSize/AantalPalletBlokjes), buttonSize/AantalPalletBlokjes, buttonSize/AantalPalletBlokjes);
    }
  }
}


void draw() {
  update(mouseX, mouseY);
}


void update(int x, int y) {
  stroke(buttonTekening);
  rectMode(CORNER);

  for (i=0; i < nrButtons; i++) {

    if ( overButton(buttonX+(buttonSize*i), buttonY, buttonSize, buttonSize) ) {
      buttonOver[i] = true;
      fill(buttonHighlight);
    }
    else {
      buttonOver[i] = false;
      fill(buttonColor);
    }
    rect(buttonX+(buttonSize*i), buttonY, buttonSize, buttonSize);

    if (i == 0) {
      if (TekenLijn) fill(buttonHighlight);
      rect(buttonX+(buttonSize*i), buttonY, buttonSize, buttonSize);
      rect(buttonX, buttonY+buttonSize/2, buttonSize, buttonSize);
    }
    if (i == 1) {
      if (TekenRechthoek) fill(buttonHighlight);
      rect(buttonX+(buttonSize*i), buttonY, buttonSize, buttonSize);
      rect(buttonX+(buttonSize*1.25), buttonY+buttonSize/4, buttonSize/2, buttonSize/4); /* rechthoek button 2e button*/
    }
    if (i == 2) {
      if (TekenEllipse) fill(buttonHighlight);
      rect(buttonX+(buttonSize*i), buttonY, buttonSize, buttonSize);
      ellipse(buttonX+(2.5*buttonSize), buttonY+buttonSize/2, buttonSize/2, buttonSize/4);
    }
    if (i==3) {
      if (buttonOver[3]&&(!TekenPallet)) fill(buttonHighlight); 
      else fill(drawColor);
      rect(buttonX+(buttonSize*i), buttonY, buttonSize, buttonSize);
      for (k=1;k<(AantalPalletBlokjes-1);k++) {
        for (j=1; (j < AantalPalletBlokjes-1);j++) {
          fill(j*70, k*50, (k+j)*50);
          rect(buttonX+(k*buttonSize/AantalPalletBlokjes)+(buttonSize*3), buttonY+(j*buttonSize/AantalPalletBlokjes), buttonSize/AantalPalletBlokjes, buttonSize/AantalPalletBlokjes);
        }
      }
    }
    if (i==4) {
      if (TekenWissen) fill(buttonHighlight);
      rect(buttonX+(buttonSize*i), buttonY, buttonSize, buttonSize);
    }
  }
}
void mouseReleased() {
  MuisLosgelaten = true;
}


void mouseDragged() {

  if (TekenLijn) {
    stroke(drawColor);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  if (TekenRechthoek) {

    rectMode(CORNERS);
    fill(wisColor);
    stroke(wisColor);

    rect (rectX, rectY, rectXoud, rectYoud);

    fill(drawColor);
    stroke(drawColor);

    rectXoud=pmouseX;
    rectYoud=pmouseY; 

    rectMode(CORNERS);
    rect (rectX, rectY, pmouseX, pmouseY);
  }  

  if (TekenEllipse) {
   
        fill(wisColor);
     stroke(wisColor);
     ellipse(ellX, ellY, (abs(ellX-ellXoud)*3)+4, (abs(ellY-ellYoud)*3)+4);
     
     fill (drawColor);
     stroke (drawColor);
     ellXoud = pmouseX;
     ellYoud = pmouseY;
     ellipse (ellX, ellY, abs(pmouseX-ellX)*3, abs(pmouseY-ellY)*3);
     
     
   /*
    fill (wisColor);
    stroke(drawColor);
    i=(ellX-ellXoud)*2;
    j=(ellY-ellYoud)*2;
    if (i==0) i=1;
    if (j==0) j=1;


    println("ellX",ellX, "ellY: ", ellY, "i: ", i, "j", j);
    ellipse(ellX, ellY, abs(i), abs(j));
    pushMatrix();
  
    scale(i,j);
    println("na scale: ellX",ellX, "ellY: ", ellY, "i: ", i, "j", j);
    stroke(drawColor);
    fill(drawColor);
    ellipse (ellX,ellY, abs(i), abs(j));
    popMatrix();
    ellXoud=pmouseX;
    ellYoud=pmouseY;
    */
  }

  if (TekenWissen) {
    stroke(wisColor);

    fill(wisColor);
    rectMode(CENTER);
    rect (mouseX, mouseY, 40, 40);
  }
}


void tekenNwFrame() {

  PFrame f = new PFrame();
  f.setResizable(false);
  //f.setVisible(true);
}

void tekenPallet() {
  s.size(300, 550);
  //s.hide();      

  s.stroke(buttonTekening);
  s.rectMode(CORNER);

  // vul pallet       
  for (i=0;i<30;i++) {
    for (j=0;j<45;j++) {

      if (j<3)              s.fill ((j+5)*(i+5), 0, 0) ;    //Roodtinten
      if (j>=3 && j < 6)    s.fill ((j+2)*(i+5), (j+2)*(i+5)/2, 0);   

      if (j>=6 && j < 9)    s.fill (0, (j-1)*(i+5), 0);         //Groentinten
      if (j>=9 && j < 12)   s.fill ((j-4)*(i+5)/2, (j-4)*(i+5), 0);    
      if (j>=12 && j < 15)  s.fill ((j-7)*(i+5), (j-4)*(i+5), 0);     

      if (j>=15 && j < 18)  s.fill (0, 0, (j-10)*(i+5));     //Blauwtinten
      if (j>=18 && j < 21)  s.fill (0, (j-13)*(i+5)/2, (j-13)*(i+5));   
      if (j>=21 && j < 24)  s.fill (0, (j-16)*(i+5), (j-16)*(i+5));  

      if (j>=24 && j < 27)  s.fill ((j-19)*(i+5)/2, (j-19)*(i+5), (j-19)*(i+5));   //Mengtinten   
      if (j>=27 && j < 30)   s.fill ((j-22)*(i+5), (j-22)*(i+5)/2, (j-22)*(i+5));      
      if (j>=30 && j < 33)   s.fill ((j-25)*(i+5), (j-25)*(i+5), (j-25)*(i+5)/2);

      if (j>=33 && j < 36)   s.fill ((j-28)*(i+5)/2, (j-28)*(i+5), (j-28)*(i+5)/2);  
      if (j>=36 && j < 39)   s.fill ((j-31)*(i+5), (j-31)*(i+5)/2, (j-31)*(i+5)/2);  
      if (j>=39 && j < 42)   s.fill ((j-34)*(i+5)/2, (j-34)*(i+5)/2, (j-34)*(i+5));  

      if (j>=42)  s.fill ((j-37)*(i+5));  //Grijstinten


      s.rect(i*10, j*10, 10, 10);
    }
  }
  s.fill(drawColor);
  s.rect(20, 470, 260, 30);
  s.redraw();

  s.show();
  s.requestFocus();
}

void mouseEntered() { 
  //InPalletFrame = false; 
  TekenPallet = false;
  if (NieuwFrame) {
    s.setVisible(false);
    s.focused=false;
    this.focused=true;
  }
}


void mouseExited() {
  //je zit nu in de frame tekenpallet...
  //InPalletFrame = true;
  TekenPallet = true;
  if (NieuwFrame) {
    s.setVisible(true); 
    s.focused = true;
    this.focused = false;
  }
}

void mousePressed() {
  update(mouseX, mouseY);
  TekenPallet = false;
  if (buttonOver[0]==true) {
    /*Tekenlijn*/
    TekenLijn = true;
    TekenRechthoek= false;
    TekenEllipse = false;
    TekenWissen = false;
  }
  if (buttonOver[1]==true) { 
    TekenRechthoek = true;
    TekenLijn = false;
    TekenEllipse = false;
    TekenWissen = false;
    /*TekenRechrhoek*/
  }
  if (buttonOver[2]==true) { 
    TekenEllipse = true;
    TekenLijn = false;
    TekenRechthoek = false;
    TekenWissen = false;
    /*TekenRechrhoek*/
  }
  if (buttonOver[3]==true) { 
    // TekenEllipse = false;
    // TekenLijn = false;
    // TekenRechthoek = false;
    TekenPallet = true;

    if (!NieuwFrame) {
      NieuwFrame=true; 
      tekenNwFrame();
      tekenPallet(); //er zit een bug in processing, denk ik... de eerste keer dat je het pallet opstart moet ie 2 keer getekend worden om er goed uit te laten zien??
      // s.show();
    }
    tekenPallet();
  }
  if (buttonOver[4]==true) { 
    TekenEllipse = false;
    TekenLijn = false;
    TekenRechthoek = false;
    TekenWissen = true;
    // wissen kan nu beginnen
  }


  /*else, er wordt getekend en niet op een button gedrukt */
  else {
    stroke(wisColor);
    fill(drawColor);
    if (TekenLijn) 
      line(mouseX, mouseY, pmouseX, pmouseY);
      

    if (TekenRechthoek) {

      rectX = mouseX;
      rectY = mouseY;
      rectXoud=pmouseX;
      rectYoud=pmouseY;
    }
    if (TekenEllipse) {
      ellX = mouseX;
      ellY = mouseY; 
      ellXoud = pmouseX;
      ellYoud = pmouseY;
      
    }
  }
}

boolean overButton(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } 
  else {
    return false;
  }
}


public class PFrame extends Frame {
  public PFrame() {
    setBounds(100, 100, 300, 550);
    s = new secondApplet();
    add(s);
    s.init();

    show();
  }
}


public class secondApplet extends PApplet {
  public void setup() {
    // size(100, 200);
    noLoop();
    //tekenPallet();
  }

  public void draw() {
  }

  public void mousePressed() {

    drawColor = get(mouseX, mouseY);
    tekenPallet();
  }
}   


