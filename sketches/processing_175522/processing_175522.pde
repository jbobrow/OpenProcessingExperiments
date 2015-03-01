
PFont font_jessi1;
PFont font_jessi2;

void setup()
{
  size(600, 400);
  smooth();
  background(216, 246, 255);
  font_jessi1 = createFont("FiraSans-Regular.ttf", 20, true);
  font_jessi2 = createFont("FiraSans-Regular.ttf", 15, true);
}

void draw()
{

  textAlign(CENTER, CENTER);

  for (int i=0; i <360; i+=20)
  {
    float ver = sin(millis()/350.0+i)*2;
    float amp = sin(millis()/350.0+i)*10;
    int pos = mouseX+50;

    background(216, 246, 255);

    pushMatrix();
    noStroke();
    fill(144, 205, 237);
    
    textFont(font_jessi1);
    text("BLUB", 150+amp*1.5, 600-frameCount*2.2);
    text("BLUB", 250+amp, 650-frameCount*1.7);
    text("BLUB", 350-amp, 500-frameCount*2);
    text("BLUB", 450-amp*2, 750-frameCount*1.9);

    textFont(font_jessi2);
    text("BLUB", 150+amp*1.5, 585-frameCount*2.2);
    text("BLUB", 150+amp*1.5, 615-frameCount*2.2);

    text("BLUB", 250+amp, 635-frameCount*1.7);
    text("BLUB", 250+amp, 665-frameCount*1.7);

    text("BLUB", 350-amp, 485-frameCount*2);
    text("BLUB", 350-amp, 515-frameCount*2);

    text("BLUB", 450-amp*2, 735-frameCount*1.9);
    text("BLUB", 450-amp*2, 765-frameCount*1.9);
    popMatrix();

    if ( frameCount > 450)
    {
      frameCount = 0;
    }

    for ( int a=0; a < 700; a +=200)
    {
      fill(227, 218, 188);
      noStroke();
      ellipse(a, 400, 200, 100);
    }

    for ( int b=0; b < 700; b +=200)
    {
      fill(227, 218, 188);
      noStroke();
      ellipse(b+100, 400, 200, 110);
    }
      
      pushMatrix();
      fill(134, 134, 134);
    
    textFont(font_jessi1);
    text("HAI", -170+frameCount*3, 300+ amp*2);
    
    fill(201, 145, 130);
    
    textFont(font_jessi2);

    text("TAUCHER", -100+frameCount*3, 300);
    popMatrix();
    }
  }


