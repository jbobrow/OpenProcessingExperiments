

int space = 1;
int zero = 300;
void setup() {
  size(300,600);
  smooth();
  background(255,239,116);
  noFill();
}

void draw() {
  space = space + 6;
  stroke(2,167,28,random(50,100));
  strokeWeight(5);
  stroke(222,211,0,random(30,150));
  ellipse(150,200,space,space);
  strokeWeight(random(1,2));
  stroke(255,250,82,random(50,100));
  quad(width/2,height/3,width/2,height/3,0,0,50,0);
  quad(width/2,height/3,width/2,height/3,50,0,70,0);
  quad(width/2,height/3,width/2,height/3,70,0,120,0);
  quad(width/2,height/3,width/2,height/3,120,0,140,0);
  quad(width/2,height/3,width/2,height/3,140,0,190,0);
  quad(width/2,height/3,width/2,height/3,190,0,210,0);
  quad(width/2,height/3,width/2,height/3,210,0,260,0);
  quad(width/2,height/3,width/2,height/3,260,0,280,0);
  quad(width/2,height/3,width/2,height/3,280,0,330,0);



  //sideA
  quad(width/2,height/3,width/2,height/3,0,0,0,20);
  quad(width/2,height/3,width/2,height/3,0,20,0,70);
  quad(width/2,height/3,width/2,height/3,0,70,0,90);
  quad(width/2,height/3,width/2,height/3,0,90,0,140);
  quad(width/2,height/3,width/2,height/3,0,140,0,160);
  quad(width/2,height/3,width/2,height/3,0,160,0,210);
  quad(width/2,height/3,width/2,height/3,0,210,0,230);
  quad(width/2,height/3,width/2,height/3,0,230,0,280);
  quad(width/2,height/3,width/2,height/3,0,280,0,300);
  quad(width/2,height/3,width/2,height/3,0,300,0,350);
  quad(width/2,height/3,width/2,height/3,0,350,0,370);
  quad(width/2,height/3,width/2,height/3,0,370,0,420);
  quad(width/2,height/3,width/2,height/3,0,420,0,440);
  quad(width/2,height/3,width/2,height/3,0,440,0,490);
  quad(width/2,height/3,width/2,height/3,0,490,0,510);
  quad(width/2,height/3,width/2,height/3,0,560,0,580);
  quad(width/2,height/3,width/2,height/3,0,580,0,630);

  //sideB
  quad(width/2,height/3,width/2,height/3,zero,0,zero,20);
  quad(width/2,height/3,width/2,height/3,zero,20,zero,70);
  quad(width/2,height/3,width/2,height/3,zero,70,zero,90);
  quad(width/2,height/3,width/2,height/3,zero,90,zero,140);
  quad(width/2,height/3,width/2,height/3,zero,160,zero,210);
  quad(width/2,height/3,width/2,height/3,zero,210,zero,230);
  quad(width/2,height/3,width/2,height/3,zero,230,zero,280);
  quad(width/2,height/3,width/2,height/3,zero,280,zero,300);
  quad(width/2,height/3,width/2,height/3,zero,300,zero,350);
  quad(width/2,height/3,width/2,height/3,zero,350,zero,370);
  quad(width/2,height/3,width/2,height/3,zero,370,zero,420);
  quad(width/2,height/3,width/2,height/3,zero,420,zero,440);
  quad(width/2,height/3,width/2,height/3,zero,580,zero,630);

  //bottum
  quad(width/2,height/3,width/2,height/3,0,height,50,height);
  quad(width/2,height/3,width/2,height/3,50,height,70,height);
  quad(width/2,height/3,width/2,height/3,70,height,120,height);
  quad(width/2,height/3,width/2,height/3,120,height,140,height);
  quad(width/2,height/3,width/2,height/3,140,height,190,height);
  quad(width/2,height/3,width/2,height/3,190,height,210,height);
  quad(width/2,height/3,width/2,height/3,210,height,260,height);
  quad(width/2,height/3,width/2,height/3,260,height,280,height);
  quad(width/2,height/3,width/2,height/3,280,height,330,height);

  fill(255,255,0,10);
  quad(150,550,200,600,150,650,100,600);
  fill(255,255,0,4);
  quad(150,550,100,500,150,450,200,500);
  quad(150,650,200,700,150,750,100,700);
  quad(250,550,300,600,250,650,200,600);
  quad(50,550,100,600,50,650,0,600);
  noFill();
  fill(5,175,234,150);
  ellipse(150,160,20,80);
  ellipse(150,240,20,80);
  ellipse(190,200,80,20);
  ellipse(110,200,80,20);
  int x = 100;
  int y = 150;
  int x1 = 200;
  int y1 = 150;
  int x2 = 200;
  int y2 = 250;
  int x3 = 100;
  int y3 = 250;
  fill(0,250,231,100);
  quad(x,y-30,x+20,y,x,y+30,x-20,y);
  quad(x1+20,y1,x1,y1-30,x1-20,y1,x1,y1+30);
  quad(x2+20,y2,x2,y2-30,x2-20,y2,x2,y2+30);
  quad(x3,y3-30,x3+20,y3,x3,y3+30,x3-20,y3);
  noFill();
  
}
 

