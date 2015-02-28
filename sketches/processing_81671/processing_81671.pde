
//import processing.opengl.*;

float s0 = second(); //einmal aktuelle sekunde


float m0 = minute();
//float m = mmm*6-90;

float h0 = hour();
//float hh = h*30-90;


void setup() {
  size(750, 750);
  smooth();
  background(255);
}


void draw() {

  //background(255);
  
  if (frameCount%6==0){
    
    noStroke();
    fill(255,25.5);
    rect(0,0,800,800);
  }
 
  
//  fill(255);
//
//  stroke(0); 
//
//  line(750/2, 0, 750/2, 750);
//
//  line(0, 750/2, 750, 750/2);

  noStroke();

  float milla = millis();


  //zeiger mit kleinen winkelschritten

  fill(255, 0, 0);

  float s1 = radians(6 * s0 + (s0 + milla)/1000*6-90);      // s0 * 6 - 90 = startwinkel aus aktueller sekunde beim start. 

  float x3 = width/2 + 300*cos(s1);
  float y3 = height/2 + 300*sin(s1);

  //ellipse(x1, y1, 10, 10);



  /*float m1 = radians(6 * m0  + (m0 + milla)/10000.0 -90);      // s0 * 6 - 90 = startwinkel aus aktueller minute beim start. 

  float x2 = width/2 + 250*cos(m1);
  float y2 = height/2 + 250*sin(m1);

  //ellipse (x2, y2, 10, 10);



  float h1 = radians(30 * h0 + (milla/1000/12)/10 - 90);      // winkel h1 erhöht sich alle 12 sekunden um 0.1 (0.1 * 5 * 60 = 30° pro stunde)

  float x3 = width/2 + 200* cos(h1);
  float y3 = height/2 + 200 * sin(h1);*/

  //ellipse (x3, y3, 10, 10);  





  //kontrollzeiger

  fill(0, 0, 0);

 float hr = radians(30*hour()-90); //pro stunde 30°   (-90° entspricht 12 Uhr)

 float x1 = width/2 + 250* cos(hr);
 float y1 = height/2 + 250 * sin(hr);
 
 //ellipse (x1, y1, 30, 30);


  float mi = radians(6*minute()-90); //pro minute 6°   (-90° entspricht 12 Uhr)

  float x2 = width/2 + 350*cos(mi);
  float y2 = height/2 + 350*sin(mi);
  
  //ellipse (x2,y2 , 30, 30);


//  float s =radians(6*second()-90); //pro sekunde 6°   (-90° entspricht 12 Uhr)
//
//  
//  float x3 = width/2 + 375*cos(s);
//  float y3 = height/2 + 375*sin(s);
  
  //ellipse(x3, y3, 30, 30);


 
  
  
  
  
    
    float slope1 = (y1-y2)/(x1-x2);
    float slope2 = (y2-y3)/(x2-x3);
  
    if(slope1!=slope2){
     
      float centerX = (slope1*slope2*(y3-y1) + slope1*(x2+x3) - slope2*(x1+x2))/(2*(slope1-slope2));
      float centerY = -1/slope1*(centerX-(x1+x2)/2)+(y1+y2)/2;
      float radius = dist(centerX, centerY, x2, y2);
      
      
      
      noFill();
      stroke(0);
      
      
     
      
      
      strokeWeight(2);
      ellipse(centerX, centerY, 2*radius, 2*radius);
      
      
    
  

  }

}


