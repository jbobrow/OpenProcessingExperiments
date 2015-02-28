
class Squid {
  ArrayList<fisharm> tentacles = new ArrayList();
  float aantal = 40.0;
  fisharm mytentacle;
  float objectX, objectY;
  float objx = 160; // variabelen van Jmyron video shizzle
  float objy = 120; // variabelen van Jmyron video shizzle
  int afstandtent =0;
  int limiettent = 100; // limiet tentacles
  int speedtent = 4; // snelheid tentacles
  float x,y,z;
  float xs, ys;
  boolean omhoogtent = false;
  
  
  

  Squid(float tempx, float tempy, float tempz) {
    x = tempx;
    y = tempy;
    z = tempz;
    ys = 1.0*tempz/20.0; //speed
    smooth();

    for (int i = 0;i<aantal;i++) {
      fisharm mytentacle = new fisharm();
      tentacles.add(mytentacle);
    }
  }

  void check(float yy) {
    if (yy<-150) {
      y = height;
      x = width/2+random(-200,200);
    }
  }

/*void shit(){ 
  objectX = width/2;
  objectY = height/2;
}*/



    float angle(float x,float y, float x1,float y1){
    float a = degrees( atan2(y1-y, x1-x) );
    return a; 
    }



    void awayFromMouse(float x1, float y1, float x2, float y2){
    float an = angle(x1, y1, x2, y2);
    
    /* deze speed var past de snelheid aan. let op als je dat te hoog zet 
    zijn ze onmiddellijk weg. Aangezien de kans bestaat dat je ze allemaal
    buiten beeld duwt heb ik de check() functie ook aanpassing gegeven: de x
    ligt bij spawn terug binnen de schermcoordinaten (zelf kleiner) */
    
    float speed = 1.50;
    float xx = x1 - cos(radians(an)) * speed;
    float yy = y1 - sin(radians(an)) * speed;
    x = xx;
    y = yy;
    }




  void draw(float w) {
    xs = random(-.5, .5);
    x-=xs;
    y-=ys;
    check(y);
    strokeWeight(.015);
    // aanroepen van de functie zat er niet in.
    awayFromMouse(x, y, mouseX,mouseY);
    
        if(afstandtent>limiettent){
    omhoogtent=false;
  }
    if(afstandtent<0){
    omhoogtent=true;
  }

  if(omhoogtent){
    afstandtent+=speedtent;
  }
  else{
    afstandtent-=speedtent;
  } 

    pushMatrix();
    translate(0, 0, -z);
    for (int i = 0;i<aantal;i++) {
      pushMatrix();
      float wave = abs((5+w)*sin(frameCount/(40.0)));
      float wave2 = wave+abs(50.0*sin(10+i/5.0*frameCount/600.0));

      translate(x, y);
      rotateY(i*(360.0/aantal)+frameCount/100.0);
      stroke(155, 130, 100, 40); //kleuren
      fill(55+wave, 60+wave*4.0, 140+wave, 250);

      triangle(0, -25, 50+wave, 30, 60, 30);
      
      


      pushMatrix(); // onderste triangle
      translate(20, 90+(20*abs(sin(frameCount/25.0))));

      //float bright = random(0,255);
  
      triangle(0, -25, 50+wave, -50, -25, -50);

      popMatrix();

      /* hier is een nieuwe pushpop die de arm tekent op de juist locatie
       ik heb die in het wit gezet voor de duidelijkheid. kan je terug wegdoen
       uiteraard. */
      stroke(255,50);
      strokeWeight(.25);
      pushMatrix();
            tentacles.get(i).fisharmdraw(40-wave2/2+wave*4, 80+wave2);
            //tentacles.get(i).fisharmdraw(afstandtent, afstandtent);
      popMatrix();

      noStroke();
      
      fill(255,0,0,30);
      ellipse(0, 40, 50, 60);
      

      //quad(0,0,(50+wave)/2,-25,50+wave,0,(50+wave)/2,25);
      pushMatrix();

      translate(40-wave2/2+wave*4, 80+wave2);
      stroke(5, 130, 100, 40); //kleur van de kleine boxen

      box(4, 4, 4);    


      


      popMatrix();
      popMatrix();
      
              
     
      
    }
    popMatrix();
  }
}


