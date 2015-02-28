
float x=0;
float xa=100;
float xb=0;
float xaa=150;
void setup(){
  size(600,600);
  background(200);
  smooth();
  strokeCap(SQUARE);
  rectMode (CENTER);
}

void draw(){
  background(200);
  //---------------line--------------------
  strokeWeight(random(8,10));
  stroke(random(200,230), random(150,180), random(90,110));
  line(x, 10, x, 190);
  x++;
  if(x>=width){
    x=0;
  }
  //-----------------------ellipse-------------
  strokeWeight(5);
  stroke(210, 160, 90);
  fill(random(100,110), random(130,180), random(100,110));
  ellipse(xa, 300, 100, 100);
  noStroke();
  fill(90,110,90,200);
  ellipse(xa,300, random(70, 80), random(70, 80));
  xa+=2;
  
   if(xa>=width){
    xa=0;
  }
  
 //-----------rectangle-------------
  strokeWeight(random(2,3));
  stroke(random(10,20), random(100,150), random(200,100));
 /* int shrink = 1;
  int xaa = 50;
 if(xaa>100){
    shrink = 0;
  }else if (xaa<51) {
    shrink = 1;  // can't figure how to make the rectangle pulse
                  //ie grow/shrink
  }
 if(shrink == 1) {
    xaa +=1;
  }else if (shrink == 0) {
    xaa-=1;
  }*/
  
  
  rect(xb, 490, xaa,xaa);
  xb+=0.5;
  
  if(xb>=width){
    xb=0;
  }
  
 
  xb+=0.5;
}


