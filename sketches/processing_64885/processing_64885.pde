
// Make the line appear faintly and grow dark to black,
// then split and fade again as it forms a pod.
// Make the pod shape slightly random.

void setup ()
{
  size (300,300);
  background (255);
  smooth();
  frameRate(60);
  strokeWeight (20);
  stroke(0, 100);
  fill(255,10);

}

int botlx = 150;
int botly = 150; 
int botrx = 150; 
int botry = 150; 

int toplx = 150;
int toply = 150;
int toprx = 150;
int topry = 150;

void draw() {

  {
  bezier(35,150,toplx,toply,toprx,topry,265,150);
  bezier(35,150,botlx,botly,botrx,botry,265,150);
  }
if(mousePressed == true) {
// move the control points 
  toplx=toplx-1;
  toply=toply-1;
  toprx=toprx+1;
  topry=topry-1;
  botlx=botlx-1;
  botly=botly+1;
  botrx=botrx+1;
  botry=botry+1;
}
  if (toplx <=34) {

      toplx=34;
      toply=34;
      toprx=266;
      topry=34;
      botlx=34;
      botly=266;
      botrx=266;
      botry=266;

  }
  
 
}




