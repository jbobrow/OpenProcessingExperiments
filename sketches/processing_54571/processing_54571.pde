
void setup(){
size(1024,768);
background(252, 0, 133);
frameRate(200);
smooth();
}

void draw(){
  float f = 0.3333333;
   float durchmesser = random(100);
   fill(random(255),random(255),random(255), 70); //flache füllen - 70 dahinter - 70% deckkraft
   stroke(random(255),random(255),random(255), 50); //strichfarbe
   strokeWeight(random(10)); //strichdicke
   ellipse(mouseX, mouseY, durchmesser, durchmesser);

fill(0,0,255, 50); //flache füllen - 70 dahinter - 70% deckkraft
strokeWeight(2);
quad(mouseX, mouseY, 0, 0, 0, 0, 0, 5);
}





