
size(400, 400);
background(255);

stroke(0,70);
strokeWeight(10);
fill(200,0,0,20);


for(int i= 0; i<40; i++) {
  pushMatrix();
  for(int j=0; j<40; j++) {
    float w =(40-i) * 2 +3;
    //rect(0,0,w,w);
    //line(0,0,w,w);
    ellipse(0,0,w,w);
    rotate(radians(4));
    translate(0,30);
  }
  popMatrix();
  translate(10,0);
}
