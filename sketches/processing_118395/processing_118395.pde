
int eSize = 3;

size(510,510);
background(0);
stroke(0);

for(int x = 0; x <= width; x +=10){

  stroke(x,180,255,181);
  line(0,0,x,height);
  
  stroke(x,181,255,280);
  line(width,0,x,height);
  
  
}

for(int y=0; y <= width; y +=10){
  
  line(y,width-y,255,y);

}

for(int y=0; y <= width; y +=10){
  
  stroke(255);
  line(width-y,255,y,y);
  
  stroke(255,235,118,150);
  line(255,width-y,y,y);
  
  stroke(255);
  line(width-y,y,y,255);
}


stroke(211,211,211,50);
strokeWeight(5);
noFill();
ellipse(255,255,80,80);

stroke(247,247,247,50);
strokeWeight(5);
noFill();
ellipse(255,255,100,100);

stroke(247,247,247,80);
strokeWeight(15);
noFill();
ellipse(255,255,120,120);

stroke(247,247,247,50);
strokeWeight(5);
noFill();
ellipse(255,255,120,120);

stroke(234,234,234,70);
strokeWeight(30);
noFill();
ellipse(255,255,140,140);

stroke(234,234,234,60);
strokeWeight(5);
noFill();
ellipse(255,255,140,140);







