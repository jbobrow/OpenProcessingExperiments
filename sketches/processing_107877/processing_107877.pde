
size(1280,800);
background(255,255,255);


int a = 0;
while (a < 800) { //the background yo
  //stroke(137, 11, 11);
  strokeWeight(0);
  //line(0, a, 1280, a);
  //line(0, a+1, 1280, a-2);
  line(a, 0, 1280, a);
  line(0, a, a, 800);
  a = a + 10;
}




//my house
stroke(0, 0, 0);
strokeWeight(1.50);
line(100, 200, 100, 800); //1
line(100, 600, 800, 600);//2
line(800, 600, 800, 400);//3
line(800, 400, 350, 400);//4
line(350, 200, 350, 600);//5
line(800, 600, 820, 580);//d1
line(800, 400, 1000, 200);//d2
line(820, 380, 820, 580);//6
line(550, 400, 550, 600);//porch
line(100, 200, 1280, 200);//7
line(100, 200, 200, 0);//8

//my room
noFill();
rect(150, 230, 150, 150); //dat window
strokeWeight(0.75);
quad(152, 227, 153, 384, 294, 384, 301, 230);
//stroke(137, 11, 11);
ellipse(190, 350, 17, 17);
ellipse(190, 370, 25, 25);

stroke(0,0,0);
//1 multiples
strokeWeight(0.75);
line(105, 201, 104, 800);
line(96, 201, 102, 800);
line(100, 200, 93, 800);

//2 multiples
line(96, 602, 803, 602);
line(100, 601, 802, 598);
line(99, 597, 800, 604);
line(100, 596, 800, 599);

//3 multiples
line(799, 597, 803, 397);
line(801, 604, 798, 400);
line(802, 600, 802, 396);

//4 multiples
//line(800, 400, 350, 400);
line(798, 403, 348, 400);
line(799, 399, 350, 403);
line(800, 396, 350, 398);
line(802, 404, 352, 401);

//5 multiples
//line(350, 200, 350, 600);
line(348, 201, 354, 601);
line(353, 200, 356, 600);
line(350, 203, 348, 598);

//d1
//line(800, 600, 820, 580); 
line(800, 603, 820, 583);

//d2
//line(800, 400, 1000, 200); 
line(800, 396, 1002, 202);
line(800, 398, 999, 200);

//6 multiples
//line(820, 380, 820, 580);
line(819, 379, 823, 580);
line(822, 380, 822, 580);

//porch
//line(550, 400, 550, 600);
line(546, 398, 549, 601);

//7 multiples
//line(100, 200, 550, 200);
line(98, 198, 1280, 205);
line(100, 195, 1280, 195);

//shading of sorts
int b = 725;
int c = 203;
while (b > 350) {
  line(350, c, b, c);
  b = b - 25;
  c = c + 3;
}
line(350, c, 360, c);

int d = 550;
int e = 400;
while (d > 350) {
    line(350, e, d, e);
    d = d - 25;
    e = e + 3;
}
line(350, e, 360, e);

int f = 300;
int g = 233;
while (f > 150) {
  line(150, g, f, g);
  f = f - 25;
  g = g + 3;
}
line(150, g, 160, g);

//8
//line(100, 200, 200, 0);
line(102, 202, 204, 0);

//dat cathedral
strokeWeight(1.5);
line(675, 300, 675, 800);//v1
strokeWeight(0.75);
line(673, 300, 676, 800);
line(672, 300, 674, 800);

strokeWeight(1.5);
line(675, 300, 725, 300);//h1
strokeWeight(0.75);
line(676, 298, 725, 301);

strokeWeight(1.5);
line(725, 175, 725, 800);//v2
strokeWeight(0.75);
line(722, 175, 724, 800);
line(726, 176, 727, 800);

strokeWeight(1.5);
line(725, 175, 760, 175);//h2
strokeWeight(0.75);
line(724, 177, 759, 177);
line(725, 173, 760, 176);

strokeWeight(1.5);
line(760, 100, 760, 400);//v3
strokeWeight(0.75);
line(757, 100, 759, 400);
line(761, 101, 762, 399);

strokeWeight(1.5);
line(760, 100, 820, 80); //top1
strokeWeight(0.75);
line(757, 99, 819, 78);
line(759, 102, 820, 82);

strokeWeight(1.5);
line(820, 80, 880, 100); //top2
strokeWeight(0.75);
line(818, 76, 879, 97);

strokeWeight(1.5);
line(880, 100, 880, 320);//v4
strokeWeight(0.75);
line(877, 100, 882, 320);
line(882, 100, 884, 318);
