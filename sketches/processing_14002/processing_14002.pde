
void setup () {
  size(500,500);
  background(255);
  noStroke();
  
  for (int a=0; a<50; a++) {
   
    for (int b=0; b<50; b++) {
      fill(0);
      float c = sqrt((10*b-250)*(10*b-250) + (10*a-250)*(10*a-250));
     
      if (c<125) {
        fill(0,0,0);
        ellipse(10*b, 10*a, (125-c)/10+1, (125-c)/10+1); 
      } else {
        fill(0);
        ellipse(10*b, 10*a, 1, 1); 
      }
    }
  }
}


                                
