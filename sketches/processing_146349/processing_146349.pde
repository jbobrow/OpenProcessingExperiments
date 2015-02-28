
PVector[] blob = new PVector[1132];
PVector[] blob2 = new PVector[1132];
PVector[] blobo = new PVector[1132];

void setup() {
  size (800,800);
  background(100,100,100);
  stroke(255);
  
  for (int i=0; i<blob.length; i++) {
    blob[i] = new PVector(random(width), random(height));
    blob2[i] = new PVector(random(255),random(255),random(255));
    blobo[i] = new PVector(blob[i].x, blob[i].y);
  }
}

void keyPressed() {
  if(key=='w'){
      fill(0,0,0,50);
      rect(0,0,width,height);
  }
    if(key=='s'){
      fill(255,255,255,50);
      rect(0,0,width,height);
  }
  if(key=='d'){
    stroke(255);
    for (int i=0; i<blob.length; i++) {
      blob[i] = new PVector(random(width), random(height));
      blob2[i] = new PVector(random(255),random(255),random(255));
      blobo[i] = new PVector(blob[i].x, blob[i].y);
  }  
}
}
  
void draw() {
  fill(50,50,50,1);
  rect(0,0,width,height);
  ////////MOVEMENT/////////////
  for (int i=0; i<blob.length; i++) {
    blob[i].x = blob[i].x+random(5)-2.5;
    blob[i].y = blob[i].y+random(5)-2.5; 
    blob2[i].x=blob2[i].x+random(3)-1.5;
    blob2[i].y=blob2[i].y+random(3)-1.5;
    blob2[i].z=blob2[i].z+random(3)-1.5;
    if ((dist(mouseX,mouseY,blob[i].x,blob[i].y)<300) && mousePressed) {
      blob[i].x+=(mouseX-blob[i].x)*0.01;
      blob[i].y+=(mouseY-blob[i].y)*0.01;
    }
    if ((dist(mouseX,mouseY,blob[i].x,blob[i].y)<200  && mousePressed)) {
      blob2[i].x=blob2[i].x-5;
      blob2[i].y=blob2[i].y+5;
      blob[i].x=blob[i].x+random(11)-5.5;
      blob[i].y=blob[i].y+random(11)-5.5;
    }
    if ((dist(mouseX,mouseY,blob[i].x,blob[i].y)<100 && mousePressed)) {
      blob2[i].x=blob2[i].x-7;
      blob2[i].y=blob2[i].y+7;
      blob[i].x=blob[i].x+random(15)-7.5;
      blob[i].y=blob[i].y+random(15)-7.5;
    }
  }
  /////////////DRAWING////////////
  for (int i=0; i<blob.length; i++) {
    stroke(blob2[i].x, blob2[i].y, blob2[i].z);
    line(blobo[i].x,blobo[i].y,blob[i].x,blob[i].y);
    blobo[i].x = blob[i].x;
    blobo[i].y = blob[i].y;
  }
}

