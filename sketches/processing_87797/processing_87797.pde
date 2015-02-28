
int dotsSize;
color dotsColor;
int leaveX;
int leaveY;

void setup() {
  size(800,800);
  int mouseX;
  int mouseY;
 
}

void draw() {

//draw background
background(252,250,217);
dotsSize=int(random(0,100));
dotsColor=int(random(#24D3D2,#C724D3));
leaveX=int(random(0,width));
leaveY=int(random(0,height));
fill(dotsColor);
ellipse(leaveX,leaveY,dotsSize,dotsSize);

translate(-100,-134);
fill(50,205,50);
ellipse(mouseX+100,mouseY+60,70,50);//head//
fill(50,205,50);
ellipse(mouseX+100,mouseY+134,70,100);//body//
fill(50,205,50);
ellipse(mouseX+84,mouseY+22,16,35);
ellipse(mouseX+116,mouseY+22,16,35);//eyes//
fill(0);
ellipse(mouseX+84,mouseY+31,14,14);
ellipse(mouseX+116,mouseY+31,14,14);//eyeballs//
fill(0,100,0);
ellipse(mouseX+62,mouseY+180,40,10);
ellipse(mouseX+138,mouseY+180,40,10);//feet//

pushMatrix();
translate(mouseX+70,mouseY+155);
rotate(radians(-30));
fill(0,100,0);
ellipse(0,0,32,65);
popMatrix();
pushMatrix();
translate(mouseX+130,mouseY+155);
rotate(radians(30));
ellipse(0,0,32,65);
popMatrix();//legs//

fill(50,205,50);
arc(mouseX+100,mouseY+66,20,12,radians(5),radians(175));//smile//

}
