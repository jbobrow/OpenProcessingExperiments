
void setup(){
  size(720,720);
 colorMode(RGB);
  smooth();
  noFill();
  background(0);
 
  stroke(0);
 
  strokeWeight(3);
 // point(width/2, height/2);
  ellipseMode(CENTER);
 
    
}
 
 
void draw() {
 if (mousePressed == true) {
   background(0);
   drawArcs();
   drawShapes();
   drawCircle();
  }
}
 
// draw dark leaves in background made of arcs
void drawArcs(){
   
 // println(CHORD);
   
  fill(100,60);
  pushMatrix();
  translate(width/2 + 25 , height/2);
  for(int i = 360; i >0 ; i-=30  ){
      pushMatrix();
      rotate(radians(i) );
      strokeWeight(2);
      arc(90 + random(20), 0, 240 , 60 + random(120) , 0, PI, 2);
      arc(-90 + random(20), 0, 240, 60 + random(120), 0, PI, 2);
      popMatrix();
   }
    popMatrix();
}
 
//draw the satellite shape in the middle
void drawCircle(){
  pushMatrix();
  translate(width/2 + 25 , height/2);
  fill(0);
 
  // draw spokes and outer balls
   for(int i = 360; i >0 ; i-=36  ){
      pushMatrix();
      rotate(radians(i) );
      strokeWeight(2);
      float tDist = random(20) + 50;
      line(0,0,tDist,1);
      ellipse(tDist,0, random(10),random(10) + 10);
      popMatrix();
   }
    ellipse(0,0,random(30) + 20,random(30) + 20);
    rotate(radians(random(360)) );
    popMatrix();
}
 
// draw red shapes next to satellite
void drawShapes(){
 
  pushMatrix();
  translate(width/2 - 50, height/2);
 
  float tRandom1 = 50 + random(50);
  float tRandom2 = 50 + random(50);
  float tRandom3 = 50 + random(50);
 
  for( int i = 0; i < 4; i++) {
    
  pushMatrix();
  beginShape();
  float startpoint = tRandom1;
  if ( i == 0){
      noFill();
  } else if ( i == 1){
    translate(75, -75);
    noFill();
  }else if ( i == 2){
    translate(150, 0);
     noFill();
  } else{
    translate(75, 75);
    noFill();
  }
   
  rotate(radians(i * 90) );
  curveVertex(tRandom1,0);
  curveVertex(tRandom1,0);
  
  curveVertex(150, tRandom2);
  curveVertex( tRandom2,150);
  curveVertex(0,tRandom3);
   
   
  curveVertex(startpoint,0);
  curveVertex(startpoint,0);
  fill(255, 0, 0,80);
  endShape();
  popMatrix();
  }
   popMatrix();   
}


