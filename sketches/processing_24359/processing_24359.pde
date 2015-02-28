

int five = 50;
int zero = 300;
int ran1 = 100;
int ran2 = 200;
int ran11 = 100;
int ran22 = 200;
int a = 152;
int b = 11;
int c = 11;
void setup () {
  size(300,600);
  
  smooth();
}

int count = 1;


void draw() {

  background(242,90,90);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  line(150,200,random(0,300),random(0,600));


  //top
  noLoop();
  line(150,200,random(0,300),random(0,600));
  quad(width/2,height/3,width/2,height/3,0,0,50,0);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,50,0,70,0);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,70,0,120,0);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,120,0,140,0);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,140,0,190,0);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,190,0,210,0);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,210,0,260,0);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,260,0,280,0);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,280,0,330,0);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));


  //sideA
  quad(width/2,height/3,width/2,height/3,0,0,0,20);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,20,0,70);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,70,0,90);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,90,0,140);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,140,0,160);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,160,0,210);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,210,0,230);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,230,0,280);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,280,0,300);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,300,0,350);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,350,0,370);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,370,0,420);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,420,0,440);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,440,0,490);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,490,0,510);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,560,0,580);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,0,580,0,630);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));

  //sideB
  quad(width/2,height/3,width/2,height/3,zero,0,zero,20);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,20,zero,70);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,70,zero,90);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,90,zero,140);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,160,zero,210);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,210,zero,230);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,230,zero,280);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,280,zero,300);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,300,zero,350);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,350,zero,370);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,370,zero,420);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,420,zero,440);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,zero,580,zero,630);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));

  //bottum
  quad(width/2,height/3,width/2,height/3,0,height,50,height);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,50,height,70,height);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,70,height,120,height);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,120,height,140,height);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,140,height,190,height);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,190,height,210,height);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,210,height,260,height);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,260,height,280,height);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));
  quad(width/2,height/3,width/2,height/3,280,height,330,height);
  stroke(a,b,c,random(ran11,ran22));
  fill(a,b,c,random(ran1,ran2));



  while (count < 10) {
    count = count + 1;
    stroke(255,random(80,92),random(80,92));
    line(150,200,0,random(0,600));
    line(150,200,random(0,300),0);
    line(150,200,300,random(0,600));
    line(150,200,random(0,300),600);
  }
  int w = 150 ;
  int e = 200;
  fill(0,90,8);
  ellipse(w,e,80,80);
  fill(36,160,15,100);
  triangle(120, 155, 150, 50, 180, 155);
  triangle(120, 245, 150, 350, 180, 245);
  triangle(105, 170, 0, 200, 105, 230);
  triangle(195, 170, 300, 200, 195, 230);

  stroke(193,14,29);
  fill(255,3,3);
  //star

  int x = 150;
  int y = 600;
  int sizelow = 50;
  int sizehigh = 110;
  //first layer
  triangle(x,y, x, y-sizelow, x-sizelow, y);
  triangle(x,y, x, y-sizelow, x+sizelow, y);
  triangle(x,y, x, y+sizelow, x-sizelow, y);
  triangle(x,y, x, y+sizelow, x+sizelow, y);
  //2nd layer

  stroke(193,14,29);
  fill(160,5,5);
  triangle(x-sizelow,y-sizelow, x, y-sizelow, x-sizelow, y);
  triangle(x+sizelow,y-sizelow, x, y-sizelow, x+sizelow, y);
  triangle(x-sizelow,y+sizelow, x, y+sizelow, x-sizelow, y);
  triangle(x+sizelow,y+sizelow, x, y+sizelow, x+sizelow, y);
  //3rd layer
  stroke(193,14,29);
  fill(80,2,2);
  triangle(x-sizelow,y-sizelow, x, y-sizelow, x, y-sizehigh);
  triangle(x+sizelow,y-sizelow, x, y-sizelow, x, y-sizehigh);
  triangle(x-sizelow,y+sizelow, x, y+sizelow, x, y+sizehigh);
  triangle(x+sizelow,y+sizelow, x, y+sizelow, x, y+sizehigh);
  triangle(x-sizelow,y-sizelow, x-sizehigh, y, x-sizelow, y);
  triangle(x+sizelow,y-sizelow, x+sizehigh, y, x+sizelow, y);
  triangle(x-sizelow,y+sizelow, x-sizehigh, y, x-sizelow, y);
  triangle(x+sizelow,y+sizelow, x+sizehigh, y, x+sizelow, y);
  

}


