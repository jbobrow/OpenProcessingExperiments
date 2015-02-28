
PImage man1a;
PImage man1b;
PImage woman1a;
PImage woman1b;
PImage man2a;
PImage man2b;
PImage woman2a;
PImage woman2b;

void setup () {
  size (1250, 495);
  background (255);
  
  man1a = loadImage ("man_1a.jpg");
  man1b = loadImage ("man_1b.jpg");
  woman1a = loadImage ("woman_1a.jpg");
  woman1b = loadImage ("woman_1b.jpg");
  man2a = loadImage ("man_2a.jpg");
  man2b = loadImage ("man_2b.jpg");
  woman2a = loadImage ("woman_2a.jpg");
  woman2b = loadImage ("woman_2b.jpg"); 
  
  image (man1a, 0, 50); 
  image (woman1a, 300, 50);
  image (man2a, 600, 50);
  image (woman2a, 900, 50);
}

void draw () {
  
}

void mousePressed () {
  if ((mouseX >=0) && (mouseX<=300) && (mouseY>=100) && (mouseY<=495)) {
    image (man1b, 0, 50);   
  }
  else if ((mouseX >=300) && (mouseX<=600) && (mouseY>=100) && (mouseY<=495)) {
    image (woman1b, 300, 50);   
  }
  else if ((mouseX >=600) && (mouseX<=900) && (mouseY>=100) && (mouseY<=495)) {
    image (man2b, 600, 50);   
  }
  else if ((mouseX >=900) && (mouseX<=1200) && (mouseY>=100) && (mouseY<=495)) {
    image (woman2b, 900, 50);   
  }
}

void mouseReleased() {
  if ((mouseX >=0) && (mouseX<=300) && (mouseY>=100) && (mouseY<=495)) {
    image (man1a, 0, 50);   
  }
  else if ((mouseX >=300) && (mouseX<=600) && (mouseY>=100) && (mouseY<=495)) {
    image (woman1a, 300, 50);   
  }
  else if ((mouseX >=600) && (mouseX<=900) && (mouseY>=100) && (mouseY<=495)) {
    image (man2a, 600, 50);   
  }
  else if ((mouseX >=900) && (mouseX<=1200) && (mouseY>=100) && (mouseY<=495)) {
    image (woman2a, 900, 50);   
  }
}















