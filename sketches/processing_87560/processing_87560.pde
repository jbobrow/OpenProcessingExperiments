
size(500, 500);

for (int x=0; x < 500; x +=10) {
  for (int y=0; y <500; y +=10) {

    if (y<100) {
      fill(201, 125, 234);
    }
    else if (y >=10 && y <200) {
      fill(151, 96, 211);
    }
    else if (y >=200 && y<300){
      fill(124, 39, 216);
    }
    else if (y >=300 && y<400){
      fill(199, 162, 240);
    }
    else if(y >=400 && y<=500){
      fill(51, 2, 95);
    }
    
    
    
    rect(x, y, 240, 60);
  }
}



