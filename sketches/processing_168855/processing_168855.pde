
int eSize=5;

size(400,400);
background(255);

for(int i =0 ; i<=width ; i++){
  stroke(255,248+i,98,40);
  strokeWeight(3);
  line(i,-i,400,400);
  
  stroke(133,252+i,223,40);
  strokeWeight(3);
  line(-i,i,400,400);
  
  
  stroke(254,127+i,242,50);
  strokeWeight(3);
  line(-i,i,400,400);
  
  stroke(254,127+i,242,30);
  strokeWeight(3);
  line(i,-i,400,400); 
}


for(int y = -10; y<=width; y+=6){
  for(int x = -10; x<=width; x+=6){
  noStroke();
  //strokeWeight(1);
  rect(x,y,eSize,eSize);
  fill(86+y,255-y/3,31+x/2,50);
}
} 
 for(int x = 50; x<=350; x+=5){
    line(x,50,350,350);
    stroke(255,180,88,150);
    strokeWeight(1);
    
    line(50,50,x,350);
    stroke(88,255,245,150);
    strokeWeight(1);
    
    line(x,350,350,50);
     stroke(255,255,88,150);
    strokeWeight(1);
    
    line(50,350,x,50);
     stroke(109,255,88,150);
     strokeWeight(1);
  }

for(int i =0 ; i<=width ; i++){
  
  smooth();
  fill(255,255,255);
  noFill();
  stroke(255);
 strokeWeight(10);
 rectMode(CENTER);
 rect(200,200,300,300);
}

 for(int y = 50; y <=height-50; y+=10){
   for(int x = 50; x<= width-50 ; x+=10){
 noStroke();
 ellipse(x,50,eSize,eSize);
 fill(255-x,y,120+x,x);
 
 noStroke();
 ellipse(50,y,eSize,eSize);
 fill(100+x,255-y,x,y*2);
 
 noStroke();
 ellipse(x,350,eSize,eSize);
 fill(x,255,50,x*2);
 
 noStroke();
 ellipse(350,400-y,eSize,eSize);
 fill(x,200,70,y);
   }
 }
 for(int i =0 ; i<=width ; i++){
      smooth();
  noFill();
  stroke(255,255,255);
  strokeWeight(10);
  ellipse(200,200,520,520);
  
  smooth();
  noFill();
  stroke(255,255,255);
  strokeWeight(40);
  ellipse(200,200,400,400);
  
    smooth();
  noFill();
  stroke(150,205,237,150);
  strokeWeight(4);
  ellipse(200,200,400,400);
  
  smooth();
  noFill();
  stroke(255,255,255);
  strokeWeight(2);
  ellipse(200,200,470,470);

smooth();
noFill();
stroke(255,255,255);
strokeWeight(50);
ellipse(200,200,180,180);
 
 smooth();
noFill();
stroke(207,237,150,120);
strokeWeight(6);
ellipse(200,200,190,190);




 stroke(255,255,255);
  strokeWeight(10);
  line(70,40,80,45); 
  
  stroke(255,255,255);
  strokeWeight(10);
  line(50,60,60,65);
  
  stroke(255,255,255);
  strokeWeight(10);
  line(350,340,340,335);
  
  stroke(255,255,255);
  strokeWeight(10);
  line(330,360,320,355);
  
  stroke(255,255,255);
  strokeWeight(10);
  line(285,185,295,180);
  
  stroke(255,255,255);
  strokeWeight(10);
  line(280,165,290,160);
  
}



