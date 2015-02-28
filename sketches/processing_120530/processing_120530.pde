
/*@pjs preload="eat.png";*/


PImage img;

int eSize = 3;

size(565,400);
background(2,10,3);
smooth();
noStroke();
fill(0);


img = loadImage("eat.png");

tint(0,153,0);
image(img,0,0);

for(int i=0; i<240; i+=5){
 ellipse(i,i,eSize,eSize);
 for(int x=0; x<=width; x+=10){
 
  if(x <= width/4){ 
    fill(255); 
  }
  else{   
    fill(0); 
  }
  ellipse(x/2, height/2, eSize, eSize);
   
}
}

stroke(0);
strokeWeight(3);
line(0,200,200,0);

strokeWeight(2);
line(30,130,370,350);

strokeWeight(1);
line(240,350,312,270);








