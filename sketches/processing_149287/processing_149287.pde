
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

int x=150;
PImage nyan;
PImage rainbow;
PImage toaster;
PImage keyboard;

PFont fontPortrait;
int y=150;
int yy=y+127;

int tx=80;
int numtoaster=10;
boolean pt = true;
boolean play = false;
boolean story = false;
boolean controls = false;


float ty=random(0,400);
//Creamos la matriz de posiciones con el número de elementos que queremos mostrar:
float[] posicionesX = new float[numtoaster];
float[] posicionesY = new float[numtoaster];
//Y lo mismo para las velocidades en X e Y:
float[] velocidadesX = new float[numtoaster];

Minim minim;//creem un objecte de so
AudioPlayer daSound;//creem un player
AudioOutput out;//creem un output

void setup() {
  size(800, 400);
    frameRate(30);
  
  background(0, 68, 120); // sets nyan cat blue bg!
  noFill();
  stroke(0);
  smooth();
  frameRate(40); // too fast and it flies in a browser, too slow is choppy
  
  nyan = loadImage("Nyan.png");
  rainbow = loadImage("Rainbow.png");
  toaster = loadImage("Toaster.png"); 
  keyboard = loadImage("keyboard.png");

  fontPortrait = loadFont("Helvetica-48.vlw");
  minim = new Minim(this);//instanciem l'objecte de so
  daSound = minim.loadFile("Nyansong.mp3");//carreguem l'mp3
    out = minim.getLineOut(Minim.STEREO, 2048);//instanciem l'out      

      daSound.cue(0);
    daSound.play();
 for (int i=0; i<numtoaster; i++) {
    posicionesX[i]=random(width-20, width*2);
    posicionesY[i]=random (height);
    velocidadesX[i]=random(-7,-3);


             // if(posicionesY[i]<=y&&posicionesX[i]<=50&&posicionesY[i]>=y+127) {
               if(94>posicionesX[i]&&y<posicionesY[i]) {
               if (0<posicionesX[i]&&y+79>posicionesY[i]) {
                 fill(0);
        image(rainbow,125,100,135,55);
        image(rainbow,125,200,135,55);
        image(rainbow,125,300,135,55);
        textSize(30);
        text("Play",130,136);
        text("Story",130,236);
        text("Controls",130,338);
        textSize(40);
        fill(250);
        text("Nyan cat",130,50);
       
               play=false;  
               pt=true;

               }
               }
  
}
} // end setup()

  void draw() {
  
  
//PRESENTACIO  
  if(pt){
        background(0, 68, 120);
        fill(0);
        image(rainbow,0,100,270,55);
        image(rainbow,0,200,270,55);
        image(rainbow,0,300,270,55);
        textSize(30);
        text("Play",130,136);
        text("Story",130,236);
        text("Controls",130,338);
        textSize(40);
        fill(250);
        text("Nyan cat",130,50);
       
  }
        if(pt==true&&mouseX>124&&mouseX<261&&mouseY>99&&mouseY<156&&mousePressed){
            pt=false;  
            play = true;
            story = false;
            controls = false;
        }else if(true&&mouseX>124&&mouseX<261&&mouseY>99&&mouseY<156){
          image(nyan,220,100);
        }

        if(pt==true&&mouseX>124&&mouseX<261&&mouseY>199&&mouseY<256&&mousePressed){
            pt = true;
            play = false;
            story = true;
            controls = false;
        }else if(true&&mouseX>124&&mouseX<261&&mouseY>199&&mouseY<256){
          image(nyan,220,200);
        }
         if(pt==true&&mouseX>124&&mouseX<261&&mouseY>299&mouseY<356&&mousePressed){
            pt = true;
            play = false;
            story = false;
            controls = true;
        }else if(true&&mouseX>124&&mouseX<261&&mouseY>299&&mouseY<356){
          image(nyan,220,300);
        }          
        


//STORY
        if(story==true){
        background(0, 68, 120);
        image(rainbow,0,100,270,55);
        image(rainbow,0,200,270,55);
        image(rainbow,0,300,270,55);
        textSize(30);
        stroke(0);
        fill(0);
        text("Play",130,136);
        fill(150);
        text("Story",130,236);
        fill(0);
        text("Controls",130,338);
        textSize(40);
        fill(250);
        text("Nyan cat",130,50);
           textSize(15);
           fill(13,13,13);
           text("Nyan Cat, also known as Pop Tart Cat, is an 8-bit animation",320,110);
           text("depicting a cat with the body of a cherry pop tart flying",320,130);
           text("through outer space. While absurd themes like flying kittens",320,150);
           text("and pastry cats have been around for some time, the surreal" ,320,170);
           text("humor behind this particular combination has captivated" ,320,190);
           text("YouTubers and online art communities, spawning fan",320,210);
           text("illustrationsas well as user-interface designs and homebrew",320,230);
           text("games across multiple platforms.",320,250);
              if(true&&mouseX>124&&mouseX<261&&mouseY>99&&mouseY<156){
          image(nyan,220,100);
        } 
        if(true&&mouseX>124&&mouseX<261&&mouseY>199&&mouseY<256){
          image(nyan,220,200);
          }
          if(true&&mouseX>124&&mouseX<261&&mouseY>300&&mouseY<356){
          image(nyan,220,300);
        } 
         
        }
        
//CONTROL
     if(controls==true){
        background(0, 68, 120);
        image(rainbow,0,100,270,55);
        image(rainbow,0,200,270,55);
        image(rainbow,0,300,270,55);
        textSize(30);
        stroke(0);
        fill(0);
        text("Play",130,136);
        text("Story",130,236);
        fill(150);
        text("Controls",130,338);
        textSize(40);
        fill(250);
        text("Nyan cat",130,50);
        image(keyboard,300,50,450,300);
        if(true&&mouseX>124&&mouseX<261&&mouseY>99&&mouseY<156){
          image(nyan,220,100);
        } 
        if(true&&mouseX>124&&mouseX<261&&mouseY>199&&mouseY<256){
          image(nyan,220,200);
        }  
        if(true&&mouseX>124&&mouseX<261&&mouseY>300&&mouseY<356){
          image(nyan,220,300);
        }
     } 
            
       
//PLAY
       if(play==true){
                        background(0, 68, 120);
                        for (int z=0;z<30;z++) { // draws random stars of random sizes
                        float zx=random(800);
                        float zy=random(800);
                        float diameter=random(10);
                         int m = millis();
//                        int(zx); // have to convert floats to ints for grid coords
//                        int(zy);
//                        int(diameter);
                        ellipse(zx, zy, diameter, diameter);
                        textFont(fontPortrait, 20);
                        fill(255);
                        text("Puntuació:", 400, 50);
                        image (rainbow,-10,y,100,55);
                        image (nyan,50,y);
              }
              //INICIO BUCLE
              
                       
              for (int i = 0; i<numtoaster; i++) {
                        //Restablecer las posiciones
                         posicionesX[i] += random(-7,-3);
                         image(toaster,posicionesX[i],posicionesY[i]);
              }

  }
             
       
              
       
                
  
                 //Inicio del bucle
              for (int i = 0; i<numtoaster; i++) {
                //Restablecer las posiciones
                posicionesX[i] += velocidadesX[i];
                image(toaster,posicionesX[i],posicionesY[i]);

             // if(posicionesY[i]<=y&&posicionesX[i]<=50&&posicionesY[i]>=y+127) {
               if(94>posicionesX[i]&&y<posicionesY[i]) {
               if (0<posicionesX[i]&&y+127<posicionesY[i]) {
               
               play=false;  
               pt=true;

               }
               }
                //Establecemos los límites de la ventana
                //posY:
                
                if (x<0)
                {
                  x = 0;
                }
                if (x>width-55)
                {
                  x = width-55;
                }
                if (y<=10)
                {
                  y = 10;
                }
                if (y>=height-65)
                {
                  y = height-65;
                }
              }
              
              
  
            

              if (key == CODED) {
                if (keyCode == UP) {
                  y=y-10;

                } else if (keyCode == DOWN) {
                  y=y+10;
                } 
                }
       }



//Tanquem les coses de so de java  S´HA DE FER SI O SI s´executa quan acaba el programa
void stop(){
// the AudioPlayer you got from Minim.loadFile()
daSound.close();
// the AudioInput you got from Minim.getLineIn()
minim.stop();
super.stop();
}




