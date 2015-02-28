
PImage bg;
PFont font;
float x = 33; // X-coordinate of text
float y = 60; // Y-coordinate of text

void setup() 
{
  size(580, 386);  
      bg = loadImage("cold.jpg"); // para poner una imagen de fondo
 font = loadFont("lp.vlw");// la fuente
  textFont(font);
  noStroke();
}

void draw() 
{

    background(bg); // llama el backgrownd de arriba
  fill(204, 120);
  rect(400, 400, width, height);
  fill(0);
  // If the cursor is over the text, change the position
  if ((mouseX >= x) && (mouseX <= x+200) &&
    (mouseY >= y-22) && (mouseY <= y)) {
    x += random(-15, 15);
    y += random(-5, 20);
    text("ahhhhhh", x, y);
    bg = loadImage("dos.jpg");
    loop();
  }
  else {
  text("shhhh", x, y); // si no esta el mouse sobre la palabra lo deja asi
  fill(0, 102, 153); // no c por que no funciona el fill :S

  }
}

