
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/139851*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
float lineLength;
int x;
int y;
int howManySets;
float spacing;
int diameter;
int lineX;
int lineY;
float angle;


void setup() {
  size (800, 800);
   background(255);
}

void draw(){
}

void mouseClicked() {
  lineX=mouseX;
  lineY=mouseY;
  howManySets=int(random(2,5));
  lineLength=int(random(100,150));
  angle=random(16,25);
  
  line(lineX,lineY,lineX,lineY-lineLength);

  for (int i = 0; i < howManySets+1; i++) {

    spacing=lineLength/howManySets;
    diameter=5;
 
    
    line(lineX,lineY-spacing*i,(lineX+spacing/2+i)+1, (lineY-spacing*i)-angle);
    ellipse((lineX+spacing/2+i)+1,(lineY-spacing*i)-angle,diameter,diameter);
    
    line(lineX,lineY-spacing*i,(lineX-spacing/2+i)-1, (lineY-spacing*i)-angle);
    ellipse((lineX-spacing/2+i)-1,(lineY-spacing*i)-angle,diameter,diameter);
    
    


    
  }
}






