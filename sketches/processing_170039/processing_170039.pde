
int eSize=16;

size(400,400);
colorMode(RGB,255);
background(255);


for(int y=0; y<=height; y+=18){
  for(int x=0; x<=width; x+=18){
 
    if(x > 100 && x < 300 && y > 100 && y < 300){  
      fill(59,x,255,255);  
    }else{    
      fill(59,340-x,255,255);  
    }  
    
    noStroke(); 
    rectMode(CENTER);
    rect(x, y, eSize, eSize);
    println("x=" + x + ", y=" + y);  
}
}

for(int x= 0; x <=300; x+=25){
  if(x >=240){  
  stroke(191,480-x,255,255);
  strokeWeight(15);
  rectMode(CENTER);
  noFill();
  rect(410,0,x,x);
  
   stroke(191,480-x,255,255);
  strokeWeight(15);
  noFill();
 rect(0,410,x,x);

  stroke(191,480-x,255,255);
  strokeWeight(15);
  noFill();
 rect(-10,0,x,x);
  
  stroke(191,480-x,255,255);
  strokeWeight(15);
  noFill();
 rect(410,410,x,x);
}
}

for(int x= 0; x <=300; x+=25){
  if(x <=150){  
  stroke(191,360-x,255,255);
  strokeWeight(20);
  rectMode(CENTER);
  noFill();
 rect(410,0,x,x);
  
   stroke(191,360-x,255,255);
  strokeWeight(15);
  noFill();
  rect(0,410,x,x);

  stroke(191,360-x,255,255);
  strokeWeight(15);
  noFill();
  rect(-10,0,x,x);
  
  stroke(191,360-x,255,255);
  strokeWeight(15);
  noFill();
  rect(410,410,x,x);
}
}


