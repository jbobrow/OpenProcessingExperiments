
//Kelvin Pan
//Simon 16/17
//8.23.12
//Drawing: Reddit's Alien
//Website: http://awxrus.webs.com/Reddit Alien/RedditAlienIndex.html
//Reference Image: http://www.stickermule.com/products/reddit-alien-logo-sticker

//setup
size(300,375);
background(207,230,246);
smooth();
stroke(0,0,0);
fill(255,255,255);
strokeWeight(7);

//ears
ellipse(80,128,30,30);
ellipse(220,128,30,30);

//antenna
line(150,100,160,60);
line(160,60,195,68);
ellipse(205,73,25,25);

//arms
ellipse(150,230,120,90);

//legs
bezier(95,297.5,100,265,150,285,150,297.5);
bezier(205,297.5,200,265,150,285,150,297.5);

//torso
ellipse(150,210,85,175);

//baseline
line(95,297.5,205,297.5);

//oval head
ellipse(150,150,150,100);

//smile curve
noFill();
bezier(125,170,140,180,160,180,175,170);

//red eyes
fill(238,75,34);
noStroke();
ellipse(122,140,22,22);
ellipse(178,140,22,22);

//POSSIBLE TEXT?!
