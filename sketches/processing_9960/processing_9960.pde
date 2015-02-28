
     void setup() {
       size(400, 400);
       colorMode(HSB, 100);
       noStroke();

     } 

     void draw() {
       
       int y = 0;
for(int x=0; x<width; x+=60) {
  // rows
  delay(5);
  for(int m=0; m<height; m+=60) {
    int omer = int(random(40));
    int hugh = int(random(20))+40;
    if(omer < 2) {
      fill(95, 95, hugh+35,33);
    } 
    else { 
      fill(58, 20, hugh,33);
    } 
    rect(x, m, 60, 60);
    delay(1);
      if(omer == 30){
      fill(95, 95, hugh+35,90);
      rect(x, m, 60, 60);
      delay(1);
      fill(90,33);
      rect(x+5, m+5, 50, 50);
      delay(1);      

    }

  }
  //lines
  int omer = int(random(40));
  int hugh = int(random(20))+40;
  if(omer < 2) {
    fill(95, 95, hugh+35,33);
  } 
  else { 
    fill(58, 20, hugh,33);
  } 
  rect(x, y, 60, 60);
    if(omer == 30){
    fill(95, 95, hugh+35,33);
    rect(x, y, 60, 60);
    fill(90,33);
    rect(x+5, y+5, 50, 50);
    
  }
  y += 60; 


}

     }


