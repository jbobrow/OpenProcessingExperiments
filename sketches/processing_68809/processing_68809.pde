
int Tamy=400,Tamx=400;
void setup()
{
//  size(Tamx,Tamy);
  size(400,400);
  background(0,0,240);         //fondo
  strokeWeight(2);       //grosor del contorno 
  smooth();              //depurar contorno
  frameRate(2);
}
void draw()
{  
  background(0,0,135);
  stroke(255,255,0);     //color
  fill(255,255,0);       //relleno
  ellipse(340,75,50,50); //x,y,diagonal mayor, diagonal menor
  noFill();
  bezier(350,80,320,70,340,90,random(290,320),random(75,85));
  bezier(350,80,320,70,340,90,random(290,320),random(100,115));
  bezier(350,80,320,70,340,90,random(290,320),random(50,65));

  bezier(350,80,320,70,340,90,random(370,390),random(75,85));
  bezier(350,80,320,70,340,90,random(370,390),random(100,115));
  bezier(350,80,320,70,340,90,random(370,390),random(50,65));

  bezier(350,80,320,70,340,90,random(290,320),random(30,45));
  bezier(350,80,320,70,340,90,random(290,320),random(100,115));
  bezier(350,80,320,70,340,90,random(290,320),random(15,25));
  
  bezier(350,80,320,70,340,90,random(370,390),random(30,45));
  bezier(350,80,320,70,340,90,random(370,390),random(60,75));
  bezier(350,80,320,70,340,90,random(370,390),random(15,25));
  
  stroke(150,130,110);
  fill(150,130,110);
  bezier(0,Tamy/2,Tamx/4,50,Tamx/4,(Tamy/2),Tamx/2,Tamy/2);
  bezier(Tamx/2,Tamy/2,(Tamx/2)+(Tamx/4),50,(Tamx/2)+(Tamx/4),(Tamy/2),Tamx,Tamy/2);
  
  stroke(10,195,20);
  fill(10,195,20);
  rect(0,Tamy/2,Tamx,Tamy);
  
}

