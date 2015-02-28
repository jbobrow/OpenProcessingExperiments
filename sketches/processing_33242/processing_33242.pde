
size(768,768);
background(0);
noStroke();

colorMode(RGB,255);
for(int j=0; j<256; j++){
  for (int i=0; i<256; i++){
    //top left rectangle
    stroke(i,j,0);
    point(i,j);
    
    //middle rectangle
    stroke(0,i,j);
    point(i+width/3,j+height/3);
    
    //bottom right rectangle
    stroke(j,0,i);
    point(i+width-width/3,j+height-height/3);
  }
}

                
                
