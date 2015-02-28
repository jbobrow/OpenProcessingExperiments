
size(250,250);
background(255);
smooth();
strokeWeight(0.5);

for(int i=0;i<5000; i+=1){
  stroke(i/12);
  line(width/2,height/2,random(0,width),random(0,height));
  line(width/2,height/2,random(0,width),random(0,height));
}

