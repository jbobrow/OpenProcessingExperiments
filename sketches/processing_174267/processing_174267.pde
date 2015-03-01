
PFont font_fira;

void setup() 
{
  font_fira = createFont("FiraSans-Regular.ttf", 20, true);
  size (500, 250);
}

void draw()

{
  background(22, 31, 90);



  pushMatrix();
  translate(mouseX+sin(millis()/100.0), height-50+sin(millis()/100.0));

  pushMatrix();
  fill(234, 213, 154);
  rect(10, -12, 7, 15);
  rect(25, -12, 7, 15);
  rect(40, -12, 7, 15);
  rect(55, -12, 7, 15);
  fill(0);
  rect(10, -17, 7, 5);
  rect(25, -17, 7, 5);
  rect(40, -17, 7, 5);
  rect(55, -17, 7, 5);
  //rect(0,0,55,20);
  quad(0, 0, 75, 0, 70, 10, 5, 10);
  fill(227, 44, 27);
  quad(5, 10, 70, 10, 65, 20, 10, 20);

  popMatrix();
  popMatrix();

  //ICEBÃ�ï¿½RG

  pushMatrix();
  translate(-mouseX+sin(millis()/100.0), height-50+sin(millis()/100.0));

  pushMatrix();
  fill(149, 242, 241);
  triangle(660, 30, 720, 30, 690, -20);
  fill(255);
  triangle(650, 30, 700, 30, 675, -30);
  triangle(680, 30, 740, 30, 700, -10);

  popMatrix();
  popMatrix();

  pushMatrix();
  for (int i=0; i<width+10; i+=20)
  {
    //float flut = map(mouseX, 100, 200, 200, 400);
    fill(106, 152, 188);
    noStroke();
    float welle = sin(millis()/70.0+i)+10;
    ellipse(i, height, welle+46, welle+66);
  }
  popMatrix();

  if (mouseX >=290) {
    translate(0, 0);
    fill(0);
    rect(0, 0, 500, 250);
    fill(255);
    textFont(font_fira);
    textAlign(CENTER, CENTER);
    //text("Diese Szene wurde als unangemessen eingestuft und ist fÃ�Â¼r die Ã�ï¿½ffentlichkeit nicht geeignet!", width/2, height/2);
    text("Diese Szene ist in Ihrem Land nicht verfügbar,", width/2, height/2-60);
    text("da die GEMA die erforderlichen", width/2, height/2-30);
    text("Rechte nicht eingeräumt hat!", width/2, height/2-00);
    
    text("Das tut uns leid.  Nicht.", width/2, height/2+60);
  }
  
}

