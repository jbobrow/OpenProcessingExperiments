

void setup(){
  size(600,1000);
  //background(180);
  smooth();
  noCursor();
  
  
}

void draw (){
  background(255);
  smooth();
  strokeWeight(2);
  stroke(0);
  for ( float b = -50; b < 600; b +=8){
      line(b,150,b+60,900);
    }
  float x = mouseX;
  float y = mouseY;
  //eye control
  if( x >= 350){
    x = 350;}
    if ( x<=250){
      x=250;}
      if ( y >= 430){
        y = 430;}
        if (y <= 270){
          y = 270;}
          
  noStroke();
  fill(0,150);
  ellipse(300,870,300,30);
  fill(63,39,12);
  ellipse(300,450,420,500);
  ellipse(150,270,180,210);
  ellipse(450,270,180,210);
  ellipse(300,720,60,60);
  ellipse(300,780,120,120);
  
  
  //hands and feet
  fill(140,86,27);
  ellipse(210,720,30,30);
  ellipse(390,720,30,30);
  ellipse(240,870,60,30);
  ellipse(360,870,60,30);
 
  //white
  fill(255);
  rect(240,270,120,210);
  ellipse(210,360,180,300);
  ellipse(390,360,180,300);
  
  fill(89,67,43);
  rect(240,480,90,90);
  //black
  fill(0);
  //eyes
  //ellipse(150,360,30,30);
  //ellipse(330,360,30,30);
  //nose
  ellipse(300,480,90,60);
  
  fill(140,86,27);
  ellipse(300,600,90,60);
  
  //brown
  fill(140,106,68);
  ellipse(240,540,120,120);
  ellipse(360,540,120,120);
  
   fill(0);
  ellipse(x-90,y,30,30);
  ellipse(x+90,y,30,30);
  
}



