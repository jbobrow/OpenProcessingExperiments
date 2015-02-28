
PImage earthimg, hearingimg, humanbodyimg, livingthingsimg, materialthingsimg, mindimg, sightimg, spaceimg;
PImage map;

Button earth;
Button hearing;
Button humanbody;
Button livingthings;
Button materialthings;
Button mind;
Button sight;
Button space;

void setup() {
  size(500, 750);
  imageMode(CENTER);
  map = loadImage("map.jpg");//background image
  //frameRate (1);



  //img, mousex1, mousex2, mousey1, mousey2
  earth = new Button("earthimg.jpg", 144, 230, 460, 560  );
  hearing = new Button("hearingimg.jpg", 150, 230, 150, 230);
  humanbody = new Button("humanbodyimg.jpg", 160, 260, 330, 420);
  livingthings = new Button("livingthingsimg.jpg", 200, 250, 70, 130);
  materialthings = new Button("materialthingsimg.jpg", 230, 340, 400, 500);
  mind = new Button("mindimg.jpg", 144, 216, 240, 340  );
  sight = new Button("sightimg.jpg", 250, 350, 120, 200);
  space = new Button("spaceimg.jpg", 230, 350, 200, 330);
}

void draw() {

  image(map, 250, 375, 500, 750);
  earth.display();
  hearing.display();
  humanbody.display();
  livingthings.display();
  materialthings.display();
  mind.display();
  sight.display();
  space.display();
}


class Button {
  PImage myImg;
  float xPos, yPos, x, y, mousex1, mousex2, mousey1, mousey2;
  Button(String imgName, int _mousex1, int _mousex2, int _mousey1, int _mousey2) {
    myImg = loadImage(imgName);
    xPos = 250;
    yPos = 375;
    x = 500;
    y = 750;
    mousex1 = _mousex1;
    mousey1 = _mousey1; 
    mousex2 = _mousex2;
    mousey2 = _mousey2;
  }

  void display() {



    if (mouseX>mousex1 && mouseX<mousex2 && mouseY>mousey1 && mouseY<mousey2) {
      tint(255, 255);
      image(myImg, xPos, yPos, x, y);
    } 
    else {
      tint(255, 0);
      image(myImg, xPos, yPos, x, y);
    }
  }
}



