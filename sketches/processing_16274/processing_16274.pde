
boolean mouseReleased = false;



PFont font;
PImage card1;

int card=0;

void setup(){
  size (480, 320);
//  ellipseMode(CENTER);
  
 noStroke();
 smooth();
 font = loadFont("Rockwell-48.vlw");
 textFont(font);
 
 card1 = loadImage("RocketshipDoom.png");
 
}
 
 /*
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      v= -10;
    }
    if (keyCode == DOWN) {
      v = +10;
    }
    if (keyCode == LEFT){
      t =-20;
    }
    if (keyCode == RIGHT){
      t= +20;
    }
  }
} 

*/
  
void draw(){
  //menu

background(0);

    
 if (card == 0) {
   image (card1, 0, 0);
    fill(255);
    textFont(font, 24);
    text("Click to start...", 300, 310);
    if (mousePressed) {
        card = 1;
    }
}
else if(card == 1) {

  
  
  background(0);
  
  float m=millis();

  
float r = random (-400, 400);

//sun location
float sunLocX=50+r;
float sunLocY=50;
float sunRadius=10+m/100;

//moonlocation
float moonLocX=430+r;
float moonLocY = 50;
float moonRadius=10+m/100;

//shiplocation
float shipLocX;
float shipLocY;
float shipWidth = 10;
float shipHeight=30;

noCursor();

//  m=millis();
  
//  float r = random (-400, 400);
 
 //sun 
  noStroke();
  fill(255, 235, 0);
  ellipse (50+r, 50, sunRadius*2.0, sunRadius*2.0);

  //moon
  fill(230);
  ellipse (230+r, 50, moonRadius*2.0, moonRadius*2.0);

  
  shipLocX = mouseX;
  shipLocY = mouseY;
  
    strokeWeight(5);
         stroke (130);
    line (shipLocX-10, shipLocY+30,  shipLocX, shipLocY);
    line  (shipLocX+10, shipLocY+30, shipLocX, shipLocY);
    
    



    if (mousePressed) {
      float d = dist(mouseX, mouseY, 50+r, 50);
      if (d < 10+m/100) {
      card = 2;
      }
    }
    if(mousePressed) {
      float d = dist(mouseX, mouseY, 430+r, 50);
      if (d < 10+m/100) {
        card = 3;
       }
      
      else{
       stroke (130);
      }
  

 
  

  //}
    
}

if (card ==2){
    background (0, 40, 86);
 //   cursor();
                textFont (font, 24);
        fill(255);
        text ("You landed in the sun!", 50, 250);
        text ("Click To Restart",50, 380);
        if (mousePressed) {
        card = 1;
    }
}
if (card ==3){
  
     background (0, 40, 86);
  //   cursor();
     fill(255);
                textFont (font, 24);
        fill(255);
        text ("You landed safely on the moon!", 50, 250);
        text ("Click To Restart",50, 380);
        if (mousePressed) {
        card = 1;
    }
}
  


 /* 
  line (230+t, 280+v, 240+t, 250+v);
    line (250+t, 280+v, 240+t, 250+v);
    */

}


  mouseReleased = false;
}
 
void mouseReleased() {
mouseReleased = true;
}


