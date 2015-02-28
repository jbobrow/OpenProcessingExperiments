
void setup() {
  size(1085, 671);
  
}


void draw() {

PImage img;
img = loadImage("mordorgood.png");
image(img, 0, 0);

img = loadImage("frodogood.png");
image(img, 500, 100);

img = loadImage("ringgood.png");
image(img, mouseX, mouseY);

if (mouseX < 500 ) {
  if (mouseY > 100) {
    if(mouseX > 400) {
      if(mouseY < 200) {
    img = loadImage("bigsauron.png");
    image(img, 0, 0);
      }
    }
  }
} 

if (mouseX < 750 ) {
  if (mouseY > 250) {
    if(mouseX > 450) {
      if(mouseY < 500) {

img = loadImage("samgood.png");
image(img, 100, 150);

PFont font;
font = loadFont("Apple-Chancery-48.vlw"); 
textFont(font); 
String s = "Frodo!Nooo!";
text(s, 70, 250, 300, 100);
      }
    }
  }
}



if (mouseX < 875 ) {
  if (mouseY > 225) {
    if(mouseX > 775) {
      if(mouseY < 350) {
img = loadImage("saurongood.png");
image(img, 300, 100);
      }
    }
  }
}

if (mouseX < 750 ) {
  if (mouseY > 250) {
    if(mouseX > 450) {
      if(mouseY < 500) {
        if(mousePressed) {
img = loadImage("boilemgood.png");
image(img, 70, 100);
img = loadImage("mashemgood.png");
image(img, 70, 290);
img = loadImage("stewgood.png");
image(img, 70, 473);
        }
      }
    }
  }
}

if (mouseX < 650 ) {
  if (mouseY > 350) {
    if(mouseX > 575) {
      if(mouseY < 425) {
img = loadImage("ringvisiongood.png");
image(img, 0, 0);
      }
    }
  }
}

}







