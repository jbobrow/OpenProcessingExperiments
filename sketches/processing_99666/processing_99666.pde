
size(800,800);
  for (float i=width/8; i<width; i+= width/4) for (float j=height/8; j<height; j+= height/4){
     fill(255,255,255,i/2);
  float posV = i++;
  float posC = j++;
  ellipse(posV, posC, width/4, height/4);
  }
