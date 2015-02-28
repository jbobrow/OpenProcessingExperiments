
int i=0; //the number of actually activ objects
int anzahl=25;//maximum number of objects
Schwengel[]  schwengel;

class Schwengel{ //the coloured circles with a line rotating around the previous circle
  float centerx,centery,lang,omega,alfa,big,punktx,punkty;
  // that means: center of rotation, length of the rotating line, speed of rotation, angle, diameter of the circle,
  //and the location of the outer circle that is rotated.
  color farbe;
  int reflected=0;
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
  //and the the center of the next object must be set at the position of the actual outer circle
  void rotieren(){//let the angle grow, get the new position of the circle
    alfa=alfa+omega;
    punktx=centerx+lang*cos(alfa);
    punkty=centery+lang*sin(alfa);
    if(punktx<0||punkty<0||punktx>width||punkty>height){//reflect the circels from at the walls.
      //if they meet the wall, all rotation is turned
      umdrehen();
    }
    else{
      reflected=0;// reflected soll verhindern, dass die funktion ständig hin und her springt
      //nach umkehrung wird nicht sofort wieder umgekehrt. hier wird reflected zurückgesetzt, wenn 
      //alles wieder ok.
      //und nun ein wenig zufall, um hin- und her-reflektionen zu vermeiden:
      if(random(0,100)>99.97){
        schwengel[ceil(random(2,15))].omega=-schwengel[ceil(random(1,19))].omega;
        println("x");
       }
    }
  }

  void umdrehen(){//turn  the rotation to the other side
    if(reflected==0){//nur, wenn nicht eben schon umgedreht
      for (int a=0;a<anzahl;a++){
        schwengel[a].omega=-schwengel[a].omega;
      }

         reflected=1;

    }
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
  schwengel[0]=new Schwengel(width/2,height/2,random(20,60),random(0.01,0.04),0,random(10,30),color(random(50,250),random(50,250),random(50,250),190));// we start with one object activ

}

void draw() {
  background(40,35,30);
  for(int i=0;i<anzahl;i++){
    schwengel[i].rotieren();
    schwengel[constrain(i+1,1,anzahl-1)].centerx=schwengel[i].punktx;//the circle is the center of rotation for the following circle
    schwengel[constrain(i+1,1,anzahl-1)].centery=schwengel[i].punkty;//after anzahl-1 there is no following circle
  }
  stroke(60);
  for(int j=0;j<anzahl;j++){    
    schwengel[j].zeichne_linie();
  }
  fill(60);
  stroke(60);
  ellipse(width/2,height/2,10,10);//the innermost circle - static
  if(i==anzahl-1){//here the ordinary way doesn´t work
    stroke(255);
    line(schwengel[anzahl-2].punktx,schwengel[anzahl-2].punkty,schwengel[anzahl-1].centerx,schwengel[anzahl-1].centery);
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
    schwengel[i].lang=random(30,60);
    schwengel[i].omega=random(-0.04,0.04);
    if(abs(schwengel[i].omega)<0.001){//not too slow
      schwengel[i].omega=schwengel[i].omega*2;
    }
    schwengel[i].alfa=random(0,6.4);
    schwengel[i].big=random(10,30);
    schwengel[i].farbe=color(random(50,250),random(50,250),random(50,250),190);
    //a new circle should not be created outside the screen. In that case, it will be turned 180 degrees .
    if(schwengel[i].centerx+schwengel[i].lang*cos(schwengel[i].alfa)<0||schwengel[i].centerx+schwengel[i].lang*cos(schwengel[i].alfa)>width){
      schwengel[i].alfa=schwengel[i].alfa+PI;
    }
    if(schwengel[i].centery+schwengel[i].lang*sin(schwengel[i].alfa)<0||schwengel[i].centery+schwengel[i].lang*sin(schwengel[i].alfa)>height){
      schwengel[i].alfa=schwengel[i].alfa+PI;
    }
  }
}

















