
size(400,400);
colorMode(RGB,width);


for(int y = 0; y < height; y++){
  for(int x = 0; x < width; x++){
    stroke(width/height,x,y);
    point(x,y);
    
  }
}

ellipseMode(CENTER);

fill(RGB,10,60,120);
smooth();
noStroke();


for (int y=15; y<height; y+=50){
  for(int x=30; x<width; x+=30){
    ellipse(x,y, 60, 30);


  }
  
}

