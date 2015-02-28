


/*<pre>
W / S - zoom in out
left / right - add remove legs;
up / down - add remove segment to leg;
- / + - change decay (scaling factor, press - a bunch to make it go above one)</pre>
*/

float boxsize=100;
int branches=10;
int steps=20;
float decay=0.9;
float cor=30;
float wave=1.8*PI;
float freq=0.075;
float wave2=0.7*PI;
float freq2=0.05;
float wave3=0;
float freq3=0.02;
float zoom=-900;
int pointerX;
int pointerY;

void setup(){
  noCursor();
  frameRate(60);
  colorMode(HSB,255);
  size(800,600,P3D);
  noSmooth();
  noStroke();
}

void draw(){
  // pointerX=mouseX;
  pointerY=mouseY;
  pointerX=mouseX;

  if (wave+hz(freq)>2*PI) { //if the new wave will be over 2PI ...
    wave=(wave+hz(freq)-2*PI); //then roll it over 
  } 
  else {
    wave+=hz(freq); //otherwise just add the increment to wave
  }

  if (wave2+hz(freq2)>2*PI) { //if the new wave will be over 2PI ...
    wave2=(wave2+hz(freq2)-2*PI); //then roll it over 
  } 
  else {
    wave2+=hz(freq2); //otherwise just add the increment to wave
  }

  if (wave3+hz(freq3)>2*PI) { //if the new wave will be over 2PI ...
    wave2=(wave3+hz(freq3)-2*PI); //then roll it over 
  } 
  else {
    wave3+=hz(freq3); //otherwise just add the increment to wave
  }


  background(255);

  lights();

  pushMatrix();
  translate(width/2,height/2,zoom);
  rotateX(-TWO_PI*((pointerY-height/2)*1.0 / height));
  rotateY(-TWO_PI*((-pointerX-width/2)*1.0 / width));
  for(int i=0;i<branches;i++){


    boxtree(boxsize,steps,decay,cor);  
    rotateZ(TWO_PI/branches);
  }
  rotateX(PI);
  for(int i=0;i<branches;i++){
    boxtree(boxsize,steps,decay,cor);  
    rotateZ(TWO_PI/branches);
  }

  popMatrix();

}

void boxtree(float fat, int i, float factor, float col){
  fill(col);

  pushMatrix();
  for (int j=i;j>1;j-=1){
    if(col+col*(1/decay)>255){
      col=col+col*(1/decay)-255;
    }
    else{
      col+=col*(1.0/decay);
    }
    fill(col,255,255);
   noStroke();
   box(fat);
   // thingy(fat);

    rotateZ(0.25*PI*sin(wave));
    rotateX(0.6 * (sin(wave2)+1)/2);
    fat=fat*factor;

    translate(0,0,fat);

  }
  popMatrix();

}

void keyPressed(){
  if (key=='-'){
    decay=decay+0.025;
    if (decay>1){
      print("  yo decays big man ");
    }
  } 
  else if (key=='='){
    decay=decay-0.025;
  } 
  else if (keyCode==RIGHT){
    branches++;
  } 
  else if (keyCode==LEFT){
    branches--;
    if (branches<1){
      branches=1;
    }
  } 
  else if (keyCode==UP){
    steps++;
    print(steps+" ");
  } 
  else if (keyCode==DOWN){
    steps--;
    if (steps<1){
      steps=1;
    }
  } 
  else if (key=='s'){
    zoom=zoom*1.2;
  } 
  else if (key=='w'){
    zoom=zoom/1.2;
  }

}

float hz(float x) { //take in our desired freq as X
  return((2*PI*x)/frameRate); //2PI is one complete cycle, so multiply by freq and divide by frame
}

void thingy(float fatness){
  beginShape(TRIANGLES);
  vertex(-fatness/2,fatness/3,0);
  vertex(fatness/2,fatness/3,0);
  vertex(0,-fatness/2,0);
  endShape();
    beginShape(TRIANGLES);
  vertex(-fatness/3,fatness,20);
  vertex(fatness/3,fatness,20);
  vertex(0,-fatness/3,20);
  endShape();
 



}




