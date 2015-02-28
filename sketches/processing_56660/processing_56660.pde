
  int[] xpos = new int[50]; 
int[] ypos = new int[50];

void setup() {
  size (400,400);
   xpos[0]=0;
  ypos[0]=0;


}
void draw()
{
  background(255);
 
   for (int i=0; i<xpos.length-1; i++)
 {
   
 xpos[i]=xpos[i+1];
 ypos[i]=ypos[i+1];
 xpos[xpos.length-1]=mouseX;
 ypos[ypos.length-1]=mouseY;
 }
 for (int i=0; i<xpos.length-1; i++){
   fill(0, 50, 100, i);
   noStroke();
   smooth();
ellipse(xpos[i],ypos[i], i,i);
 }
}

