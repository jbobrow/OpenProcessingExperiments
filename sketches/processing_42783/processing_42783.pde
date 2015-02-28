
class crazyItalian { 

  PImage imageA;
  PImage imageB;

  String imageAFileName;
  String imageBFileName;

  int xPos;
  int yPos;

  boolean imageState = true;  //true will mean showing A, false = image B

  // constructor - same name as the class
  crazyItalian(String imageAFileName_, String imageBFileName_, int x_, int y_) {

    imageAFileName = imageAFileName_;
    imageBFileName = imageBFileName_;

    xPos = x_;
    yPos = y_;

    imageA = loadImage (imageAFileName);
    imageB = loadImage (imageBFileName);

    image (imageA, xPos, yPos);
  }

  // methods
  void changeImage() {

    //first, flip imageState!
    imageState = !imageState; 

    if (imageState == true) {  //A or B?
      image(imageA, xPos, yPos);
    } 
    else {
      image(imageB, xPos, yPos);
    }
  }
}

crazyItalian man1;
crazyItalian man2;
crazyItalian woman1;
crazyItalian woman2;

int position = 0; // refers to arrow keys

void setup () {
  size (1250, 495);
  background (255);

  man1 = new crazyItalian("man_1a.jpg", "man_1b.jpg", 0, 50);
  man2 = new crazyItalian("man_2a.jpg", "man_2b.jpg", 300, 50);
  woman1 = new crazyItalian("woman_1a.jpg", "woman_1b.jpg", 600, 50);
  woman2 = new crazyItalian("woman_2a.jpg", "woman_2b.jpg", 900, 50);
}

void draw () {
  //still empty!
}

void keyPressed () {
  if (key==CODED) {
    if (keyCode==RIGHT) {
      position++; 
    }
    else if (keyCode==LEFT) {
      position--;
    }
    
  if (position <= 0) {
     position = 4; 
  }
  else if (position >=5) {
    position = 1;
  }
  } 
  //do something about it, pass the current position in
  evaluatePosition(position); //i'm putting it in it's own function for clarity
} //end keyPressed

void evaluatePosition(int currPos) {
  switch (currPos) { //GREAT use for switch and case

  case 1:
    man1.changeImage();
    break;

  case 2:
    man2.changeImage();
    break;
    
  case 3:
    woman1.changeImage();
    break;
    
    case 4:
    woman2.changeImage();
    break;
    
  }
  println(currPos);
}

//leaving this as 'legacy code' haha
void mousePressed() {
  if ((mouseX >=0) && (mouseX<=300) && (mouseY>=100) && (mouseY<=495)) {
    man1.changeImage();
  }
  else if ((mouseX >=300) && (mouseX<=600) && (mouseY>=100) && (mouseY<=495)) {
    man2.changeImage();
  }
  else if ((mouseX >=600) && (mouseX<=900) && (mouseY>=100) && (mouseY<=495)) {
    woman1.changeImage();
  }
  else if ((mouseX >=900) && (mouseX<=1200) && (mouseY>=100) && (mouseY<=495)) {
    woman2.changeImage();
  }
}



