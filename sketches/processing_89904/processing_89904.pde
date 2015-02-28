
int yPos=0;

void setup(){ //setup function use only once
  size(400,400);
  smooth();
  background(150);
}

void draw(){ //draw function loops
  yPos=mouseY;
  if (yPos<150){
    fill(232,61,87);
    ellipse(200,200,350,200);
    fill(255);
    ellipse(200,150,150,50);
    fill(0);
    ellipse(200,150,100,25);
    strokeWeight(5);
    line(125,250,275,250);
   }
   else if (yPos >= 150 && yPos <=250){
     background(0,0,255);
   }
   else(
      background(0);
   }
}
