
PImage tomato;
PFont AgencyFB;
PFont gill;
float posX;
float posY;
float w;
float h;

void setup() {
  size(400, 400);
  background(255);
  smooth();
  tomato=loadImage("tomato.jpg");
  imageMode(CENTER);
  posX=width/2;
  posY=height/3;
  w=width/3;
  h=height/4;
 

  fill(0);

  //initial text of "vegetable" and "fruit"
  textSize(20);
  gill=loadFont("GillSansMT-48.vlw");
  textAlign(CENTER);
  text("Vegetable", width/4, height/4*3);
  text("Fruit", width/4*3, height/4*3);
  text("Drag the Picture to Sort It.", width/2, height/6);
}

void draw() {
//when press the picture with the mouse, the picture will stick to the mouse.
  if (mousePressed && mouseX>=posX-w/2 && mouseX<=posX+w/2 && mouseY>=posY-h/2 && mouseY<=posY+h/2) {
    background(255);
    line(0, height/3*2, width, height/3*2);
    line(width/2, height/3*2, width/2, height);
    posX=mouseX;
    posY=mouseY;
    image(tomato, posX, posY, w, h);
  }

//when put the picture to the left blank, correct.
  if (posX<width/2 && posY>height/3*2 && mousePressed==false) {
    AgencyFB=loadFont("AgencyFB-Bold-60.vlw");
    textFont(AgencyFB);
    textAlign(CENTER);
    text("Good Job!", width/2, height/2);
  }
  
//when put the picture to the right blank, wrong.
  else if (posX>width/2 && posY>height/3*2 && mousePressed==false) {
    AgencyFB=loadFont("AgencyFB-Bold-60.vlw");
    textFont(AgencyFB);
    textAlign(CENTER);
    text("Wrong!", width/2, height/2);
  }
  else {
  }
   image(tomato, posX, posY, w, h);
     line(0, height/3*2, width, height/3*2);
  line(width/2, height/3*2, width/2, height);
}

