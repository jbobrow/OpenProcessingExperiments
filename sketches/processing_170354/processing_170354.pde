
int eSize = 10;

size(400,400);
smooth();
background(0);

for(int z = 0; z <=400; z += 1){
  for(int a = 0; a <=400; a += 1){
  stroke(50,0+z,400+a,200);
  line(z, a, z, a); 
}
}


for(int x =0; x<=400; x+=10) {
for(int y =0; y<=400; y+=10) {
  
  stroke(255-y,x*2,y);
  line(800-x*5,0,200,y*5);
}

}

for (int y = 0; y <= 400; y += 20) {
  for (int x = 0; x <= 400; x += 20) {
    if(x > 100 && x < 300 && y > 100 && y < 300){
      fill(255);
    }else{
      fill(0);
    }
 
    ellipse(x, y, eSize, eSize);
  }
}


