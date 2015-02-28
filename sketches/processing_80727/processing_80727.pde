
//Working Title: Bitten 
//Discription: The infographic will take the useres through various visualizations that will allow them to view the data through various comparative views. 
//Technical problems: Being able to graph and inturpert the data in various ways.

import controlP5.*;

PFont fairplex;
int margin = 100;
int allDogMax = 0;

Dog [] dogs;
int idx = 0;



ControlP5 cp5;

DropdownList dogsList;

void setup() {
  size(800, 650);
  smooth();
  
  fairplex=loadFont("FairplexWideBold-48.vlw");

  String[] data=loadStrings("dog_bite.csv");

  dogs = new Dog[data.length];

  for (int i=0; i<data.length; i++) {
    dogs[i]=new Dog(data[i]);
    if ( dogs[i].dMax>allDogMax) {
      allDogMax = dogs[i].dMax;
    }
  }


  cp5 = new ControlP5(this);
  // create a DropdownList
  dogsList = cp5.addDropdownList("Dogs")
    .setPosition(margin, margin)
      ;
  for (int i=0; i<data.length; i++) {
    dogsList.addItem(dogs[i].breed, i);
  }
}

void draw() {
  background(#FFFFFF);


  //  fill(0);
  //  text(dogs[idx].breed, 20, 20);
  // get width by dividing by 2* num bars +1
  float barWidth = (width-2.0*margin)/11.0;
  float plotWidth = width-2.0*margin;
  float plotHeight = height-2.0*margin;
  float x = margin+barWidth;

  stroke(0);
  strokeWeight(0.50);
  // box around plot area
  noFill();
  //rect(margin,margin,plotWidth,plotHeight);

  //axes
  line(margin, height-margin, width-margin, height-margin);
  line(margin, height-margin, margin, margin);

  
  textFont(fairplex);
    textSize(40);

  text("Dog Attacks", x+margin, margin/2);



  //BAR GRAPH

  noStroke();

  textSize(10);
  fill(#FF5500); 
  float dataPoint=map(dogs[idx].attacks, 0, allDogMax, 0, plotHeight); 
  rect(x, margin+plotHeight-dataPoint, barWidth, dataPoint);
  text("Attacks", x, margin+plotHeight+margin/5);
  fill(0);
  if (dist(mouseX, mouseY, x, margin+plotHeight+margin/5)<25) {
    text(dogs[idx].attacks, x, plotHeight );
  }

  x=x+2*barWidth;

  fill(#FF0000);
  dataPoint=map(dogs[idx].children, 0, allDogMax, 0, plotHeight); 
  rect(x, margin+plotHeight-dataPoint, barWidth, dataPoint);
  text("Children", x, margin+plotHeight+margin/5);
  fill(0);
  if (dist(mouseX, mouseY, x, margin+plotHeight+margin/5)<25) {
    text(dogs[idx].children, x, plotHeight );
  } 

  x=x+2*barWidth;

  fill(#FF00DE);
  float dataPointThree=map(dogs[idx].adults, 0, allDogMax, 0, plotHeight);
  rect(x, margin+plotHeight-dataPointThree, barWidth, dataPointThree);
  text("Adults", x, margin+plotHeight+margin/5);
  fill(0);
  if (dist(mouseX, mouseY, x, margin+plotHeight+margin/5)<25) {
    text(dogs[idx].adults, x, plotHeight );
  }


  x=x+2*barWidth;

  fill(#001BFF);
  float dataPointFour=map(dogs[idx].deaths, 0, allDogMax, 0, plotHeight);
  rect(x, margin+plotHeight-dataPointFour, barWidth, dataPointFour);
  text("Deaths", x, margin+plotHeight+margin/5);
  fill(0);
  if (dist(mouseX, mouseY, x, margin+plotHeight+margin/5)<25) {
    text(dogs[idx].deaths, x, plotHeight );
  }


  x=x+2*barWidth;

  fill(#001BFF);
  float dataPointFive=map(dogs[idx].maining, 0, allDogMax, 0, plotHeight);
  rect(x, margin+plotHeight-dataPointFive, barWidth, dataPointFive);
  text("Maming", x, margin+plotHeight+margin/5);
  fill(0);
  if (dist(mouseX, mouseY, x, margin+plotHeight+margin/5)<25) {
    text(dogs[idx].maining, x, plotHeight );
  }
}


class Dog {
  //fields
  String breed;
  int attacks;
  int children;
  int adults;
  int deaths;
  int maining; 
  int dMax=0;
  PImage img;

  //constructor
  Dog(String data) {
    String [] pieces=split(data, ",");
    breed = pieces[0];
    attacks= (int)parseFloat(pieces[1]);
    if (attacks>dMax) {
      dMax = attacks;
    }
    children= (int)parseFloat(pieces[2]);
    if (children>dMax) {
      dMax = children;
    }
    adults= (int)parseFloat(pieces[3]);
    if (adults>dMax) {
      dMax = adults;
    }
    deaths= (int)parseFloat(pieces[4]);
    if (deaths>dMax) {
      dMax = deaths;
    }

    maining=(int)parseFloat(pieces[5]);
    if (maining>dMax) {
      dMax= maining;
    }
  }

  //methods
  void setImage(String file) {
    img = loadImage(file);
  }
}

/*void keyPressed() {
 idx++;
 if (idx>=dogs.length) {
 idx = 0;
 }
 }*/

void controlEvent(ControlEvent theEvent) {
  // DropdownList is of type ControlGroup.
  // A controlEvent will be triggered from inside the ControlGroup class.
  // therefore you need to check the originator of the Event with
  // if (theEvent.isGroup())
  // to avoid an error message thrown by controlP5.

  if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
    idx = int(theEvent.getGroup().getValue());
  }
}

void customize(DropdownList dogsList) {
  // a convenience function to customize a DropdownList
  dogsList.setBackgroundColor(color(#F50000));
  dogsList.setItemHeight(20);
  dogsList.setBarHeight(15);
  dogsList.captionLabel().set("Dogs");
  dogsList.captionLabel().style().marginTop = 3;
  dogsList.captionLabel().style().marginLeft = 3;
  dogsList.valueLabel().style().marginTop = 3;
  for (int i=0;i<40;i++) {
    dogsList.addItem("item "+i, i);
  }
  //ddl.scroll(0);
  dogsList.setColorBackground(color(#F50000));
  dogsList.setColorActive(color(255, 0));
}


