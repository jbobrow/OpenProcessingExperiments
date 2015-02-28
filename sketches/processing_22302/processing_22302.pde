
  float inc = 3;  

float dim = 200;   

boolean isBackGround = true;  

boolean isFade = false;  

int LONGITUD = 200;  

int NUM_TALLOS = 10;  

void setup() {  

  size(700,200);  

   

  smooth();  

}  

void draw() {  

   

  if ( isBackGround  == true){   

    background(118,24,24);  

  }   

  if (isFade) hazFade();  

  inc += 0.1;  

  float angle = sin(inc) /60.0 ;  

  translate(width/2,height/2);   

  for (int i = 0; i < NUM_TALLOS; i++) {   

    tail(0,dim/3, LONGITUD, angle);   

    rotate(PI*8/NUM_TALLOS);  

  }  

  fill(209,49,209,180);  

  stroke(152,76,52,500);  

  ellipse(0,0,dim,dim);  

}  

void tail(float x,float y, int units, float angle) {  

  pushMatrix();  

  translate(x, y);  

     

  for (int i =0 ; i < units; i++) {  

    rotate(angle);  

    translate(0,2);  

    line(10, 168, 180, 20);  

    line(0,16,10,50);  

       

       

  }  

  fill(227,18,168,500);  

  stroke(116,21,400,300);  

  strokeWeight(1);  

  ellipse(0,0,20,50);  

  popMatrix();  

}  

   

void hazFade(){  

  isBackGround = false;  

  fill(255,255,100);  

  noStroke();  

  rect(0,0,width,height);  

}  

   

void keyPressed() {  

  switch(key) {  

  case '+':   

    println("has pulsado la tecla +");  

    break;  

  case '-':   

    println("has pulsado la tecla -");  

    break;  

   

  case 'F':   

  case 'f':  

    isFade = !isFade;  

    break;  

  case 's':   

  case 'S':   

    println("salvamos IMAGEN");  

    save("out/filename-"+frameCount+".png");  

    break;  

   

  case 'b':   

  case 'B':   

    isBackGround =! isBackGround;  

   

    break;  

  }  

} 
 
