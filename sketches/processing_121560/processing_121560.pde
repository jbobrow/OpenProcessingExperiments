
int x,y,diamX,diamY,ecartX,ecartY;
void setup(){
  size(295,295);
  background(255);
  x=width/2;
  y=height/2;
  smooth();
  cursor(CROSS);
}
void draw(){
  fill(255);
  rect(0,0,width,height);
  if(mouseX<width/2 && mouseY<height/2){
    diamX=mouseX*2;
    diamY=mouseY*2;
  }else if(mouseX>width/2 && mouseY>height/2){
    diamX=(width-mouseX)*2;
    diamY=(height-mouseY)*2;
  }else if(mouseX<width/2 && mouseY>height/2){
    diamX=mouseX*2;
    diamY=(height-mouseY)*2;
  }else if(mouseX>width/2 && mouseY<height/2){
    diamX=(width-mouseX)*2;
    diamY=mouseY*2;
  }
  ecartX=diamX/8;
  ecartY=diamY/8;
  noFill();
  stroke(0,30);
  strokeWeight(5);
  ellipse(x,y,diamX,diamY);
  noStroke();
  //cercleRouge
  fill(200,0,0,100);
  ellipse(x+ecartX,y+ecartY,diamX*0.62,diamY*0.62);
  //cercleVert
  fill(0,200,0,100);
  ellipse(x-ecartX,y-ecartY,diamX*0.62,diamY*0.62);
  //cercleBleu
  fill(0,0,200,100);
  ellipse(x+ecartX,y-ecartY,diamX*0.62,diamY*0.62);
  //cercleJaune
  fill(200,200,0,100);
  ellipse(x-ecartX,y+ecartY,diamX*0.62,diamY*0.62);
  //pointRouge
  stroke(255,50,50);
  point(x+ecartX,y+ecartY);
  //pointJaune
  stroke(255,255,50);
  point(x-ecartX,y+ecartY);
  //pointBleu
  stroke(50,50,255);
  point(x+ecartX,y-ecartY);
  //pointVert
  stroke(50,255,50);
  point(x-ecartX,y-ecartY);
  strokeWeight(1);;
  stroke(20,30);
  noFill();
  //ellipse(x,y,dist(x-ecartX,y+ecartY,x+ecartX,y-ecartY),dist(x-ecartX,y+ecartY,x+ecartX,y-ecartY));
  x=mouseX;
  y=mouseY;
  line(0,0,width,height);
  line(width,0,0,height);
}


