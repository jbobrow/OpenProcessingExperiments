
size(500,500);
background(250);

int counter=0;
for (int x=0; x< width;x++){
  for (int y=0;y<height;y++){
    if((x>250)&&(y<500)){
      stroke ((counter % 33)*4, (counter % 43) *2, (counter%47)*3);
      point(x,y);
    }else {
      stroke((counter % 33)*4, (counter % 43) *4, (counter%13)*4,230);
      point(x,y);
     }
     counter++;
  }
}


