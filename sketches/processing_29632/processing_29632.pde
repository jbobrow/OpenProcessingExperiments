
PImage im;

void setup(){
  size (350,500);
  im =loadImage("bob_marley.jpg");
  im.resize(im.width,im.height);
}
void draw(){
  background(0);
  
//  image (im,0,0,im.width,im.height);
  
 im.loadPixels();
 //siempre hay que ponerlo

  for (int i =0;i<im.width;i+=12){
    
  for (int j =0;j<im.height;j+=12){
 pushMatrix();
    int pColor = im.get (i,j);
    
    

 //float d= map (dist(mouseX,mouseY,i,j),0,width,10,0);

 float ang = atan2 (j-mouseY,i-mouseX);

  noStroke();
  fill (pColor);
  rectMode (CENTER);
  translate (i,j);
  rotate (ang);
  rect(0,0,8,8);
  popMatrix();

} }
}

void keyPressed (){
  saveFrame("screenshot-####.png");
  //per video tga
}

