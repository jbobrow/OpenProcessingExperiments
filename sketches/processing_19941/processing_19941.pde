
size(250,250);
background(#c2afd7,50);
smooth();
strokeWeight(0.7);

for(int i=0;i<5000; i+=1){
  stroke(i);
  line(width/2,height/2,random(0,width),random(0,height));
  line(width/2,height/2,random(0,width),random(0,height));
}

