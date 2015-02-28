
size (500,500);
background(23, 239, 0 );

smooth();
stroke(255);
strokeWeight(4);






noStroke();

int radius=200;
for ( int deg = 0; deg <360; deg +=12){
  float angle = radians(deg);
  float x = 250+ ( cos(angle)*radius);
  float y= 250+(sin(angle)*radius);
  ellipse(x,y,20,20);
  fill(0,200);
}
  

smooth();
noFill();
randomSeed(0);
strokeWeight(4);

stroke(0,200);
for ( int i = 0; i< 500; i +=10){
  float begin = radians(i);
  float end = begin+ HALF_PI;
  arc(200,200,i,i,begin,end);
}
stroke(0);
for ( int i = 0; i< 500; i +=10){
  float begin = radians(i);
  float end = begin+ HALF_PI;
  arc(100,100,i,i,begin,end);
}

stroke(0);
for ( int i = 0; i< 500; i +=10){
  float begin = radians(i);
  float end = begin+ HALF_PI;
  arc(300,200,i,i,begin,end);
}
stroke(0,120);
for ( int i = 0; i< 500; i +=10){
  float begin = radians(i);
  float end = begin+ HALF_PI;
  arc(400,200,i,i,begin,end);
}


fill(0);
for ( int y= 100; y <= 500; y += 20){
  for ( int x = 100; x <= 500; x+= 20){
   if ((x% 10) ==0){
    line( x,y, x+4, y-4);
   }else{
    line(x,y, x+4, y+4);
   }
  }
} 

fill(0);
for ( int y= 50; y <= 500; y += 20){
  for ( int x = 50; x <= 500; x+= 20){
   if ((x% 10) ==0){
    line( x,y, x+4, y-4);
   }else{
    line(x,y, x+4, y+4);
   }
  }
} 

fill(0);
for ( int y= 0; y <= 500; y += 20){
  for ( int x = 0; x <= 500; x+= 20){
   if ((x% 10) ==0){
    line( x,y, x+4, y-4);
   }else{
    line(x,y, x+4, y+4);
   }
  }
} 

fill(0);
for ( int y= 200; y <= 500; y += 10){
  for ( int x = 200; x <= 500; x+= 10){
   if ((x% 10) ==0){
    line( x,y, x+3, y-3);
   }else{
    line(x,y, x+3, y+3);
   }
  }
} 


fill(0);
for ( int y= 100; y <= 400; y += 10){
  for ( int x = 100; x <= 400; x+= 10){
   if ((x% 10) ==0){
    line( x,y, x+3, y-3);
   }else{
    line(x,y, x+3, y+3);
   }
  }
} 



fill(255);
for ( int y= 80; y <= 400; y += 10){
  for ( int x = 80; x <= 400; x+= 10){
   if ((x% 10) ==0){
    line( x,y, x+3, y-3);
   }else{
    line(x,y, x+3, y+3);
   }
  }
}






