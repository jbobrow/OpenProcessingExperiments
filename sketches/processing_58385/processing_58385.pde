
int w = 600;
int h = 600;
int gX = 0;
int gY = 600;
int sP = 15;
int space = 50;


//Controls: A,D = circle size
        //  W,S = adjust color
        //  R,F = blend glitch

void setup() {
  background(0);
  size(600, 600);
}
void draw() {

   kreis (0, 255, 255, 255, 50);
rot();
  smooth();
  holeMove(1);
  println(gX);
 bHole(gX, gY, 500, 255);

 
 erase();


 
 
}


void bHole(int cuX, int cuY, int cuSize, float bHfill) {
  fill(bHfill);
  ellipseMode(CENTER);
  if(keyPressed){
   if(key =='d'){
     gX=gX+1;}
   if(key =='a'){
     gX=gX-1;}
   if(key =='s'){
     gY=gY+(sP);}
   if(key =='w'){
     gY=gY-(sP);}
   if(key =='r'){
     sP=sP+2;}
   if(key =='f'){
     sP=sP-2;}
     if(mousePressed){
       sP=0;
     }
 }
 cuX = width/2;
 cuY = height/2;
 
 fill((random(gY)),(random(gY)),(random(gY)));
  //ellipse(gX, gY, cuSize, cuSize);
  blend(0, sP, w, h, 0, 0, h, w, DIFFERENCE);
  

  
  
}

void rot(){
   if(key =='t'){
    
 pushMatrix();
 translate(0,10);
 popMatrix();}

}

void holeMove(int holeSpeed){
  gX=gX+1;
  if(gX<80){
    gX=gX-1;
  }
}

void erase(){
 if(keyPressed){
   if(key =='b'){
     background(0);
   }}}

void kreis (float kontur, float _r, float _g, float _b, float _alpha) {
  noStroke();
  strokeWeight(kontur);
  fill((random(gY)),(random(gY)),(random(gY)));

  for (int x = 15; x < width; x += space) {
    for (int y = 15; y < height; y += space) {
      ellipse(x,y,gX,gX); 

  }}
}


