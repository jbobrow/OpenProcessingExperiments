
Walker [] myWalker;

 
void setup() {
size(800,600);
myWalker=new Walker[15];
for (int i=0;i<myWalker.length;i++){ 
myWalker [i]=new Walker(random(0,400),random(0,300));
 
  }
noStroke();
fill(255);
}
 
void draw() {
  background(4, 81, 140);
for (int i=0;i<myWalker.length;i++){ 
 
       
myWalker[i].moveWalker();
myWalker[i].drawWalker();
    }
}
 
 
 
 
 
class Walker {
float x;
float y;
float s;
    
Walker (float ax, float ay) {
x=ax;
y=ay;

}
    
void moveWalker() {
float myX=int(random(0,2));
float myY=int(random(0,2));
x=x+myX/2;
y=y+myY/2;
      
   }
    
void drawWalker() {
fill(50, 205, 50);
pushMatrix();
translate(x,y);
scale(0.5);
  stroke(255);
  strokeWeight(2);
  ellipse(150, height/2-74, 70, 50);//head//
  fill(50, 205, 50);
  ellipse(150, height/2, 70, 100);//body//
  fill(50, 205, 50);
  ellipse(134, height/2-112, 16, 35);
  ellipse(166, height/2-112, 16, 35);//eyes//
  fill(0, 100, 0);
  ellipse(112, height/2+48, 40, 10);//lef feet//
  ellipse(188, height/2+48, 40, 10);//right feet//
  fill(50, 205, 50);
  arc(150, height/2-64, 20, 12, radians(5), radians(175));//smile//

  //moving eyeballs//
  fill(32);
  int myTime=0;//start 
  int nTime=second()-myTime;//measuring time
  if (nTime>=0 && nTime%2==0) {
    ellipse(131, height/2-103, 14, 14);
    ellipse(163, height/2-103, 14, 14); //lef//
  }
  if (nTime>=0 && nTime%2==1) {
    ellipse(137, height/2-103, 14, 14);
    ellipse(169, height/2-103, 14, 14); //right//
  }

  //legs//
  pushMatrix();
  translate(120, 320);
  rotate(radians(-30));
  fill(0, 100, 0);
  ellipse(0, 0, 32, 65);
  popMatrix();//left leg//
  pushMatrix();
  translate(130, 290);
  rotate(radians(30));
  ellipse(60, 0, 32, 65);//right leg//
  popMatrix();
  popMatrix();
}

}
