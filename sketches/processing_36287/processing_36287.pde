
int [] LN = {
  -60, 0, 0, 200, -15, 400
};
int [] LN2 = {
  600, 0, 600, 200, 600, 400
};

int choice = 0;
int[] r = {48,255,155,255,255,61,156,156,156,125,242,125,242,110,242,242};
int[] g = {43,166,181,213,175,135,107,49,13,38,191,93,121,125,50,234};
int[] b = {47,0,143,150,56,59,34,16,0,30,94,0,31,41,3,64};
int[] t = {100,100,100,100,100,100,100,100,100,100,100,100,100,100,100};



void setup()
{
  size(700, 400);
  background (255);
  //stroke(0, 0, 0, 100);
  noFill();
}
void draw()
{

  line(LN[0], LN[1], LN[2], LN[3]);
  line(LN[2], LN[3], LN[4], LN[5]);
  //line(LN2[0], LN2[1], LN2[2], LN2[3]);
  //line(LN2[2], LN2[3], LN2[4], LN2[5]);
}

void mousePressed()
{
  LN[2] = mouseX;
  LN[3] = mouseY;
  LN2[2] = mouseX;
  LN2[3] = mouseY;
  
  choice = int(random(0,15));
  println (choice);
  stroke(r[choice],g[choice],b[choice],t[choice]);
  
  

 // stroke (random(0, 255), random(0, 255), random(0, 255), random(20, 100));


  if (LN[0] > 700) {
    LN[0] = -60;
    background(255);
  }

  LN[0] = LN[0] + 60 ;
  
   if (LN[4] >700){
     LN[4] = -15;
     background(255);}
     
  LN[4] = LN[4] + 15;
}



void mouseDragged()
{
  LN[2] = mouseX;
  LN[3] = mouseY;
  LN2[2] = mouseX;
  LN2[3] = mouseY;

  strokeWeight(random(0.5,3));
}







