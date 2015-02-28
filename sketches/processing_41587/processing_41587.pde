
void setup () {
  size(500, 450);

}
void draw() {
 
 noStroke();
 fill(10,20,35,50);
 rect(0,0,500,500);
 fill(10,45,20,50);
 rect(0, 400, 500, 200);
 fill(255);
 
 float rw = random (70,110);
 float rx =random (0,width-rw/2);
  float ry= random (0,350);
 noStroke(); 
fill(255, 40);
ellipse (rx-15, ry, 10, 10);


  bug(200, 240);
 
}

void bug (int x, int y) {
  //wings
  fill( 190, 190, 170, 200);
float ang1 =  .15* (sin(millis()/100.0));
 float noiseValue1 = noise(  millis()/2000.0 ); 
  float noiseValue2 = noise( (millis()+12345)/1957.9  ); 
 
  float x1 = map(noiseValue1, 0,1,  50, 350); 
  float y1 = map(noiseValue2, 0,1,  50,400); 
 
  pushMatrix();
  translate(x1, y1); 
  rotate(radians(-20));
   rotate(ang1); 
  ellipse(0, 0, 60, 150);
  rotate(radians(40));
  
  ellipse(35, 55, 50, 70);
  popMatrix();
  
  pushMatrix();
  translate(x1+100, y1);
  rotate(radians(20));
  rotate(-ang1);
  ellipse(0, 0, 60, 150);
  rotate(radians(-40));
  ellipse(-35, 55, 50, 70);
  popMatrix();

  //body
 fill( 200,210, 150);
  float noiseValue3 = noise( (millis())/1211.1  );
  float noiseAngle = map(noiseValue3, 0,1,  -5,5);  
  
  pushMatrix(); 
 
 if (mousePressed) {
   fill(240,250,150);
  ellipse(x1+60, y1+90, 30, 60);
 }else { 
  ellipse(x1+60, y1+90, 30, 60);
   } 
   
  ellipse(x1+60, y1+60, 75, 100);
  popMatrix();
  fill( 230, 240, 170, 250);
  float noiseValue9 = noise(  millis()/1000.0 ); 
  float noiseAngle1 = map(noiseValue9, 0,1,  -5,5);  
  pushMatrix();
 rotate( radians(noiseAngle1)); 
  ellipse(x1+50, y1+5, 45, 60);
  popMatrix();
  
}

