
int pos1x = 100;
int pos1y;
int pos2x = 900;
int pos2y;
int posbolax = 100;
int posbolay;
int goles1;
int goles2;
float angulobola;
float vel1;
float vel2;
float velbola = 15;
float tiempo = 0;
boolean bolaenjuego = false;
int tamb = 34;
boolean der = true;
int dif = 110; //inverso
int desv = 0;
boolean saca1 = true;
PImage mac;



void setup()
{
  size(1200, 900);
  background(0);
  smooth();
  pos1y = 450;
  pos2y = 450;
  bolaenjuego = false;
  tiempo = 0;
  frameRate = 24;
  desv = 0;
  mac = loadImage("mac.png");
}

void draw()
{
  background(0);

  strokeWeight(2);
  noFill();
  

  //campo
  stroke(0, 255, 40);
  line(width/2, 100, width/2, 800);
  rect(50, 100, 1100, 700);
  stroke(0,150, 20);
  line(250, 100, 250, 800);
  rect(400, 250, 400, 400);
 line(950, 100, 950, 800);

  //jug1
  pos1y = mouseY;
  if (pos1y <= 175) {
    pos1y = 175;
  }
  if (pos1y >= 800-75) {
    pos1y = 800-75;
  }
  stroke(180, 100, 255);
  rect(85, pos1y-75, 15, 150);

  if ( bolaenjuego == false )
  {


    if (saca1)
    {
      //jug2
      pos2y = 450;
      stroke(20, 205, 255);
      rect(width-100, pos2y-75+desv, 15, 150);

      //bola
      posbolay = pos1y-tamb/2;
      stroke(255);
      image(mac, 100, posbolay, tamb, tamb);
      //rect(100, posbolay, tamb, tamb);
    }
    else
    {
      pos2y = 450;
      stroke(20, 205, 255);
      rect(width-100, pos2y-75+desv, 15, 150);
      posbolay = pos2y-tamb/2;
      stroke(255);
      image(mac, 1072, posbolay, tamb, tamb);
      //rect(1072, posbolay, tamb, tamb);
    }
  }

  if (bolaenjuego == true)
  {

    //bola
    stroke(255);
    image(mac, posbolax, posbolay, tamb, tamb);
    //rect(posbolax, posbolay-tamb/2, tamb, tamb);

    //jug2    
    pos2y = buscarbola()+desv;
    if (pos2y <= 175) {
    pos2y = 175;
    }
    if (pos2y >= 800-75) {
      pos2y = 800-75;
    }
    stroke(20, 205, 255);
    rect(width-100, pos2y-75, 15, 150);

    int dere = 1;

    if (der == false)
    {
      dere = -1;
    }

    if (posbolax <= 50 || posbolax >= 1150 )
    {
      metiogol();
    }
    else 
    {
      if (posbolax <= 100 && posbolay >= (pos1y - 75)  && posbolay <= (pos1y + 75) && der == false )
      { 
        der = true;
        angulobola += (PI/16)*(pos1y - (posbolay + tamb/2))/75;
      }
      else if (posbolax >= 1080 && posbolay >= (pos2y - 75)  && posbolay <= (pos2y + 75) && der == true )
      { 
        der = false;
        angulobola += (PI/16)*(pos2y - (posbolay + tamb/2))/75;
      }

      if (posbolay >= 800-tamb/2 && angulobola <= PI/2 )
      {
        angulobola = (PI- angulobola);
        desv = int(random(-dif,dif));
      }
      else if (posbolay <= 100+tamb/2 && angulobola >= PI/2 )
      {
        angulobola = (PI- angulobola);
        desv = int(random(-dif,dif));
      }
    }

    posbolax += (sin(angulobola))*velbola*dere;
    posbolay += (cos(angulobola))*velbola;
  }

  fill(255);
  text("" + goles1, 500, 70);  
  textAlign(RIGHT);
  text("" + goles2, 700, 70);
  
  fill(180, 100, 255);
  textSize(50);
  textAlign(LEFT);
  text("JUGADOR 1", 50, 70);  
  fill(20, 205, 255);
  
  
  textAlign(LEFT);
  text("JUGADOR 2", 880, 70);
  textAlign(LEFT);    
  fill(255,20,70);
  text("NUEVO", 50, 870);
  fill(255);
  text("DIFICULTAD", 600, 870);
  fill(20,255,55);
  text("1", 960, 870);
  fill(210, 210, 0);
  text("2", 1040, 870);
  fill(255,0,0);
  text("3", 1120, 870);
  tiempo += 1/24;
  
  noFill();
  strokeWeight(2);
  stroke(255);
  if(velbola == 15)
  {
    rect(945, 822, 60, 60);
  }
  else if(velbola == 20)
  {
    rect(1025, 822, 60, 60);
  }
  else if(velbola == 25)
  {
    rect(1105, 822, 60, 60);
  }
  
}

void mousePressed()
{
  if(mouseX <= 300 && mouseY >= 800)
  {
    setup();
    goles1 = 0;
    goles2 = 0;
  }
  
  else if(mouseX > 950 && mouseX <= 1030 && mouseY >= 800)
  {

    velbola = 15;
  }
  else if(mouseX > 1030 && mouseX <= 1110 && mouseY >= 800)
  {

    velbola = 20;
  }
  else if(mouseX > 1110 && mouseX <= 1180 && mouseY >= 800)
  {
    velbola = 25;
  }
  
  else
  {
    if (bolaenjuego==false)
    {
      angulobola = random(PI/4, 3*PI/4);
      bolaenjuego = true;
    }
  }

}

void metiogol()
{
  if (posbolax <=0)
  {
    goles2++;
    setup();
    posbolax = 100;
    pos1y = mouseY;
    der = true;
    saca1 = true;
    background(0,255,255);
  }
  if (posbolax >= 1200)
  {
    goles1++;
    setup();
    posbolax = width-130;
    pos2y = int(random(175, 800-175));
    der = false;
    saca1 = false;
    background(255,0,255);
  }
  
}

int buscarbola()
{
  int predicc = 0;
  predicc = int(posbolay + velbola*tiempo*sin(angulobola));

  if (predicc <= 0)
  {
    predicc = -predicc;
  }
  if (predicc >= 800)
  {
    predicc = predicc-800;
  }
  
  return predicc;
}


