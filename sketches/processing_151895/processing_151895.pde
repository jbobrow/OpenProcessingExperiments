
Malla malla;
color color1, color2;

void setup()
{
  size(600, 600, P2D);
  smooth(8);
  color1 = color(255, 0, 255);
  color2 = color(255, 255, 0);
  malla = new Malla(width*0.4, height*0.4, color1, color2);
  background(0);
}

void draw()
{
  fill(0, 24);
  noStroke();
  rect(0, 0, width, height);
  malla.display();
}

//////////////////////////////////////////////////////////////////////////////////////

class Malla
{
  Punto[] punto;
  float distBase, factorDist, alfaMax, ancho, alto;
  PVector temp1, temp2;
  float tempDist, alfaStroke;
  color color1, color2, colorStroke;
  float minX, maxX, minY, maxY, factorColor;

  Malla(float ancho, float alto, color color1, color color2)
  {
    this.ancho = ancho;
    this.alto = alto;
    this.color1 = color1;
    this.color2 = color2;
    distBase = sqrt(sq(ancho) + sq(alto));
    factorDist = 0.1;
    alfaMax = 32;
    minX = (width - ancho)*0.5;
    maxX = (width + ancho)*0.5;
    minY = (height - alto)*0.5;
    maxY = (height + alto)*0.5;
    punto = new Punto[250];    
    for (int i = 0; i < punto.length; i++)
    {
      punto[i] = new Punto(ancho, alto);
    }
  }

  void display()
  {
    strokeWeight(1);
    for (int i = 0; i < punto.length; i++)
    {
      punto[i].update();
    }
    for (int i = 0; i < punto.length; i++)
    {
      for (int j = 0; j < punto.length; j++)
      {
        temp1 = punto[i].obtenerPos();
        temp2 = punto[j].obtenerPos();
        tempDist = PVector.dist(temp1, temp2);
        if (tempDist < distBase*factorDist)
        {
          alfaStroke = map(tempDist, 0, distBase*factorDist, 0, alfaMax);
          factorColor = map(temp1.x, minX, maxX, 0, 1);
          colorStroke = lerpColor(color1, color2, factorColor);
          stroke(red(colorStroke), green(colorStroke), blue(colorStroke), alfaStroke);
          line(temp1.x, temp1.y, temp2.x, temp2.y);          
        }
      }
    }
  }
}


class Punto
{
  PVector pos, vel;
  float ancho, alto;
  float minX, maxX, minY, maxY;
  float velMax;
  float radio, radioBase, factorRadio;

  Punto(float ancho, float alto)
  {
    this.ancho = ancho;
    this.alto = alto;
    velMax = 0.75;
    factorRadio = 0.5;
    radioBase = sqrt(sq(ancho) + sq(alto));
    radio = radioBase*factorRadio;
    minX = (width - ancho)*0.5;
    maxX = (width + ancho)*0.5;
    minY = (height - alto)*0.5;
    maxY = (height + alto)*0.5;
    pos = new PVector(random(minX, maxX), random(minY, maxY));
    if (dist(pos.x, pos.y, width*0.5, height*0.5) > radio)
    {
      pos.normalize();
      pos.mult(radio);
    }
    vel = new PVector(random(-1*velMax, velMax), random(-1*velMax, velMax));
  }

  void update()
  {    
    if (dist(pos.x, pos.y, width*0.5, height*0.5) > radio)
    {
      vel.mult(-1);
    }
    pos.add(vel);
  }

  PVector obtenerPos()
  {
    return pos;
  }
}



