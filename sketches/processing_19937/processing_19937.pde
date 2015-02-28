
size(500,500);
background(0);
smooth();
strokeWeight(0.6);

for(int i=0;i<5000; i+=1){
  stroke(i/2);
  line(width/2,height/2,random(0,width),random(0,height));
  line(width/2,height/2,random(0,width),random(0,height));
}

