
void setup() {
 size(600,600);
 background(255);
 strokeWeight(1);
 
 frameRate(120);
}
 void draw() {
for( int x=0; x<600 ; x=x+5) {
  int y= x*6;
 stroke(0,10);
 line(y,0,y,600);
 line(0,y,600,y);
stroke(0,x);
fill(x+120, x+50, x+10, x);
bezier(y+0,x+0,x+100,x+250,x+155,x+148,x+500,x+150);
bezier(y+600,x+600,x+100,x+250,x+155,x+148,x+500,x+150);
bezier(-y+0,-x+0,-x+100,-x+250,-x+155,-x+148,-x+600,-x+600);

}


  for (int i=0; i<2000; i++){
  stroke(250,14,36,40);
  noFill();
  beginShape();
  vertex((i+random(10)), (i+random(600)));
  vertex((i+random(500)), i);
  vertex((i+random(1250)), (i+random(520)));
  vertex((i), (i+random(900)));
  endShape();
   if(mousePressed) {
   noLoop();
   
   }
 
  }
   for (int j=0; j<200; j++){
     strokeWeight(2);
     noFill();
   stroke(0,10);
  beginShape();
  vertex((j), (j+random(600)));
  vertex((j+random(500)), j);
  vertex((j+random(1200)), (j+random(520)));
  vertex((j+random(800)), (j+random(900)));
  endShape();
  
  
  } 
 
   saveFrame();  
  
    
  
 }  

   
  


