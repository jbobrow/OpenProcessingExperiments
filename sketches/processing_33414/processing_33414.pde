
size(100,100);
background(0);
noFill();

colorMode(RGB,255);
for(int j=0; j<256; j++){
  for (int i=0; i<256; i++){
    //top left rectangle
    
    //translate i to be proportional
    //to new window size values
    float x = map(i, 0, 256, 0, width);
    float y = map(j, 0, 256, 0, height);
    
    //color is still values from 0 to 255
    stroke(i,0,j);
    strokeWeight(5);
    
    //new points are proportional to our NEW window size
    point(x,y);

  //these values will draw a box 255x255 pixels
//      stroke(i,0,j);
//      point(i,j);
  }
}

                
                
