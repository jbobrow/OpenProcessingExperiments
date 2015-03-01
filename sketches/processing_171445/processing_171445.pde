
size(600, 300);
colorMode(RGB, 400);
background(400);
rect(0, 0, 300, 300);



int eSize = 7;  

size(600, 300);  
background(255);  
smooth();  

//背景
for (int y=0; y<=height; y+=10) {
  for (int x=0; x<=width; x+=10) {

    if (x < 300 && y < 150) {  
      fill(x);
    }   
    if (x >= 300 && y < 150) { 
      fill(y);
    }
    if (x < 300 && y >= 150) {  
      fill(300-y);
    }   
    if (x >= 300 && y >= 60) {  
      fill(100-x);
    }

    rect(x, y, eSize, eSize);
  }
}
for (int y=0; y<=height; y+=20) {
  for (int x=0; x<=width; x+=20) {

    if (x > 100 && x < 300) {  
      fill(255);
    } else {   
      fill(0);
    }
    ellipse(x, y, eSize, eSize);
  }
}

//右面の白塗り
fill(400);
rect(300, 0, 300, 300);

for (int y=0; y<=height; y+=10) {
  for (int x=0; x<=width; x+=10) {

    if (x < 150 && y < 150) {  
      fill(x);
    }   
    if (x >= 150 && y < 150) { 
      fill(y);
    }
    if (x < 150 && y >= 150) {  
      fill(300-y);
    }   
    if (x >= 300 && y >= 60) {  
      fill(100-x);
    }

    rect(10^x, 10^y, eSize, eSize);}
  }

for (int y=0; y<=height; y+=20) {
  for (int x=0; x<=width; x+=20) {

    if (x > 100 && x < 300) {  
      fill(255);
    } else {   
      fill(60,320,170,15);
    }
    ellipse(x, y, eSize, eSize);
  }
}
//前面のランダム線
for ( int i = 0; i < 100; i++ ) {
  line( random( 300 )+300, 0, random( 300 )+300, 300 );
}


