


size(470,662);
smooth();
background(247,246,244);




//左下第一个半圆
fill(205,10,31);
noStroke();
ellipse(140,355,150,150);

fill(247,246,244);
noStroke();
rect(140,250,150,300);

//右下上半圆
fill(1,123,190);
ellipse(240,355,150,150);

fill(247,246,244);
noStroke();
rect(240,250,150,300);

//右下下半圆
fill(206,177,1);
ellipse(240,505.5,150,150);

fill(247,246,244);
noStroke();
rect(240,350,150,300);

//最右边半圆
fill(228,80,134);
ellipse(380.1,200,150,150);

fill(247,246,244);
noStroke();
rect(200,50,300,150);

//左上大圆
fill(0);
ellipse(140,180,200,200);

//中间竖矩形
fill(39,169,46);
rect(240,80,65,200);

//矩形上的三角
fill(39,169,46);
beginShape();
vertex(240,80);
vertex(305,15);
vertex(305,80);
endShape();

//矩形上的半圆
fill(39,169,46);
beginShape();
vertex(240,81);
bezierVertex(239,5,310,15,305,15);
endShape();

fill(0);
rect(335,415,4,15);


PFont font = loadFont("Helvetica-Bold-48.vlw");

textFont(font,8);
fill(0);
text("6:00pm",310,510);
fill(0);
text("21.11.2012",310,520);
fill(0);
text("Euroluce",310,530);
fill(0);
text("20 Russell Street",310,540);
fill(0);
text("Melboume",310,550);

textFont(font,25);
fill(180);
text("Euroluce",310,620);
textFont(font,4);
fill(0);
text("www.super-mary.com",312,630);


rotate(radians(-90));
textFont(font,32);
fill(225,0,0);
text("Oluce",-432,305);
textFont(font,32);
fill(0);
text("Antonio",-432,390);
fill(0);
text("Verderi",-432,425);



