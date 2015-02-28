
//declaring variable
float circlex;
float circley;
float vely = 10;
float velx = 5;

void setup(){
  background(255);
  smooth();
  frameRate(60);
  size(1000,180);
}

void draw(){
  fill(random(200,255),random(200,255),0);
  //noStroke();
  strokeWeight(3);
  circlex+=velx;
  circley+=vely; // the same as circley=circley+vel
  ellipse(circlex,circley,40,40);
  if((circlex<0)||(circlex>width)){
    velx=velx*-1;
  }
  if((circley<0)||(circley>height)){
    vely=vely*-1;
  }
  
}
   //same as vel=vel

