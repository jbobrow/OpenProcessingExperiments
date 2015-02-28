

int [] xwaarden = new int[10];
int [] ywaarden = new int[10];
int sliderValue = 100;

float r = 0; 
float g = 0; 
float b = 0;

import controlP5.*;

ControlP5 controlP5;

int myColorBackground = color(0,0,0);

RadioButton q;

void setup(){
 size(600,600);
 smooth();
 
 controlP5 = new ControlP5(this);
  q = controlP5.addRadioButton("radioButton",20,160);
  q.setColorForeground(color(#2d26b4));
  q.setColorActive(color(#161261));
  q.setColorLabel(color(255));
  q.setItemsPerRow(5);
  q.setSpacingColumn(50);

  addToRadioButton(q,"1",1);
  addToRadioButton(q,"2",2);
  addToRadioButton(q,"3",3);
  addToRadioButton(q,"4",4);
  addToRadioButton(q,"5",5);
  
  
 for(int i=0;i<10;i++)
 { xwaarden[i] = 100*int(random(0,10));
   ywaarden[i] = int(random(0,height));
 } 
 
 frameRate(30);
  controlP5 = new ControlP5(this);

  controlP5.addSlider("sliderValue",0,255,128,100,200,10,100);
  
  // tab global is a tab that lies on top of any other tab and
  // is always visible

  
  controlP5.controller("sliderValue").moveTo("extra");
  controlP5.tab("extra").setColorForeground(0xffff0000);
  controlP5.tab("extra").setColorBackground(0xff330000);
  
  controlP5.trigger();
  
  // in case you want to receive a controlEvent when
  // a  tab is clicked, use activeEvent(true)
  controlP5.tab("extra").activateEvent(true);
  controlP5.tab("extra").setId(2);
  
  controlP5.tab("default").activateEvent(true);
  // to rename the label of a tab, use setLabe("..."),
  // the name of the tab will remain as given when initialized.
  controlP5.tab("default").setLabel("close");
  controlP5.tab("default").setId(1);
 
}

void addToRadioButton(RadioButton theRadioButton, String theName, int theValue ) {
  Toggle t = theRadioButton.addItem(theName,theValue);
  t.captionLabel().setColorBackground(color(#21bdbb));
  t.captionLabel().style().movePadding(2,0,-1,2);
  t.captionLabel().style().moveMargin(-2,0,0,-3);
  t.captionLabel().style().backgroundWidth = 46;
}

void draw()
{ background(myColorBackground);
  noStroke();
    fill(sliderValue);
  rect(0,0,width,100);

  //head 
   fill(#996633); 
  //ellipseMode(CENTER); 
  ellipse(mouseX,mouseY,100,100); 
  //ears
  ellipse(mouseX-30,mouseY-55,50,50); 
  ellipse(mouseX+30,mouseY-55,50,50); 
  //body 
  ellipse(mouseX,mouseY+100,120,150); 
  //feet
  ellipse(mouseX+30,mouseY+180,60,60); 
  ellipse(mouseX-30,mouseY+180,60,60); 
  //hands
  ellipse(mouseX-55,mouseY+65,50,50); 
  ellipse(mouseX+55,mouseY+65,50,50); 
  //white fill ears
  fill(255); 
  ellipse(mouseX-30,mouseY-55,30,30); 
  ellipse(mouseX+30,mouseY-55,30,30);
  //white fill body
  ellipse(mouseX,mouseY+100,70,110); 
  // eyes
  fill(0); 
  ellipse(mouseX-10,mouseY-10,10,10); 
  ellipse(mouseX+10,mouseY-10,10,10);
  //mouth
  rect(mouseX, mouseY+15,20,1); 
  
  
  for(int i=0;i<10;i++)
  {rondjes(xwaarden[i],ywaarden[i]);
  }
}

void rondjes(int x, int y)
  {fill(r,g,b); 
   ellipse(x, y, 50, 50);
}

void mousePressed() { 
    r = random(255); 
    g = random(255); 
    b = random(255); 
}



void controlEvent(ControlEvent theEvent) {
  print("got an event from "+theEvent.group().name()+"\t");
  for(int i=0;i<theEvent.group().arrayValue().length;i++) {
    print(int(theEvent.group().arrayValue()[i]));
    

  }
  println("\t "+theEvent.group().value());
  myColorBackground = color(int(theEvent.group().value()*30),100,100);
}

void slider(int theColor) {
  myColorBackground = color(theColor);
  println("a slider event. setting background to "+theColor);
}



