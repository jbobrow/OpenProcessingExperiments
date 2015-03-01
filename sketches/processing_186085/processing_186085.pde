
  size(600,600);
  background(172,129,196);
  
  
  for (int i = 50; i <width; i += 100) {
    for (int j = 50; j <height; j += 100) {
  
      float k = map(i,25,width,25,width);
      float l = map(j,50,height,50,height);
      
      //ears
      fill(160,90,24);
      ellipse(k-30,l-40,17,25);
      ellipse(k+30,l-40,17,25);
      //the head
      fill(160,90,24);
      ellipse(i, j, 100, 100);
      //the mouth area
      fill(211,147,87);
      ellipse(i, j+20, 80, 60);
      //smile
      arc(i, j+5, 70, 70, radians(35), radians(140));
      //nose
      fill(0);
      ellipse(i, j+15, 30, 20);
      //eyes
      fill(255);
      ellipse(k-15,l-25,12,23);
      ellipse(k+15,l-25,12,23);
      fill(0);
      ellipse(k-15,l-20,6,10);
      ellipse(k+15,l-20,6,10);
  
      
      
    }
  }


