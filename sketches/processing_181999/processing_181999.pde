
void setup(){
	size(600,600);
background(255);
frameRate(5);
}

void draw() {
  
  int w = 600;
  int h = 600;
  int units = 7;
  int unitW = w/units;
  int unitH = h/units;
  smooth();
  
  size(w,h);
  
  if(mousePressed==true){
  
  for (int i=0; i < units; i++) {
    for (int j=0; j < units; j++) {
      //random fills limited by 2nd argument
      fill(random(0,200), random(100,200), random(200,255));
        //nternal rectangles
        for (int k=0;k<10;k++) {
          stroke(random(55*k));
          strokeWeight(random(1+k));
          rect(unitW*i+k*7,unitH*j+k*7,unitW-(10*k),unitH-(10*k));
        }
        
    }
  }
  
  }	
}


