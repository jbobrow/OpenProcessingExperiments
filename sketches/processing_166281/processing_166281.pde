
PImage[]buttons;
PImage img;
int selButton = 0;

void setup() {
  size(800, 600);


  img =  loadImage("pot.png");

  buttons= new PImage[7];
  buttons [0] = loadImage("_finger.png"); 
  buttons [1] = loadImage("worm.png"); 
  buttons [2] = loadImage("hair.png"); 
  buttons [3] = loadImage("skull.png"); 
  buttons [4] = loadImage("eye.png"); 
  buttons [5] = loadImage("poison.png"); 
  buttons [6] = loadImage("cricket.png"); 
  //buttons [7] = loadImage("newpot.png"); 


  background(50);

  smooth();

  image(img, 180, 80, 438, 438);
}

void draw() {


  if (mousePressed) {

    // if(mouseX >200 && mouseX <638 && mouseY >30 && mouseY<468 ){
    if (mouseX<200) {

      if (50 < mouseX && mouseX < 177 && 20 < mouseY && mouseY < 129)  selButton = 0;
      else if (30 < mouseX && mouseX < 124 && 160 < mouseY && mouseY < 266)  selButton = 1;
      else if (10 < mouseX && mouseX <136 && 290<mouseY && mouseY < 407) selButton =2;
      else if (30<mouseX&&mouseX<164 && 450<mouseY && mouseY<564) selButton=3;
      else if (610<mouseX&&mouseX<721 && 20<mouseY && mouseY<149) selButton=4;
      else if (670<mouseX&&mouseX<770&&160<mouseY&&mouseY<289)selButton=5;
      else if (580<mouseX&&mouseX<779&&450<mouseY&&mouseY<580)selButton=6;
      //  else if(580<mouseX&&mouseX<779&&450<mouseY&&mouseY<580)selButton=7;
    } else {
      image(buttons[selButton], mouseX-50, mouseY-50);
    }
  }


  noStroke();
  fill(50);
  image(buttons[0], 50, 20);
  image(buttons[1], 30, 160);
  image(buttons[2], 10, 290);
  image(buttons[3], 30, 450);
  image(buttons[4], 610, 20);
  image(buttons[5], 670, 160);
  image(buttons[6], 580, 450);
  //  image(buttons[7],650,290);
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(180, 80, 438, 438);
  img.save("drawing.png");
}



