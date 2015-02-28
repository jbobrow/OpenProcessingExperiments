

 
void setup()
{
  size(500,500);
  smooth(); 
  noFill();
  strokeWeight(8.0);
  //strokeCap(ROUND);
 
  colorMode(HSB, 360, 100,100,100);
   background(0,0,0);
}
 
void draw(){
  //background(0); 

  translate(width/2, height/2);
  rotate(radians(-90));
  
  noFill();
  

   

   

   // min
  float m = minute();
  float mMap = map (m, 0,59, 0, 360);// 0 a 12 para 0 a 360: resultado e um numero de 0 a 360
  float angle_minute = radians (mMap);
  float hM = map ( m, 0, 59, 0, 360);// mapear o HUE
  
  stroke(hM,100,100);
  arc(0, 0, 410, 410, 0, angle_minute);

  // horas
  float h = hour(); // - 0 a 24
  float h12 = h % 12; // 0 a 12
  float hMap =   map (h12, 0,12, 0, 360);// 0 a 12 para 0 a 360
  float angle_hour = radians (hMap);
  float hH = map ( h12, 0, 12, 0, 360);// mapear o HUE
  
  stroke(hH,100,100);
  arc(0, 0, 380, 380, 0, angle_hour);

   


  
    // sec
  float s = second() ;
  float sMap = map (s, 0,59, 0, 360);// 0 a 12 para 0 a 360: resultado e um numero de 0 a 360
  float angle_second = radians (sMap);
  float angle_first = radians (sMap-5);
  
  float hS = map ( s, 0, 59, 0, 360);// mapear o HUE
  
  stroke(hS,100,100, 30);
  arc(0, 0, 430, 430, angle_first, angle_second);
  
    noStroke();
  fill(360,0,0, 1);
  rect(-width/2,-height/2, width, height);
  
    //millis
  float ms = millis();
  float msMap = map (ms, 0,59, 0, 360);
  float angle_milli = radians (msMap);
  float angle_dois = radians (msMap-25);
  float hMS = map (ms, 0, 59, 0, 360);
  
  stroke(hMS,100,100, 30);
  arc(0, 0, 450, 450, angle_dois, angle_milli);
  
  
  noStroke();
  fill( random (255), random (255), random(255));
  ellipse (0, 0, 20,20);
  
  
  
  
    noStroke();
  fill(360,0,0, 20);
  rect(-width/2,-height/2, width, height);
  
}
 



