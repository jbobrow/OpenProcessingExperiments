
int numstalks=40;
Stalk[] stalks = new Stalk[numstalks];

void setup() {
  size(400,300,JAVA2D); 
  smooth();
  for(int i=0;i<stalks.length;i++) {
    stalks[i]=new Stalk(random(width),random(height));
  }
}

void draw() {
  background(255);
  for(int i=0;i<stalks.length;i++) {
    stalks[i].display();
  }
}

class Stalk {
  
float noi1,noi2,noi3,noi4,noi5,noi6,noi7,noi8,noi9,noi10,xpos,ypos;
float seed1 = random(0.0003);
float seed2 = random(0.001);
float seed3 = random(0.002);
float seed4 = random(0.0009);
float seed5 = random(0.0008);
  Stalk(float startx,float starty) {
  xpos=startx;
  ypos=starty;
  }
  void display() {
    noFill();
    stroke(10,128);
    strokeWeight(1*noise(frameCount*0.0005));
    noi1=noise(millis()*seed1);
    noi2=noise(millis()*seed2);
    noi3=noise(millis()*seed3);
    noi4=noise(millis()*seed4);
    noi5=noise(millis()*seed5);
    bezier(0,height,xpos,ypos,width*0.5*noi1,height*0.5*noi2, width*0.5*noi5+mouseX,height*0.5*noi4);
  }

}

