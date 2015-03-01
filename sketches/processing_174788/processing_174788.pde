
PFont font_stencil; 

void setup()
{
  size(400, 500);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100);
  smooth();

  font_stencil = createFont("arialbd.ttf", 70, true);
}

void draw()

{
  background(0, 0, 100);

  if (mouseX<=305 && mouseX>=275 && mouseY<=210 && mouseY>=170 && mousePressed==true)
  {
    pushMatrix();
    fill(58, 91, 91);
    textSize(30);
    text("Fire", 210, 60);
    fill(0, 0, 0);
    popMatrix();
     pushMatrix();
    fill(36, 98, 99);
    textSize(50);
    text("Fire", 210, 90);
    fill(0, 0, 0);
    popMatrix();
    pushMatrix();
    fill(0, 94, 83);
    textSize(65);
    text("Fire", 205, 135);
    fill(0, 0, 0);
    popMatrix();
    textFont(font_stencil);
    textAlign(CENTER, CENTER);
    pushMatrix();
    translate(165, 285);
    rotate(radians(-90));
    text("FEUER", 0, 0);
    popMatrix();
    pushMatrix();
    fill(0, 0, 0);
    translate(225, 285);
    rotate(radians(-90));
    textSize(85);
    text("ZEUG", 0, 0);
    popMatrix();
    pushMatrix();
    translate(285, 185);
    textSize(50);
    text("O", 0, 0);
    popMatrix();
  } else
  {

    fill(0, 0, 0);
    textFont(font_stencil);
    textAlign(CENTER, CENTER);
    pushMatrix();
    translate(165, 285);
    rotate(radians(-90));
    text("FEUER", 0, 0);
    popMatrix();
    pushMatrix();
    fill(0, 0, 0);
    translate(225, 285);
    rotate(radians(-90));
    textSize(85);
    text("ZEUG", 0, 0);
    popMatrix();
    pushMatrix();
    translate(285, 185);
    textSize(50);
    text("O", 0, 0);
    popMatrix();
  }
}



