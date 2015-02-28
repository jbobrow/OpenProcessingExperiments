
float r;
float x;
float y;
float theta=360*30;
int multi = 1;

float giro = 1; //360


void setup() {
    size(1200, 720);
    strokeWeight(2);
    noFill();
    smooth();
    background(0);
    frameRate(120);
}


void draw() {
    translate(width/2, height/2); // translate to center of screen
    //rotate(radians(theta));  
    rotate (giro);
    
    for (int i =0; i< 100; i++) {
      theta=theta+ multi*0.09;
              
      r = 360-theta/30;
        
          //limites para a espiral parar de ser desenhada 
          if (theta < 0 || theta >360*30) {
            multi = multi * -1; //alternando entre inteiro positivo e negativo: +1 -1
            break;
          }
                if (multi > 0) {
                  stroke(0,0,0);
                }
                if (multi < 0) {
                  stroke(255, 255, 255);
                }
               
              
      x =r*cos(radians(theta)); // radians para converter pi em radianos
      y =r*sin(radians(theta));
        
         
        
       point (x, y);    
       //rotate(radians(theta)); 
       
       giro = giro + 1; 
        
    }
} 

/*float amount = PI/2;
float twist = PI*2-30;

 rotate(millis()/1000000);

  beginShape();
  twist = 0;
  for (float i = 600; i > 20; i=i-8)
  {
    twist = twist + amount*sin((millis()/10000.0));
    curveVertex(sin(twist)*i,cos(twist)*i);
  }
  endShape();
  if(millis()>29500)
    noLoop();
}

*/
 

