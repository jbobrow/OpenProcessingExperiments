
String message = "snowing";
float x, y; 
float hr, vr;  
 
void setup() {
  size(200, 800);
  smooth();
  background(0);


  textAlign(CENTER, CENTER);
  hr = textWidth(message) / 5;
  vr = (textAscent() + textDescent()) /1;
  noStroke();
   
  x = 4500;
  y = 4500;
   
}
 
void draw() {
  
   
   
  fill(255);

     
  text("s", random(x), y);
  text("n", random(x+3), random(y));
  text("o", random(x+2), random(y));
  text("w", random(x+18), random(y));
  text("i", random(x+4), random(y));
  text("n", random(x+3), random(y));
  text("g", random(x+2), random(y));

 }




