
//declaring variable
float circlex;
float circley;
float vely = 3;
float velx = 5;

void setup(){
  background(255);
  smooth();
  frameRate(60);
  size(500,500);
}

void draw(){
  fill(255,227,8);
  //noStroke();
  strokeWeight(3);
  circlex+=velx;
  circley+=vely; // the same as circley=circley+vel
  ellipse(250,circley,circley,circley);
  if((circlex<0)||(circlex>width)){
    velx=velx*-1;
  }
  if((circley<0)||(circley>height)){
    vely=vely*-1;
  }
  
}
   //same as vel=vel

