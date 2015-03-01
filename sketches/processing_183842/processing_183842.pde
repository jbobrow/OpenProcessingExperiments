
int i;

void setup() {
  size(500, 500);
  background(255);
}


void draw() {

  translate(width/2, height/2);
  textSize(50);
  rotate(radians(90));
  fill(#714D4D);
  text("Halterung", 0, 150);

  textSize(20);
  fill(#372FB4);
  text("Halterung", -100, 120);
  text("Halterung", -100, 150);
  textSize(10);
  rotate(radians(270));
  text("Halterung", -155, -105);

if (mouseButton == LEFT) {
  for (int i=0; i < 360; i+=20); 
  {  

    float a = sin(millis()/380.0+i)*10;
    float b = sin(millis()/320.0+i)*20;

    background(255);
    textSize(10);
    fill(#5AD5D8);
    
    text("SEIFEN", -140+frameCount*2, -80+b);
    text("BLASE", -140+frameCount*2, -70+b);
    
    text("SEIFEN", -90+frameCount*2, -60+a);
    text("BLASE", -90+frameCount*2, -50+a);

    if (frameCount > 250) {
      frameCount = 0;
    }

    pushMatrix();
    //translate(width/2,height/2);
    textSize(50);
    rotate(radians(90));
    fill(#714D4D);
    text("Halterung", 0, 150);

    textSize(20);
    fill(#372FB4);
    text("Halterung", -100, 120);
    text("Halterung", -100, 150);
    textSize(10);
    rotate(radians(270));
    text("Halterung", -155, -105);
    popMatrix();
  }
}
}

