
ArrayList<Ser> Pop;
int i, j, doentes;
int t=10;
int contagio=30;
int chance=3;
int natal=4;
int mortalidade=4;
boolean tipo=false;

void setup()
{
  size(700, 700);
  Pop=new ArrayList<Ser>();
  textSize(20);
}

void draw()
{
  background(0);
  for(i=0; i<Pop.size(); i=i+1)
  {
    Pop.get(i).viver();
  }
  doentes=0;
  for(i=0; i<Pop.size(); i=i+1)
  {
    if(Pop.get(i).doente)
    {
      doentes=doentes+1;
    }
  }
  fill(0);
  stroke(255, 0, 0);
  rect(width-81, 0, 80, 80);
  fill(0);
  stroke(255, 0, 0);
  rect(0, height-201, width-1, 200);
  if(tipo)
  {
    fill(0, 100, 0);
    stroke(255, 0, 0);
    ellipse(width-41, 40, t, t);
    noFill();
    ellipse(width-41, 40, contagio, contagio);
  }
  else
  {
    fill(0, 0, 255);
    noStroke();
    ellipse(width-41, 40, t, t);
  }
  fill(255);
  text("Total Population: "+Pop.size(), 40, width-150);
  text("Infection Chance: "+chance, width/2, width-150);
  text("Birth Rate: "+natal, width/2, width-100);
  text("Death Rate: "+mortalidade, width/2, width-50);
  fill(150, 200, 255);
  text("Healthy Population: "+(Pop.size()-doentes), 40, width-100);
  fill(255, 100, 100);
  text("Sick Population: "+doentes, 40, width-50);
  fill(255, 100, 100);
  stroke(255);
  rect(width-120, height-170, 30, 30);
  rect(width-120, height-120, 30, 30);
  rect(width-120, height-70, 30, 30);
  fill(0, 200, 100);
  rect(width-70, height-170, 30, 30);
  rect(width-70, height-120, 30, 30);
  rect(width-70, height-70, 30, 30);
  for(i=0; i<Pop.size(); i=i+1)
  {
    
  }
}

class Ser
{
  float posx;
  float posy;
  float velx;
  float vely;
  boolean doente;
  
  Ser(float tposx, float tposy, float tvelx, float tvely, boolean tdoente)
  {
    posx=tposx;
    posy=tposy;
    velx=tvelx;
    vely=tvely;
    doente=tdoente;
  }
  
  void viver()
  {
    if(posx>=0 && posx<=width)
    {
      posx=posx+velx;
    }
    else
    {
      if(posx<0)
      {
        posx=0;
      }
      else
      {
        posx=width;
      }
      velx=-velx;
    }
    if(posy>=0 && posy<=height-200)
    {
      posy=posy+vely;
    }
    else
    {
      if(posy<0)
      {
        posy=0;
      }
      else
      {
        posy=height-200;
      }
      vely=-vely;
    }
    if(doente)
    {
    }
    else
    {
      for(j=0; j<Pop.size(); j=j+1)
      {
        if(sqrt(sq(posx-Pop.get(j).posx)+sq(posy-Pop.get(j).posy))<(contagio/2+t/2) && Pop.get(j).doente && random(1000)<chance)
        {
          doente=true;
        }
      }
    }
    if(doente)
    {
      if(random(1000)<mortalidade)
      {
        Pop.remove(i);
      }
    }
    else
    {
      if(random(1000)<natal)
      {
        Pop.add(new Ser(posx, posy, random(-2, 2), random(-2, 2), false));
      }
    }
    if(doente)
    {
      fill(0, 100, 0);
      stroke(255, 0, 0);
      ellipse(posx, posy, t, t);
      noFill();
      ellipse(posx, posy, contagio, contagio);
    }
    else
    {
      fill(0, 0, 255);
      noStroke();
      ellipse(posx, posy, t, t);
    }
  }
}

void mousePressed()
{
  if(mouseY<height-200)
  {
    Pop.add(new Ser(mouseX, mouseY, random(-2, 2), random(-2, 2), tipo));
  }
  else
  {
    if(mouseX>width-120 && mouseX<width-90 && mouseY>height-170 && mouseY<height-140 && chance>0)
    {
      chance=chance-1
    }
    if(mouseX>width-120 && mouseX<width-90 && mouseY>height-120 && mouseY<height-90 && natal>0)
    {
      natal=natal-1;
    }
    if(mouseX>width-120 && mouseX<width-90 && mouseY>height-70 && mouseY<height-40 && mortalidade>0)
    {
      mortalidade=mortalidade-1
    }
    if(mouseX>width-70 && mouseX<width-40 && mouseY>height-170 && mouseY<height-140)
    {
      chance=chance+1
    }
    if(mouseX>width-70 && mouseX<width-40 && mouseY>height-120 && mouseY<height-90)
    {
      natal=natal+1
    }
    if(mouseX>width-70 && mouseX<width-40 && mouseY>height-70 && mouseY<height-40)
    {
      mortalidade=mortalidade+1
    }
  }
}

void keyPressed()
{
  if(key=='c' || key=='C')
  {
    tipo=!tipo;
  }
  if(key=='z' || key=='Z')
  {
    natal=0;
    chance=0;
    mortalidade=0;
  }
}
