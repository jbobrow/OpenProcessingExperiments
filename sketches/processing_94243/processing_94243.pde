

//first cicle
float xPos; 
float yPos; 

float angle; 
float angle_rad; 
float xPos2; 
float yPos2; 
float xPos_new;  
float yPos_new; 

// second circle 
float xPos3; 
float yPos3;  
float speed1 = 1; 
float speed2 = 4;



void setup() {
  size(300, 300); 

  noStroke(); 
  xPos = width/2; 
  yPos= height/2;
  angle = 0.0; 

  xPos3= 0.0; 
  yPos3 =  0.0;
}



void draw() {

  // transparenz des schweifs....
  fill(100, 10); 
  rect (0, 0, height, width);


 /* fill (255, 255, 255); 
  ellipse(xPos, yPos, 3, 3);*/

  if (angle <= 180) {
    angle = angle + 1.0 ;  
    angle_rad= angle* 2*PI/ 180; 
    xPos2 = cos(angle_rad) *50; 
    yPos2 = sin(angle_rad) *50 ; 

    xPos_new = xPos + xPos2; 
    yPos_new = yPos + yPos2;  

    fill (255, 255, 255); 
    ellipse(xPos_new, yPos_new, 13, 13);

    /* 
     fill(255, 255, 255); 
     line(xPos, yPos, xPos_new, yPos_new); 
     */
  }

  else {
    angle = 0.0 ;
  }

  fill (200); 
  ellipse(xPos3, yPos3, 13, 13 ); 

  if (yPos3 > height || yPos3 < 0 ) {
    
      speed2 = speed2 * -1; 
    
  }
  if (xPos3 > width || xPos3 < 0 ) {
    
      speed1 = speed1 * -1;
     
  }
  if (mousePressed){ 
  
  speed1 = speed1 * -1;
    
    } 
    
    if (mousePressed){
    speed2 = speed2 * -1;
    
    }
    
   
xPos3 = xPos3 + speed1; 
yPos3 = yPos3 + speed2;

}

/* diese Methode soll nach satz des Pythagras, dn abstand der Kugel vom Mittelunkt,
   und diesen nie Überschreiten, d.h. sobald der kleiner null ist soll der Ball 
   die Richtung ändern */  

float Pytho(float x1, float y1, float x2, float y2, float r1, float r2){

  float result;  
  float a;
  float b; 
  float c;    
  
  // Abstand der beiden Kreismittelpunte voneinander 
  
  c = dist (x1, x2, y1, y2); 
  c = c - (r1+r2); 
 
  

return c; 
}




