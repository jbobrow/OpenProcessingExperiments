
void setup() {
 size(500, 500);
  background(255);
 
  smooth();
  frameRate(30);
}
 
void draw() {
  noStroke();
  fill(0, 0);
  rect(0, 0, width, height);
  noFill();
  for (int j = 0; j < 2;j++) {
  
    for (float i = 20; i < width+2000;i += random(10)) {    
   float a = random(1,255);
   float b = random(1,255);
   float c = random(1,255);
      stroke(a,b,c, 255);
      
      strokeWeight(10);
      int est = int(random(100));
    if (est==10||est==11){
      fill(a,b,c,255);
      rect(50*int(random(0,10)),50*int(random(0,10)),30,30);
    }
     
    }
  }
  filter(BLUR, 3);
  
  for(int q=0; q<100;q++){
   
   
    stroke(1,1,1);
   strokeWeight(1);
    line(50*q,0,5*q,500);
   
   
     stroke(1,1,1);
   strokeWeight(1);
    line(0,50*q,500,5*q);
   
    
  }
}


