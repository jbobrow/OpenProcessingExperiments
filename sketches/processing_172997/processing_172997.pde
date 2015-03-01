
void setup()
{
  size(300,500);
}

void draw()
{
}

void keyPressed()
{
  int rot = int(random(255));
  int grun = int(random(255));
  int blau = int(random(255));
  
  int farbe = int(random(3));
  
  float verteilung = random(1);
  
  switch(farbe)
  {
 
   case 1: 
     fill((rot + grun)*verteilung, (rot + grun)*(1-verteilung), blau);
     break;
   case 2: 
     fill((rot+blau)*verteilung, grun, (rot+blau)*(1-verteilung));
     break;
   case 3: 
     fill(rot, (grun+blau)*verteilung, (grun+blau)*(1-verteilung));
     break;
  }
  rect(0,0,100,500);
  
  fill( rot, grun, blau);
  rect(100,0,100,500);
  
  verteilung = random(1);
  print(verteilung);
  
  switch(farbe)
  {
 
   case 1: fill((rot + grun)*verteilung, (rot + grun)*(1-verteilung), blau); break;
   case 2: fill((rot+blau)*verteilung, grun, (rot+blau)*(1-verteilung)); break;
   case 3: fill(rot, (grun+blau)*verteilung, (grun+blau)*(1-verteilung)); break;
  }
  rect(200,0,100,500);
}
