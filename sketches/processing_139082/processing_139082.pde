
int i;
float j;

void setup(){
  size(600,600); 
  //background (255);
}

void draw() {
  if (mouseX > 0) {
    noCursor();
  }
  //background (0);
  noStroke();
  //fill(255);
  rect(0,0,600,600);
  for (i=0 ; i<500 ; i++){
    float j = map(i, 0, 500, 0, 255);
    stroke (j, 255, 255);
    line ( 0, j, width,j);
     }
  float x = mouseX;
  float y = mouseY;
  float n = noise(x)*10;
 
  //neck//
  //curve (300,600, 200, 100, x, y, x+20, y-20);
  //hair//
  strokeWeight(2);
  noFill();
  stroke (207, 166, 5);
  if (x < width/2){
    line (x, y-100, x+50, y-150);
    ellipse (x+50, y-150, 20, 20);
    //bezier ( x, y-100, x, y+50, x+100, y-100, x+100+n, y-100 );  
  } else{
    line (x, y-100, x-50, y- 150);
    ellipse (x-50, y-150, 20, 20);
    //bezier ( x, y-100, x, y+50, x-100, y-100, x-100-n, y-100 );
  }
  
  //head//
  fill(207, 166, 54);
  ellipseMode(CENTER);
  ellipse (x, y, 200 , 200);
  
  //eyes//
  fill (255);
  ellipseMode(CENTER);
  strokeWeight (1);
  ellipse (x-100, y, 40  , 40);
  ellipse (x+50  , y, 40, 40);
  
  //eye balls//
  //fill (x+y, y/3, x*2);
  fill (0);
  noStroke();
  ellipseMode(CENTER);
  ellipse (x-100, y, 20  , 20); //right//
  ellipse (x+50  , y, 20 , 20); //left//
  //ellipse (x-100-n/2, y+n/2, 20  , 20); //right//
  //ellipse (x+50-n/2  , y, 20 , 20); //left//
  
  //wings//
  noStroke();
  fill(255, 99);
  triangle (x+5, y+110, x+165, y+130-n*8, x+120, y+60);//right//
  triangle (x-5, y+110, x-165, y+130-n*8, x-120, y+60);//left//
    
  //body//
  noStroke();
  fill (200, 65, 54);
  ellipseMode(CENTER);
  ellipse (x+5 , y+125 , 50, 50);
  
  //eye brows//
  strokeWeight(10);
  stroke(207, 100, 54);
  line (x-140, y-25, x-90, y-40-n);
  line (x+100, y-25, x+40, y-40-n);
  
  //lips//
  strokeWeight(1);
  stroke(255);
  fill(0);
  rect (x-70, y+35, 90, 65, 3);
  
  //tooth//
  fill (5, 26, 137);
  float t = n*4;
  rect (x-70, y+35, 90, t, 3);
  rect (x-70, y+100, 90, 1-t, 3);
  //quad (x-70, y+35, x+20, y+35, x-70, y+50+n*4, x+20, y+35,);
  
}

