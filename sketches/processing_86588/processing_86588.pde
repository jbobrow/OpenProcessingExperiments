
void setup() {
  size(800,800);
  int myAlpha;
  int myBeta;
  myAlpha=mouseX;
  myBeta=mouseY;
  
}

void draw() {
background(252,250,217);

fill(50,205,50);
ellipse(mouseX+100,mouseY+60,70,50);//head//
fill(50,205,50);
ellipse(mouseX+100,mouseY+134,78,100);//body//
fill(50,205,50);
ellipse(mouseX+84,mouseY+22,16,35);
ellipse(mouseX+116,mouseY+22,16,35);//eyes//
fill(0);
ellipse(mouseX+84,mouseY+31,14,14);
ellipse(mouseX+116,mouseY+31,14,14);//eyeballs//
fill(0,100,0);
ellipse(mouseX+62,mouseY+180,40,10);
ellipse(mouseX+138,mouseY+180,40,10);//feet//
fill(0,100,0);
ellipse(mouseX+70,mouseY+150,32,60);
ellipse(mouseX+130,mouseY+150,32,60);//legs//
fill(50,205,50);
arc(mouseX+100,mouseY+66,20,12,radians(5),radians(175));//smile//

}
