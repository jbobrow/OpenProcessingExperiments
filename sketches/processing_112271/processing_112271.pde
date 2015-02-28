
size(500,500);
background(255);
strokeWeight(5);


fill(243, 247, 15);
noStroke();
for(int y=0; y<= height; y+=30)
{
  for(int x=0; x<= width; x+=30)
 {
  ellipse(x, y,  16-y/15, 16-y/15);
  }
}


int v=60;
  for(int x=10;x<width;x=x+v){
  for(int y=15;y<height;y=y+v){
    stroke(12, 201, 165);
    point(x,y);
    for(int i=5;i<10;i=i+5){
      point(x+i,y-i);
    }
  }
}

int j=25;

  for(int x=10;x<width;x=x+j){
  for(int y=10;y<height;y=y+j){
    stroke(0);
    point(x,y);
    for(int i=10;i<10;i=i+10){
      point(x+i,y-i);
    }
  }
}

int k=25;

  for(int x=20;x<width;x=x+k){
  for(int y=20;y<height;y=y+k){
    stroke(0);
    point(x,y);
    for(int i=10;i<10;i=i+10){
      point(x-i,y+i);
    }
  }
}





