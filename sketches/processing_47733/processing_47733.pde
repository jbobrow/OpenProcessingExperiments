
float gap = 5.0;

PImage bild;


void setup(){
  size(634,477);
  smooth();
  bild = loadImage("bildportrait.jpg");
  
}


void draw(){
 background(0);
 noStroke();

for(int i = 0; i < width/gap; i++){
for(int j = 0; j < height/gap; j++){
  
  float val = brightness( bild.get(int(gap*i),int(gap*j)))/255;
  
  float valR = red( bild.get(int(gap*i),int(gap*j)))/255;
  float valG = green( bild.get(int(gap*i),int(gap*j)))/255;
  float valB = blue( bild.get(int(gap*i),int(gap*j)))/255;
  


strokeWeight(val);

pushMatrix();
rotate(radians(mouseX/200));
stroke(255,0,0,220);
line(gap*i,gap*j,gap*i+valR*gap,gap*j+valR*gap);
popMatrix();

pushMatrix();
rotate(radians(mouseY/200));
stroke(0,255,0,200);
line(gap*i,gap*j,gap*i+valG*gap,gap*j+valG*gap);
popMatrix();

pushMatrix();

stroke(0,0,255,150);
line(gap*i,gap*j,gap*i+valB*gap,gap*j+valB*gap);

popMatrix();


  
}  
}
  
}

