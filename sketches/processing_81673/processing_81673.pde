
/**
 * ControlP5 Listener.
 * the ControlListener interface can be used to implement a custom 
 * ControlListener which listens for incoming ControlEvent from specific
 * controller(s). MyControlListener in the example below listens to
 * ControlEvents coming in from controller 'mySlider'.
 *
 * by andreas schlegel, 2012
 */
 PImage Whitman; //for the picture of the buildings
float x, y; //an variable for picture location
import controlP5.*;
//controlP5.addSlider("Speed",1 min vlaue ,20 max value,12 starting,width-176 position,height-15,100 l,10 h);
//ControlGroup l = controlP5.addGroup("Settings",0,10);
//controlP5.addSlider("alpha_desc",1,255,130,40,44,100,10).setGroup(l);
ControlP5 controlP5;
MyControlListener myListener;
MyControlListener myListener1;
MyControlListener myListener2;
MyControlListener myListener3;

//department buttons
boolean buttonSociology=false;
boolean buttonScience=false;
boolean buttonAnkeny=false;

//rollover buttons

//for proffesors archiology
int xa1=100;
int ya1= 543;
int wa1= 25;
float ha1=1.5; 

//for majors archiology
int xa= 100;
int ya= 533;
int wa= 25;
int ha= 12;

//for proffesors psychology
int xps1= 200;
int yps1= 541;
int wps1= 25;
int hps1= 6;

//for majors psychology
int xps= 200;
int yps= 510;
int wps= 25;
int hps= 35;

//for proffesors chemistry
int xc1= 300;
int yc1= 541;
int wc1= 25;
float hc1= 3.5;


//for majors chemistry
int xc= 300;
int yc= 511;
int wc= 25;
int hc= 33;


PFont f; //load the font

//regular set up and image load
void setup(){
  size(670,545);
  
  f= createFont("BellMT-48", 12, true); //creating the font

Whitman= loadImage("campusmap.png");
  x=0.0;
  y=0;
rectMode(CENTER);
  
  controlP5 = new ControlP5(this);
  controlP5.setColor(new CColor(0xffaa0000, 0xff330000, 0xffff0000, 0xffffffff, 0xffffffff));  
  
  
  //Creat new Control Group j (ankeny).
  ControlGroup j=controlP5.addGroup("Ankeny",220,10);
  j.setBackgroundColor(color(255,255,255,0));
  j.setBackgroundHeight(20);
  j.setMoveable(true);
  j.setWidth(100);
  //start with the control group j closed.
  j.close();
  //creat slider 1 group j.
  controlP5.addSlider("departments",0,255,255,0,10,100,7).setGroup(j);
  
  //Create new Control Group k (science).
  ControlGroup k=controlP5.addGroup("Science",110,10);
  k.setBackgroundColor(color(255,255,255,0));
  k.setBackgroundHeight(20);
  k.setMoveable(true);
  k.setWidth(100);
  //start with the control group k closed.
  k.close();
  //creat slider 1 group k.
  controlP5.addSlider("chemistry",0,255,255,0,10,100,7).setGroup(k);
  
  //creat new Control Group l.
  ControlGroup l = controlP5.addGroup("Sociology",0,10);
  l.setBackgroundColor(color(255,255,255,0));
  l.setBackgroundHeight(20);
  l.setMoveable(true);
  l.setWidth(100);
  //start with the control group closed.
  l.close();
  //create slider 1 group l.
 controlP5.addSlider("archiology",0,255,255,0,10,100,7).setGroup(l);
 //create slider 2 group l.
 controlP5.addSlider("psychology",0,255,255,170,10,100,7).setGroup(l);

  //for archiology
  myListener = new MyControlListener();
  //for psychology
  myListener1= new MyControlListener();
  //for chemistry
  myListener2=new MyControlListener();
  
  //for departments
  myListener3=new MyControlListener();
  
  controlP5.getController("archiology").addListener(myListener);
  controlP5.getController("psychology").addListener(myListener1);
  controlP5.getController("chemistry").addListener(myListener2);
  controlP5.getController("departments").addListener(myListener3);
}

