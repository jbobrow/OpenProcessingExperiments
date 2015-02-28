
String[]  mensajes;
float posx;
int indice;

void setup()
{
  
  size (500,356);
  
  mensajes = loadStrings("chapulin.txt");



posx=0;
indice=0;

}
void draw()
{
 background(255, 233, 0);
 loadPixels();  

translate (180,80,10);
// Loop through every pixel
for (int i = 0; i < pixels.length; i++) {
  // Pick a random number, 0 to 255
  float rand = random(180,255);
  // Create a grayscale color based on random number
  color c = color(rand);
  // Set pixel at that location to random color
  pixels[i] = c;
}
// When we are finished dealing with pixels
updatePixels(); 
pushMatrix();

 translate (105,170);

  image (loadImage ("url.png"),0,0);
  
 popMatrix();


fill (2,3,0,220);
noStroke ();
rect(0,0, width,140);

PFont f= loadFont("Nadeem-28.vlw");

textFont(f,40);
fill(255,255,255,180);
text("Chapulin Colorado",20,60);

fill(255,255,255,120);
text(mensajes [indice], posx,120);

posx=posx-5;

if (posx < 0- textWidth( mensajes[indice]))
{
 
  indice =indice +1;
  if (indice >=mensajes.length)
  {
    indice=0;
   
  }

 posx=width;
}
}


