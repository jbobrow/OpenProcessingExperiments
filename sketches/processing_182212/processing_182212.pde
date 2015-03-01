
/////////////////////// Arduino
// Conception :
//Construire un circuit Arduino avec une résistance variable connecté à l'entrée A0 et Calibrer le map. Ici j'ai utilisé un cordon conducteur en maille.
// Usage :
// Une fois que le circuit est construit, lancer le code arduino. Ensuite, lancer Processing avec le code processing. Faite varier la résistance et amusez vous.
//void setup() {
  
  //Serial.begin(9600);
//}

//void loop() {
  
  //int sensor = analogRead(A0);
  //int output = map(sensor, 1, 1000, 300, 50);
  //Serial.write(output);
  //delay(50);

//}
/////////////////////// Processing
import processing.serial.*;

Serial myPort ;
PImage logo;
int bgsize = 0;
int Y_AXIS = 1;

int X_AXIS = 2;
PFont font;
void setup() {
  colorMode(RGB, 255);
  logo = loadImage("logo.png");
 size(800,800);
  color b1 = color(255,255,100);

  color b2 = color(100,255,255);

  setGradient(0, 0, width, height, b1, b2, Y_AXIS);

myPort = new Serial(this, Serial.list()[0],9600);

}
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ){

  // calculate differences between color components 

  float deltaR = red(c2)-red(c1);

  float deltaG = green(c2)-green(c1);

  float deltaB = blue(c2)-blue(c1);



  // choose axis

  if(axis == Y_AXIS){

    /*nested for loops set pixels

     in a basic table structure */

    // column

    for (int i=x; i<=(x+w); i++){

      // row

      for (int j = y; j<=(y+h); j++){

        color c = color(

        (red(c1)+(j-y)*(deltaR/h)),

        (green(c1)+(j-y)*(deltaG/h)),

        (blue(c1)+(j-y)*(deltaB/h)) 

          );

        set(i, j, c);

      }

    }  

  }  

  else if(axis == X_AXIS){

    // column 

    for (int i=y; i<=(y+h); i++){

      // row

      for (int j = x; j<=(x+w); j++){

        color c = color(

        (red(c1)+(j-x)*(deltaR/h)),

        (green(c1)+(j-x)*(deltaG/h)),

        (blue(c1)+(j-x)*(deltaB/h)) 

          );

        set(j, i, c);

      }

    }  

  }

}
void draw(){
  

  
if (myPort.available() > 0) {
  bgsize = myPort.read();
  println(bgsize);
 
}


imageMode(CENTER);

  image(logo, random(1000), random(1000), bgsize*2-100, bgsize*2-100);
  if (mousePressed){
    color b1 = color(255,255,100);

  color b2 = color(100,255,255);
     setGradient(0, 0, width, height, b1, b2, Y_AXIS);
     
font = loadFont("HelveticaLTStd-Bold-48.vlw");
textFont(font, 75);
fill(255,0,255);

text("PASSION ZEBRE", 100, 250);

     
  }

}



