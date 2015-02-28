
float xc,yc;
color Pcolor;
 
void setup(){
  size(700,500, P3D);
  background(0);
}
 
void draw(){
  translate(width/2,height/2);
  rotateX(mouseY/30.0);
  rotateY(mouseX/30.0);
  translate(-width/2, -height/2);

  xc = map (noise(frameCount/10.0),0,1,0,width/4);
  yc = map (noise(frameCount/10.0),0,1,0,height/4);
  
  Pcolor=color (random(0,255),random(0,255),random(0,255),random(0,200));
  
  pushMatrix(); 
  translate(xc,yc);
  fill(Pcolor);
  frameRate(30.0);
  rectMode(CENTER);
  stroke(255);
  box(xc,yc,random(0,50));
  popMatrix();

}

