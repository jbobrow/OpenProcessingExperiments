
float posX;
float posY;
float fke = 0.01;

void setup(){
 size(800,600);
 frameRate(20);
 background(255);
 smooth();
  
}


void draw(){
  
noStroke();
fill(255,255,255,20);
rect(0, 0, width, height);

translate (posX,posY);
    rotate (90/3*fke);

  for (int i=0; i<100000; i++){
    noStroke();
 fill (random(255), random(255), random(255), random(255));
 fke = fke + .01;
 posX = noise(fke*i) * width;
 posY = noise(fke*i) * height;
 ellipse (posX+i, posY+i, random(30), random(30));
 
  }
  
  translate (posX,posY);
    rotate (PI/3*fke);
  
  for (int x=0; x<500; x++){
    noStroke();
     fill (random(255), random(255), random(255), random(255));
 posX = noise(fke*x) * width;
 posY = noise(fke*x) * height;
 rect ((posX-x), posY-x, random(20),random(20));
  }
  
 
}

