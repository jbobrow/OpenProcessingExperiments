
// If you know some math, you will remember Monsier Fourier (looking at the x or y-values as
//Fourier series from 0 to anzahl), otherwise just enjoy the movements


int i=0; //the number of actually activ objects
int anzahl=15;//maximum number of objects
int auswahl=ceil(random(0,8));
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

  //there are different routines for drawing and rotating, because the circles must be drawn after the lines to cover them
  //and the the center of the next object must be set at the position of the actual circle
  void rotieren(){//let the angle grow, get the new position of the circle
    alfa=alfa+omega;
    if(alfa>2*PI){
      alfa=alfa-2*PI;
    }
    punktx=centerx+lang*cos(alfa);
    //punktx=2*alfa;
    punkty=centery+lang*sin(alfa);
    //punkty=2*alfa;

  }
  void zeichne_linie(){//draw the connection from center to actual circle
    stroke(255,60);
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
  for (int a=0;a<anzahl;a++){
    println(auswahl);
    switch(auswahl){
    case 1:
      schwengel[a]= new Schwengel(0,0,140/(2*a+1),0.01*(2*a+1),0,5,color(200,200,200)); // Rechteckschwingung - n ungerade, bn=1/n
      schwengel[0].centerx=300;
      break;
    case 2:
      schwengel[a]= new Schwengel(0,0,100*pow(-1,(a+2)%2)/(a+1),(a+1)*0.01,0,5,color(200,200,200));//kipp n ungerade , alternierend 1/n
      schwengel[0].centerx=450;
      break;
    case 3:
      schwengel[a]= new Schwengel(0,0,-300*pow(-1,(a+2)%2)/((2*a+1)*(2*a+1)),0.01*(2*a+1),0,5,color(200,200,200)); // Dreieck - n ungerde, alternierend   n=1/n*n
      schwengel[0].centerx=300;
      schwengel[0].lang=120;
      break;
    case 4:
      schwengel[a]= new Schwengel(0,0,180/((a+1)*(a+1)),(a+1)*0.01,0,5,color(200,200,200));//alle 1/n*n
      schwengel[0].centerx=300;
      break;
    case 5:
      schwengel[a]= new Schwengel(0,0,140/(2*a+1),0.01*(2*a+1),pow(-1,(a+1)%2)*PI/2,5,color(200,200,200));
      schwengel[0].centerx=300;
      break;
    case 6:
      schwengel[a]= new Schwengel(0,0,60*(2*a+1+(2*a+1))*abs(pow(-1,(-1+(a+1)%3)))/((2*a+1)*(2*a+1)),   0.01*(2*a+2),pow(-1,(a+2)%2)*PI/4,  5,  color(200,200,200));
      schwengel[0].centerx=300;
      break;
    case 7:
      schwengel[a]= new Schwengel(0,0,140/(2*a+1),0.01*(2*a+1),pow(-1,(a+1)%2),5,color(200,200,200));
      schwengel[0].centerx=300;
      break;
    case 8:
      schwengel[a]= new Schwengel(0,0,100/((a+1)),(a+1)*0.01,PI*pow(-1,(a+1)%2),5,color(200,200,200));
      schwengel[0].centerx=300;
      break;
    }
  }
  schwengel[0].centery=300;
  schwengel[anzahl-1].farbe=color(255,0,0);//the last circle: big and red
  schwengel[anzahl-1].big=10;
}


void draw() {
  background(100,100,100);
  for(int i=0;i<anzahl;i++){
    schwengel[i].rotieren();
    schwengel[constrain(i+1,1,anzahl-1)].centerx=schwengel[i].punktx;//the circle is the center of rotation for the following circle
    schwengel[constrain(i+1,1,anzahl-1)].centery=schwengel[i].punkty;//after anzahl-1 there is no following circle
  }
  for(int j=0;j<anzahl;j++){    
   schwengel[j].zeichne_linie();//drawing the connecting lines
   }

  if(i==anzahl-1){//here the ordinary way doesn´t work
    line(schwengel[anzahl-2].punktx,schwengel[anzahl-2].punkty,schwengel[anzahl-1].centerx,schwengel[anzahl-1].centery);
  }
  for(int k=0;k<anzahl;k++){
    schwengel[k].zeichne_kreis();//drawing the circles
  }
}

















