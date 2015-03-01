
int status = 0;

void setup()
{
  smooth();
  size(500, 500);
}

void draw()
{
  background(255);
  translate(width/2, height/2);
  println(mouseX, mouseY);

  rectMode(CENTER);
  fill(255);
  stroke(0);
  rect(0, 0, 400, 400);
  noStroke();
  fill(0);
  rect(0, 0, 300, 300);



  fill(0);
  PFont myFont;
  myFont = createFont("Verdana", 18);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  text("ON", -175, 0);
  fill(0);
  text("OFF", 175, 0);

  //PFont myFont2;
  //myFont2= createFont("Verdana", 10);
  //textFont(myFont2);
  //textAlign(CENTER, CENTER);
  //text("Click", -175, 0);
  //fill(0);
  //text("Click", 175, 0);
  //fill(0);



  if (mouseX>=64 && mouseX<=84 && mouseY>=240 && mouseY<=260)
  {
    if (mousePressed==true)
    {
      status=1;
    }
  }

  if (mouseX>=415 && mouseX<=435 && mouseY>=240 && mouseY<=260)
  {
    if (mousePressed==true)
    {
      status=0;
    }
  }

  if (status==1)
  {
    for (int i=0; i<1; i+=10)
    {

      pushMatrix(); 
      //rotate(radians(i));
      fill(255, 106, 106);
      textFont(myFont);
      text("Feuer", 26, 20+random(13));
      text("Feuer", 24, 10+random(12));
      text("Feuer", 22, 0+random(15));
      text("Feuer", 20, -10+random(17));
      text("Feuer", 18, -20+random(20));
      text("Feuer", 16, -30+random(17));
      text("Feuer", 14, -40+random(15));
      text("Feuer", 12, -50+random(12));
      text("Feuer", 10, -60+random(13));
      text("Feuer", 8, -70+random(13));
      text("Feuer", 6, -80+random(12));
      text("Feuer", 4, -90+random(15));

      text("Feuer", 0, -80+random(12));
      text("Feuer", -4, -75+random(13));
      text("Feuer", -6, -70+random(12));
      text("Feuer", -8, -65+random(15));

      text("Feuer", -26, 20+random(13));
      text("Feuer", -24, 10+random(12));
      text("Feuer", -22, 0+random(15));
      text("Feuer", -20, -10+random(17));
      text("Feuer", -18, -20+random(20));
      text("Feuer", -16, -30+random(17));
      text("Feuer", -14, -40+random(15));
      text("Feuer", -12, -50+random(12));
      text("Feuer", -10, -60+random(13));
      text("Feuer", -8, -70+random(13));
      text("Feuer", -6, -80+random(13));
      
      popMatrix();




      pushMatrix();
      rotate(radians(i));
      fill(255, 130, 71);
      textFont(myFont);

     // text("Feuer", -54, 140+random(20));
     // text("Feuer", -52, 130+random(20));
      text("Feuer", -50, 120+random(20));
      text("Feuer", -48, 110+random(20));
      text("Feuer", -46, 100+random(20));
      text("Feuer", -44, 90+random(20));
      text("Feuer", -42, 80+random(20));
      text("Feuer", -40, 70+random(20));
      text("Feuer", -38, 60+random(18));
      text("Feuer", -36, 50+random(16));
      text("Feuer", -34, 40+random(14));
      text("Feuer", -32, 30+random(30));
      text("Feuer", -30, 20+random(12));

      //text("Feuer", 54, 140+random(200));
      //text("Feuer", 52, 130, 250, -140+random(200));
      text("Feuer", 50, 120+random(20));
      text("Feuer", 48, 110+random(20));
      text("Feuer", 46, 100+random(20));
      text("Feuer", 44, 90+random(20));
      text("Feuer", 42, 80+random(20));
      text("Feuer", 40, 70+random(20));
      text("Feuer", 38, 60+random(18));
      text("Feuer", 36, 50+random(16));
      text("Feuer", 34, 40+random(14));
      text("Feuer", 32, 30+random(30));
      text("Feuer", 30, 20+random(12));
      
     text("Feuer", 0,30+random(20));
     text("Feuer", 0,40+random(14));
     text("Feuer", 0,50+random(12));
     text("Feuer", 0,60+random(20));
     text("Feuer", 0,70+random(15));
     text("Feuer", 0,80+random(20));
     text("Feuer", 0,90+random(15));
     text("Feuer", 0,100+random(50));
     text("Feuer", 0,110+random(30));
     text("Feuer", 0,120+random(11));
    // text("Feuer", 0,130+random(90));
     //text("Feuer", 0,140+random(18));
     
     
      popMatrix();
      
      
      
    }
  }
}



