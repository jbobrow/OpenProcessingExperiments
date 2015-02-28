
void setup() {
  size(600, 600);
  background(#E8D5AD);
}

void draw() {
  smooth();

  //ellipse

  fill(227,190,35,40);
  stroke(0);
  strokeWeight(3);
    ellipse(383,375,90,90);
  strokeWeight(0.5);
    ellipse(390,285,130,130);
    ellipse(220,343,130,130);
  
  fill(160,11,11,63);
  stroke(0);
  strokeWeight(0.5);
    ellipse(299,217,100,100);
    ellipse(289,367,20,20);
    ellipse(311,424,15,15);
  strokeWeight(2);
    ellipse(230,388,50,50);
    ellipse(243,103,15,15);
  strokeWeight(5);
    ellipse(125,280,25,25);
 
  fill(117,131,155,42);
  strokeWeight(0.5);
    ellipse(294,321,150,150);
  strokeWeight(2);
    ellipse(160,354,40,40);
  strokeWeight(1);
    ellipse(227,266,70,70);
  
  fill(17,32,155);
  strokeWeight(2);
    ellipse(100,360,15,15);

  fill(24,62,142,42);
    ellipse(443,278,45,45);
    
  fill(216,106,22,63);
  stroke(0);
  strokeWeight(3);
    ellipse(262,276,50,50);
  strokeWeight(1);
    ellipse(378,435,20,20);
    ellipse(141,414,30,30);

  fill(0);
  noStroke();
    ellipse(359,191,50,50);
    ellipse(403,246,30,30);
    ellipse(407,412,26,26);
    ellipse(266,413,8,8);
    ellipse(262,276,20,20);
  
  fill(219,124,138,40);
  stroke(0);
  strokeWeight(1.5);
    ellipse(225,205,110,110);
    
  fill(196,175,206,30);
  strokeWeight(0.5);
    ellipse(390,150,65,65);
  
  fill(131,82,155,32);
  strokeWeight(1.2);
    ellipse(470,410,20,20);
    
  fill(88,74,142);
  strokeWeight(2);
    ellipse(325,473,25,25);
  
  
  
  
  
  
  
  //lines
  stroke(0);
  strokeWeight(4);
  line(392,113,225,470);
  
  strokeWeight(3);
  line(452,168,425,444);
  line(170,415,300,467);
  line(422,209,494,207);
  
  strokeWeight(2.5);
  line(429,223,501,223);
  line(332,120,140,388);
  line(250,183,106,328);
  
  strokeWeight(2);
  line(163,447,301,410);
  
  strokeWeight(1);
  line(160,170,492,367);
  line(135,188,483,188);
  line(282,115,348,153);
  line(281,132,344,168);
  line(92,311,473,399);
  
  strokeWeight(0.1);
  line(433,129,403,487);
  line(415,153,388,474);
  line(406,165,376,458);
  line(102,375,458,403);
  line(110,240,495,384);
  line(100,263,480,393);
  line(100,339,426,469);
  line(131,226,101,283);
  line(146,231,111,284);
  line(172,234,135,295);
  line(339,207,190,460);
  line(337,200,174,445);
  
  
      
  //quad
  noStroke();
  fill(117,131,155,12);
  quad(30,0,130,0,600,395,600,570);
  fill(229,196,123,22);
  quad(547,0,597,0,0,593,0,500);
  
  
  //ellipses 
  noFill();
  stroke(0);
  strokeWeight(23);
  ellipse(300,300,480,480);

  

  
  
}
