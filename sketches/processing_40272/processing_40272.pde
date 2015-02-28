

//SVG files of profile drawing and shooting star

 PShape s;
 
 PShape q;

//color/size random variables

 float r;
 float g;
 float b;
 float m;
 float x;

//variables for rainbow

 float circleX=250;
 float circleY=0;
 float circleA=250;
 float circleB=10;
 float circleC=250;
 float circleD=20;
 float circleE=250;
 float circleF=30;
 float circleG=250;
 float circleH=40;
 float circleI=250;
 float circleJ=50;

 float a=0;
 float d=1.75;
 
//variables for shooting stars
 
 float starX=290;
 float starY=-40;
 
 float starA=0;
 float starB=-200;
 
 float starC=325;
 float starD=-400;

////setup////

void setup() {
  size(500,500); 
    background(126,189,255);
    smooth();
    
    
//loading objects
  
  s = loadShape("cristobal.svg");
  
  q = loadShape("onestar.svg");
  
//head//
  
  noStroke();
  fill(255,255,255);
  
  beginShape();
  
   vertex(196,92.5);
   vertex(179.5,104);
   vertex(168.5,124);
   vertex(166,181);
   vertex(171.5,230.5);
   vertex(181,250);
   vertex(196,276);
   vertex(217,292.5);
   vertex(245,292.5);
   vertex(272.5,272);
   vertex(286,250);
   vertex(291.5,228.5);
   vertex(295.5,180.5);
   vertex(291,141);
   vertex(281,121.5);
   vertex(266,102);
   vertex(237,100.5);
   vertex(218,96.5);
   
  endShape(CLOSE);
 
//body
  
  fill(232,202,173);
  
  beginShape();
  
   vertex(185.877,259.5);
   vertex(185.877,288.798);
   vertex(181.447,299.558);
   vertex(125.75,333.735);
   vertex(73.219,374.874);
   vertex(52.333,441.963);
   vertex(59.928,499.997);
   vertex(485.244,500);
   vertex(464.751,438.165);
   vertex(443.472,359.052);
   vertex(411.193,323.608);
   vertex(358.029,297.026);
   vertex(309.295,284.368);
   vertex(289.675,271.71);
   vertex(287.776,242);
   vertex(268.789,273);
   vertex(250,288);
   vertex(218.789,292);
   vertex(199.801,278);
  
  endShape(CLOSE);
  
//clothes
  
  fill(0,0,0);
  
  beginShape();
  
   vertex(73.5,371); 
   vertex(121.5,328); 
   vertex(178.5,296); 
   vertex(203.5,368); 
   vertex(262.5,432); 
   vertex(311,363.5);
   vertex(310.5,279.5); 
   vertex(383.5,302.5); 
   vertex(422,324.5); 
   vertex(399,397.5); 
   vertex(396,500.003);
   vertex(148.5,500.003); 
   vertex(131.5,413.5);
   
  endShape(CLOSE);
  
//hair
 
  beginShape();
  
   vertex(177.649,238.799);
   vertex(166.89,203.356); 
   vertex(166.89,151.457); 
   vertex(172.27,117.913); 
   vertex(188.409,98.925); 
   vertex(201.068,95.128); 
   vertex(232.713,103.989);
   vertex(263.727,104.622); 
   vertex(285.245,135.635); 
   vertex(293.473,172.977); 
   vertex(289.043,219.179);
   vertex(293.473,233.736); 
   vertex(302.334,231.837); 
   vertex(309.929,199.559); 
   vertex(315.625,163.483);
   vertex(307.397,107.675); 
   vertex(285.245,77.307); 
   vertex(244.106,59.686); 
   vertex(203.6,69.18);
   vertex(183.979,68.547); 
   vertex(170.688,90.664); 
   vertex(152.334,112.218); 
   vertex(137.777,127.539);
   vertex(147.904,185.636); 
   vertex(154.233,216.015); 
   vertex(165.625,235.002);
   
  endShape(CLOSE);
  
//eyebrow
  
  beginShape();
  
   vertex(242.535,162.914);
   vertex(272.112,159.21); 
   vertex(283.25,166.5); 
   vertex(269.75,164.25); 
   vertex(241.5,168.5);
   
  endShape(CLOSE);
  
//eye outline
  
  stroke(0,0,0);
  strokeWeight(2);
  noFill();
  
  beginShape();
  
   vertex(246.5,176.5);
   vertex(255,169.5);
   vertex(267,169.5);
   vertex(274,179);
   vertex(264,181.5);
   vertex(254,181.5);
   
  endShape(CLOSE);
  
//nose

  beginShape();
  
   vertex(219.167,217.5); 
   vertex(220.667,215.167); 
   vertex(227.5,221.5); 
   vertex(232.167,221.5); 
   vertex(239,215.167); 
   vertex(240.5,217.333);
   
  endShape();
  
}

