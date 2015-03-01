


size(400,400);
fill(200,40,250);
background(100);
noStroke();
 
background(255);
smooth();
for (int y = 0; y <= 400; y += 20) {
  for (int x = 0; x <= 400; x += 20) {
    if(x > 100 && x < 300 && y > 100 && y < 300){
      fill(255);  
    }else{   
      fill(0);  
    }
 
    ellipse(x, y, 10,10);
  }
}


for(int y=0; y< 400; y+=10){
  for(int x=0; x < 400; x+=20){
fill(x,y,30);
ellipse(x,y,250,250);
  }
}

int  x, y, z;

for (z = 0; z < 70; z=z+12 ){ 
 for(x = 0; x < width; x +=60 ){
  for(y = 0; y < height; y += 60 ){
fill(230, x/3, y/2, 150);
    ellipse(x, y, z, z);
  }
 }
}


