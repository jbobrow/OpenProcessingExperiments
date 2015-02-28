
//using embedded data
color [] pal = {#243835,#d6d7bb,#4cb6b8,#857729,#666248};

size(600,600);
background(pal[0]);
smooth();

int[] geometric = {2,4,6,8,16,32,64,128,256,512};

for(int i = 0; i < geometric.length; i++){
  strokeWeight(1);
  stroke(pal[2],50);
  fill(pal[3]);
  float x = geometric [i];
  float y = geometric [i];
  rect(x,y,10,50);
}
