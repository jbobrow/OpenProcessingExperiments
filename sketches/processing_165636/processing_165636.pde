
void setup()
{
  size(600,600);
  background(255);
  smooth();
}

void draw()
{
  background(0,150,255);
  fill(220);
  beginShape();
  vertex(0,500);
  vertex(0,300);
  vertex(123,200);
  vertex(255,322);
  vertex(400,111);
  vertex(551,231);
  vertex(600,87);
  vertex(600,500);
  endShape();
  fill(240);
  rect(0,420,width,420);
  Droid(mouseX,mouseY);
}

void Droid(int x,int y)
{
  translate(x,y);
  fill(175);
  strokeWeight(1.125);
  
  line(30,10,60,40); //right leg
  line(60,40,50,70);
  line(50,70,42,77);
  line(50,70,40,70);
  
  line(-30,10,-30,60); //left leg
  line(-30,60,-20,100);
  line(-20,100,-12,109);
  line(-20,100,-19,110);
  
  quad(-2,13,2,13,12,60,8,60); //middle leg
  quad(12,60,8,60,-12,90,-8,90);
  quad(-12,90,-8,90,17,110,13,110);
  line(15,110,25,120);
  line(15,110,30,110);
  
  rect(-30,0,60,10);
  quad(-60,-30,-50,0,50,0,60,-30);
  ellipse(0,-30,120,10);
  
  ellipse(0,13,20,20); //middle leg
  ellipse(10,60,10,10);
  ellipse(-10,90,10,10);
  ellipse(15,110,6,6);
  
  ellipse(-30,10,10,10); //left leg
  ellipse(-30,60,6,6);
  ellipse(-20,100,6,6);
  
  ellipse(30,10,10,10); //right leg
  ellipse(60,40,6,6);
  ellipse(50,70,6,6);

  
  quad(-10,-22,20,-22,15,5,-5,5);
  quad(-6,-18,16,-18,11,1,-1,1);
  quad(60,-20,55,-5,45,-5,50,-20);
  rect(-20,-40,50,6);
  ellipse(0,-55,100,35);
  line(-45,-47,45,-47);
 
  ellipse(-40,-55,20,20); //eyes
  ellipse(-12,-50,15,15);
  ellipse(15,-50,19,19);
  ellipse(48,-50,15,15);
  
  fill(0);
  ellipse(-45,-55,15,18); //eyes
  ellipse(-15,-50,12,14);
  ellipse(19,-50,16,16);
  ellipse(50,-50,9,15);
  
  line(-20,-70,-25,-80);
  line(-15,-70,-13,-83);
  ellipse(0,13,7,7);
}


