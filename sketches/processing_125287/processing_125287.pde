

//import audio library
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer audioSound;

//global variables
PImage backgroundClub;
PImage upperLights;
PImage neon;
PImage instructions;
boolean blinkerLights;
boolean blinkerUpperLights;
boolean blinkerNeon;
boolean clickLights = false;
boolean clickUpperLights = false;
boolean clickNeon = false;
boolean clickInstructions = true;
boolean clickAudio = false;
color[] palette = {#FF4A28, #F2A811, #D35C82, #8BBF46, #F7DB00, #21B1E8, #C248DE, #F7B407, #F74407, #C7F707, #1FCEC1};
 
void setup() {
  size(900,600);
    minim = new Minim(this);
    
  //Loading resources
  audioSound = minim.loadFile("audio.mp3");
  backgroundClub = loadImage("background.png");
  upperLights = loadImage("upperLights.png");
  neon = loadImage("neonlight.png");
  instructions = loadImage("instructions.png");
}

  //floor constants
  // I obtained this part of code from http://www.learningprocessing.com/examples/chapter-7/example-7-4/
  float distance(float x1, float y1, float x2, float y2) {
  color colorpalette;
  float distanceX = x1 - x2;
  float distanceY = y1 - y2;
  float d = sqrt(distanceX * distanceX + distanceY * distanceY );
  return d;
  }
  
void draw() {
  //background
  image(backgroundClub, 0, 0, 900, 600);
  
  //Play the sound
  if (clickAudio == true){
    audioSound.play();
  }

  //Pause the sound
  else if (clickAudio == false){
    audioSound.pause();
  }
  
  //timer
  if (frameCount % 20 == 0) { blinkerLights = !blinkerLights; }
  if (frameCount % 20 == 0) { blinkerUpperLights = !blinkerUpperLights; }
  if (frameCount % 20 == 0) { blinkerNeon = !blinkerNeon; }
  
  //turn on the lights
  if (clickLights == true){
    if (blinkerLights) {
      
      //left side
      //red light
      noStroke();
      fill(palette[0], 100);
      ellipse(25, 50, 30, 30);
      fill(palette[0], 180);
      ellipse(25, 50, 25, 25);
      fill(palette[0], 255);
      ellipse(25, 50, 20, 20);
    
      //orange light
      fill(palette[1], 100);
      ellipse(25, 100, 30, 30);
      fill(palette[1], 180);
      ellipse(25, 100, 25, 25);
      fill(palette[1], 255);
      ellipse(25, 100, 20, 20);
    
      //pink light
      fill(#D35C82, 100);
      ellipse(25, 150, 30, 30);
      fill(palette[2], 180);
      ellipse(25, 150, 25, 25);
      fill(palette[2], 255);
      ellipse(25, 150, 20, 20);
      
      //green light
      fill(palette[3], 100);
      ellipse(25, 200, 30, 30);
      fill(palette[3], 180);
      ellipse(25, 200, 25, 25);
      fill(palette[3], 255);
      ellipse(25, 200, 20, 20);
      
      //yellow light
      fill(palette[4], 100);
      ellipse(25, 250, 30, 30);
      fill(palette[4], 180);
      ellipse(25, 250, 25, 25);
      fill(palette[4], 255);
      ellipse(25, 250, 20, 20);
      
      //blue light
      fill(palette[5], 100);
      ellipse(25, 300, 30, 30);
      fill(palette[5], 180);
      ellipse(25, 300, 25, 25);
      fill(palette[5], 255);
      ellipse(25, 300, 20, 20);
        
      //purple light
      fill(palette[6], 100);
      ellipse(25, 350, 30, 30);
      fill(palette[6], 180);
      ellipse(25, 350, 25, 25);
      fill(palette[6], 255);
      ellipse(25, 350, 20, 20);
      
      //orange2 light
      fill(palette[7], 100);
      ellipse(25, 400, 30, 30);
      fill(palette[7], 180);
      ellipse(25, 400, 25, 25);
      fill(palette[7], 255);
      ellipse(25, 400, 20, 20);
         
      //red2 light
      fill(palette[8], 100);
      ellipse(25, 450, 30, 30);
      fill(palette[8], 180);
      ellipse(25, 450, 25, 25);
      fill(palette[8], 255);
      ellipse(25, 450, 20, 20);
      
      //yellow phos
      fill(palette[9], 100);
      ellipse(25, 500, 30, 30);
      fill(palette[9], 180);
      ellipse(25, 500, 25, 25);
      fill(palette[9], 255);
      ellipse(25, 500, 20, 20);
      
      //aqua light
      fill(palette[10], 100);
      ellipse(25, 550, 30, 30);
      fill(palette[10], 180);
      ellipse(25, 550, 25, 25);
      fill(palette[10], 255);
      ellipse(25, 550, 20, 20);
  
      
      //right side
      //red light
      noStroke();
      fill(palette[0], 100);
      ellipse(875, 50, 30, 30);
      fill(palette[0], 180);
      ellipse(875, 50, 25, 25);
      fill(palette[0], 255);
      ellipse(875, 50, 20, 20);
      
      //orange light
      fill(palette[1], 100);
      ellipse(875, 100, 30, 30);
      fill(palette[1], 180);
      ellipse(875, 100, 25, 25);
      fill(palette[1], 255);
      ellipse(875, 100, 20, 20);
      
      //pink light
      fill(palette[2], 100);
      ellipse(875, 150, 30, 30);
      fill(palette[2], 180);
      ellipse(875, 150, 25, 25);
      fill(palette[2], 255);
      ellipse(875, 150, 20, 20);
      
      //green light
      fill(palette[3], 100);
      ellipse(875, 200, 30, 30);
      fill(palette[3], 180);
      ellipse(875, 200, 25, 25);
      fill(palette[3], 255);
      ellipse(875, 200, 20, 20);
      
      //yeloww light
      fill(palette[4], 100);
      ellipse(875, 250, 30, 30);
      fill(palette[4], 180);
      ellipse(875, 250, 25, 25);
      fill(palette[4], 255);
      ellipse(875, 250, 20, 20);
      
      //blue light
      fill(palette[5], 100);
      ellipse(875, 300, 30, 30);
      fill(palette[5], 180);
      ellipse(875, 300, 25, 25);
      fill(palette[5], 255);
      ellipse(875, 300, 20, 20);
        
      //purple light
      fill(palette[6], 100);
      ellipse(875, 350, 30, 30);
      fill(palette[6], 180);
      ellipse(875, 350, 25, 25);
      fill(palette[6], 255);
      ellipse(875, 350, 20, 20);
      
      //orange2 light
      fill(palette[7], 100);
      ellipse(875, 400, 30, 30);
      fill(palette[7], 180);
      ellipse(875, 400, 25, 25);
      fill(palette[7], 255);
      ellipse(875, 400, 20, 20);
         
      //red2 light
      fill(palette[8], 100);
      ellipse(875, 450, 30, 30);
      fill(palette[8], 180);
      ellipse(875, 450, 25, 25);
      fill(palette[8], 255);
      ellipse(875, 450, 20, 20);
      
      //yellow phos
      fill(palette[9], 100);
      ellipse(875, 500, 30, 30);
      fill(palette[9], 180);
      ellipse(875, 500, 25, 25);
      fill(palette[9], 255);
      ellipse(875, 500, 20, 20);
      
      //aqua light
      fill(palette[10], 100);
      ellipse(875, 550, 30, 30);
      fill(palette[10], 180);
      ellipse(875, 550, 25, 25);
      fill(palette[10], 255);
      ellipse(875, 550, 20, 20);
    }
  }
   
  //turn off the lights    
  else if(clickLights == false){
    blinkerLights = false;
  }
  
  //turn on upper lights
  if (clickUpperLights == true ){
   if (blinkerUpperLights){
     image(upperLights, 105, 20, 696, 269);
     }
   }
  
   //turn off upper lights
   else if (clickUpperLights == false ){
   blinkerUpperLights = false;
   }
   
  //turn on neon
  if (clickNeon == true ){
   if (blinkerNeon){
     image(neon, 243, 193, 410, 210);
     }
   }
   
   //turn off neon
   else if (clickNeon == false ){
   blinkerNeon = false;
   }

   //floor lights
   //1 col
   fill(palette[0], distance(0, 0,mouseX,mouseY));                                   
   quad(190, 435, 275, 435, 245, 490, 145, 490);
   fill(palette[1], distance(10, 10,mouseX,mouseY));
   quad(145, 490, 245, 490, 215, 545, 100, 545);
   fill(palette[2], distance(20,20,mouseX,mouseY));
   quad(100, 545, 215, 545, 185, 600, 50, 600);
    
   //2 col
   fill(palette[3], distance(30,30, mouseX, mouseY));                                   
   quad(275, 435, 365, 435, 350, 490, 245, 490);
   fill(palette[4], distance(40,40, mouseX, mouseY));
   quad(245, 490, 350, 490, 335, 545, 215, 545);
   fill(palette[5], distance(50,50, mouseX, mouseY));
   quad(215, 545, 335, 545, 320, 600, 185, 600);
    
   //3 col
   fill(palette[6], distance(60, 60, mouseX, mouseY));                                   
   quad(365, 435, 450, 435, 450, 490, 350, 490);
   fill(palette[7], distance(60, 60, mouseX, mouseY));
   quad(350, 490, 450, 490, 450, 545, 335, 545);
   fill(palette[8], distance(70, 70, mouseX, mouseY));
   quad(335, 545, 450, 545, 450, 600, 320, 600);
    
   //4 col
   fill(palette[9], distance(80, 80, mouseX, mouseY));                                   
   quad(450, 435, 535, 435, 550, 490, 450, 490); 
   fill(palette[10], distance(90, 90, mouseX, mouseY));
   quad(450, 490, 550, 490, 565, 545, 450, 545);
   fill(palette[9], distance(100, 100, mouseX, mouseY));
   quad(450, 545, 565, 545, 580, 600, 450, 600);
    
   //5 col
   fill(palette[8], distance(110, 110, mouseX, mouseY));                                   
   quad(535, 435, 625, 435, 655, 490, 550, 490);
   fill(palette[7], distance(120, 120, mouseX, mouseY));
   quad(550, 490, 655, 490, 685, 545, 565, 545);
   fill(palette[6], distance(130, 130, mouseX, mouseY));
   quad(565, 545, 685, 545, 715, 600, 580, 600);
    
   //6 col
   fill(palette[5], distance(140, 40, mouseX, mouseY));                                   
   quad(625, 435, 710, 435, 755, 490, 655, 490);
   fill(palette[4], distance(140, 140, mouseX, mouseY));
   quad(655, 490, 755, 490, 800, 545, 685, 545); 
   fill(palette[3], distance(1450, 150 ,mouseX, mouseY));
   quad(685, 545, 800, 545, 850, 600, 715, 600);
   
   //show instructions
   if (clickInstructions == true){
     image(instructions, 323, 85, 254, 429);   
   }

}
void mouseClicked(){
  
  //show lights
  if (mouseX <=50 && clickLights == false && clickInstructions == false || mouseX >=850 && clickLights == false && clickInstructions == false){
   clickLights = true;
  }
  
  //hide lights
  else if (mouseX <=50 && clickLights == true || mouseX >=850 && clickLights == true){
    clickLights = false;
  }
  
  //show upper lights
  if (mouseX >50 && mouseX < 850 && mouseY <= 100 && clickUpperLights == false && clickInstructions == false){
   clickUpperLights = true;
  }
  
  //hide upper lights
  else if (mouseX >50 && mouseX < 850 && mouseY <= 100 && clickUpperLights == true){
    clickUpperLights = false;
  }
  
  //show neon
  if (mouseX >= 243 && mouseX <=653 && mouseY >= 193 && mouseY <= 403 && clickNeon == false && clickInstructions == false){
   clickNeon = true;
  }
  
  //hide neon
  else if (mouseX >= 243 && mouseX <=653 && mouseY >= 193 && mouseY <= 403 && clickNeon == true){
   clickNeon = false;
  }
  
  //show instructions
  if (mouseX >= 760 && mouseX <=830 && mouseY >= 220 && mouseY <= 380 && clickInstructions == false){
   clickInstructions = true;
  }
  
  //hide instructions
  else if (mouseX >= 323 && mouseX <=577 && mouseY >= 85 && mouseY <= 514 && clickInstructions == true){
   clickInstructions = false;
  }
  
  //play audio
  if (mouseX >= 60 && mouseX <= 150 && mouseY >= 270 && mouseY<= 390 && clickAudio == false && clickInstructions == false){
    clickAudio = true;
  }
  
  //pause audio
  else if (mouseX >= 60 && mouseX <= 150 && mouseY >= 270 && mouseY <= 390 && clickAudio == true){
    clickAudio = false;
  }
}  

