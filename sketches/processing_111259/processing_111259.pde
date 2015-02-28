
char letter = 'a';
int xpos = 20;
int ypos = 300;
int textX = 20;
int textY = 100;

void setup() {
  size(400, 400);
  fill(0);
  textSize(26);

  for (int i = 0; i < 26; i++) {
    xpos+=20;
    text(letter++, xpos, ypos);

    if (xpos > width -100) {
      ypos+=30;
      xpos= 60;
    }
  }
}

void draw() {
  println(mouseX + " " + mouseY);
}
void mouseClicked() {
  //A button
  if (mouseY > 280 && mouseY < 300 && mouseX > 40 && mouseX < 55) {
    text('a', textX, textY);
    textX+= 20;
  }

  //B button
  if (mouseY > 280 && mouseY < 300 && mouseX > 55 && mouseX < 75) {
    text('b', textX, textY);
    textX+= 20;
  }

  //C button
  if (mouseY > 280 && mouseY < 300 && mouseX > 75 && mouseX < 95) {
    text('c', textX, textY);
    textX+= 20;
  }
  //D button
  if ( mouseY > 280 && mouseY < 300 && mouseX > 95 && mouseX < 115) {
    text('d', textX, textY);
    textX+= 20;
  }
  //E button
  if ( mouseY > 280 && mouseY < 300 && mouseX > 125 && mouseX < 135) {
    text('e', textX, textY);
    textX+= 20;
  }
  //F button
  if ( mouseY > 280 && mouseY < 300 && mouseX > 135 && mouseX < 155) {
    text('f', textX, textY);
    textX+= 20;
  }
  //G button
  if ( mouseY > 280 && mouseY < 300 && mouseX > 156 && mouseX < 175) {
    text('g', textX, textY);
    textX+= 20;
  }
  //h button
  if ( mouseY > 280 && mouseY < 300 && mouseX > 176 && mouseX < 197) {
    text('h', textX, textY);
    textX+= 20;
  }
  //i button
  if ( mouseY > 280 && mouseY < 300 && mouseX > 197 && mouseX < 215) {
    text('i', textX, textY);
    textX+= 20;
  }
  //j button
  if ( mouseY > 280 && mouseY < 300 && mouseX > 216 && mouseX < 231) {
    text('j', textX, textY);
    textX+= 20;
  }
  //k button
  if ( mouseY > 280 && mouseY < 300 && mouseX > 235 && mouseX < 258) {
    text('k', textX, textY);
    textX+= 20;
  }
  //l button
  if ( mouseY > 280 && mouseY < 300 && mouseX > 258 && mouseX < 275) {
    text('l', textX, textY);
    textX+= 20;
  }
  //m button
  if ( mouseY > 280 && mouseY < 300 && mouseX > 275 && mouseX < 301) {
    text('m', textX, textY);
    textX+= 20;
  }
  //n button
  if ( mouseY > 280 && mouseY < 300 && mouseX > 302 && mouseX < 318) {
    text('n', textX, textY);
    textX+= 20;
  }
  //o button
  if ( mouseY > 280 && mouseY < 300 && mouseX > 319 && mouseX < 341) {
    text('o', textX, textY);
    textX+= 20;
  }
  //p button
  if ( mouseY > 310 && mouseY < 341 && mouseX > 79 && mouseX < 98) {
    text('p', textX, textY);
    textX+= 20;
  }
  //q button
  if ( mouseY > 310 && mouseY < 341 && mouseX > 98 && mouseX < 117) {
    text('q', textX, textY);
    textX+= 20;
  }
  //r button
  if ( mouseY > 310 && mouseY < 341 && mouseX > 118 && mouseX < 133) {
    text('r', textX, textY);
    textX+= 20;
  }
  //s button
  if ( mouseY > 310 && mouseY < 341 && mouseX > 133 && mouseX < 156) {
    text('s', textX, textY);
    textX+= 20;
  }
  //t button
  if ( mouseY > 310 && mouseY < 341 && mouseX > 156 && mouseX < 175) {
    text('t', textX, textY);
    textX+= 20;
  }
  //u button
  if ( mouseY > 310 && mouseY < 341 && mouseX > 175 && mouseX < 196) {
    text('u', textX, textY);
    textX+= 20;
  }
  //v button
  if ( mouseY > 310 && mouseY < 341 && mouseX > 196 && mouseX < 219) {
    text('v', textX, textY);
    textX+= 20;
  }
  //w button
  if ( mouseY > 310 && mouseY < 341 && mouseX > 219 && mouseX < 241) {
    text('w', textX, textY);
    textX+= 20;
  }
  //x button
  if ( mouseY > 310 && mouseY < 341 && mouseX > 241 && mouseX < 257) {
    text('x', textX, textY);
    textX+= 20;
  }
  //y button
  if ( mouseY > 310 && mouseY < 341 && mouseX > 257 && mouseX < 276) {
    text('y', textX, textY);
    textX+= 20;
  }
  //z button
  if ( mouseY > 310 && mouseY < 341 && mouseX > 276 && mouseX < 300) {
    text('z', textX, textY);
    textX+= 20;
  }

  //println(mouseX + " " + mouseY);
  if (textX > width - 40) {
    textY += 40;
    textX = 20;
  }
  println(textY);
  println(textX);
}



