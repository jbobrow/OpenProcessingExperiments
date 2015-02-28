


//declaring variable
float circlex=0;
float circley=0;
float vely = 20;
float velx = 1;
float g = 0;

void setup(){
  background(0);
  smooth();
  frameRate(60);
  size(1000,180);
}

void draw(){

  fill(0,random(150,255),random(150,255),random(100,255));
  noStroke();
  strokeWeight(1);
  circlex+=velx;
  vely+=g;
  circley+=vely;
   // the same as circley=circley+vel
  ellipse(circlex,circley,random(40,50),random(40,50));
  if((circlex<0)||(circlex>width)){
    velx=velx*-1;
  }
  if((circley<0)||(circley>height)){
    vely=vely*-1;
  }
  
}
   //same as vel=vel
   //inserting picture
   

