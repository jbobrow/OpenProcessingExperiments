
PFont myfont;
PFont myfont2;
PFont myfont3;
PFont myfont4;
PFont myfont5;


void setup ()
{

  size (500, 500);
  myfont = createFont ("ARDESTINE.ttf", 10, true);
  myfont2= createFont ("ARDESTINE.ttf", 20, true);
  myfont3=createFont ("ARBONNIE.ttf", 30, true);
  myfont4=createFont ("ARDESTINE.ttf", 40, true); 
  myfont5=createFont ("ARDESTINE.ttf", 80, true); 
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

textFont (myfont5);
text ("O", 450, 50);

  for (int i= 0; i<360; i+=10)//Sonnenstrahlen
  { 

    pushMatrix();
    translate (450, 50);
    noFill ();
    rotate (radians(i));
    textFont(myfont);
    //line (60, 0, 110+sin (millis()/100.0+i)*10, 0);//Sonnenstrahl bewegend
    textFont (myfont);
    fill(255, 255, 3);
    textAlign ( CENTER, CENTER);//Mitte vom Text
    text ( "Sonnenschein", 100+sin (millis()/100.0+i)*10, 0+sin (millis()/100.0+i)*10);//Position der unteren linken Ecke vom Text

    noFill();
    popMatrix();
  }

  if (mousePressed) //Sonne weg
  {
    noStroke();
    fill(210);
    rect (200, 0, 500, 250);//Rechteck grau

    fill (0);
    textFont (myfont3);
    textAlign ( CENTER, CENTER);
    text ("Wolke", 110, 70);
    textFont (myfont3);
    text ("Wolke", 70, 50);
    textFont (myfont3);
    text ("Wolke", 150, 50);
    textFont (myfont3);
    text ("Wolke", 180, 30);
    textFont (myfont3);
    text ("Wolke", 100, 30);
    textFont (myfont3);
    text ("Wolke", 130, 10);
  }

  //Funktion Wellen

  stroke (81, 121, 222);//blau linienfarbe


  for (int k=0; k<height; k+=20)//Höhenschleife
  {
    beginShape();
    for (int i= -20; i< (width+40); i+=20)//Breitenschleife
    {
      if (mousePressed)
      {
        v=100;
        h=10;
        fill (195, 247, 238);
      } else
      {
        v= 500;
        h=5;
      }
      //  unr Höhe
      float amplitude = sin(millis()/v+i+k)*h;
      curveVertex (i, k+260+amplitude);
    }
    endShape();
  }

  //Schiff
  if (mousePressed)//schiffsbewegung beim Sturm
  {
    vs=100;
    hs=10;
    s=sin(millis()/100)*10;
  } else 
  {
    vs=500;
    hs=5;
    s=0;
  }
  translate (0, sin(millis()/vs)*hs); //normale Schiffsbewegung
  noStroke ();
  noFill();
  quad (120, 250, 320, 250, 270, 300, 170, 300);//Schiffsrumpf
  

 //SEGEL
  textFont (myfont4);
  fill (165, 63, 216);
 text ("S", 230,150); 
 text ("E", 230,170);
 text ("E", 250, 170);
 text ("G", 230, 190);
 text ("G", 255, 190);
 text ("E", 230, 210);
 text ("E", 255, 210);
 text ("L", 280, 210);
  fill(196, 125, 38);
  textFont (myfont2);
  
  //SCHIFFRUMPF
  text ( "Schiff", 170, 260);
  text ( "Schiff", 220, 260); 
  text ( "Schiff", 270, 260);
  text ("Schiff", 190, 275);
  text ("Schiff", 240, 275);
  text ( "Schiff",220 , 290);
  
}

