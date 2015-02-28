
float inc = 3;
float dim = 200; 
boolean isBackGround = true;
boolean isFade = false;
int LONGITUD = 200;
int NUM_TALLOS = 10;
void setup() {
  size(700,700);

  smooth();
}
void draw() {

  if ( isBackGround  == true){ 
    background(0,168,180);
  } 
  if (isFade) hazFade();
  inc += 0.1;
  float angle = sin(inc) /20.0 ;
  translate(width/2,height/2); 
  for (int i = 0; i < NUM_TALLOS; i++) { 
    tail(0,dim/3, LONGITUD, angle); 
    rotate(PI*8/NUM_TALLOS);
  }
  fill(0,168,180,100);
  stroke(100,255,255,500);
  ellipse(0,0,dim,dim);
}
void tail(float x,float y, int units, float angle) {
  pushMatrix();
  translate(x, y);
  
  for (int i =0 ; i < units; i++) {
    rotate(angle);
    translate(0,4);
    line(0, 168, 180, 20);
    line(0,16,10,50);
    
    
  }
  fill(0,0,0,50);
  stroke(100,255,255,500);
  strokeWeight(1);
  ellipse(0,0,50,50);
  popMatrix();
}

void hazFade(){
  isBackGround = false;
  fill(255,255,255,100);
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


