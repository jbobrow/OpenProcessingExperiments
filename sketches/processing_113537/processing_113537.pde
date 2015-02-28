
size(800,800);
int g = 150;
int b = 255;
int c = 100;

background(255);
noStroke();
smooth();






//sikaku small
for(int y=0; y<=800; y+=60){
  for(int x=0; x<=800; x+=30){
    if(y < 400){
    fill(13,172,255);
    }
 else{
      fill(47,62,137);
    }
    
    rect(x,y,20,20);
  }
}



//sikakubig
for(int y=0; y<=800; y+=60){
  for(int x=0; x<=800; x+=50){
    if(y < 400){
    fill(191,233,255);
    }
 else{
      fill(227,230,255);
    }
    
    rect(x,y,30,30);
  }
}




//maru
for(int y=0; y<=800; y+=50){
  for(int x=0; x<=800; x+=50){
    if(y < 400){
    fill(255,g++,c++);
    }
 else{
      fill(255,255,b--);
    }
    
    ellipse(x,y,30,30);
  }
}







