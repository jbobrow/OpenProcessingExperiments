
PImage img1;
PImage img2;
PImage img3;
PImage plus;
PImage minus;
PImage pfeil;


noteSheet[]  mySheets;  
int seite=0;


float y = 20;
float speed = 0;
boolean lauf=false;

void setup() {
  // Images must be in the "data" directory to load correctly
  size (600, 862);

  mySheets= new noteSheet[3];
  for (int i= 0; i<mySheets.length; i++) {
    mySheets[i]= new noteSheet();
    String s=i+".jpg";
    mySheets[i].seite=loadImage(s);
  }


  img1 = loadImage("blatt_vertikal6.jpg");
  image(img1, 0, 0, width, height);

  img2 = loadImage("verlauf9.png");
  image(img2, 0, y+300, width, height);

  img3 = loadImage("verlauf15.png");
  image(img3, 0, y-500, width, height);
  
  plus = loadImage("knopf4.jpg");
  
  minus = loadImage("minus.jpg");
  
  pfeil = loadImage("pfeil1.jpg");

  
}

void draw() {
  tint(255);
  image(mySheets[seite].seite, 0, 0, width, height);
  y += speed; 
  if (y>height-100) {
    if (seite<mySheets.length-1) {
      seite++;
    }else{
      seite=0;
    }
    y=0;
  }
  tint(255,230);
  image(img2, 0, y-900, width, height);
  image(img3, 0, y, width, height);
  if (lauf==true) {
    speed = 3;
  }
  else {
    speed=0;
  }

  stroke(#FF1717);
  if (mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  
  
  noStroke();
  tint(255,150);
  image(minus, width-45, 5);
  image(plus, width-95, 5);
  image(pfeil, width-155, 5);
   
  
}


void mousePressed() { 
  if (lauf==false) {
    lauf=true;
  }
  else {
    lauf=false;
  }
}


class noteSheet {
  PImage seite;
  noteSheet() {
  }
}

// fill(0,99);
//noStroke();
//rect(0, y-650, 800, 700);
//rect(0, y+300, 800, 700);



