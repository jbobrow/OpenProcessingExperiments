

PGraphics vignette;

void setup(){
  size(480,320,P2D);

  frameRate(50);
  rectMode(CENTER);
  noFill();
  stroke(255,220);
  smooth();

  vignette = createGraphics(width+20,height+20,JAVA2D);
  vignette.beginDraw();
  vignette.smooth();
  vignette.noFill();
  vignette.strokeWeight(1.5);
  for(int i = 0;i<width*2;i++){
    vignette.stroke(0,map(i,0,width*2,0,255));
    vignette.ellipse(vignette.width/2,vignette.height/2,i,i);

  }
  vignette.endDraw();

}


void draw(){
  //background(0);
  pushStyle();
  fill(0,120);
  rect(width/2,height/2,width,height);
  popStyle();

pushMatrix();
  translate(random(-1,1),random(-1,1));

  for(int i = 0;i<400;i+=2){
    pushMatrix();
    translate(width/2,height/2);
    rotate(frameCount*(1.0+i/400.0*noise(frameCount/300.0)));
    stroke(255,noise((frameCount-i)/30.0)*220);
    rect(0,0,5+i,5+i);
    popMatrix();
  }
  
  
  popMatrix();
  
  //tint(random(200,255),random(200,255),30,180);
  //tint(255,120);
  image(vignette,random(-20),random(-20));


  //tint(random(200,255),random(200,255),12,150);
  //image(g,random(-2,2),random(-2,2));


  pushStyle();
  strokeWeight(10);
  stroke(0);
   noFill();
   
  rect(width/2,height/2,width,height);
  popStyle();

}


