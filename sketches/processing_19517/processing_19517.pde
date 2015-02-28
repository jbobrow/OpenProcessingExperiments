
int p=25;
int n=1;
int v=1;
void setup(){
  size(400,325,P2D);
}

void draw(){
  //marco TV negro
  fill(20);
  stroke(100);
  for(int x=p;x<=width-p;x+=p){
    rect(x,p,p,p);
    rect(x,height-2*p,p,p);
    rect(x,height-3*p,p,p);}

  for(int y=p;y<=height-p;y+=p){
    rect(p,y,p,p);
    rect(width-2*p,y,p,p);
    rect(width-3*p,y,p,p);}
  
  //pix alrededor TV
  fill(255);
  stroke(200);
  for(int x=0;x<=width;x+=p){
    rect(x,0,p,p);
    rect(x,height-p,p,p);
  }
  for(int y=0;y<=height;y+=p){
    rect(0,y,p,p);
    rect(width-p,y,p,p);
  }
  
  rect(p,height-2*p,p,p);
  rect(width-2*p,p,p,p);
  
  //Invader cuando la TV recibe señal
  //marco blanco
  if (v<=10){
    fill(255);
    stroke(200);
    for(int x=2*p;x<=width-4*p;x+=p){
      for(int y=2*p;y<=height-4*p;y+=p){
      rect(x,y,p,p);}}
    fill(240,51,51);
    stroke(203,148,148);
    // invader
    rect(6*p,3*p,p,p);
    rect(8*p,3*p,p,p);
    for(int x=5*p;x<=9*p;x+=p){
      rect(x,4*p,p,p);
      rect(x-p,7*p,p,p);}
    rect(9*p,7*p,p,p);
    for(int x=5*p;x<=9*p;x+=2*p){
      rect(x,5*p,p,p);
      rect(x,6*p,p,p);}
    rect(3*p,8*p,p,p);
    rect(4*p,8*p,p,p);
    rect(6*p,8*p,p,p);
    rect(8*p,8*p,p,p);
    rect(10*p,7*p,p,p);
    rect(10*p,8*p,p,p);
    rect(11*p,8*p,p,p);
  }
  else {
    noStroke(); 
  //draw the "pixels"
  for(int i=2*p; i<height-3*p; i++){
    for(int j=2*p; j<width-3*p; j++){
      //pick a random grayscale value before drawing each rectangle. (thanks subpixel!)
      fill(int(random(256)));
      rect(j*n, i*n, n, n);}
    }
  }
v++;
if (v>=30){v=1;}
}

//Codigo para ruido TV extraido de: (code for tv noise taken from)
//http://www.openprocessing.org/visuals/?visualID=7011  
//inspired by www.space-invaders.com
//Space Invaders processing series http://www.flickr.com/photos/50ftw/5406771336/

