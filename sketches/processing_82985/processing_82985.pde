
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

  allDogMax=int(roundTo20(allDogMax));


  cp5 = new ControlP5(this);
  // create a DropdownList
  dogsList = cp5.addDropdownList("Dogs")
    .setPosition(margin*5, margin/2)
      ;
  for (int i=0; i<data.length; i++) {
    dogsList.addItem(dogs[i].breed, i);
  }
  customize(dogsList); // customize the first list
}

void draw() {
  background(#FFFFFF);
  smooth();




  //  fill(0);
  //  text(dogs[idx].breed, 20, 20);
  // get width by dividing by 2* num bars +1
  float barWidth = (width-2.0*margin)/11.0;
  float plotWidth = width-2.0*margin;
  float plotHeight = height-2.0*margin;
  float x = margin+barWidth;
  int img;

  println(plotWidth);
  println(plotHeight);
  image(dogs[idx].img, x-(margin/2), plotHeight/5, plotWidth, plotHeight); 

  text("type of attacks", plotWidth/1-(margin*1.5), plotHeight+(margin*1.5));

  pushMatrix();

  text("Number of incidents in 2011", margin, plotHeight/3);
  textAlign(CENTER, CENTER);
  popMatrix();

  text("pieces[0]",20, 20);
  /*for(int i=0; i<=plotHeight; i+=20){
   fill(220);
   rect(margin, margin, plotWidth, 10);
   } */

  stroke(0);
  strokeWeight(0.50);
  // box around plot area
  noFill();
  //rect(margin,margin,plotWidth,plotHeight);

  //axes
  line(margin, height-margin, width-margin, height-margin);
  line(margin, height-margin, margin, margin);

  textAlign(LEFT, BASELINE);

  fill(0);
  textFont(fairplex);
  textSize(30);

  text(" When dogs attacks", margin/2, margin/2);



  //BAR GRAPH
  textAlign(LEFT, BASELINE);
  noStroke();

  //println(plotHeight);

  textSize(15);
  fill(#FF5500); 
  float dataPoint=map(dogs[idx].attacks, 0, allDogMax, 0, plotHeight); 
  rect(x, margin+plotHeight-dataPoint, barWidth, dataPoint);
  fill(0);
  textSize(15);
  text("Attacks", x, margin+plotHeight+margin/5);
  textSize(20);
  if (dist(mouseX, mouseY, x, margin+plotHeight)<50) {
    fill(#FF0000);
    text(dogs[idx].attacks, x, plotHeight );
  }

  x=x+2*barWidth;

  fill(#FFF700);
  dataPoint=map(dogs[idx].children, 0, allDogMax, 0, plotHeight); 
  rect(x, margin+plotHeight-dataPoint, barWidth, dataPoint);
  fill(0);
  textSize(15);
  text("Children", x, margin+plotHeight+margin/5);
  textSize(20);
  if (dist(mouseX, mouseY, x, margin+plotHeight)<50) {
    fill(#FF0000);
    text(dogs[idx].children, x, plotHeight );
  } 

  x=x+2*barWidth;

  fill(#FF00DE);
  float dataPointThree=map(dogs[idx].adults, 0, allDogMax, 0, plotHeight);
  rect(x, margin+plotHeight-dataPointThree, barWidth, dataPointThree);
  fill(0);
  textSize(15);
  text("Adults", x, margin+plotHeight+margin/5);
  fill(0);
  textSize(20);
  if (dist(mouseX, mouseY, x, margin+plotHeight)<50) {
    fill(#FF0000);
    text(dogs[idx].adults, x, plotHeight );
  }


  x=x+2*barWidth;

  fill(#001BFF);
  float dataPointFour=map(dogs[idx].deaths, 0, allDogMax, 0, plotHeight);
  rect(x, margin+plotHeight-dataPointFour, barWidth, dataPointFour);
  fill(0);
  textSize(15);
  text("Deaths", x, margin+plotHeight+margin/5);
  textSize(20);

  if (dist(mouseX, mouseY, x, margin+plotHeight)<50) {
    fill(#FF0000);
    text(dogs[idx].deaths, x, plotHeight);
  }


  x=x+2*barWidth;

  fill(#001BFF);
  float dataPointFive=map(dogs[idx].maining, 0, allDogMax, 0, plotHeight);
  rect(x, margin+plotHeight-dataPointFive, barWidth, dataPointFive);
  fill(0);
  textSize(15);
  text("Maming", x, margin+plotHeight+margin/5);
  textSize(20);

  if (dist(mouseX, mouseY, x, margin+plotHeight+margin/5)<25) {
    fill(#FF0000);
    text(dogs[idx].maining, x, plotHeight );
  }

  // y axis annotation
  int tickInc = 20;
  for (int i=0; i<=allDogMax/tickInc; i++) {
    fill(100);
    textSize(13);
    textAlign(RIGHT, CENTER);
    text(i*tickInc, margin-4, (margin+plotHeight)-i*plotHeight/(tickInc+1));
    stroke(0);
    strokeWeight(1);
    line(margin, (margin+plotHeight)-i*plotHeight/(tickInc+1), margin+4, (margin+plotHeight)-i*plotHeight/(tickInc+1));
  }
}



float roundTo20(float n) {
  float r = n/20;
  r = ceil(r);
  return r*20;
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
    img = loadImage(breed +".png");
    // error handling
    if (img==null) {
      img = loadImage("genericdog.png");
    }
  }

  //methods
  //  void setImage(String file) {
  //    img = loadImage(file);
  //  }
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
  dogsList.setItemHeight(15);
  dogsList.setBarHeight(20);
  dogsList.setWidth(200);
  dogsList.captionLabel().set("Dogs");
  dogsList.captionLabel().style().marginTop = 3;
  dogsList.captionLabel().style().marginLeft = 3;
  dogsList.valueLabel().style().marginTop = 3;
  dogsList.scroll(0);
  dogsList.setColorBackground(color(#F50000));
  dogsList.setColorActive(color(23, 23, 23));
}

//for (int i=0;i<40;i++) {
//  dogsList.addItem("item "+i, i);
//}


