
int x=600;
int y=280;
int ra=240;
int a=230;
int b=290;
int rb=180;
int c=550;
int d=410;
int rc=660;
int xe=600;
int ye=280;
int xd=550;
int yd=410;


void setup()
{
  size(600,600);
  smooth();
}

void draw()
{
  background(255);

  float da=dist(x,y,mouseX,mouseY);
  float db=dist(a,b,mouseX,mouseY);
  float dc=dist(c,d,mouseX,mouseY);

  if (db < rb/2 && mousePressed==true)
  {
    stroke(215,240,245);
    strokeWeight(1.4);
    for(int i=9; i<width; i+=30)
    {
      for(int j=3; j<width; j+=30)
      {
        line(j,i,j+12,i);
      }
    }
    for(int i=9; i<width; i+=30)
    {
      for(int j=3; j<width; j+=30)
      {
        line(i,j,i,j+12);
      }
    }
  }

  //right corner doughnut(small)
  stroke(180);
  strokeWeight(30);
  fill(255,0);
  ellipse(550,410,555,565);

  //<right corner quads>//
  //quad-corner
  strokeWeight(0);
  fill(100);
  quad(620,410,700,700,500,700,400,640);
  //quad-broad
  fill(0);
  quad(520,313,560,375,470,450,385,416);
  //quad-top
  quad(490,296,490,330,360,425,325,412);
  //quad-bottom
  fill(0,230);
  quad(452,467,567,518,487,613,358,545);
  //quad-long
  strokeWeight(1);
  stroke(0);
  fill(255);
  quad(570,380,590,390,435,535,435,503);
  //quad-small
  fill(0);
  quad(430,440,488,464,480,470,422,445);
  //<right corner quads end>//


  //ellipse_right corner
  fill(0);
  ellipse(600,280,240,240);

  //arc_right corner
  fill(255,0);
  strokeWeight(21);
  stroke(125);
  arc(595,280,285,285,PI,TWO_PI);
  strokeWeight(1);
  stroke(255);
  fill(255);
  quad(440,283,470,265,470,290,440,300);

  //<upperleft corner>//

  //long one
  strokeWeight(0);
  fill(0,50);
  beginShape();
  vertex(140,0);
  bezierVertex(160,150,120,300,30,450);
  vertex(38,480);
  bezierVertex(160,300,200,150,200,0);
  endShape();

  //hollowed one
  stroke(0);
  strokeWeight(5);
  fill(0,0);
  beginShape();
  vertex(90,260);
  vertex(30,300);
  bezierVertex(63,360,100,378,130,390);
  vertex(165,325);
  bezierVertex(120,310,100,280,90,260);
  endShape();



  //broad one
  strokeWeight(1);
  fill(255);
  beginShape();
  vertex(110,60);
  bezierVertex(80,103,43,136,5,160);
  vertex(20,220);
  bezierVertex(73,190,146,143,190,60);
  vertex(110,60);
  endShape();

  //black one
  fill(0);
  beginShape();
  vertex(0,60);
  bezierVertex(50,110,100,145,145,162);
  vertex(150,190);
  bezierVertex(72,170,36,140,0,115);
  vertex(0,60);
  endShape();

  //black piece
  fill(0);
  beginShape();
  vertex(158,165);
  bezierVertex(162,166,168,168,180,170);
  vertex(190,196);
  bezierVertex(182,195,174,193,165,192);
  vertex(158,165);
  endShape();


  //center doughnut
  stroke(0);
  strokeWeight(30);
  fill(255,0);
  ellipse(190,220,260,260);

  //right corner doughnut (large)
  stroke(90);
  strokeWeight(60);
  fill(255,0);
  ellipse(550,410,660,670);


  if(dc<rc/2+30 && dc>rc/2-30 && db>rb/2)
  {
    stroke(87,175,102);
    strokeWeight(6);
    ellipse(c,d,rc+54,rc+64);
    ellipse(c,d,rc-56,rc-46);
  }

  //center ellipse
  fill(0);
  strokeWeight(59);
  stroke(0);
  ellipse(230,290,120,120);


  if(da<ra/2)
  {
    fill(0,0);
    strokeCap(SQUARE);
    stroke(174,0,0);
    strokeWeight(8);
    for(int i=55; i<300; i+=25)
        arc(x,y,ra-8,ra-8,radians(i),radians(i+15));

  }


  if(db<rb/2)
  {
    fill(0,0);
    stroke(255);
    strokeWeight(55);
    ellipse(a,b,rb-54,rb-54);
  }
  if (db < rb/2 && mousePressed==true)
  {
    stroke(1,147,138);
    strokeWeight(31);
    fill(255,0);
    ellipse(190,220,260,260);

    //right corner doughnut (large)
    stroke(90);
    strokeWeight(60);
    fill(255,0);
    ellipse(550,410,660,670);

    fill(0);
    stroke(145,236,247);
    strokeWeight(55);
    ellipse(a,b,rb-54,rb-54);
  }
  if(dc<rc/2+30 && dc>rc/2-30 && db>rb/2&&mousePressed==true)
  {
    background(255);
    //right corner doughnut(small)
    stroke(180);
    strokeWeight(30);
    fill(255,0);
    ellipse(550,410,555,565);
    //<right corner quads>//
    //quad-corner
    strokeWeight(0);
    fill(100);
    quad(620,410,700,700,500,700,400,640);
    //quad-broad
    fill(0);
    quad(520,313,560,375,470,450,385,416);
    //quad-top
    quad(490,296,490,330,360,425,325,412);
    //quad-bottom
    fill(0,230);
    quad(452,467,567,518,487,613,358,545);
    //quad-long
    strokeWeight(1);
    stroke(0);
    fill(255);
    quad(570,380,590,390,435,535,435,503);
    //quad-small
    fill(0);
    quad(430,440,488,464,480,470,422,445);
    //<right corner quads end>//
    //ellipse_right corner
    fill(0);
    ellipse(600,280,240,240);
    //<upperleft corner>//
    //long one
    stroke(255);
    strokeWeight(0);
    fill(0,50);
    beginShape();
    vertex(140,0);
    bezierVertex(160,150,120,300,30,450);
    vertex(38,480);
    bezierVertex(160,300,200,150,200,0);
    endShape();
    //broad one
    stroke(0);
    strokeWeight(1);
    fill(255);
    beginShape();
    vertex(110,60);
    bezierVertex(80,103,43,136,5,160);
    vertex(20,220);
    bezierVertex(73,190,146,143,190,60);
    vertex(110,60);
    endShape();
    //black one
    stroke(0,125,23);
    fill(0,125,23);
    beginShape();
    vertex(0,60);
    bezierVertex(50,110,100,145,145,162);
    vertex(150,190);
    bezierVertex(72,170,36,140,0,115);
    vertex(0,60);
    endShape();
    //black piece
    beginShape();
    vertex(158,165);
    bezierVertex(162,166,168,168,180,170);
    vertex(190,196);
    bezierVertex(182,195,174,193,165,192);
    vertex(158,165);
    endShape();
    //center doughnut
    stroke(1,77,9);
    strokeWeight(30);
    fill(255,0);
    ellipse(190,220,260,260);
    //hollowed one
    stroke(0);
    strokeWeight(5);
    fill(0,0);
    beginShape();
    vertex(90,260);
    vertex(30,300);
    bezierVertex(63,360,100,378,130,390);
    vertex(165,325);
    bezierVertex(120,310,100,280,90,260);
    endShape();
    //right corner doughnut (large)
    stroke(16,155,42);
    strokeWeight(40);
    fill(255,0);
    ellipse(xd,yd,660,670);
    strokeWeight(3);
    ellipse(xd,yd,760,770);
    strokeWeight(2);
    ellipse(xd,yd,600,610);
    ellipse(xd,yd,540,550);
    strokeWeight(10);
    ellipse(xd,yd,780,790);
    //arc_right corner
    fill(255,0);
    strokeWeight(21);
    stroke(125);
    arc(595,280,285,285,PI,TWO_PI);
    strokeWeight(1);
    stroke(255);
    fill(255);
    quad(440,283,470,265,470,290,440,300);
    //center ellipse
    fill(0,0);
    strokeWeight(39);
    stroke(0,250);
    ellipse(230,290,140,140);
    strokeWeight(1);
    fill(255,130);
    ellipse(230,290,100,100);
    stroke(255);
    fill(4,211,26);
    ellipse(230,290,60,60);
  }
  if(da<ra/2&&mousePressed==true)
  {
    background(255);
    //right corner doughnut(small)
    stroke(180);
    strokeWeight(30);
    fill(255,0);
    ellipse(550,410,555,565);
    //<right corner quads>//
    //quad-corner
    strokeWeight(0);
    fill(100);
    quad(620,410,700,700,500,700,400,640);
    //quad-broad
    fill(0);
    quad(520,313,560,375,470,450,385,416);
    //quad-top
    quad(490,296,490,330,360,425,325,412);
    //quad-bottom
    fill(0,230);
    quad(452,467,567,518,487,613,358,545);
    //quad-long
    strokeWeight(1);
    stroke(0);
    fill(255);
    quad(570,380,590,390,435,535,435,503);
    //quad-small
    fill(0);
    quad(430,440,488,464,480,470,422,445);
    //<right corner quads end>//
    //ellipse_right corner
    fill(0);
    ellipse(600,280,240,240);
    //arc_right corner
    fill(255,0);
    strokeWeight(21);
    stroke(125);
    arc(595,280,285,285,PI,TWO_PI);
    strokeWeight(1);
    stroke(255);
    fill(255);
    quad(440,283,470,265,470,290,440,300);
    //<upperleft corner>//
    //long one
    strokeWeight(0);
    fill(0,50);
    beginShape();
    vertex(140,0);
    bezierVertex(160,150,120,300,30,450);
    vertex(38,480);
    bezierVertex(160,300,200,150,200,0);
    endShape();
    //hollowed one
    stroke(0);
    strokeWeight(5);
    fill(0,0);
    beginShape();
    vertex(90,260);
    vertex(30,300);
    bezierVertex(63,360,100,378,130,390);
    vertex(165,325);
    bezierVertex(120,310,100,280,90,260);
    endShape();
    //broad one
    strokeWeight(1);
    fill(255);
    beginShape();
    vertex(110,60);
    bezierVertex(80,103,43,136,5,160);
    vertex(20,220);
    bezierVertex(73,190,146,143,190,60);
    vertex(110,60);
    endShape();
    //black one
    fill(102,10,10);
    stroke(102,10,10);
    beginShape();
    vertex(0,60);
    bezierVertex(50,110,100,145,145,162);
    vertex(150,190);
    bezierVertex(72,170,36,140,0,115);
    vertex(0,60);
    endShape();
    //black piece

      beginShape();
    vertex(158,165);
    bezierVertex(162,166,168,168,180,170);
    vertex(190,196);
    bezierVertex(182,195,174,193,165,192);
    vertex(158,165);
    endShape();
    //center doughnut
    stroke(50,0,0);
    strokeWeight(30);
    fill(255,0);
    ellipse(190,220,260,260);
    //right corner doughnut (large)
    stroke(162,50,50);
    strokeWeight(60);
    fill(255,0);
    ellipse(550,410,660,670);
    //center ellipse
    fill(0,0);
    strokeWeight(39);
    stroke(0,250);
    ellipse(230,290,140,140);
    strokeWeight(1);
    fill(255,130);
    ellipse(230,290,100,100);
    stroke(255);
    fill(200,0,0);
    ellipse(230,290,60,60);

    strokeCap(SQUARE);
    stroke(200,0,0);
    fill(0,0);
    strokeWeight(15);
    arc(xe,ye,200,200,radians(160),radians(290));
    arc(xe,ye,200,200,radians(50),radians(140));
    stroke(110,0,0);
    strokeWeight(10);
    arc(xe,ye,167,167,radians(180),radians(280));
    arc(xe,ye,167,167,radians(50),radians(160));
    strokeWeight(25);
    arc(xe,ye,150,150,radians(190),radians(280));
    stroke(160,0,0);
    strokeWeight(40);
    arc(xe,ye,60,60,radians(50),radians(230));
    strokeWeight(15);

    arc(xe,ye,285,285,radians(50),radians(145));
    stroke(255,0,0);
    strokeWeight(3);
    arc(xe,ye,310,310,radians(50),radians(160));
    arc(xe,ye,110,110,radians(50),radians(240));
  }

  if(keyPressed==true)
  {
    background(255);

    stroke(215,240,245);
    strokeWeight(1.4);
    for(int i=9; i<width; i+=30)
    {
      for(int j=3; j<width; j+=30)
      {
        line(j,i,j+12,i);
      }
    }
    for(int i=9; i<width; i+=30)
    {
      for(int j=3; j<width; j+=30)
      {
        line(i,j,i,j+12);
      }
    }
    //right corner doughnut(small)
    stroke(180);
    strokeWeight(30);
    fill(255,0);
    ellipse(550,410,555,565);
    //<right corner quads>//
    //quad-corner
    strokeWeight(0);
    fill(100);
    quad(620,410,700,700,500,700,400,640);
    //quad-broad
    fill(0);
    quad(520,313,560,375,470,450,385,416);
    //quad-top
    quad(490,296,490,330,360,425,325,412);
    //quad-bottom
    fill(0,230);
    quad(452,467,567,518,487,613,358,545);
    //quad-long
    strokeWeight(1);
    stroke(0);
    fill(255);
    quad(570,380,590,390,435,535,435,503);
    //quad-small
    fill(0);
    quad(430,440,488,464,480,470,422,445);
    //<right corner quads end>//
    //ellipse_right corner
    fill(0);
    ellipse(600,280,240,240);
    //arc_right corner
    fill(255,0);
    strokeWeight(21);
    stroke(125);
    arc(595,280,285,285,PI,TWO_PI);
    strokeWeight(1);
    stroke(255);
    fill(255);
    quad(440,283,470,265,470,290,440,300);
    //<upperleft corner>//
    //long one
    strokeWeight(0);
    fill(0,50);
    beginShape();
    vertex(140,0);
    bezierVertex(160,150,120,300,30,450);
    vertex(38,480);
    bezierVertex(160,300,200,150,200,0);
    endShape();
    //hollowed one
    stroke(0);
    strokeWeight(5);
    fill(0,0);
    beginShape();
    vertex(90,260);
    vertex(30,300);
    bezierVertex(63,360,100,378,130,390);
    vertex(165,325);
    bezierVertex(120,310,100,280,90,260);
    endShape();
    //broad one
    strokeWeight(1);
    fill(255);
    beginShape();
    vertex(110,60);
    bezierVertex(80,103,43,136,5,160);
    vertex(20,220);
    bezierVertex(73,190,146,143,190,60);
    vertex(110,60);
    endShape();
    //black one
    fill(1,147,138);
    stroke(1,147,138);
    beginShape();
    vertex(0,60);
    bezierVertex(50,110,100,145,145,162);
    vertex(150,190);
    bezierVertex(72,170,36,140,0,115);
    vertex(0,60);
    endShape();
    //black piece

      beginShape();
    vertex(158,165);
    bezierVertex(162,166,168,168,180,170);
    vertex(190,196);
    bezierVertex(182,195,174,193,165,192);
    vertex(158,165);
    endShape();
    //center doughnut
    stroke(50,0,0);
    strokeWeight(30);
    fill(255,0);
    ellipse(190,220,260,260);
    //right corner doughnut (large)
    stroke(16,155,42);
    strokeWeight(40);
    fill(255,0);
    ellipse(xd,yd,660,670);
    strokeWeight(3);
    ellipse(xd,yd,760,770);
    strokeWeight(2);
    ellipse(xd,yd,600,610);
    ellipse(xd,yd,540,550);
    strokeWeight(10);
    ellipse(xd,yd,780,790);
    //center ellipse
    fill(0,0);
    strokeWeight(39);
    stroke(0,250);
    ellipse(230,290,140,140);
    strokeWeight(1);
    fill(255,130);
    ellipse(230,290,100,100);
    stroke(255);
    fill(200,0,0);
    ellipse(230,290,60,60);

    strokeCap(SQUARE);
    stroke(200,0,0);
    fill(0,0);
    strokeWeight(15);
    arc(xe,ye,200,200,radians(160),radians(290));
    arc(xe,ye,200,200,radians(50),radians(140));
    stroke(110,0,0);
    strokeWeight(10);
    arc(xe,ye,167,167,radians(180),radians(280));
    arc(xe,ye,167,167,radians(50),radians(160));
    strokeWeight(25);
    arc(xe,ye,150,150,radians(190),radians(280));
    stroke(160,0,0);
    strokeWeight(40);
    arc(xe,ye,60,60,radians(50),radians(230));
    strokeWeight(15);

    arc(xe,ye,285,285,radians(50),radians(145));
    stroke(255,0,0);
    strokeWeight(3);
    arc(xe,ye,310,310,radians(50),radians(160));
    arc(xe,ye,110,110,radians(50),radians(240));
  }
}


