

void setup ()
{

  size (500, 500);
} 

void draw()
{
  
//Variablendeklaration
  float v=0; // Geschwindigkeit Welle
  float h=0;//Amplitude Welle
  float vs=0;//Geschwindigkeit Schiff
  float hs=0;//Amplitude Schiff
  float s=0;//Amplitude Segel
//Hintergrund
  background (195, 247, 238);//hellblau gesamthintergrund
  
//Oberer Rechteck Hintergrund
  
  noStroke();//keine linie beim rechteck
  if (mousePressed)
  {

    fill (210);//grau Himmel
  } else
  {
    fill (255);// weiß Himmel
  }


  rect (0, 0, 500, 250);//obere hälfte bild weiß
  
//Sonne
 
  
  stroke (234, 195, 24);//Sonnenlinie
  fill (245, 226, 12);//Sonnenfarbe
  ellipse (450, 50, 100, 100); // Grundkörper
  
  
  for (int i= 0; i<360; i+=10)//Sonnenstrahlen
  { 

    pushMatrix();
    translate (450, 50);
    noFill ();
    rotate (radians(i));
    line (60, 0, 110+sin (millis()/100.0+i)*10, 0);//Sonnenstrahl bewegend
    popMatrix(); 
  }
  
  if (mousePressed) //Sonne weg
  {
    noStroke();
    fill(210);
   rect (300, 0, 500, 200);//Rechteck grau
  }
  
//Funktion Wellen

  stroke (81, 121, 222);//blau linienfarbe

  for (int k=0; k<height; k+=20)//Höhenschleife
  {
    for (int i= 0; i<width; i+=10)//Breitenschleife
    {
      if (mousePressed)
      {
        v=100;
        h=10;
      } else
      {
        v= 500;
        h=5;
      }

      float amplitude = sin(millis()/v+i+k)*h;

      fill (195, 247, 238);//fläche uner der kurve gefüllt
      line (0+i, 265+amplitude+k, 10+i, 265+amplitude+k);
    }
  }
  
  //Schiff
  if (mousePressed)//schiffsbewegung beim Sturm
  {
    vs=100;
    hs=10;
    s=sin(millis()/100)*10;
    
  }
  else 
  {
    vs=500;
    hs=5;
    s=0;
  }
translate (0, sin(millis()/vs)*hs); //normale Schiffsbewegung
  stroke (0);
 fill(224, 183, 143);
quad (120, 250, 320, 250, 270, 300, 170, 300);//Schiffsrumpf
fill(183, 150, 196);
triangle (220, 110,300+s, 235, 220, 250);//großerSegel 
//fill (255);
//triangle (220, 110, 230, 235, 220, 250); //kleiner Segel
line (220, 110, 220, 250);

}

