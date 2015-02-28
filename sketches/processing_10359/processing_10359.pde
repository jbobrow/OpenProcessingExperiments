
// IDEP 2010
///Ana Paula Carvalho
////Modificando


float angle = 1; // Current angle
float speed = 0.01; // velocidade que desenha as linhas
float radius = 70.0; // Tamanho circulo
float sx = 4.0;
float sy = 4.0;
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
      float sx4 = 6.0;
      float sy4 = 6.0;
      float x6 =  width/1.5 + sin(angle) * radius;
      float y6 = height/1.5 + cos(angle) * radius;
        ellipse(x6, y6, 1, 1); // Draw smaller circle
      // Set the position of the large circles based on the
      // new position of the small circle
      float x5 = x6 + cos(angle * sx4) * radius;
      float y5 = y6 + sin(angle * sy4) * radius;
       ellipse(x5, y5, 1, 1); // Draw larger circle
       //line 
  if(hh<100){
    hh+=1;
  } 
  else{
    hh--;
  }
      col = color(9,9,9+hh,15);
  stroke(devuelveColor(),hh);
  line(x5,y5,x6,y6);
      println("key 1 : sx:   "+sx +"  sy:" + sy);
    }
    
    
        if(key == '2') {
      float sx4 = 6.0;
      float sy4 = 6.0;
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
    
    
    if(key == '3') {
      float sx2 = 5.0;
      float sy2 = 5.0;
      float x4 =  width/3.5 + sin(angle) * radius;
      float y4 = height/3.5 + cos(angle) * radius;
        ellipse(x4, y4, 1, 1); // Draw smaller circle
      // Set the position of the large circles based on the
      // new position of the small circle
      float x3 = x4 + cos(angle * sx2) * radius;
      float y3 = y4 + sin(angle * sy2) * radius;
       ellipse(x3, y3, 1, 1); // Draw larger circle
       //line 
  if(hh<100){
    hh+=1;
  } 
  else{
    hh--;
  }
      col = color(9,9,9+hh,15);
  stroke(devuelveColor(),hh);
  line(x3,y3,x4,y4);
      println("key 1 : sx:   "+sx +"  sy:" + sy);
    }
 
    
  
    
    
    if(key == '4') {
      float sx2 = 4.0;
      float sy2 = 4.0;
      float x4 =  width/7 + sin(angle) * radius;
      float y4 = height/7 + cos(angle) * radius;
        ellipse(x4, y4, 1, 1); // Draw smaller circle
      // Set the position of the large circles based on the
      // new position of the small circle
      float x3 = x4 + cos(angle * sx2) * radius;
      float y3 = y4 + sin(angle * sy2) * radius;
       ellipse(x3, y3, 1, 1); // Draw larger circle
       //line 
  if(hh<100){
    hh+=1;
  } 
  else{
    hh--;
  }
      col = color(9,9,9+hh,15);
  stroke(devuelveColor(),hh);
  line(x3,y3,x4,y4);
      println("key 1 : sx:   "+sx +"  sy:" + sy);
    }
    
   
    
    if(key == '5') {
      fill(0, 30);
      noStroke ();
      rect(0, 0, width, height);
    }
    if(key == '6') {
      noLoop();  
    }
  }


