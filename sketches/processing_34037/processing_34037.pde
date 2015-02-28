
void setup(){
 size (screen.width,screen.height);
  background(0);
  colorMode(HSB,255);
  rectMode(CENTER);
  ellipseMode(CENTER);
   smooth();
  noCursor();
}
 
void draw(){
  noStroke();
  fill(0,20);
  //rect(0,0,800,800);
   
  noStroke();
  fill(frameCount%255,255,255,20);
  translate(mouseX,mouseY);
   
  float n = (frameCount-20)%255;
   
  pushMatrix();
  rotate(frameCount/10.0);
 // rect(0,0,n/5,n/5);
  popMatrix();
   
  pushMatrix();
  rotate(-frameCount/30.0);
  strokeWeight(1);
  noFill();
  stroke((frameCount-20)%255,255,255);
  ellipse(0,0,n/2,n/2);
  ellipse(0,0,n,n);
  ellipse(0,0,100*sin(frameCount/100.0),100*sin(frameCount/100.0));
  ellipse(0,0,n*2,n*2);
   
  stroke(n,255,255,100);
 // rect(0,0,n,n);
 // rect(0,0,200,200);
 // rect(0,0,n/2,n/2);
  popMatrix();
  pushMatrix();
  rotate(-frameCount/60.0);
  stroke((frameCount-20)%255,255,255,100);
  strokeWeight(1);
  line(0,0,-500,-500);
  rotate(-frameCount/40.0);
  line(0,0,500,500);
  rotate(-frameCount/30.0);
  line(0,0,0,500);
  line(0,0,500,50);
  popMatrix();
  if (mousePressed){
    save("wanatta_elipscolorida_.jpg");
}
}       
                
