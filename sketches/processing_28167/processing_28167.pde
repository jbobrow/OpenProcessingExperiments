
//for loops + patterns WEEK 3
//ethan dale
//math, programming, and art CCA SP2011

background (0);
smooth();
size(400,400);
colorMode(HSB,360,100,100,100);
float colorValue = 0;
strokeWeight(6);

for(int i = 0; i < 5000 ; i+=10){
  noFill();
  colorValue = map(i,0,width/2,0,360);
  ellipse(width/2,height/2,i,i);
  stroke(colorValue, i,i + colorValue);
  //for loop that draws ellipses
  }
  


for(int f = 0; f < 500; f+=15){
noFill();
  stroke(236,98,99);
  rect(f, f, 25,25);  
}



