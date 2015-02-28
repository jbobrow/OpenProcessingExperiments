
PShape s;

PImage a;



void setup() {
  size(500,500); 
  
  //background, loading objects
  
  s = loadShape("cristobal.svg");
  a = loadImage("cris.jpg");
  image(a,0,0,500,500);
  
  smooth();
  
  //face color
  
  noStroke();
  fill(255,255,255,200);
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
  
  //eyeliner
  
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
  
}

void draw() {
  
  smooth();
  
  //sun
  
  noStroke();
  fill(255, 255,abs(255-mouseX/2));
  ellipse(75,75,60,60);
  shape(s,40,50,60,60);
  
  strokeWeight(5);
  stroke(255,255,abs(255-mouseX/2));
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

  
  smooth();
  
  //star
  
  noStroke();
  fill(abs((mouseX/2-mouseY/2)-50),abs((mouseX/2-mouseY/2)-50),abs((mouseX/2-mouseY/2)-50));
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
  
  noStroke();
  fill(abs((mouseX/2-mouseY/2)-50),abs((mouseX/2-mouseY/2)-50),abs((mouseX/2-mouseY/2)-50));
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
  
  noStroke();
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
  
  //stars
  
  noStroke();
  fill(255,255,mouseX/2);
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
  
    noStroke();
  fill(255,255,mouseY/2);
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
  fill(255,255,abs(mouseX/2-mouseY/2));
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
  
  
  noStroke();
  fill(255,255,abs(mouseY/2-mouseX/2));
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
  fill(255,255,abs(255-mouseY/2));
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
  
  
  
  
  
  
  //draw over it
  
  for(int i=0; i<256; i++); {
    float r =random(255);
  
  if (mousePressed) {
    strokeWeight(1);
    stroke(0,0,0);
    fill (mouseX+r/2,abs(255-mouseX)+r/2,mouseY+(255-r/2));
  } else {
    noStroke();
    noFill();
  }
    ellipse(mouseX,mouseY,r/10,r/10); 
  }
  
    
}

void keyPressed() {
  save("cristobal7.tiff");
}


