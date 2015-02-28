
void setup(){
  size (250,250);
  background (#000000);
  smooth();
  frameRate(45);
}
void draw(){
 
  //random colour lines
  
  noStroke();
  // positioning
  for(int i=0;i<200;i+=10){
    strokeWeight(random(10));
    stroke(random(25,255),random(25,255),random(110,255),random(180,250));
    line(random(250,90),250,random(i),random(i*3));
  }
  //random white circles
  for (int j=0;j<50;j+=5){
    noStroke();
    fill(random(230,255),random(230,255),random(230,255),random(100,250));
    ellipse (random(500),random(250),random(j),random(j));
  }
}