////draw////

void draw() {
  
  r=random(200,255);
  g=random(20,200);
  b=random(200,255);
  x=random(255);
  m=random(20);
  a=a+.005;
  
  smooth();
  
//shooting stars

 noStroke();
 fill(255,225,0);
 
  ellipse(starX,starY,50,50);

  shape(q,starX-21,starY-10,50,50);
  
  starX=starX+.3;
  starY=starY+1;
  
 fill(255,200,0);
 
  ellipse(starA,starB,30,30);

  shape(q,starA,starB-5,30,30);
  
  starA=starA+1;
  starB=starB+.9;
  
 fill(245,210,80);
 
  ellipse(starC,starD,20,20);

  shape(q,starC-8,starD,20,20);
  
  starC=starC+.25;
  starD=starD+1;
  
//rainbow
  
  noStroke();
  fill(255,110,140);
  
   ellipse(circleX,circleY,10,10);
   ellipse(250-circleX+250,circleY,10,10);
   
   circleX=circleX+d*(cos(a));
   circleY=circleY+d*(sin(a));
  
  fill(255,150,110);
  
   ellipse(circleA,circleB,10,10);
   ellipse(250-circleA+250, circleB,10,10);
   
   circleA=circleA+(d-.05)*(cos(a));
   circleB=circleB+(d-.05)*(sin(a));
  
  fill(240,240,90);
  
   ellipse(circleC,circleD,10,10);
   ellipse(250-circleC+250, circleD,10,10);
   
   circleC=circleC+(d-.1)*(cos(a));
   circleD=circleD+(d-.1)*(sin(a));
  
  fill(120,240,110);
  
   ellipse(circleE,circleF,10,10);
   ellipse(250-circleE+250, circleF,10,10);
   
   circleE=circleE+(d-.15)*(cos(a));
   circleF=circleF+(d-.15)*(sin(a));
  
  fill(130,230,240); 
  
   ellipse(circleG,circleH,10,10);
   ellipse(250-circleG+250,circleH,10,10);
   
   circleG=circleG+(d-.2)*(cos(a));
   circleH=circleH+(d-.2)*(sin(a));
  
  fill(220,150,255);
  
   ellipse(circleI,circleJ,10,10);
   ellipse(250-circleI+250,circleJ,10,10);
   
   circleI=circleI+(d-.25)*(cos(a));
   circleJ=circleJ+(d-.25)*(sin(a));
   

  
//sun
  
  fill(255,abs(255-mouseX/3),0);
  
   ellipse(75,75,60,60);
  
   shape(s,40,50,60,60);
  
  strokeWeight(5);
  stroke(255,abs(255-mouseX/3),0);
  
   line(25,25,50,50);
   line(100,100,125,125);
   line(125,25,100,50);
   line(25,125,50,100);
   line(25,75,35,75);
   line(120,75,130,75);
   line(75,25,75,35);
   line(75,120,75,130);
  
//eyes
  
 
  noStroke();
  fill(0, abs(150-mouseX), abs(mouseX-mouseY));
  
   ellipse(200,175,10,10);
  
   ellipse(260,175,10,10);
  
//eye star
  
  noStroke();
  fill(abs((mouseX/2-mouseY/2)-50));
  
  beginShape();
  
   vertex(217.092,179.846);
   vertex(231.213,159.667);
   vertex(206.607,160.732);
   vertex(191.78,141.066);
   vertex(185.189,164.798);
   vertex(161.904,172.822);
   vertex(182.437,186.424);
   vertex(186,183.833);
   vertex(191.499,175);
   vertex(204.833,172.167);
   vertex(212.332,179.846);
   
  endShape(CLOSE);
 
  beginShape();
  
   vertex(217.092,179.846);
   vertex(225.709,202.919);
   vertex(202.154,195.724);
   vertex(182.873,211.049);
   vertex(182.437,186.424);
   vertex(186,183.833);
   vertex(199.666,183.833);
   vertex(212.332,179.846);
   
  endShape(CLOSE);
  
//lips
  
  noStroke();
  fill(255,0,abs(mouseY-mouseX));
  
  beginShape();
  
   vertex(210.75,246.6);
   vertex(214.75,241.25);
   vertex(222.25,236.75);
   vertex(229.375,238.875);
   vertex(236.5,236.75);
   vertex(246,240.5);
   vertex(250.683,246.207);
   vertex(243.5,244.375);
   vertex(236.75,243.625);
   vertex(222.75,244);
   vertex(217.5,245.25);
   
  endShape(CLOSE);
  
  fill(255,0,abs(mouseY-mouseX));
  
  beginShape();
  
   vertex(210.75,248.5);
   vertex(224.25,250.004);
   vertex(238.5,250.004);
   vertex(251.5,249.252);
   vertex(247.25,255.375);
   vertex(242.125,259.25);
   vertex(223.5,259.25);
   vertex(216.375,255.375);
   
  endShape(CLOSE);
  
//stars in the sky
  
  noStroke();
  fill(255,255,g);
  
  beginShape();
  
   vertex(467.842,73.535);
   vertex(446.414,71.06); 
   vertex(432.228,87.309); 
   vertex(427.96,66.165); 
   vertex(408.123,57.694); 
   vertex(426.913,47.101); 
   vertex(428.84,25.617); 
   vertex(444.72,40.214); 
   vertex(465.747,35.407); 
   vertex(456.772,55.021);
   
  endShape(CLOSE);
   
  beginShape();
  
   vertex(482.951,167.995); 
   vertex(466.728,158.432); 
   vertex(449.652,166.375); 
   vertex(453.734,147.99); 
   vertex(440.903,134.206); 
   vertex(459.648,132.406); 
   vertex(468.794,115.943); 
   vertex(476.299,133.215); 
   vertex(494.78,136.825); 
   vertex(480.674,149.3);
   
  endShape(CLOSE);
  
  noStroke();
  fill(255,255,255-g);
  
  beginShape();
  
   vertex(399.506,107.675); 
   vertex(411.943,101.537); 
   vertex(413.938,87.812); 
   vertex(423.618,97.744);  
   vertex(437.288,95.399); 
   vertex(430.835,107.675); 
   vertex(437.288,119.952); 
   vertex(423.618,117.607); 
   vertex(413.938,127.539); 
   vertex(411.943,113.813);
   
  endShape(CLOSE);
  
  noStroke();
  fill(255,255,x);
  
  beginShape();
  
   vertex(400.253,35.401); 
   vertex(395.368,35); 
   vertex(392.269,38.797); 
   vertex(391.141,34.027); 
   vertex(386.571,32.252); 
   vertex(390.759,29.706); 
   vertex(391.035,24.812); 
   vertex(394.752,28.008); 
   vertex(399.491,26.758); 
   vertex(397.6,31.28);
   
  endShape(CLOSE);
  
  beginShape();
  
   vertex(418.658,167.832); 
   vertex(414.267,159.502); 
   vertex(404.915,158.396); 
   vertex(411.482,151.646); 
   vertex(409.645,142.41); 
   vertex(418.093,146.57); 
   vertex(426.308,141.969); 
   vertex(424.964,151.287); 
   vertex(431.88,157.678); 
   vertex(422.599,159.279);
  
  endShape(CLOSE);
  
  noStroke();
  fill(255,255,255-x);
  
  beginShape();
  
   vertex(322.598,63.587); 
   vertex(330.953,47.277); 
   vertex(322.254,31.148);
   vertex(340.348,34.055); 
   vertex(352.999,20.797); 
   vertex(355.826,38.903); 
   vertex(372.345,46.839); 
   vertex(355.998,55.123); 
   vertex(353.556,73.285); 
   vertex(340.626,60.298);
   
  endShape(CLOSE);
  
  noStroke();
  fill(255,255,x);
  
  beginShape();
  
   vertex(367.633,77.744); 
   vertex(375.811,73.239); 
   vertex(376.735,63.949);
   vertex(383.547,70.334); 
   vertex(392.668,68.343); 
   vertex(388.7,76.794); 
   vertex(393.412,84.854); 
   vertex(384.148,83.692); 
   vertex(377.939,90.664); 
   vertex(376.183,81.495);
   
  endShape(CLOSE);
  
  beginShape();
  
   vertex(470.933,102.454); 
   vertex(466.812,99.332); 
   vertex(461.903,100.957); 
   vertex(463.6,96.073); 
   vertex(460.537,91.907); 
   vertex(465.706,92.011); 
   vertex(468.722,87.812); 
   vertex(470.221,92.759); 
   vertex(475.146,94.329); 
   vertex(470.903,97.284);
   
  endShape(CLOSE);
   
  
//draw over it
  
  if (mousePressed) {
    strokeWeight(1);
    stroke(0,0,0);
    fill (r,g,b);
  } else {
    noStroke();
    noFill();
  }
    ellipse(mouseX,mouseY,m,m); 
  }

void keyPressed() {
  save("paulstanely2.tiff");
}


