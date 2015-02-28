
int i=0; //the number of actually activ objects
int anzahl=20;//maximum number of objects
Schwengel[]  schwengel;

class Schwengel{ //the coloured circles with a line rotating around the previous circle
  float centerx,centery,lang,omega,alfa,big,punktx,punkty;
  color farbe;

  Schwengel(float centerx_, float centery_,float lang_, float omega_, float alfa_, float big_, color farbe_){
    centerx=centerx_;
    centery=centery_;//center of rotation 
    lang=lang_;      // distance from center
    omega=omega_;    //angular velocity
    alfa=alfa_;      //actual angle
    big=big_;       //diameter of circle
    farbe=farbe_;   //colour of circle
  }

  //there are different routines for drawing an rotating, because the circles must be drawn after the lines to cover them
  //and the the center of the next object must be set as the position of the actual circle
  void rotieren(){//let the angle grow, get the new position of the circle
    alfa=alfa+omega;
    punktx=centerx+lang*cos(alfa);
    punkty=centery+lang*sin(alfa);
  }
  void zeichne_linie(){//draw the connection from center to actual circle
    stroke(255);
    line(centerx,centery,punktx,punkty);

  }
  void zeichne_kreis(){//fill the circle
    stroke(farbe);
    fill(farbe); 
    ellipse(punktx,punkty,big,big);
  }
}


void setup() {
  size(600, 600);
  colorMode(RGB);
  smooth();
  ellipseMode (CENTER);
  schwengel= new Schwengel[anzahl];
  for (int a=1;a<anzahl;a++){
    schwengel[a]= new Schwengel(0,0,0,0,0,0,color(200,200,200)); //all objects are initialised but without radius
    //the updating sets them to the position of the last circle    
  }
  schwengel[0]=new Schwengel(width/2,height/2,random(20,60),random(0.01,0.04),0,random(10,30),color(255,255,255));// we start with one object activ

}

void draw() {
  background(100,100,100);
  for(int i=0;i<anzahl;i++){
    schwengel[i].rotieren();
    schwengel[constrain(i+1,1,anzahl-1)].centerx=schwengel[i].punktx;//the circle is the center of rotation for the following circle
    schwengel[constrain(i+1,1,anzahl-1)].centery=schwengel[i].punkty;//after anzahl-1 there is no following circle
  }
  for(int j=0;j<anzahl;j++){    
    schwengel[j].zeichne_linie();
    fill(60);
    stroke(60);
  }
  ellipse(width/2,height/2,10,10);//the innermost circle - static
  if(i==19){//here the ordinary way doesn´t work
    stroke(255);
    line(schwengel[18].punktx,schwengel[18].punkty,schwengel[19].centerx,schwengel[19].centery);
  }


  for(int k=0;k<anzahl;k++){
    schwengel[k].zeichne_kreis();
  }
}


void mouseReleased(){//that starts a new circle
  if(i<anzahl-1){
    i=i+1;
    schwengel[i].centerx=schwengel[i-1].punktx;//the last circle gives the actual center-position
    schwengel[i].centery=schwengel[i-1].punkty;
    schwengel[i].lang=random(40,80);
    schwengel[i].omega=random(-0.04,0.04);
    if(abs(schwengel[i].omega)<0.001){//not too slow
      schwengel[i].omega=schwengel[i].omega*2;
    }
    schwengel[i].alfa=random(0,6.4);
    schwengel[i].big=random(10,30);
    schwengel[i].farbe=color(random(50,250),random(50,250),random(50,250),190);

  }
}














