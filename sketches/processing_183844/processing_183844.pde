
PImage Karte1;
PImage Karte2;
PImage Karte1_ohneBG;
PImage Karte2_ohneBG;
PFont font_fira;

void setup()
{
  size(500, 500);
  Karte1 = loadImage("Karte1.jpg");
  Karte2 = loadImage("Karte2.jpg");
  Karte1_ohneBG = loadImage("Karte1_ohneBG.png");
  Karte2_ohneBG = loadImage("Karte2_ohneBG.png");
  font_fira = createFont("FiraSans-Regular.ttf", 100, true);
}

void draw()
{
  background(0);

  if (mouseX<=590 && mouseX>=380 &&mouseY<=300 && mouseY>=200 && mousePressed == true)
  {
    tint(  0, 197, 205);
    image(Karte2, -170, -30);
    noTint();
    image(Karte2_ohneBG, -170, -30);
  } else
  {
    tint(  205, 0, 0); 
    image(Karte1, -160, -60);
    noTint();
    image(Karte1_ohneBG, -160, -60);

    fill(0);
    textFont(font_fira);
    textSize (30);
    text("KLICK", 400, 240);
    text("MICH", 400, 270);
    text("AN", 420, 300);
  }
}



