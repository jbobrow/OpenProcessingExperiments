
class Particle
{
 float x,y,vx,vy,diam,a;
boolean dead=false;
Particle(float _x, float _y)

{
 x=_x;
y=_y;
diam=random(5,130);
a=1;
vx=mvelx*0.2+random(-1,1);
vy=mvely*0.2+random(-1,1);
}
  void update()
  {
   vx+= noise(x*0.01,y*0.01,frameCount*0.02)-0.5;
  vy+= noise(y*0.01, x*0.01, frameCount*0.02+38450)-.5; 
  x+=vx;
  y+=vy;
  a*=0.98;
  diam--;
  if(a<0.05)
  {dead=true;}
  }
  void display()
  {
    fill(255,142,3,a*255);
    pushMatrix();
    translate(x,y);
    ellipse(0,0,diam,diam);
 popMatrix();
  }
}

ArrayList parts;
float mvelx,mvely;
void setup()
{
 size(500,500,P3D);
background(25,25,25);
  parts= new ArrayList();
}
void draw()
{
 background(25,25,25);
 fill(255);
 for(int y=0;y<height;y+=100)
 for(int x=0;x<width;x+=100)
 for(int i =5; i<20; i+=10)
 {
   ellipse(x,y,i,i);
 }
 fill(40,100,17);
 rect(0,175,500,500);
 fill(155,222,130,50);
 ellipse(250,325,490,280);
 stroke(110,110,110);
 strokeWeight(1);
 fill(157,157,157);
 ellipse(120,250,170,100);
 ellipse(180,230,150,100);
 ellipse(240,250,180,90);
 ellipse(300,250,180,80);
 ellipse(360,240,170,100);
 ellipse(400,260,100,100);
 fill(113,50,7);
 stroke(67,32,9,50);
 strokeWeight(2);
pushMatrix();
rotate(radians(20));
translate(100,-100);
rect(100,250,300,50);
popMatrix();
pushMatrix();
rotate(radians(-20));
translate(-100,100);
rect(100,250,300,50);
popMatrix();
stroke(67,32,9);
strokeWeight(1);
line(125,250,405,350);
line(130,240,410,340);
line(135,230,415,330);
//
line(120,340,400,230);
line(125,350,405,240);
line(130,360,410,250);
line(135,370,415,260);

fill(0,150);
noStroke();
ellipse(290,290,130,50);
fill(157,157,157);
stroke(110,110,110);
ellipse(90,300,100,130);
ellipse(90,350,100,100);
ellipse(100,360,100,130);
ellipse(120,370,100,100);
ellipse(180,380,120,120);
ellipse(240,380,150,120);
ellipse(300,380,90,110);
ellipse(360,370,100,100);
ellipse(420,350,80,150);
ellipse(450,330,90,90);
ellipse(450,300,100,130);


 
 noStroke();
 float tempx=noise(frameCount*0.03)*width;
 float tempy=noise(frameCount*0.03+37032)*height;
 mvelx=mouseX-pmouseX;
 mvely=mouseY-pmouseY;
parts.add(new Particle(tempx,tempy));
for(int i=0; i<parts.size(); i++)
{
  Particle p= (Particle)parts.get(i);
  if(p.dead==true)
  {parts.remove(i);}
  p.update();
  p.display();
}

}

void mouseDragged()
{
  for(int i=0; i<10;i++)
{
 parts.add(new Particle(mouseX,mouseY)); 
 
}

}




