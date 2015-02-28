
size(440, 440);
smooth();



for(int i=0; i<=440; i+=20) {
  for (int j=0; j<=800; j+=20) {
   strokeWeight(3);
    colorMode(HSB);
   if(i<=200&&j<=200) {
   fill(230, j, 255, 220);
      rect(i, j, 30, 30);
  } 
   else if (i>=200&&j<=200) {
    fill(65, j, 255, 220);
      rect(i, j, 30, 30);
   }
    else if (i<=200&&j>=200) {
    fill(65, j-200, 255, 220);
      rect(i, j, 30, 30);
   }
    else if (i>=200&&j>=200) {
    fill(230, j-200, 255, 220);
      rect(i, j, 30, 30);
   }
   ellipse(i, j, 30, 30);
  }
}


