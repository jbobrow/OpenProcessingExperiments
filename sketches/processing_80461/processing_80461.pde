

void setup() {
  size(600,625);
  background(255,189,103,19);
}

void draw () {
  
  fill (175,136,88);
  ellipse (random(0, 600), random(200, 300), random(60,200), random(20,25));
  
    fill (80,59,32);
  ellipse (random(0, 600), random(100, 200), random(80,300), random(30,50));
  
  fill (0);
  noStroke();
  ellipse (random(0, 600), random(0, 100), random(200,500), random(50,100));
  frameRate (2);
  
  fill (255,189,103,70);
  rect (0,0,600,450);
  
  
  
  
  
  
  fill (188,137,74);
  triangle (300,400,400,340,530,400);
  
  fill (93,69,40);
  triangle (200,400,300,340,500,400);
  
   fill (62,47,27,20);
  triangle (450,475,600,445,600,400);
  
  fill (62,44,22);
  triangle (350,400,600,358,600,400);
  
  fill (26,19,11);
  triangle (-500,400,100,300,400,400);
  
  
  
  
  
  fill (245,184,109);
  rect (0,400,600,5);
  
  fill (216,160,90);
  rect (0,405,600,10);
  
  fill (185,134,71);
  rect (0,415,600,15);
  
  fill (170,121,62);
  rect (0,430,600,20);
  
  fill (155,109,53);
  rect (0,450,600,25);
  
  fill (137,94,43);
  rect (0,475,600,30);
  
  fill (116,79,33);
  rect (0,505,600,35);
  
  fill (98,65,25);
  rect (0,540,600,40);
  
  fill (82,53,17);
  rect (0,580,600,45);
  
  
  
  
  fill (85,66,40,70);
  triangle (0,400,mouseX,500,500,400);
  
   fill (62,47,27,70);
  triangle (250,400,mouseX,455,600,400);
  
  fill (85,66,40,80);
  triangle(100,400,mouseX,550,430,400);
  
  
  
  
  
}


