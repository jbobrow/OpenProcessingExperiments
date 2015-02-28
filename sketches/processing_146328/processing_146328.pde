
PVector[] blob = new PVector[1132];
PVector[] blob2 = new PVector[1132];

void setup() {
  size (800,800);
  background(100,100,100);
  stroke(255);
  
  for (int i=0; i<blob.length; i++) {
    blob[i] = new PVector(random(width), random(height));
    blob2[i] = new PVector(random(255),random(255),random(255));
  }
}
  
void draw() {
  fill(100,100,100,1);
  rect(0,0,width,height);
  for (int i=0; i<blob.length; i++) {
  point(blob[i].x,blob[i].y);
  stroke(blob2[i].x, blob2[i].y, blob2[i].z);
  }
for (int i=0; i<blob.length; i++) {
  blob[i].x = blob[i].x+random(5)-2.5;
 blob[i].y = blob[i].y+random(5)-2.5; 
 blob2[i].x=blob2[i].x+random(3)-1.5;
  blob2[i].y=blob2[i].y+random(3)-1.5;
   blob2[i].z=blob2[i].z+random(3)-1.5;
}
for (int i=0; i<blob.length; i++) {
  if (dist(mouseX,mouseY,blob[i].x,blob[i].y)<200) {
    blob2[i].x=blob2[i].x-5;
    blob2[i].y=blob2[i].y+5;
    blob[i].x=blob[i].x+random(11)-5.5;
    blob[i].y=blob[i].y+random(11)-5.5;
}
}
}

