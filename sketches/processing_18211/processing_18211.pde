
size(250,250);
smooth();
noStroke();
background(215,250,235);
      
stroke(255);
for(int y=0; y<=height; y+=40){
  for(int x=0; x<=width; x+=40){
    fill(61,216,150,70);
    ellipse (x,y,20,20);
       ellipse (x,y,12,12);
       ellipse (x,y,5,5);
  }
}
 strokeWeight(2);
for(int i=0; i<250; i+=40)
{stroke(255);
line(i,0,i,250);}

 strokeWeight(1);
for(int i=0; i<250; i+=20)
{stroke(255);
line(i,0,i,250);}

for(int y=0; y<=height; y+=40){
  for(int x=0; x<=width; x+=20){
    fill(140,190,216,90);
    rectMode(CENTER);
   rect (x,y,5,5);
  }
}  

for(int y=0; y<=height; y+=40){
  for(int x=0; x<=width; x+=20){
    fill(140,190,216,90);
    rectMode(CENTER);
   rect (x,y,5,5);
  }
}  

stroke(255);
for(int y=0; y<=height; y+=40){
  for(int x=0; x<=width; x+=40){
   noFill();
    rect (x,y,50,50);
  }
}

