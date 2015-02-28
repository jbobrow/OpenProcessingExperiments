
//Good creep rate --> (.005*m) % height)

void setup() {
  size(500,700);
 
}

void draw() {
  int s = (second()*2);   // a time variable
  int m = millis();   // a milli variable
  float a;
  //a = mouseX + mouseY/10;
  //a = abs(mouseY - height) / 1.7;
  a = mouseX + (mouseY - height) / 15;
  float b;
  //b = mouseY + mouseX/10;
  //b = abs(mouseX - width) * 1.3;
  b = mouseY + (mouseX - width) / 15;
  
  float c;
  c = abs(mouseY*.7 - width);
  background(255, 204, 0);
  smooth();
  strokeWeight(3);   
  line(c,( (.005*m) % height), a , b );
  smooth();
  strokeWeight(5);   
  ellipse(c,( (.005*m) % height),7,7);
  smooth();
  strokeWeight(10*(70));   // Default
  fill(255);
  ellipse(a , b ,(abs(mouseY - 2*height) / 8) + ((.0009*m) % height),(abs(mouseX - 2*width) / 8) + ((.0009*m) % height));
  //smooth();
  //strokeWeight(1);
  //noFill();
  //ellipse(a , b ,(abs(mouseY - 2*height) / 8) + s*10,(abs(mouseX - 2*width) / 8) + s*10);
  
  
}


