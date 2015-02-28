
float xposBuild, yposBuild, zposBuild;

void status3()
{
  translate(width/2, height/2, 0);
  fill(255, 255, 0);
  sphere(100);
  fill(255);
  text("Z-Wert: " + zposBuild, -380, 290);
  
  //Drehung des Sonnensystems
  if(drehen == true)
  {
    rotateY(a*2);
  }
  a += 0.01;
  
  if(myPlanet.length > 0)
  {
    for(int i= 0; i<myPlanet.length; i++)
    {
      myPlanet[i].zeichne();  
    }
  }
  
  //Z-Achse variable
  if(keyPressed)
  {
    if(state == 3)
    {
      if(key == '+')
      {
        zposBuild += 5;
      }
      else if(key == '-')
      {
        zposBuild -= 5;
      }
    }
  }
}

//Wenn Maus gedrückt, wird neuer Planet erstellt
void mousePressed()
{
  xposBuild = mouseX;
  yposBuild = mouseY;
  //new object
  Planet f = new Planet(xposBuild, yposBuild, zposBuild);
  //append array
  myPlanet = (Planet[]) append(myPlanet, f);
}

