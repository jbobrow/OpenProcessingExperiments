
float inc = 20;
float dim = 500;
boolean isBackGround = true;
boolean isFade = false;
int LONGITUD = 100;
int NUM_TALLOS =15;
int[] xpos = new int[40];
int[] ypos = new int[40];
 
void setup() {
  size(700,700);
  smooth();
  for(int i=0; i < xpos.length; i++) {
    xpos[i]=0;
    ypos[i]=0;
 }
   
}
 
void draw() {
  if ( isBackGround  == true)
  background(250,250,208);
  for (int i = 0; i < xpos.length-1; i ++ ) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  
  xpos[xpos.length-5] = mouseX;
  ypos[ypos.length-5] = mouseY;
 
  for (int i = 0; i < xpos.length-150; i ++ ) {
 
    noStroke();
    fill(155,150,20);
    rect(xpos[i],ypos[i++],i/2,i*100);
  }
    for (int b = 1; b < ypos.length-10; b++ ) {
    noStroke();
    fill(150,50,90,20);
    ellipse(xpos[b],ypos[b++],b*5,b*5);
  }
    for (int c = 2; c < ypos.length-1; c++ ) {
    noStroke();
    fill(120,10,150,40);
    ellipse(50,ypos[c++],c,c);
  }
    for (int d = 5; d < ypos.length-9; d++ ) {
    noStroke();
    fill(0,50,50,30);
    ellipse(600,ypos[d++],d*2,d*2);
  }
  int a = 5;
  while (a < width) {
    noStroke();
    float distance = abs(mouseY - a);
    fill(120,20,30,10);
    rect(a,1,1,width);
    a += 5;
  }
  
  if (isFade) hazFade();
  inc += 0.03;
  float angle = sin(inc) /10.0 ;
  translate(width/2,height/2);
  for (int f = 0; f < NUM_TALLOS; f++) {
    tail(50,dim/3, LONGITUD, angle);
    rotate(PI*2/NUM_TALLOS);
  }
  fill(255,20,20,20);
  stroke(55,20,20,40);
  ellipse(0,0,dim*3,dim*3);
}
void tail(float x,float y, int units, float angle) {
  pushMatrix();
  translate(x, y);
   
  for (int f =0 ; f < units; f++) {
    rotate(angle);
    translate(0,1);
    line(150, 158, 180, 20);
    line(0,16,10,50);
     
     
  }
  fill(209,0,116,10);
  stroke(209,0,116,10);
  strokeWeight(1);
  ellipse(0,0,100,100);
  popMatrix();
}
 
void hazFade(){
  isBackGround = false;
  fill(209,0,116,0);
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

