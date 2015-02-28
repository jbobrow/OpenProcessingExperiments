
PImage b;
int gap = 10;

void setup(){
  size(460,640);
  b = loadImage("DSCF87133.jpg");
  smooth();
}

void draw(){
  background(0);
  noStroke();
//image(b,0,0);
  
  gap = 5+mouseX/50;
  
  strokeWeight(1);
  for(int i =0; i<width/gap; i++){
    for(int j =0; j<height/gap; j++){
      
      float val = brightness(b.get(int(gap*i),int(gap*j)))/255;
      
      fill(b.get(int(gap*i),int(gap*j)));
      stroke(25,0,0);
      line(gap*i,gap*j,gap*i,gap*j);
      rect(gap*i,gap*j,gap*i+val,gap*j+val);

if (keyPressed) {
  gap = 5+mouseX/100;
 stroke(25,0,0);
  ellipse(gap*i,gap*j,mouseX*val, mouseX*val);
  }}
}
}

