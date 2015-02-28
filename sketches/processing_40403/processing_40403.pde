
//Homework #3
// James Kim

void setup() {
  size(800,800);
  smooth();
  background(255);
}

void draw() {

for(int x=0;x<width; x+=60){
  for(int y=0; y<height; y+=60){
    fill(255);
    rect(x,y,60,60);
  }
}
    for(int x=0;x<width;x+=20){
      for(int y =0;y<height;y+=20){
        if(x%60==0 && y%70 ==0){
          fill(200);
          float ellSize = (map(mouseX,0,width,5,30));
          rect(x,y,ellSize,ellSize);
            ellipse(x,y,ellSize,ellSize);
            ellipse(x,y,50,50);
            strokeWeight(5);
              if(x%50==0 && y%40==0){
                 ellipse(x,y,10,10);
                //pushMatrix();
                //rotate(radians(30));
                
        }
      }
    }
  }
}

//Had a problem uaing the pushMatrix func./ rotating an object
// was trying to rotate the pattern




