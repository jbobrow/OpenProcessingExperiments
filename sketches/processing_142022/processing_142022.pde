
size(300,300);
background(255);
smooth();
noFill();
for(int d=0;d<75;d+=4){
for(int x=0;x<350;x+=75){
for(int y=0;y<350;y+=75){
stroke(random(255),random(255),255);
strokeWeight(4);
ellipse(x,y,d,d);
  }
 }
}

