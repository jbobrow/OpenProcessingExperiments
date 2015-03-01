
PFont font_Drache;
PFont font_Himmel;

void setup()
{
  size(500, 500);
  smooth();

  font_Drache = createFont("aliee13.ttf", 20, true);
  font_Himmel = createFont("aliee13.ttf", 50, true);
}


void draw()
{

  if (mousePressed==true)
  {
    background(255);

    for (int f=0; f<width; f+=170)
    {
      fill(14, 5, 124);
      textFont(font_Himmel);
      textAlign(CENTER, CENTER);
      text("Himmel", 90+f, 10);
      text("Himmel", 90+f, 40);
      text("Himmel", 90+f, 70);
      text("Himmel", 90+f, 100);
      text("Himmel", 90+f, 130);
      text("Himmel", 90+f, 160);
      text("Himmel", 90+f, 190);
      text("Himmel", 90+f, 220);
      text("Himmel", 90+f, 250);
      text("Himmel", 90+f, 280);
      text("Himmel", 90+f, 310);
      text("Himmel", 90+f, 340);
      text("Himmel", 90+f, 370);
      text("Himmel", 90+f, 400);
      text("Himmel", 90+f, 430);
      text("Himmel", 90+f, 460);
      text("Himmel", 90+f, 490);
    }

    for (int i=0; i<width; i+=150)
    {
      float ver = sin(millis()/100.0+i)*30;

      pushMatrix();

      //Drache
      translate(90, 90);
      rectMode(CENTER);
      noStroke();
      fill(255, 0, 0);
      rotate(radians(45));

      textFont(font_Drache);
      textAlign(CENTER, CENTER);
      text("Drache", i+ver, 2*ver);
      text("Drache", (i+ver), 2*ver-20);
      text("Drache", (i+ver), 2*ver-40);
      text("Drache", (i+ver), 2*ver+20);
      text("Drache", (i+ver), 2*ver+40);
      //rect(i+ver, 2*ver, 100, 100);

      //Mund
      stroke(0);
      fill(255);
      ellipse((i+ver)+20, (2*ver)+20, 20, 20);


      //Augen
      stroke(0);
      fill(255);
      ellipse((i+ver)-30, (2*ver), 20, 20);
      ellipse((i+ver), (2*ver)-30, 20, 20);

      fill(0);
      ellipse((i+ver)-30, (2*ver), 10, 10);
      ellipse((i+ver), (2*ver)-30, 10, 10);

      popMatrix();
    }
  } 
  
  else
  {
    background(255);
    
    for (int f=0; f<width; f+=170)
    {
      fill(66, 208, 242);
      textFont(font_Himmel);
      textAlign(CENTER, CENTER);
      text("Himmel", 90+f, 10);
      text("Himmel", 90+f, 40);
      text("Himmel", 90+f, 70);
      text("Himmel", 90+f, 100);
      text("Himmel", 90+f, 130);
      text("Himmel", 90+f, 160);
      text("Himmel", 90+f, 190);
      text("Himmel", 90+f, 220);
      text("Himmel", 90+f, 250);
      text("Himmel", 90+f, 280);
      text("Himmel", 90+f, 310);
      text("Himmel", 90+f, 340);
      text("Himmel", 90+f, 370);
      text("Himmel", 90+f, 400);
      text("Himmel", 90+f, 430);
      text("Himmel", 90+f, 460);
      text("Himmel", 90+f, 490);
    }
    
    for (int i=0; i<width; i+=150)
    {
      float ver = sin(millis()/500.0+i)*5;

      pushMatrix();

      //Drache
      translate(90, 90);
      rectMode(CENTER);
      noStroke();
      fill(255, 0, 0);
      rotate(radians(45));

      textFont(font_Drache);
      textAlign(CENTER, CENTER);
      text("Drache", i+ver, 2*ver);
      text("Drache", (i+ver), 2*ver-20);
      text("Drache", (i+ver), 2*ver-40);
      text("Drache", (i+ver), 2*ver+20);
      text("Drache", (i+ver), 2*ver+40);
      //rect(i+ver, 2*ver, 100, 100);

      //Mund
      stroke(0);
      fill(255);
      ellipse((i+ver)+20, (2*ver)+20, 20, 20);

      //Augen
      stroke(0);
      fill(255);
      ellipse((i+ver)-30, (2*ver), 20, 20);
      ellipse((i+ver), (2*ver)-30, 20, 20);

      fill(0);
      ellipse((i+ver)-30, (2*ver), 10, 10);
      ellipse((i+ver), (2*ver)-30, 10, 10);

      popMatrix();
    }
  }
}



