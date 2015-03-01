
PImage[] buttons;
PImage[] img;
int selButton =0;
 
void setup(){
  size(680,800);
  background(#4253ce);
  
  noFill();
  stroke(#ffffff);
  strokeWeight(7);
  rect(30, 30, 620, 600);



  buttons = new PImage[5];
  buttons[0] = loadImage("piece.png");
  buttons[1] = loadImage("beer.png");
  buttons[2] = loadImage("hamburger.png");
  buttons[3] = loadImage("planet.png");
  buttons[4] = loadImage("pingpong.png");

  img = new PImage[1];
  img[0] = loadImage("back.jpg");
  
  image(img[0],0,0);
  
  
  smooth();
   
}
 
void draw(){
   
  if (mousePressed){
     
    if(mouseY >660){
       
      if (30 < mouseX && mouseX <130 && 680 < mouseY && mouseY < 780 ) selButton = 0;
      else if ( 150 < mouseX && mouseX < 250 && 680 < mouseY && mouseY < 780) selButton = 1;
      else if ( 280 < mouseX && mouseX < 380 && 680 < mouseY && mouseY < 780) selButton = 2;
      else if ( 415 < mouseX && mouseX < 515 && 680 < mouseY && mouseY < 780) selButton = 3;
      else if ( 545 < mouseX && mouseX < 645 && 680 < mouseY && mouseY < 780) selButton = 4;
       
    }else{
      image(buttons[selButton],mouseX-50,mouseY-50);
    }
  }
    noStroke();
    fill(#ffffff);
    rect(0, 660, width, 140);

    image(buttons[0],30,680);
    image(buttons[1],150,680);
    image(buttons[2],280,680);
    image(buttons[3],415,680);
    image(buttons[4],545,680);

    
    
    
    noFill();
    stroke(#fcfc0d);
    strokeWeight(6);
      if (selButton == 0) rect(30, 680, 100, 100);
  else if (selButton == 1) rect(150, 680, 100, 100);
  else if (selButton == 2) rect(280, 680, 100, 100);
  else if (selButton == 3) rect(415, 680, 100, 100);
  else if (selButton == 4) rect(545, 680, 100, 100);
  }
 
void keyPressed() {
  // Press any key to save
  PImage img = get(0, 0, width , height);
  img.save("drawing.png");
}


