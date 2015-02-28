
void setup(){
  size(800,800);
  background(255,0,0);
}
 
float i = 0;
float t = 0;
float f = 0;
 
void draw(){
    
  pushMatrix();
  t -= 0.75;
  translate(0,t);
  fill(200,100,50);
  ellipse(112.5,800,25,25);
  noStroke();
  fill(255,0,0);
  triangle(98,810,113,850,100,850);
  triangle(126,810,112,850,126,850);
  popMatrix();
  
  pushMatrix();
  f -= 1;
  stroke(1);
  translate(0,f);
  fill(225,75,25);
  ellipse(725,800,35,35);
  noStroke();
  fill(255,0,0);
  triangle(690,810,726,850,690,850);
  triangle(761,810,724,850,761,850);
  popMatrix();
   
  noStroke();
   
  fill(#5E65FC);
  ellipse(30,30,30,30);
  fill(#5EF8FC);
  ellipse(60,60,30,30);
  fill(#FCFC5E);
  ellipse(30,90,30,30);
  fill(#FC5EEA);
  ellipse(60,120,30,30);
  fill(#CFFAF2);
  ellipse(30,150,30,30);
  fill(#D1FACF);
  ellipse(60,180,30,30);
  fill(#E0DE8F);
  ellipse(30,210,30,30);
  fill(#7C1F1F);
  ellipse(60,240,30,30);
  fill(#BABABC);
  ellipse(30,270,30,30);
  fill(#6D4C90);
  ellipse(60,300,30,30);
  fill(#50904C);
  ellipse(30,330,30,30);
  fill(#EFF0C9);
  ellipse(60,360,30,30);
  fill(#E80EDE);
  ellipse(30,390,30,30);
  fill(#0308FF);
  ellipse(60,420,30,30);
  fill(#03FFF0);
  ellipse(30,450,30,30);
  fill(#23FF03);
  ellipse(60,480,30,30);
  fill(#FF0396);
  ellipse(30,510,30,30);
  fill(#FFE603);
  ellipse(60,540,30,30);
  fill(#FF5F03);
  ellipse(30,570,30,30);
  fill(#E1FAF9);
  ellipse(60,600,30,30);
  fill(#F5CBE7);
  ellipse(30,630,30,30);
  fill(#F5F1CB);
  ellipse(60,660,30,30);
  fill(#359386);
  ellipse(30,690,30,30);
  fill(#FC5EEA);
  ellipse(60,720,30,30);
  fill(#5E65FC);
  ellipse(770,30,30,30);
  fill(#5EF8FC);
  ellipse(740,60,30,30);
  fill(#FCFC5E);
  ellipse(770,90,30,30);
  fill(#FC5EEA);
  ellipse(740,120,30,30);
  fill(#CFFAF2);
  ellipse(770,150,30,30);
  fill(#D1FACF);
  ellipse(740,180,30,30);
  fill(#E0DE8F);
  ellipse(770,210,30,30);
  fill(#7C1F1F);
  ellipse(740,240,30,30);
  fill(#BABABC);
  ellipse(770,270,30,30);
  fill(#6D4C90);
  ellipse(740,300,30,30);
  fill(#50904C);
  ellipse(770,330,30,30);
  fill(#EFF0C9);
  ellipse(740,360,30,30);
  fill(#E80EDE);
  ellipse(770,390,30,30);
  fill(#0308FF);
  ellipse(740,420,30,30);
  fill(#03FFF0);
  ellipse(770,450,30,30);
  fill(#23FF03);
  ellipse(740,480,30,30);
  fill(#FF0396);
  ellipse(770,510,30,30);
  fill(#FFE603);
  ellipse(740,540,30,30);
  fill(#FF5F03);
  ellipse(770,570,30,30);
  fill(#E1FAF9);
  ellipse(740,600,30,30);
  fill(#F5CBE7);
  ellipse(770,630,30,30);
  fill(#F5F1CB);
  ellipse(740,660,30,30);
  fill(#359386);
  ellipse(770,690,30,30);
  fill(#FC5EEA);
  ellipse(740,720,30,30);
   
  fill(137,75,28);
  triangle(200,250,200,600,100,600);
  triangle(575,250,675,600,575,600);
  fill(0);
  quad(500,20,575,250,200,250,300,50);
   
  fill(255,50,0);
  rect(200,400,375,100);
  fill(255,75,0);
  rect(200,500,375,75);
  fill(255,100,0);
  rect(200,575,375,50);
  fill(255,150,0);
  rect(200,625,375,25);
  fill(255,200,0);
  rect(200,650,375,25);
  fill(255,250,0);
  rect(200,675,375,25);
  fill(225,255,0);
  rect(200,700,375,25);
  fill(200,255,0);
  rect(200,725,375,25);
  fill(175,255,0);
  rect(200,750,375,25);
  fill(150,255,0);
  rect(200,775,375,25);
  fill(255);
  ellipse(400,450,200,75);
  fill(255,75,0);
  triangle(400,350,420,390,380,390);
   
  stroke(0);
  line(300,450,500,450);
  line(325,425,325,475);
  line(350,425,350,475);
  line(375,425,375,475);
  line(400,425,400,475);
  line(425,425,425,475);
  line(450,425,450,475);
  line(475,425,475,475);
   
  pushMatrix();
  i += 0.1;
  translate(300,300);
  smooth();
  fill(255,0,0);
  rotate(i);
  rect(-25,-25,25,25);
   
  translate(-30,-30);
  i += 0.1;
  smooth();
  fill(225,255,155);
  rotate(i);
  rect(-25,-25,50,50);
  popMatrix();
   
  pushMatrix();
  translate(0, 0);
  rotate(0);
  i += 0.1;
  translate(500,300);
  smooth();
  fill(255,0,0);
  rotate(i);
  rect(-25,-25,25,25);
   
  translate(-30,-30);
  i += 0.1;
  smooth();
  fill(225,255,155);
  rotate(i);
  rect(-25,-25,50,50);
  popMatrix();
 
}


