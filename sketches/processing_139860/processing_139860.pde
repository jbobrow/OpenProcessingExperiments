
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/139848*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int x;
int y;
int howManySets;
float spacing;
int diameter;
float angle;
float lineLength;
int lineY;

void setup() {
size (800,800);
background(255);
}

void draw() {
}

void mouseClicked(){

x=mouseX;
y=mouseY;
lineY=mouseY-25;

  howManySets=int(random(2,5));
  lineLength=int(random(60,80));
  angle=random(16,25);
  
  
  fill(232,247,67);
  stroke(165,237,210);
  line(x,lineY,x,lineY-lineLength);

  for (int i = 0; i < howManySets+1; i++) {

    spacing=lineLength/howManySets;
    diameter=5;
    
    ellipseMode(CENTER);
    
    line(x,lineY-spacing*i,(x+spacing/2+i)+1, (lineY-spacing*i)-20);
    ellipse((x+spacing/2+i)+1,(lineY-spacing*i)-20,diameter,diameter);
    
    line(x,lineY-spacing*i,(x-spacing/2+i)-1, (lineY-spacing*i)-20);
    ellipse((x-spacing/2+i)-1,(lineY-spacing*i)-20,diameter,diameter);
  }
  



noStroke();
fill(32,194,201);
 
ellipseMode(CENTER);
//head
ellipse(x,y,72,50);

fill(32,194,201);
//left curve
bezier(x-36,y,x-36,y+50,x-21,y+72,x,y+72);
//right curve
bezier(x+36,y,x+36,y+50,x+21,y+72,x,y+72);

fill(232,247,67);
//eye
ellipse(x,y-10,15,15);


fill(165,237,210);
//triangle body
triangle(x,y+72, x-36,y,x+36,y);

fill(232,247,67);
//antenna big circle 
ellipse(x,y-100,15,15);

ellipse(x,y-120,7,7);

fill(232,247,67,90);
ellipseMode(CORNER);
ellipse(x-34,y-5,-50,10);
ellipse(x+34,y-5,50,10);

fill(232,247,67,90);
bezier(x-33,y,x-45,y+2,x-70,y+48,x-48,y+66);
bezier(x+33,y,x+45,y+2,x+70,y+48,x+48,y+66);
 
  
}