void draw() {
  rectMode(CENTER);
  
  
  //Maxy
   stroke(0);
  noFill();
  rect(500,255,100,50);
  
  //Science Building
  rect(260,235,100,50);
  stroke(0);
  noFill();
  
  //Ankeny
   rect(380,250,100,50);
  stroke(0);
  noFill();
  
  if ((buttonSociology && buttonScience && buttonAnkeny) || (!buttonSociology && !buttonScience && !buttonAnkeny)){
    translate(x,y);
  image(Whitman,0,0);
  
  if(mouseX>500-50 && mouseX<500+50 && mouseY>255-25 && mouseY<255+25){
    textFont(f, 12);
   fill(0);
   text("Maxy", 500, 255);
  }
  
  else if(mouseX>260-50 && mouseX<260+50 && mouseY>235-25 && mouseY<235+25){
   textFont(f, 12);
   fill(0);
   text("Science Building", 225, 235); 
  }
  
   else if(mouseX>380-50 && mouseX<380+50 && mouseY>250-25 && mouseY<250+25){
   textFont(f, 12);
   fill(0);
   text("Ankeny", 330, 240); 
  }
  }
  
  else if(buttonSociology){
    
 background(#B27CE8, 255-myListener.col);
 
 
 
 //archiology
 noStroke();
 fill(#21CB5E, myListener.col);
 rect(width/2,height/2,width,height);
 
 //psychology
 noStroke();
 fill(#E81717, myListener1.col);
 rect(width/2, height/2, width, height);
 
 //for professor titeling archiology
   if(mouseX> xa1-wa1 && mouseX< xa1+wa1 && mouseY> ya1-ha1 && mouseY< ya1+ha1){
   textFont(f, 12);
   fill(0);
   text("Archiology Professors", 40, 500);
 }
 //for major titeling archiology
 else if(mouseX> xa-wa && mouseX< xa+wa && mouseY> ya-ha && mouseY< ya+ha){
   textFont(f, 12);
   fill(0);
   text("Archiology Majors", 40, 500);
 }
 
  //for professor titeling psychology
   if(mouseX> xps1-wps1 && mouseX< xps1+wps1 && mouseY> yps1-hps1 && mouseY< yps1+hps1){
   textFont(f, 12);
   fill(0);
   text("Psychology Professors", 150, 530);
 }
 //for major titeling psychology
 else if(mouseX> xps-wps && mouseX< xps+wps && mouseY> yps-hps && mouseY< yps+hps){
   textFont(f, 12);
   fill(0);
   text("Psychology Majors", 150,460 );
 }
 
 if(mouseX>500-50 && mouseX<500+50 && mouseY>255-25 && mouseY<255+25){
    textFont(f, 12);
   fill(0);
   text("Whitman Campus", 450, 255);
  }
   
   

//archiology
noStroke();
fill(#E5551C, myListener.col);  
rect(100,533,50,24);

//psychology
noStroke();
fill(#250A62, myListener1.col);
rect(200,510,50,70);

//archiology
noStroke();
fill(#DE3361, 255-myListener.col);
rect(100,543,50,3);  

//psychology
noStroke();
fill(#EDC02B, 255-myListener1.col);
rect(200,541,50,6);
  }
  
  else if (buttonScience){
 
    background(#B27CE8, 255-myListener.col);
    
 
 //chemistry
 noStroke();
 fill(#3E4FDB, myListener2.col);
 rect(width/2,height/2,width,height);
 
 //for professor titeling chemistry
   if(mouseX> xc1-wc1 && mouseX< xc1+wc1 && mouseY> yc1-hc1 && mouseY< yc1+hc1){
   textFont(f, 12);
   fill(0);
   text("Chemistry Professors", 250, 520);
 }
 //for major titeling chemistry
 else if(mouseX> xc-wc && mouseX< xc+wc && mouseY> yc-hc && mouseY< yc+hc){
   textFont(f, 12);
   fill(0);
   text("Chemistry Majors", 250, 450);
 }
 
 else if(mouseX>260-50 && mouseX<260+50 && mouseY>235-25 && mouseY<235+25){
   textFont(f, 12);
   fill(0);
   text("Whitman Campus", 212, 235); 
  }
 

//chemistry
noStroke();
fill(#EA2FD8, myListener2.col);  
rect(300,511,50,66);

//chemistry
noStroke();
fill(#3CEDE9, 255-myListener2.col);
rect(300,541,50,7);
  }
  
  else if (buttonAnkeny){
    background(#B27CE8, 255-myListener.col);
 
 //archiology
 noStroke();
 fill(#21CB5E, myListener3.col);
 rect(width/2,height/2,width,height);
 
 //psychology
 noStroke();
 fill(#E81717, myListener3.col);
 rect(width/2, height/2, width, height);
 
 //chemistry
 noStroke();
 fill(#3E4FDB, myListener3.col);
 rect(width/2,height/2,width,height);
 
 
 
 //for professor titeling archiology
   if(mouseX> xa1-wa1 && mouseX< xa1+wa1 && mouseY> ya1-ha1 && mouseY< ya1+ha1){
   textFont(f, 12);
   fill(0);
   text("Archiology Professors", 40, 500);
 }
 //for major titeling archiology
 else if(mouseX> xa-wa && mouseX< xa+wa && mouseY> ya-ha && mouseY< ya+ha){
   textFont(f, 12);
   fill(0);
   text("Archiology Majors", 40, 500);
 }
 
 //for professor titeling psychology
   if(mouseX> xps1-wps1 && mouseX< xps1+wps1 && mouseY> yps1-hps1 && mouseY< yps1+hps1){
   textFont(f, 12);
   fill(0);
   text("Psychology Professors", 150, 530);
 }
 //for major titeling psychology
 else if(mouseX> xps-wps && mouseX< xps+wps && mouseY> yps-hps && mouseY< yps+hps){
   textFont(f, 12);
   fill(0);
   text("Psychology Majors", 150,460 );
 }
 
 //for professor titeling chemistry
   if(mouseX> xc1-wc1 && mouseX< xc1+wc1 && mouseY> yc1-hc1 && mouseY< yc1+hc1){
   textFont(f, 12);
   fill(0);
   text("Chemistry Professors", 250, 520);
 }
 //for major titeling chemistry
 else if(mouseX> xc-wc && mouseX< xc+wc && mouseY> yc-hc && mouseY< yc+hc){
   textFont(f, 12);
   fill(0);
   text("Chemistry Majors", 250, 450);
 }
 
  else if(mouseX>380-50 && mouseX<380+50 && mouseY>250-25 && mouseY<250+25){
   textFont(f, 12);
   fill(0);
   text("Whitman Campus", 330, 240); 
  }
 
 

//archiology
noStroke();
fill(#E5551C, myListener3.col);  
rect(100,533,50,24);

//psychology
noStroke();
fill(#250A62, myListener3.col);
rect(200,510,50,70);

//chemistry
noStroke();
fill(#EA2FD8, myListener3.col);  
rect(300,511,50,66);

//archiology
noStroke();
fill(#DE3361, 255-myListener3.col);
rect(100,543,50,3);  

//psychology
noStroke();
fill(#EDC02B, 255-myListener3.col);
rect(200,541,50,6);

//chemistry
noStroke();
fill(#3CEDE9, 255-myListener3.col);
rect(300,541,50,7);
}
}

class MyControlListener implements ControlListener {
  int col;
  public void controlEvent(ControlEvent theEvent) {
    println("i got an event from archiology, " +
            "changing background color to "+
            theEvent.getController().getValue());
    col = (int)theEvent.getController().getValue();
  }
}

void mousePressed(){
  if(mouseX>450 && mouseX<550 && mouseY>230 && mouseY<280){
    buttonSociology=!buttonSociology;
  }
  
  if(mouseX>210 && mouseX<310 && mouseY>210 && mouseY<260){
    buttonScience=!buttonScience;
  }
  
  if(mouseX>330 && mouseX<430 && mouseY>225 && mouseY<275){
    buttonAnkeny=!buttonAnkeny;
}
}




