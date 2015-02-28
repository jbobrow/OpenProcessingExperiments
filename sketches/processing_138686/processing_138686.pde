
size(500,400);

  smooth();
  noStroke();
  beginShape();
  vertex(200,140);
  bezierVertex(200,140,155,120,130,180);
  bezierVertex(130,180,200,210,200,140);
  endShape();
  
  
pushMatrix();
  translate(200,140);  // move origin to center of object
  rotate(radians(180)); // rotate about the origin
  translate(-200,-140); // move back
  // draw the shape here....
  beginShape();
  vertex(200,140);
  bezierVertex(200,140,155,120,130,180);
  bezierVertex(130,180,200,210,200,140);
  endShape();
popMatrix();


pushMatrix();
  translate(200,140);  // move origin to center of object
  rotate(radians(90)); // rotate about the origin
  translate(-200,-140); // move back
  // draw the shape here....
  beginShape();
  vertex(200,140);
  bezierVertex(200,140,155,120,130,180);
  bezierVertex(130,180,200,210,200,140);
  endShape();
popMatrix();

pushMatrix();
  translate(200,140);  // move origin to center of object
  rotate(radians(-90)); // rotate about the origin
  translate(-200,-140); // move back
  // draw the shape here....
  beginShape();
  vertex(200,140);
  bezierVertex(200,140,155,120,130,180);
  bezierVertex(130,180,200,210,200,140);
  endShape();
popMatrix();
  
  




