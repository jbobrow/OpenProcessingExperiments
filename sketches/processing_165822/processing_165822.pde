
PImage img1,img2;
PImage[] buttons;
int selButton =0;

void setup(){
  size(640,640);
  img1 = loadImage("01.png");
  //img2 = loadImage("13.png");
  image(img1, -90,0,795,640);
  //image(img2, 550,568,56,30);
  buttons = new PImage[11];
  buttons[0] = loadImage("02.png");
  buttons[1] = loadImage("03.png");
  buttons[2] = loadImage("04.png");
  buttons[3] = loadImage("05.png");
  buttons[4] = loadImage("06.png");
  buttons[5] = loadImage("07.png");
  buttons[6] = loadImage("08.png");
  buttons[7] = loadImage("09.png");
  buttons[8] = loadImage("10.png");
  buttons[9] = loadImage("11.png");
  buttons[10] = loadImage("12.png");
  smooth();
  
}

void draw(){
  
  
  if (mousePressed){
    
    if(mouseY > 500){
      
      if (51 < mouseX && mouseX <103 && 550 < mouseY && mouseY < 604 ) selButton = 0;
      else if ( 118 < mouseX && mouseX < 170 && 550 < mouseY && mouseY < 604) selButton = 1;
      else if ( 185 < mouseX && mouseX < 237 && 550 < mouseY && mouseY < 604) selButton = 2;
      else if ( 252 < mouseX && mouseX < 304 && 550 < mouseY && mouseY < 604) selButton = 3;
      else if ( 319 < mouseX && mouseX < 371 && 550 < mouseY && mouseY < 604) selButton = 10;
      else if ( 386 < mouseX && mouseX < 438 && 550 < mouseY && mouseY < 604) selButton = 9;
      else if ( 453 < mouseX && mouseX < 505 && 550 < mouseY && mouseY < 604) selButton = 6;
      else if ( 520 < mouseX && mouseX < 572 && 550 < mouseY && mouseY < 604) selButton = 8;
      
    }else{
      image(buttons[selButton],mouseX-80,mouseY-80);
    }
  }
    noStroke();
    image(buttons[0],51,550);
    image(buttons[1],118,550);
    image(buttons[2],185,550);
    image(buttons[3],252,550);
    image(buttons[4],319,550);
    image(buttons[5],386,550);
    image(buttons[6],453,550);
    image(buttons[7],520,550);
    //image(buttons[8],485,550);
    
    //noFill();
    //stroke(120);
  }

void keyPressed() {
  // Press any key to save 
  PImage img = get(0, 0, width , height);
  img.save("drawing.png");
}


