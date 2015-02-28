
int inc=60;
int a,b,c;
int bottom = 400;
int inc2=5;


void setup(){
  size(600,600);
  smooth();

  
}

void draw(){
  frameRate(2);
  background(255);
  for(int g=2;g<width;g+=17){
  stroke(0,random(130,255),0);
  strokeWeight(random(1,2));
  line(g,random(420,470),g,600);
  }
  for(int g=7;g<width;g+=10){
  stroke(0,random(130,255),0);
  strokeWeight(random(1,2));
  noFill();
  beginShape();
  vertex(g,random(440,500));
  bezierVertex(g+20,560,g-5,520,g+10,600);
  endShape();
  }
 /* for(int i=100; i<200;i+=inc){
     for(int j=100;j<130; i+=inc2){
    fill(random(150,250),random(150,250),random(150,250));
   quad(j,i,j+20,i,j+30,i+30,j-10,i+30);
     }
  }*/
  
    noStroke();
  fill(#523516,150);
  a=40;
  b=15;
  for(int i=10; i<width; i+=inc){
    for(int j=20; j<bottom; j+=inc){
    rect(i,j,b,a);
  }
  }
  fill(#04B702,150);
  c=30;
  for(int i=10; i<width; i+=inc){
    for(int j=20; j<bottom; j+=inc){
   ellipse(i+7,j,c,c);
  }
  }
  fill(#523516,150);
  a=30;
  b=15;
  for(int i=40; i<width; i+=inc){
    for(int j=0; j<bottom; j+=inc){
    rect(i,j,b,a);
  }
  }
  fill(#04B702,150);
  c=30;
  for(int i=40; i<width; i+=inc){
    for(int j=0; j<bottom; j+=inc){
   ellipse(i+7,j,c,c);
  }
  }
  
  strokeWeight(1);
  fill(#04B702,150);
for(int k=400;k<570;k+=50){
 fill(#FCDC8A);
 stroke(0);
 quad(k,570,k+5,430,k-5,430,k-10,570);
}
  for(int k=100;k<270;k+=50){
 fill(#FCDC8A);
 stroke(0);
 quad(k,570,k+5,430,k-5,430,k-10,570);
}

for(int k=400;k<570;k+=50){
 fill(0);
 stroke(0);
 quad(k,570,k,575,k-10,575,k-10,570);
}
  
  for(int k=100;k<270;k+=50){
 fill(0);
 stroke(0);
 quad(k,570,k,575,k-10,575,k-10,570);
}
  fill(#E3A300);
 stroke(0);
 quad(390,430,390,350,560,350,560,430);
 quad(90,430,90,350,260,350,260,430);
 quad(90,350,90,140,115,140,115,350);
 quad(390,350,390,140,415,140,415,350);
 triangle(75,100,130,137,70,160);
 triangle(375,100,430,137,370,160);
 
 //eyes
 if(mousePressed){
     fill(0);
     ellipse(96,137,15,15);
  ellipse(83,126,15,15);
  ellipse(396,137,15,15);
  ellipse(383,126,15,15);
  
  
 } else {
   fill(255);
  stroke(0);
  ellipse(96,137,15,15);
  ellipse(83,126,15,15);
  ellipse(396,137,15,15);
  ellipse(383,126,15,15);
 
 }
  
  
  
  noStroke();
  fill(0);
  ellipse(96,137,10,10);
  ellipse(83,126,10,10);
  ellipse(396,137,10,10);
  ellipse(383,126,10,10);
  
  fill(#FCDC8A);
  stroke(0);
  ellipse(120,375,25,20);
  ellipse(420,375,25,20);
  ellipse(170,400,30,35);
  ellipse(470,400,30,35);
  ellipse(117,410,10,10);
  ellipse(417,410,10,10);
  ellipse(187,365,10,10);
  ellipse(487,365,10,10);
  ellipse(227,390,25,30);
  ellipse(527,390,25,30);
  quad(95,95,105,95,100,105,85,105);
  quad(395,95,405,95,400,105,385,105);
  quad(130,120,140,120,135,130,120,130);
  quad(430,120,440,120,435,130,420,130);
for(int t=170;t<350;t+=50){
  fill(#FCDC8A);
 stroke(0);
 quad(103,t,110,t+7,103,t+14,94,t+7);
}

for(int t=170;t<350;t+=50){
  fill(#FCDC8A);
 stroke(0);
 quad(403,t,410,t+7,403,t+14,394,t+7);
}


  
}






