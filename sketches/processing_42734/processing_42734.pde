
PImage dog;
import processing.serial.*;
float lo0, hi0;
float lo1, hi1;

Serial myPort;
int arduinoInput = 0;
int trimPot = 0;
int light = 0;

void setup() {
size (500, 500);
println(Serial.list());
lo0 = 0;
hi0 =1023;
lo1 = 190;
hi1 = 950;
dog=loadImage ("Dog Diapers AP536F1 Female Pet Diapers Ice Cream Treats.png");

myPort = new Serial (this, Serial.list()[0], 9600);
myPort.bufferUntil('\n');
}

void serialEvent (Serial myPort) {
String inString = myPort.readStringUntil('\n');

if (inString != null) {
inString = trim(inString);
int[] pot = int(split(inString, ","));
//arduinoInput = int(inString);
if (pot.length>=2) {
trimPot = pot[0];
light = pot[1];
}
}
}

void draw() {
smooth();
noStroke();
fill (0);
float fly = map (trimPot, lo0, hi0, 0, height);
background (255);

image(dog, (fly/128)+32, fly);
image(dog, (fly/64)+30, fly);
image(dog, (fly/32)+28, fly);
image(dog, (fly/16)+25, fly);
image(dog, (fly/8)+20, fly);
image(dog, (fly/4)+15, fly);
image(dog, (fly/2)+10, fly);

image (dog, fly, fly);
}

