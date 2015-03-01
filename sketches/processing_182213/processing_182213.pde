
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


void setup() {
  colorMode(RGB, 255);
  logo = loadImage("logo.png");
 size(550,300);
  
//println("available serial ports:");
//println(Serial.list());
myPort = new Serial(this, Serial.list()[0],9600);
}

void draw(){
  
if (myPort.available() > 0) {
  bgsize = myPort.read();
  println(bgsize);
 
}
//size(logo.width*bgcolor,logo.height*bgcolor);
//rect(0,0,width,height);

background(100,255,255);
fill(255,bgsize,40);

noStroke();
ellipse(bgsize+180,100,bgsize-50,bgsize-50);

//float logo = map(bgsize,0 ,255, 255,0); //faire la mÃªme chose mais avec int //
imageMode(CORNER);
  image(logo, 40, 60, bgsize+200, 200);


}




