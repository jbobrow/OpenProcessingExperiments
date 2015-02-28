
int barcoenx;
void setup(){
size(800,600);
smooth();

barcoenx=0;
}

void draw(){
 // background(34,171,255);
 background(mouseX,mouseY,mouseX+50);
fill(mouseY-20,mouseX-80,mouseY-400);
noStroke();
  rect(0,420,800,600);
  strokeWeight(2);
stroke(255,0,255);
  fill(mouseX-255,mouseY-120,mouseX-150);
  quad(barcoenx-162,360,barcoenx-239,371,barcoenx-238,350,barcoenx-174,335);
  fill(mouseY-255,mouseX-90,mouseX-100);
  quad(barcoenx-259,400,barcoenx-265,370,barcoenx-128,350,barcoenx-80,381);
  fill(255,mouseY-100,mouseX+10);
  quad(barcoenx-292,395,barcoenx,371,barcoenx-124,420,barcoenx-280,420);
  fill(mouseY+2,mouseX+123,mouseX-255);
  triangle(barcoenx-336,400,barcoenx-280,420,barcoenx-332,420);
  fill(mouseY-50,mouseX-205,30);
  ellipse(barcoenx-247,380,11,11);
   ellipse(barcoenx-225,377,11,11);
    ellipse(barcoenx-203,374,11,11);
     ellipse(barcoenx-181,371,11,11);
      ellipse(barcoenx-160,368,11,11);
       ellipse(barcoenx-138,365,11,11);

barcoenx=barcoenx+1;
}

