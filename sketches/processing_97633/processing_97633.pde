
PImage pic1;
PImage pic2;
PImage pic3;
PImage pic4;
Boolean inverted=false;
int blur = 0;

void setup() {
  frameRate(15);
  pic1 = loadImage("tulpe.jpg");
  pic2 = loadImage("lilie.jpg");
  pic3 = loadImage("rose.jpg");
  pic4 = loadImage("orchide.jpg");
  size(600, 600);

  background(255);
  image(pic1, 50, 50);
  image(pic2, 300, 50);
  image(pic3, 50, 300);
  image(pic4, 300, 300);
}

void draw() {
  if(frameCount == 2){
  image(pic1, 50, 50);
  image(pic2, 300, 50);
  image(pic3, 50, 300);
  image(pic4, 300, 300);
  }  
  //println("X: " + mouseX + " Y: " + mouseY);


  if (mouseX > 300 && mouseX < 550) {
    if (mouseY > 300 && mouseY < 550) {
      pushStyle();
      noStroke();
      fill(255);
      rect(300, 300, 250, 250);
      //println("bot-right");
      imageMode(CORNERS);
      image(pic4, 300, 300, mouseX, mouseY);
      popStyle();
    }
    else {
      image(pic4, 300, 300);
    }
  }
  else {
    image(pic4, 300, 300);
  }


  if (mouseX > 50 && mouseX < 300) {
    if (mouseY > 50 && mouseY < 300) {
      if(pic1.get(mouseX, mouseY) == -16777216){
        pic1 = loadImage("tulpe.jpg");
      } 
      //println(pic1.get(mouseX, mouseY));
      pushStyle();
      tint(pic1.get(mouseX, mouseY));
      image(pic1, 50, 50);
      popStyle();
    }
    else {
      image(pic1, 50, 50);
    }
  }
  else {
    image(pic1, 50, 50);
  }
  //background(255);
  //fill(0,200,0);
  //rect(25,25,550,550,10);
  //image(pic1,50,50);
  //image(pic2,300,50);
  //image(pic3,50,300);
  //image(pic4,300,300);
}

void mouseClicked() {
  //println("Clicked");
  if (mouseX > 50 && mouseX < 300) {
    if (mouseY > 50 && mouseY < 300) {
      pic1 = loadImage("tulpe.jpg");
     println("top-left");
      pushStyle();
      tint(pic1.get(mouseX, mouseY));
      println(pic1.get(mouseX, mouseY));
      image(pic1, 50, 50);
      popStyle();
      //println(pic1.get(mouseX,mouseY));
    }
    else if (mouseY > 300 && mouseY < 550) {
      if (inverted) {
       // println("bot-left");
        image(pic3, 50, 300);
        inverted = false;
      }
      else {
        filter(INVERT);
        image(pic3, 50, 300);
        filter(INVERT);
        inverted = true;
      }
    }
  }

  if (mouseX > 300 && mouseX < 550) {
    if (mouseY > 50 && mouseY < 300) {
      background(255);
      image(pic2, 300, 50);
      filter(BLUR, blur);
      //println("top-right");
      if (blur < 8) {
        blur += 1;
      }
      else {
        blur = 0;
      }
      image(pic1, 50, 50);
      image(pic3, 50, 300);
      image(pic4, 300, 300);
    }
    /*
    else if (mouseY > 300 && mouseY < 550) {
     if (inverted) {
     println("bot-right");
     image(pic3, 50, 300);
     inverted = false;
     }
     else {
     filter(INVERT);
     image(pic3, 50, 300);
     filter(INVERT);
     inverted = true;
     }
     }
     */
  }
}



