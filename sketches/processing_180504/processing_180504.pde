
float counter = 0;
PFont font_fira;

void setup()
{
  size(500, 500);
  font_fira = createFont("FiraSans-Regular.ttf", 30, true);
}

void draw()
{

  if (mousePressed == true)
  {
    stroke(0);
    strokeWeight(2);
    translate(width/2, height/2);
    background(139, 100, 80);
    rectMode(CENTER);
    fill(0, 0, 139);
    rect(0, 0, 350, 350);
    textFont(font_fira);
    text("FensterFensterFenster", -150, -180);
    text("FensterFensterFenster", -150, 200);
    pushMatrix();
    rotate(1.56);
    text("FensterFensterFenster", -150, 205);
    text("FensterFensterFenster", -150, -185);
    popMatrix();

    textSize(20);
    fill(255);
    text("SCHNEE", -140, 130);
    textSize(40);
    text("MANN", -160, 170);

    for (int i=0; i<360; i+=40)
    {
      translate(-5,2);
      fill(255);
      noStroke();

      float amp = sin(millis()/500.0+i)*130;
      textFont(font_fira);
      textSize(15);
      text("Schnee", amp, -100+frameCount*2);
      text("Schnee", amp, -10+frameCount*2);
      text("Schnee", amp, -175+frameCount*2);


      if ( frameCount > 80)
      {
        frameCount = 0;
      }
    }
  } else
  {
    stroke(0);
    strokeWeight(2);
    translate(width/2, height/2);
    background(139, 100, 80);
    rectMode(CENTER);
    fill(0, 0, 139);
    rect(0, 0, 350, 350);
    textFont(font_fira);
    text("FensterFensterFenster", -150, -180);
    text("FensterFensterFenster", -150, 200);
    pushMatrix();
    rotate(1.56);
    text("FensterFensterFenster", -150, 205);
    text("FensterFensterFenster", -150, -185);
    popMatrix();

    textSize(20);
    fill(255);
    text("SCHNEE", -140, 130);
    textSize(40);
    text("MANN", -160, 170);
  }
}

