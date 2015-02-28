
// IDEP 2010
///Ana Paula Carvalho
////Modificando


float angle = 1; // Current angle
float speed = 0.01; // velocidade que desenha as linhas
float radius = 90.0; // Tamanho circulo
float sx = 6.0;
float sy = 6.0;
float hh = 10;
color col;


void setup() {
  size(800, 600);
  noStroke();
  background(0);
  smooth();
}


void draw() {
  // EVENTOS
  if(keyPressed){
    
    if(key == '1') {
      float x =  width/2 + sin(angle) * radius;
      float y = height/2 + cos(angle) * radius;
      //parametros circulo principal
      ellipse(x, y, 1, 1); // Draw smaller circle
      // Set the position of the large circles based on the
      // new position of the small circle
      float x3 = x + cos(angle * sx) * radius;
      float y3 = y + sin(angle * sy) * radius;
      fill(0,0);
      ellipse(x3, y3, 30, 30); // Draw larger circle
      println("key 1 : sx:   "+sx +"  sy:" + sy);
    }
    
    
    
    if(key == '2') {
      float sx4 = 8.0;
      float sy4 = 10.0;
      float x6 =  width/2 + sin(angle) * radius;
      float y6 = height/2 + cos(angle) * radius;
        ellipse(x6, y6, 1, 1); // Draw smaller circle
      // Set the position of the large circles based on the
      // new position of the small circle
      float x5 = x6 + cos(angle * sx4) * radius;
      float y5 = y6 + sin(angle * sy4) * radius;
       //line 
  if(hh<100){
    hh+=1;
  } 
  else{
    hh--;
  }
      col = color(9,9,9+hh,15);
  stroke(216,221,60,hh);
  line(x5,y5,x6,y6);
      println("key 1 : sx:   "+sx +"  sy:" + sy);
    }
    
    
    
    
    
    if(key == '3') {
      float sx2 = 4.0;
      float sy2 = 5.0;
      float x4 =  width/2 + sin(angle) * radius;
      float y4 = height/2 + cos(angle) * radius;
        ellipse(x4, y4, 1, 1); // Draw smaller circle
      // Set the position of the large circles based on the
      // new position of the small circle
      float x3 = x4 + cos(angle * sx2) * radius+250;
      float y3 = y4 + sin(angle * sy2) * radius+250;
       //line 
  if(hh<100){
    hh+=1;
  } 
  else{
    hh--;
  }
      col = color(9,9,9+hh,15);
  stroke(4,225,0,hh);
  line(x3,y3,x4,y4);
      println("key 1 : sx:   "+sx +"  sy:" + sy);
    }
 
    
  
    
    
       if(key == '4') {
      float sx3 = 2.0;
      float sy3 = 6.0;
      float x5 =  width/2 + sin(angle) * radius;
      float y5 = height/2 + cos(angle) * radius;
        ellipse(x5, y5, 1, 1); // Draw smaller circle
      // Set the position of the large circles based on the
      // new position of the small circle
      float x4 = x5 + cos(angle * sx3) * radius-150;
      float y4 = y5 + sin(angle * sy3) * radius-250;
       //line 
  if(hh<100){
    hh+=1;
  } 
  else{
    hh--;
  }
      col = color(9,9,9+hh,15);
  stroke(119,238,157,hh);
  line(x4,y4,x5,y5);
      println("key 1 : sx:   "+sx +"  sy:" + sy);
    }
    
   
    
    if(key == '5') {
      fill(0, 30);
      rect(0, 0, width, height);
    }
    if(key == '6') {
      noLoop();  
    }
  }


