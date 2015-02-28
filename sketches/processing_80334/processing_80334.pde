
float angle=0.0;


void setup() {
  size(1200, 820);
  background(54);
  strokeWeight(0.5);

  smooth();

frameRate(6);
}

void draw() {

  angle += 0.1;
  float valorSeno = sin(angle);
  float valorCoseno = cos(angle); 

int time=millis();





  
  
  
  
  
  ////////////////////////////////////////////////
  
  for (int i=0; i <=630; i+=2) {     //me falta que no se repia todo el rato



  
  float r =map(valorSeno, -1, 1, 0, i);  // el valor seno, despues va desde menos uno a mas uno, y despues desde que color, hasta q otro color... cada una de estas es R G B CON ESTO CAMBIA EL FONDO DE COLOR CONSTANTEMENTE
    float g =map(valorSeno, -1, 1, 0, 120);
    float b =map(valorCoseno, -1, 1, 0, 255);

    fill(100+r, g,100+ b, 7);
    stroke(255, 255, 255, i);

    pushMatrix();
    translate(2*width/2.9, height/1.8);//divide el canvas en 4, punto inicial al medio
    rotate(radians(i^20));//gira la composiicion
     //rotate(radians(i*i));


    //rect (12.5+i,0,2+i/2,2+i/2);
    //rect (12.5,0,2+i/2,2);
    rect (12.5, 0, 2+i/2, 2+i/2);
    
    
  
    popMatrix();
    
  }
  
  
  //////////////////////////////////////////////////////////////////////7
  
  
  for (int i=0; i <=380; i+=8) {     //me falta que no se repia todo el rato



  
  float r =map(valorSeno, -1, 1, 0, i);  // el valor seno, despues va desde menos uno a mas uno, y despues desde que color, hasta q otro color... cada una de estas es R G B CON ESTO CAMBIA EL FONDO DE COLOR CONSTANTEMENTE
    float g =map(valorSeno, -1, 1, 0, 120);
    float b =map(valorCoseno, -1, 1, 0, 255);

    fill(r, g, b, 7);
    stroke(255, 255, 255, i);

    pushMatrix();
    translate(width/5.7, height/4);//divide el canvas en 4, punto inicial al medio
    rotate(radians(i^20));//gira la composiicion
     //rotate(radians(i*i));


    //rect (12.5+i,0,2+i/2,2+i/2);
    //rect (12.5,0,2+i/2,2);
    rect (12.5, 0, 2+i/2, 2+i/2);
    
    
  
    popMatrix();
    
    
    
   
    
  }
  
  
  
  
  ////////////////////////////////////////////////
  
 for (int i=0; i <=310; i+=18) {     //me falta que no se repia todo el rato



  
  float r =map(valorSeno, -1, 1, 0, i);  // el valor seno, despues va desde menos uno a mas uno, y despues desde que color, hasta q otro color... cada una de estas es R G B CON ESTO CAMBIA EL FONDO DE COLOR CONSTANTEMENTE
    float g =map(valorSeno, -1, 1, 0, 120);
    float b =map(valorCoseno, -1, 1, 0, 255);

    fill(150+r, 50+g, b, 7);
    stroke(255, 255, 255, i);

    pushMatrix();
    translate(width/5.7, 3.2*height/4);//divide el canvas en 4, punto inicial al medio
    rotate(radians(i^20));//gira la composiicion
     //rotate(radians(i*i));


    //rect (12.5+i,0,2+i/2,2+i/2);
    //rect (12.5,0,2+i/2,2);
    rect (12.5, 0, 2+i/2, 2+i/2);
    
    
  
    popMatrix();
    
    
    
   
    
  }
 
  ////////////////////////////////////////////////////////////////////////
  
  if(time > 35000){
  
  
  stop();
  
}
    
}
