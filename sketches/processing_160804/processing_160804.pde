
size(500,500);
background(250);

for (int y=0;y<height;y+=5){
  for (int x=0;x<width;x+=5){
    if(x<=250){
       line(x,y,x+3,y+3);
    }else{
       line(x-250,y,x+3,y-3);
    }
  }
}


