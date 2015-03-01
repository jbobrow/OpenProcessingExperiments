
float x,y;
float freq;
float px,py;

void setup()
{
  size(600,600);
  //noLoop();
  x = random(width);
  y = random(height);
  px = x;
  py = y;
  freq = .03;
  background(0);
  //beginRecord(PDF, "everything.pdf");
}

void draw()
{
  //background(0);
//for(int i=0; i <5;i++)
//makeline();

stroke(0);
strokeWeight(3);
fill(255,random(50,100));
ellipseMode(CENTER);
//ellipse(x,y,width,height);
//ellipse(x,y,10,10);
strokeWeight(random(.5,3));

ellipse(10,10,10,10);
ellipse(2.5,2.5,2.5,2.5);
ellipse(3,3,3,3);
ellipse(4,4,4,4);
ellipse(6,6,6,6);
ellipse(8,8,8,8);
ellipse(12.5,12.5,12.5,12.5);
ellipse(13,13,13,13);
ellipse(17,17,17,17);
ellipse(20,20,20,20);
ellipse(22,22,22,22);
ellipse(28,28,28,28);
ellipse(15,15,15,15);
ellipse(30,30,30,30);
ellipse(35,35,35,35);
ellipse(40,40,40,40);
ellipse(45,45,45,45);
ellipse(50,50,50,50);
ellipse(55,55,55,55);
ellipse(60,60,60,60);
ellipse(65,65,65,65);
ellipse(70,70,70,70);
ellipse(25,25,25,25);
ellipse(75,75,75,75);
ellipse(80,80,80,80);
ellipse(85,85,85,85);
ellipse(90,90,90,90);
ellipse(95,95,95,95);
ellipse(100,100,100,100);
ellipse(200,200,200,200);
ellipse(300,300,300,300);
ellipse(310,310,310,310);
ellipse(320,320,320,320);
ellipse(330,330,330,330);
ellipse(340,340,340,340);
ellipse(350,350,350,350);
ellipse(360,360,360,360);
ellipse(370,370,370,370);
ellipse(380,380,380,380);
ellipse(390,390,390,390);
ellipse(400,400,400,400);
ellipse(410,410,410,410);
ellipse(420,420,420,420);
ellipse(430,430,430,430);
ellipse(440,440,440,440);
ellipse(450,450,450,450);
ellipse(290,290,290,290);
ellipse(280,280,280,280);
ellipse(270,270,270,270);
ellipse(260,260,260,260);
ellipse(250,250,250,250);
ellipse(240,240,240,240);
ellipse(230,230,230,230);
ellipse(220,220,220,220);
ellipse(210,210,210,210);
ellipse(200,200,200,200);
ellipse(200,200,200,200);
ellipse(190,190,190,190);
ellipse(180,180,180,180);
ellipse(170,170,170,170);
ellipse(160,160,160,160);
ellipse(150,150,150,150);

ellipse(140,140,140,140);
ellipse(130,130,130,130);
ellipse(120,120,120,120);
ellipse(110,110,110,110);
ellipse(100,100,100,100);
ellipse(75,75,75,75);
ellipse(50,50,50,50);
}

void mouseReleased()
{
 x = (mouseX);
y = (mouseY);
px = x;
py = y;
noiseSeed(int(random(100000)));
redraw();  
}
void keyReleased()
{
  noLoop();
}

void makeline()
{
  x = random(height);
  y = random(width);
  int l = int(random(100,500));
  for (int i = 0; i <100;i++)
  { 
    x+= (noise(y*freq, y*freq)-.3)*10;
    y+= (noise(x*freq, i*freq)-.1)*10;
  
  //float r = noise(x*freq,y*freq)*255;
  //float g = noise(y*freq,x*freq)*255;
  //float b = noise(y*freq,x*freq)*255;
  //float w = noise(x*freq,y*freq)*5;
  
  
  float r = noise(x*freq,y*freq)*255;
  float g = noise(x*freq,x*freq)*255;
  float b = noise(x*freq,i*freq)*255;
  float w = noise(i*freq,x*freq)*255;
  
  stroke(r,g,b,30);
  fill(0);
  strokeWeight(random(1,10));
  line(px,py,x,y);
  px=i;
  py=y;
  }
  //void keyReleased()
  {
    endRecord();
    //exit();
  }
}


