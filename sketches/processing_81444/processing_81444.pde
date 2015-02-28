
int anzahl=30;
float x = 0;
float y = 0;

void setup() {
  size(500, 500);
  smooth();
 
}


void draw() {
  fill(255);
  background(255);
  fill(0);

for (int i = 0; i<anzahl;i++) {
  for (int j = 0; j<anzahl;j++) {
    background(255);
    
  //sekundenzeige
    pushMatrix();
      noStroke();
      translate(width/2, height/2);
        x =sin(frameCount/30.0)*180+1;
        y =cos(frameCount/30.0)*180+1;
      
      //rotate(radians(360/60*second())-HALF_PI);
      fill(255, 0, 0,150);
      ellipse(y, x,second()*10,second()*10);
      ellipse(x, y,second()*5,second()*5);
    popMatrix();

  //Minutenzeiger
  pushMatrix();
  noStroke();
  translate(width/2, height/2);
  rectMode(CENTER);
  rotate(radians(360/60*minute())-HALF_PI);
  fill(0,255,0,150);
  rect(y, x,minute()*10,minute()*10);
  rect(x/2, y/2,minute()*5,minute()*5);
  popMatrix();
  
    //Stundenzeiger
  pushMatrix();
  noStroke();
  //translate(width/2, height/2);
 
  translate(width/2, height/2);  
  fill(0,0,255,150);
  rotate(hour()+1);
  triangle(x,y,y,x,(x+y),(y+x));
  triangle(x*2,y*2,y*3,x*3,(x+y),(y+x));
  popMatrix();
  
  //fill(0);
  //ellipse(width/2, height/2, 20, 20);
  }
}
}
