
size(640, 480);
background(0);


for (int i = 1; i<width*height; i+=(width+height)/100) {
  
  for (int strokeColor = 0; strokeColor>=0 && strokeColor <=255; strokeColor+=5) {
    stroke(strokeColor);
  } 
      line(i, i, 0, height);

  for (int strokeColor2 = 255; strokeColor2>=0 && strokeColor2 <=255; strokeColor2-=5) {
    stroke(strokeColor2);
  }
    line(0, height, i, i);         
} 



for (int i = 1; i<width*height; i+=(width+height)/100) {
  
  for (int strokeColor = 0; strokeColor>=0 && strokeColor <=255; strokeColor+=5) {
    stroke(strokeColor);
  } 
      line(i, i, width, 0);

  for (int strokeColor2 = 255; strokeColor2>=0 && strokeColor2 <=255; strokeColor2-=5) {
    stroke(strokeColor2);
  }
     line(width, 0, i, i);
     
     
} 





for (int i = 1; i<width*height; i+=(width+height)/100) {
  
  for (int strokeColor = 0; strokeColor>=0 && strokeColor <=255; strokeColor+=5) {
    stroke(strokeColor);
  } 
      line(0, 0, i, width);

  for (int strokeColor2 = 255; strokeColor2>=0 && strokeColor2 <=255; strokeColor2-=5) {
    stroke(strokeColor2);
  }
     line(i, width, 0, 0);     
     
} 


