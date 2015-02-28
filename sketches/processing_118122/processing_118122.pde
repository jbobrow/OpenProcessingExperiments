
int eSize = 3;

size(510,510);
background(0);
stroke(0);
fill(0);

for(int i=0; i<510; i+=5) {
  fill(i/10, 200, i);
  ellipse(i, i, eSize*100, eSize*100);
}


for(int x= 0; x <= width; x++){
  stroke(0, x, 210, 100);
  line(310,x,x,510);
  
  stroke(0,x,80,200);
  line(x,310,510,x);
  
  stroke(234,x,100,200);
  line(x,200,510,x);
  
  stroke(x,50,140,200);
  line(200,x,x,510); 

}


