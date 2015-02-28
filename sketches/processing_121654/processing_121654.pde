
for ( int i = 0; i < 255; i++)
{    
  if (i == 0){
    size(720,480);
    background(255);}
  stroke(i,30);
  fill(255-i,30);
  beginShape();
  vertex(float(i)/255*width,float(i)/255*height);
  bezierVertex(i,0,50,50, 255-i,i);
  bezierVertex(50,50, width/2,i, i, 0);
  endShape();
}
