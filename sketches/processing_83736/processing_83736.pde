
PImage lautsprecher;
PImage tisch;
PImage bett;

APunkt[]  myPunkte;  

ABox[]  myBoxen; 

ATable[] myTables;

ABed[] myBeds;


void setup() {
  size(320, 568);

  lautsprecher = loadImage("lautsprecher.png");
  tisch = loadImage("icontisch.png");
  bett = loadImage("iconbett.png");
  /// bett = loadImage("iconbett.png");
  myPunkte= new APunkt[1]; 
  myBoxen= new ABox[2]; 
  myTables= new ATable[1]; 
  myBeds= new ABed[1]; 
  for (int i= 0; i<myPunkte.length; i++) {
    myPunkte[i]= new APunkt();
  }
  for (int i= 0; i<myBoxen.length; i++) {
    myBoxen[i]= new ABox();
  }
  for (int i= 0; i<myTables.length; i++) {
    myTables[i]= new ATable();
  }
  for (int i= 0; i<myBeds.length; i++) {
    myBeds[i]= new ABed();
  }
  float off=50;
  myBoxen[0].pos.x=off;
  myBoxen[1].pos.x=width-off;

  myBoxen[0].pos.y=2*off;
  myBoxen[1].pos.y=2*off;
}

void draw() {
  background(100);
  stroke (150);
  fill(80);
  quad( 0, 0, width-1, 0, width-1, 40, 0, 40);  //Menue oben
  line(width/2, 0, width/2, 40);


  for (int i=0; i<myPunkte.length; i++) {
    myPunkte[i].render();
  }
  for (int i=0; i<myTables.length; i++) {
    myTables[i].render();
  }
  for (int i=0; i<myBoxen.length; i++) {
    myBoxen[i].ausrichten();
  }
  for (int i=0; i<myBoxen.length; i++) {
    myBoxen[i].render();
  }
  for (int i=0; i<myBeds.length; i++) {
    myBeds[i].render();
  }
}

class ABox {
  PVector pos;
  float rot;

  ABox() {   
    pos= new PVector(0, 0);
  }

  void render() {
    fill(140);
    stroke(0);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(radians(rot));
    imageMode(CENTER);
    //rectMode(CENTER);
    image(lautsprecher, 0, 0);
    //rect(0, 5, 1, 30);
    //rect(0, 0, 10, 20);
    popMatrix();
  }

  void ausrichten() {
    rot=degrees(atan2(myPunkte[0].pos.y-pos.y, myPunkte[0].pos.x-pos.x))-90;
  }
}

class APunkt {
  PVector pos;
  PVector pos2;
  float groesse;

  APunkt() {   
    groesse=random(39, 40);
    pos= new PVector(width/2, height/2);
    pos2= new PVector(width/4, height/4);
  }

  void render() {

    strokeWeight(3);
    stroke(255);
    fill(200);

    if (mousePressed && (mouseButton==RIGHT)) {
      quad(10, 50, mouseX, 50, mouseX, mouseY, 10, mouseY);
      ellipse(pos2.x,pos2.y, 10,10);
      pos2.x=mouseX;
      pos2.y=mouseY;
    }
    else {
      quad(10, 50, pos2.x, 50, pos2.x, pos2.y, 10, pos2.y);
      ellipse(pos2.x,pos2.y, 10,10);
    }

    strokeWeight(1);
    stroke(160, 4, 4);
    fill(230, 0, 0);
    if (mousePressed && (mouseButton==LEFT)) {
      ellipse(mouseX, mouseY, groesse, groesse);
      pos.x=mouseX;
      pos.y=mouseY;
    }
    else {
      ellipse(pos.x, pos.y, groesse, groesse);
    }
  }
}

class ABed {

  PVector pos;

  ABed() {   
    pos= new PVector(width/3, height/0.5);
  }

  void render() {
    //fill(140);
    //stroke(0);
   // pushMatrix();
    //translate(pos.x, pos.y);
    //rotate(radians(rot));
    imageMode(CENTER);
    image(bett,width-100, 400);
   
    //popMatrix();
  }

  //void ausrichten() {
  // rot=degrees(atan2(myPunkte[0].pos.y-pos.y, myPunkte[0].pos.x-pos.x))-90;
  //}
}
class ATable {

  PVector pos;

  ATable() {   
    pos= new PVector(width/3, height/0.5);
  }

  void render() {
    //fill(140);
    //stroke(0);
   // pushMatrix();
    //translate(pos.x, pos.y);
    //rotate(radians(rot));
    imageMode(CENTER);
    image(tisch,width/2, 100);
   
    //popMatrix();
  }

  //void ausrichten() {
  // rot=degrees(atan2(myPunkte[0].pos.y-pos.y, myPunkte[0].pos.x-pos.x))-90;
  //}
}



