
size(640,480);

for(int i=0; i<width; i++){
  float val = map(i, 0,width, 0,255);
  stroke(val);
  line(i,0,i,height);  
}


