
// Image taken from = http://chirpingames.com/page/4/ //

PImage myImage;
int posx;
int posy;

void setup(){
size (575, 423);
color (50);
}



void draw(){
   smooth();
  background(255);
  noStroke();
 
//background

  myImage = loadImage("bg.png");
      image(myImage, 0, -869+423);
      
  myImage = loadImage("ground.png");
      image(myImage, 0, 423-135);
          
 /*//mouse duck
  
  posx=mouseX-(mouseX);
  posy=mouseY-(mouseY);
  
  if(mousePressed == true) {
  
      myImage = loadImage("bg.png");
      image(myImage, 0, -300);  
      
      myImage = loadImage("ground.png");
      image(myImage, 0, 423-135);
    
  }
  */
  //mouse track eyes
 
 posx=mouseX-(mouseX);
 posy=mouseY-(mouseY);
 
 fill(44, 126, 200);
 noStroke();
 ellipse(235+mouseX/25,97+mouseY/18, 30,30);
 ellipse(287+mouseX/22,100+mouseY/18, 30,30);
  
 fill(0);
 noStroke();
 ellipse(233+mouseX/20,95+mouseY/16, 20,20);
 ellipse(285+mouseX/18,98+mouseY/16, 20,20);
  
 if(mousePressed == true) {
  
      myImage = loadImage("bg.png");
      image(myImage, 0, -300);  
      
      myImage = loadImage("ground.png");
      image(myImage, 0, 423-135);
      
      fill(44, 126, 200);
      
  //Eyes Blue
   noStroke();
 //Left
   ellipse(234+mouseX/25,341-97+mouseY/18, 30,30);
 //Right
   ellipse(289+mouseX/22,344-100+mouseY/18, 30,30);
  
  //Eyes Black
  
   fill(0);
   noStroke();
  //Left
   ellipse(229+mouseX/17,347-105+mouseY/16, 20,20);
  //Right
   ellipse(286+mouseX/17,345-103+mouseY/16, 20,20);
    
  }
  
}

