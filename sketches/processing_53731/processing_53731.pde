
float anzahlschwinungen = 0;
int anzahlpunkte = 200;
float drehung =20;
float px=0;
float py=0;
float[] posX;    
float[] posY;

void setup() {
  size(600, 600);
  smooth();
  posX= new float[anzahlpunkte];
  posY= new float[anzahlpunkte];
}

void draw() {
  
  posX= new float[anzahlpunkte];
  posY= new float[anzahlpunkte];
  background(255);

  drehung += TWO_PI/360;
  


  for (int i=0; i<anzahlpunkte;i++) {
    // float x=i*width/50;
    //float winkel=float(i)/50*TWO_PI;
    //oder alternativ:


    //float winkel = map(i,0,anzahlpunkte,0, TWO_PI * anzahlschwinungen);


    
    float winkel = map(i, 0, anzahlpunkte, 0, PI);
    /*  
     float x=width/2 -cos(winkel)*mouseY;
     float y=height/2 -sin(winkel)*mouseY;
     */
    winkel+=drehung;
    /*
    float x=width/2 + sin(winkel)*200;
     float y=height/2 -cos(winkel)*200; 
     */

    float faktorX=map(mouseX, 0, width, 1, 4);
    float x=width/2 + sin(winkel*faktorX+0.5)*mouseX;
    float y=height/2 -cos(winkel*5)*mouseY; 


    //Sinuskurve:
    // float y=height/2 -sin(float(i)/50*TWO_PI)*200;


    ellipse(x, y, 5,5);


/*
    if(i>0){
    line(x, y, px, py);
    }
    stroke(200,5,4);
    px=x;
    py=y;
    
    */
    posX[i]=x;
    posY[i]=y;
    
    if(i>0){
    line(posX[i-1], posY[i-1], posX[i], posY[i]);
     }   



  }
  //px=0;
}

int meinArray[];

void keyPressed() {
  if (key=='+') anzahlpunkte*=2;
  if (key=='-') anzahlpunkte/=2;
}


