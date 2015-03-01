


PFont font_fira;

void setup()
{
  size(500, 500);
  smooth();


  font_fira = createFont("FiraSans-Regular.ttf", 100, true);
}

color gras = color(11, 149, 25);
color stamm = color(149, 89, 11);
color stroke = color (0);
color apfel = color (200,0,0);

void draw()
{
  background(255);
  float ver = sin(millis()/500.0)*10;

  for (int i=0; i<width; i+=50)
  {
    pushMatrix();



    fill(gras);
    textFont(font_fira);
    textSize(20);
    text("GRAS", i+ver, 500);
    popMatrix();
  }
  for (int i=0; i<width; i+=50)
  {
    pushMatrix();


    
    textFont(font_fira);
    textSize(15);
    text("GRAS", 5+i+ver, 485);
    popMatrix();
  } 
  for (int i=0; i<width; i+=50)
  {
    pushMatrix();


    textFont(font_fira);
    textSize(10);
    text("GRAS", i+ver, 470);
    popMatrix();
  } 
  for (int i=0; i<width; i+=50)
  {
    pushMatrix();

    textFont(font_fira);
    textSize(20);
    text("GRAS", i+ver, 00);
    popMatrix();
  }

  for (int i=0; i<150; i+=15)
  {
    pushMatrix();


    fill(stamm);
    textFont(font_fira);
    textSize(20);
    text("STAMM", 230, 500-i);
    popMatrix();
  } 

  fill(gras);
  textFont(font_fira);
  textSize(11);
  text("BLAETTER", 200, 300);
  text("BAETTER", 280, 300);

  text("BLAETTER", 210, 310);
  text("BLAETTER", 220, 320);
  text("BLAETTER", 230, 330);
  text("BLAETTER", 225, 340);

  text("BLAETTER", 240, 300);
  text("BLAETTER", 250, 310);
  text("BLAETTER", 260, 320);
  text("BLAETTER", 270, 330);
  text("BLAETTER", 265, 340);

  text("BLAETTER", 265, 290);
  text("BLAETTER", 225, 290);
  text("BLAETTER", 245, 280);

  fill(apfel);
  text("APFEL", 245, 320);


  if (mousePressed) {
    for (int b=0; b<width; b+=55)
    {
      pushMatrix();
      fill(200, 200, 0);
      float vers = sin(millis()/100.0+b)*10;
      textSize(20);
      text ("FEUER", b+vers, 450);
      text ("FEUER", b+vers, 460);
      text ("FEUER", b+vers, 470);
      text ("FEUER", b+vers, 480);
      text ("FEUER", b+vers, 490);
      text ("FEUER", b+vers, 500);

      fill(200, 0, 0);
      text ("FEUER", b+5+vers, 450);
      text ("FEUER", b+5+vers, 460);
      text ("FEUER", b+5+vers, 470);
      text ("FEUER", b+5+vers, 480);
      text ("FEUER", b+5+vers, 490);
      text ("FEUER", b+5+vers, 500);
      popMatrix();
    }
    for (int b=230; b<270; b+=50)
    {
      pushMatrix();
      fill(200, 200, 0);
      float vers = sin(millis()/100.0+b)*10;
      textSize(20);
      text ("FEUER", b+vers, 430);
      text ("FEUER", b+vers, 420);
      text ("FEUER", b+vers, 410);
      text ("FEUER", b+vers, 400);
      text ("FEUER", b+vers, 390);
      text ("FEUER", b+vers, 380);
      text ("FEUER", b+vers, 370);
      text ("FEUER", b+vers, 360);
      fill(200, 0, 0);
      text ("FEUER", b+5+vers, 430);
      text ("FEUER", b+5+vers, 420);
      text ("FEUER", b+5+vers, 410);
      text ("FEUER", b+5+vers, 400);
      text ("FEUER", b+5+vers, 390);
      text ("FEUER", b+5+vers, 380);
      text ("FEUER", b+5+vers, 370);
      text ("FEUER", b+5+vers, 360);
      popMatrix();
    }
    for (int c=170; c<290; c+=50) {
      float vers = sin(millis()/100.0+c)*10;

      fill(200, 0, 0);
      text ("FEUER", c+5+vers, 300);
      text ("FEUER", c+5+vers, 310);
      text ("FEUER", c+5+vers, 320);
      text ("FEUER", c+5+vers, 330);
      text ("FEUER", c+5+vers, 340);
      text ("FEUER", c+5+vers, 290);

      fill(200, 200, 0);
      text ("FEUER", c+5+vers, 300);
      text ("FEUER", c+vers, 310);
      text ("FEUER", c+vers, 320);
      text ("FEUER", c+vers, 330);
      text ("FEUER", c+vers, 340);
      text ("FEUER", c+vers, 290);
    }
  }}
  
  void mouseReleased() {
  if (apfel == color (200,0,0) && gras == color(11, 149, 25) && stamm == color(149, 89, 11) && stroke == color(0)){
    gras = color(0);
    stamm = color(0);
    stroke = color (255);
    apfel = color (0);
  } else {
    gras = 0;
  } 
}



