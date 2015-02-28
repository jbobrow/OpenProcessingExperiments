
int mouseXOld;
int mouseYOld;
int walk;
gall dancer1;
gall dancer2;
gall dancer3;
gall dancer4;
gall dancer5;
gall dancer6;
gall dancer7;
gall dancer8;
gall dancer9;
gall dancer10;
void setup()
{
  size(600,300);
  dancer1 = new gall();
  dancer2 = new gall();
  dancer3 = new gall();
  dancer4 = new gall();
  dancer5 = new gall();
  dancer6 = new gall();
  dancer7 = new gall();
  dancer8 = new gall();
  dancer9 = new gall();
  dancer10 = new gall();
}
void draw()
{
  background(mouseX,mouseY,(mouseSpeedX()+mouseSpeedY())/3);
  smooth();                                                               
  dancer1.show(100);
  dancer2.show(200);
  dancer3.show(300);
  dancer4.show(400);
  dancer5.show(500);
  dancer6.show(-125);
  dancer7.show(-225);
  dancer8.show(-325);
  dancer9.show(-425);
  dancer10.show(-550);
  fill(0);
  ellipse(mouseX+(mouseSpeedX()*2),mouseY+mouseSpeedY()-30,150,150);
  fill(129,0,123);
  if(mouseX>150+walk)
  {
    walk+=4;
  }
  if(mouseX<150+walk)
  {
    walk-=4;
  }
  beginShape();
  vertex(100+walk,300);
  vertex(200+walk,300);
  vertex(((mouseX+50+200+walk)+mouseSpeedX()*3)/2,(mouseY+300)/2);
  vertex(mouseX+50,mouseY);
  //vertex(mouseX+50+mouseSpeedX(),mouseY-50);

  //vertex(mouseX-50+mouseSpeedX(),mouseY-50);
  vertex(mouseX-50,mouseY);
  vertex(((mouseX-50+100+walk)+mouseSpeedX()*3)/2,(mouseY+300)/2);
  endShape();
  fill(102,51,0);
  beginShape();
  vertex(mouseX+50,mouseY);
  vertex(mouseX+50+mouseSpeedX(),mouseY-50);
  vertex(mouseX-50+mouseSpeedX(),mouseY-50);
  vertex(mouseX-50,mouseY);
  endShape();
  line(mouseX-50,mouseY,mouseX+50,mouseY);
  fill(0);
  bezier(mouseX-30,mouseY-20,mouseX+(random(-1,2)*mouseSpeedX()),mouseY-20+abs(mouseSpeedY()*2),mouseX+(random(-1,2)*mouseSpeedX()),mouseY-20+abs(mouseSpeedY()*2),mouseX+30,mouseY-20);
  fill(255);
  bezier(mouseX-40,mouseY-35,mouseX-30+mouseSpeedX()*2,mouseY-40+mouseSpeedY()*2,mouseX-30+mouseSpeedX()*2,mouseY-40,mouseX-20,mouseY-35);
  bezier(mouseX-40,mouseY-35,mouseX-30,mouseY-33,mouseX-30,mouseY-33,mouseX-20,mouseY-35);
  bezier(mouseX+40,mouseY-35,mouseX+30+mouseSpeedX()*2,mouseY-40+mouseSpeedY()*2,mouseX+30+mouseSpeedX()*2,mouseY-40,mouseX+20,mouseY-35);
  bezier(mouseX+40,mouseY-35,mouseX+30,mouseY-33,mouseX+30,mouseY-33,mouseX+20,mouseY-35);
  fill(0);
  ellipse(mouseX-30,mouseY-36,2+mouseSpeedX(),2+mouseSpeedY());
  ellipse(mouseX+30,mouseY-36,2+mouseSpeedX(),2+mouseSpeedY());
  fill(204,173,234);
  beginShape();
  vertex((mouseX+200+walk)/2,(mouseY+300)/2);
  vertex(mouseX+50+mouseSpeedX(),200-(mouseY/3)-mouseSpeedX()+20);
  vertex(mouseX+50+mouseSpeedX(),250-(mouseY/3)-mouseSpeedX()+20);
  endShape();
  line((mouseX+200+walk)/2,(mouseY+300)/2,mouseX+50+mouseSpeedX(),20+250-(mouseY/3)-mouseSpeedX());
  beginShape();
  vertex((mouseX+100+walk)/2,(mouseY+300)/2);
  vertex(mouseX-50+mouseSpeedX(),200-(mouseY/3)+mouseSpeedX()+20);
  vertex(mouseX-50+mouseSpeedX(),250-(mouseY/3)+mouseSpeedX()+20);
  endShape();
  line((mouseX+100+walk)/2,(mouseY+300)/2,mouseX-50+mouseSpeedX(),250+20-(mouseY/3)+mouseSpeedX());
  fill(0);
  mouseXOld=mouseX;
  mouseYOld=mouseY;
  println(mouseSpeedY());
  
}
int mouseSpeedX()
{
  return mouseXOld-mouseX;
}
int mouseSpeedY()
{
  return mouseYOld-mouseY;
}
void keyPressed()
{
  if(key=='d')
  {
    walk+=4;
  }
  if(key=='a')
  {
    walk-=4;
  }
}
class gall
{
  void show(int distance)
  {
    fill(0);
    ellipse(mouseX+distance+15+mouseSpeedX()*2,mouseY-25,50,50);
    bezier(mouseX+distance+mouseSpeedX(),300,mouseX+distance-10+mouseSpeedX()*2,(((mouseY+300)/2)+300)/2,mouseX+distance-20+mouseSpeedX()*2,((mouseY+300)/2)+20,mouseX+distance+mouseSpeedX(),(mouseY+300)/2);
    
    beginShape();
    vertex(mouseX+distance+mouseSpeedX(),300);
    vertex(mouseX+distance+30+mouseSpeedX(),300);
    vertex(mouseX+distance+30+mouseSpeedX(),(mouseY+300)/2);
    vertex(mouseX+distance+mouseSpeedX()-1,(mouseY+300)/2);
    endShape();
    bezier(mouseX+distance+mouseSpeedX()+30,300,mouseX+distance+10+30+mouseSpeedX()*2,(((mouseY+300)/2)+300)/2,mouseX+distance+20+30+mouseSpeedX()*2,((mouseY+300)/2)+20,mouseX+distance+mouseSpeedX()+30,(mouseY+300)/2);
    fill(102,51,0);
    beginShape();
    vertex(mouseX+distance+10+mouseSpeedX(),mouseY+10);
    vertex(mouseX+distance-20+mouseSpeedX(),(mouseY+300)/2+mouseSpeedX());
    vertex(mouseX+distance-20+mouseSpeedX()+10,(mouseY+300)/2+10+mouseSpeedX());
    vertex(mouseX+distance+10+mouseSpeedX(),mouseY+30);
    endShape();
    beginShape();
    vertex(mouseX+distance+20+mouseSpeedX(),mouseY+10);
    vertex(mouseX+distance+50+mouseSpeedX(),(mouseY+300)/2+mouseSpeedX());
    vertex(mouseX+distance+50+mouseSpeedX()-10,(mouseY+300)/2+10+mouseSpeedX());
    vertex(mouseX+distance+20+mouseSpeedX(),mouseY+30);
    endShape();
    fill(50,204,100);
    beginShape();
    vertex(mouseX+distance+mouseSpeedX(),(mouseY+300)/2);
    vertex(mouseX+distance+mouseSpeedX()+30,(mouseY+300)/2);
    vertex(mouseX+distance+mouseSpeedX()*2+30-3,mouseY);
    vertex(mouseX+distance+mouseSpeedX()*2+3,mouseY);
    endShape();
    bezier(mouseX+distance+mouseSpeedX(),(mouseY+300)/2,mouseX+distance+mouseSpeedX()*2,(((((mouseY+300)/2)+mouseY)/2)+mouseY)/2,mouseX-20+distance+mouseSpeedX(),(((mouseY+300)/2)+mouseY)/2,mouseX+distance+5+mouseSpeedX()*2,mouseY);
    bezier(mouseX+distance+mouseSpeedX()+30,(mouseY+300)/2,mouseX+30+distance+mouseSpeedX()*2,(((((mouseY+300)/2)+mouseY)/2)+mouseY)/2,mouseX+20+30+distance+mouseSpeedX(),(((mouseY+300)/2)+mouseY)/2,mouseX+30-5+distance+mouseSpeedX()*2,mouseY);
    fill(102,51,0);
    ellipse(mouseX+distance+15+mouseSpeedX()*2,mouseY-15,45,45);
    
    
  }
}


