
size(600,600);
background(255);
smooth();

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
strokeWeight(1);
quad(520,313,560,375,470,450,385,416);
//quad-top
quad(490,296,490,330,360,425,325,412);

//quad-bottom
fill(0,230);
stroke(0);
quad(452,467,567,518,487,613,358,545);
//quad-long
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

//center ellipse
fill(0);
strokeWeight(60);
stroke(0);
ellipse(230,290,120,120);


