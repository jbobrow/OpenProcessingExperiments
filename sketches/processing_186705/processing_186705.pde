
import processing.serial.*;

float valeurArduino = 0; // valeur envoyé par le capteur Arduino

Serial myPort;

void setup() {
  // création d'une fenêtre de 400×400 pixels
  size(400, 400);
  
  // initialisation du port série pour communiquer avec Arduino
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');
}

void draw() {
  // set the background color with the color values:
  background(valeurArduino);
}

void serialEvent(Serial myPort) {
  // récupérer la valeur envoyée par Arduino
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // supprimer les potentiels espaces et stocker la valeur
    // reçue dans la variable valeurArduino
    valeurArduino = float(trim(inString));
    valeurArduino = map(valeurArduino, 0, 1023, 0, 255);
  }
}

