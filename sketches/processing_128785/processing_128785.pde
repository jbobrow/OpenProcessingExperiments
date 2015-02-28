
import gifAnimation.*;
PImage[] animation;
PImage bg;
PImage paper;
Gif loopingGif;
Gif nonLoopingGif;
boolean overLeftButton = false;
boolean overRightButton = false;
//PImage cursor;

void setup() {
  
  size(500, 500);
  bg=loadImage("-background.png");
  background(255);
  println("gifAnimation " + Gif.version());
  // create the GifAnimation object for playback
  loopingGif = new Gif(this, "ball.gif");
  loopingGif.loop();
   nonLoopingGif = new Gif(this, "ball.gif");
  nonLoopingGif.play();
  nonLoopingGif.ignoreRepeat();
  // create the PImage array for the interactive display
  animation = Gif.getPImages(this, "ball.gif");
  
//cursor=loadImage("cursor.png");
 //image(cursor,mouseX,mouseY);
  
  noFill();
  noStroke();
  image(bg, 0, 0);
  
}

void draw() {
  image(loopingGif, 10, height / 2 - loopingGif.height / 2);
  
  //SETTO IL COLORE Nero
  if(mouseX>0 && mouseX<42 && mouseY>0 &&mouseY<105){
    fill(0,0,0);
    stroke(0,0,0);
    strokeWeight(10);
     }

  //SETTO IL COLORE Arancione(?)
  if(mouseX>42 && mouseX<84 && mouseY>0 && mouseY<105){
    fill(255,72,21);
    stroke(255,72,21);
    strokeWeight(10);
     }
  
  //SETTO IL COLORE rosa
  if(mouseX>84 && mouseX<126 && mouseY>0 &&mouseY<105){
    fill(227,122,104);
    stroke(227,122,104);
    strokeWeight(10);
     }
  //SETTO IL COLORE viola
  if(mouseX>126 && mouseX<168 && mouseY>0 &&mouseY<105){
    fill(126,47,101);
    stroke(126,47,101);
    strokeWeight(10);
     }
      //SETTO IL COLORE magenta
  if(mouseX>168 && mouseX<210 && mouseY>0 &&mouseY<105){
    fill(199,54,93);
    stroke(199,54,93);
    strokeWeight(10);
     }
     
      //SETTO IL COLORE rosso#1
  if(mouseX>210 && mouseX<252 && mouseY>0 &&mouseY<105){
    fill(216,59,64);
    stroke(216,59,64);
    strokeWeight(10);
     }
     
     //SETTO IL COLORE arancione1#1
  if(mouseX>252 && mouseX<294 && mouseY>0 &&mouseY<105){
    fill(251,118,46);
    stroke(251,118,46);
    strokeWeight(10);
     }
     
     //SETTO IL COLORE giallo
  if(mouseX>294 && mouseX<336 && mouseY>0 &&mouseY<105){
    fill(255,208,0);
    stroke(255,208,0);
    strokeWeight(10);
     }
     
     //SETTO IL COLORE verde
  if(mouseX>336 && mouseX<378 && mouseY>0 &&mouseY<105){
    fill(134,167,77);
    stroke(134,167,77);
    strokeWeight(10);
     }
     
          //SETTO IL COLORE verde scuro
  if(mouseX>378 && mouseX<420 && mouseY>0 &&mouseY<105){
    fill(41,92,70);
    stroke(41,92,70);
    strokeWeight(10);
     }
     
           //SETTO IL COLORE verde celeste
  if(mouseX>420 && mouseX<442 && mouseY>0 &&mouseY<105){
    fill(65,152,255);
    stroke(65,152,255);
    strokeWeight(10);
     }
     
             //SETTO IL COLORE verde blu
  if(mouseX>442 && mouseX<500 && mouseY>0 &&mouseY<105){
    fill(35,71,198);
    stroke(35,71,198);
    strokeWeight(10);
     }
     
     //SETTO LA GOMMA
     if(mouseX>420 && mouseX<500 && mouseY>470 &&mouseY<500){
    fill(0,0,0);
    stroke(255,255,255);
    strokeWeight(50);
     }
     
    //imageMode(CENTER);
     //noCursor();
     //image(cursor,mouseX,mouseY);
     frameRate(100);
    if (mouseButton == RIGHT) {
     strokeWeight(random(40));
        stroke(random(255), random(255), random(255));
        line(mouseX, mouseY,pmouseX,pmouseY);
        if (keyPressed) {
          if (key == '1') {
            strokeWeight(50);
          }
        }
    }


  
  

 
     
  //DISEGNO SOLO SE FACCIO CLICK SUL MOUSE E LA POSIZIONE DEL MOUSE E' FUORI DAI PULSANTI
  if (mousePressed && mouseY>108 && mouseY<400) {
    line(mouseX, mouseY,pmouseX,pmouseY);
    
   
    }
}
void keyPressed() {
   if (keyCode == 65) { //a = paper
     paper=loadImage("paper.png");
     image(paper, 0, 0);
  
 } else {
  
  if (keyCode == 67) { //c = clear
   background(255);
    bg=loadImage("-background.png");
     image(bg, 0, 0);
  
   
     }
    }
}
void mousePressed() {
if (mouseX>250 && mouseX<400 && mouseY>400 &&mouseY<500) { 
    link("https://www.facebook.com/delacroixart");
}
}

