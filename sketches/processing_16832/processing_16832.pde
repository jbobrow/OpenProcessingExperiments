
PImage back, sunl, thirs, skql, bu, cloud,wat,sun,fin;
int card = 0;
float speed =1;
float x;
float y;
float angle = 0.0;
int a = 150;
float c = 100;



void setup(){
size(700,500);
fin = loadImage("fin.jpg");
back = loadImage("back.png");
sunl = loadImage("sunl.png");
thirs = loadImage("thirs.png");
skql = loadImage("skql.png");
bu = loadImage("bu.png");
cloud = loadImage("cloud.png");
wat = loadImage("wat.png");
sun = loadImage("sun.png");
x = 300;
y = 150;
c = 100;
}

  
  
  

void draw(){
  background(115,204,247);

  
c -= 2;
    if(c<-700){
  c=0;
  }
  image(cloud,c,100);
  image(cloud,c+150,-50);
  image(cloud,c+200,50);
  image(cloud,c+500,0);
  image(cloud,c+600,50);
  image(cloud,c+550,-100);





image(back,0,0);


    
        pushMatrix();
float d = dist(mouseX,mouseY,600,120);
if (d<25){
noStroke();
fill(255,255,0);
  ellipse(600,115,60,60);
}float f = dist(mouseX,mouseY,600,200);
if (f<25){
fill(  180,221,34);
  ellipse(600,200,60,60);}
  popMatrix();
    noStroke();
    image(bu,550,50);

    
   
    if(card == 0){
      pushMatrix();
      scale(0.8);
      translate(50,200);
      pot();
      popMatrix();
    }else if (card == 1){
      pushMatrix();
      scale(0.8);
      translate(50,200);
      pot();
      trunk(150);
      popMatrix();
    }
   else if(card == 2){
      pushMatrix();
       scale(0.8);
      translate(50,200);
      pot();
       trunk(0);
      popMatrix();
      pushMatrix();
      scale(0.8);
      translate(50,-50);
      flower(255,54,0);
      popMatrix();
    }
    else if (card == 3){
      pushMatrix();
       scale(0.8);
      translate(50,200);
      pot();
       trunk(0);
      popMatrix();
      pushMatrix();
      scale(0.8);
      translate(50,-50);
      flower(255,54,0);
      popMatrix();
    }else if(card == 4){
           pushMatrix();
       scale(0.8);
      translate(50,200);
      pot();
      curv();
      popMatrix();
      pushMatrix();
      scale(0.6);
      translate(270,220);
flower(152,72,72);
popMatrix();
image(sunl,300,100);

    }else if(card ==5){     
      pushMatrix();
       scale(0.8);
      translate(50,200);
      pot();
       trunk(0);
      popMatrix();
      pushMatrix();
      scale(0.8);
      translate(50,-50);
      flower(255,54,0);
      popMatrix();
      x += random(-speed-speed,speed+speed);
      y += random(-speed, speed);
  image(skql,x,y);  
  }else if(card == 6){
           pushMatrix();
       scale(0.8);
      translate(50,200);
      pot();
      curv();
      popMatrix();
      pushMatrix();
      scale(0.6);
      translate(270,220);
flower(152,72,72);
popMatrix();
image(thirs,300,100);
  }else if(card == 7){
  background(255);
  image(fin,0,0);
  pushMatrix();
         scale(0.8);
      translate(50,200);
       trunk(0);
      popMatrix();
      pushMatrix();
      scale(0.8);
      translate(50,-50);
      flower(255,54,0);
      popMatrix();
  }
      
    

    if(mousePressed == true)
    { float e = dist(mouseX,mouseY,600,120); 
if (e < 25){
  pushMatrix();
  translate(450,80);
  rotate(-1);
  waterpot();
  popMatrix();
  image(wat,270,180);
    }else if((mouseX>575)&&(mouseX<625)&&(mouseY>175)&&(mouseY<225)){
  image(sun,0,0,a,a);
  a++ ;}
  }
}
    

void mousePressed(){
  
if (card == 0 ) {
float d = dist(mouseX,mouseY,600,120); 
if (d < 25){
  card = 1;
}else if((mouseX>575)&&(mouseX<625)&&(mouseY>175)&&(mouseY<225)){
  card = 1;
} else card = 0;
}else if (card ==1){
  float d = dist(mouseX,mouseY,600,120); 
if (d < 25){
  card = 2;
}else if((mouseX>575)&&(mouseX<625)&&(mouseY>175)&&(mouseY<225)){
  card = 3;}}
  else if (card ==2){  
  float d = dist(mouseX,mouseY,600,120); 
if (d < 25){
  card = 4;}else if((mouseX>575)&&(mouseX<625)&&(mouseY>175)&&(mouseY<225)){
  card = 5;}
}else if(card ==3){ 
  float d = dist(mouseX,mouseY,600,120); 
if (d < 25){
  card = 5;
}else if((mouseX>575)&&(mouseX<625)&&(mouseY>175)&&(mouseY<225)){
  card = 6;} 
}
else if(card == 4){ 
  float d = dist(mouseX,mouseY,600,120); 
if (d < 25){
  card = 0;
}else if((mouseX>575)&&(mouseX<625)&&(mouseY>175)&&(mouseY<225)){
  card = 5;} 
}else if(card == 6){ 
  float d = dist(mouseX,mouseY,600,120); 
if (d < 25){
  card = 5;
}else if((mouseX>575)&&(mouseX<625)&&(mouseY>175)&&(mouseY<225)){
  card = 0;} 
}else if(card == 5){ 
  float d = dist(mouseX,mouseY,600,120); 
if (d < 25){
  card = 7;
}else if((mouseX>575)&&(mouseX<625)&&(mouseY>175)&&(mouseY<225)){
  card = 7;}
}else if((mouseX>0)&&(mouseX<700)&&(mouseY>0)&&(mouseY<500))
{card = 0;}}



void pot(){
  noStroke();
  fill(223,148,41);
  rect(130,250,240,45);
  quad(160,290,340,290,330,400,170,400);
}


void trunk(int a){
  //line 0~150
  strokeWeight(10);
  stroke(180,221,34);
  strokeCap(SQUARE);
  line(250,a,250,250);
  //leaf
  translate(250,150);
  fill(180,221,34);
  rotate(PI/12);
  ellipse(-70,50,150,60);
  rotate(-PI/6);
  ellipse(75,0,150,60);
}


void flower(int a, int b, int c){//color
    noStroke();
  smooth();
  fill(a,b,c);
  ellipse(210,210,80,80);
  ellipse(210,290,80,80);
  ellipse(290,210,80,80);
  ellipse(290,290,80,80);
  fill(255,204,0);
  ellipse(250,250,80,80);
}


void curv(){
    strokeWeight(10);
  stroke(142,175,37);
  strokeCap(SQUARE);
  noFill();
  beginShape();
curveVertex(250,150);
curveVertex(250,150);
curveVertex(250,100);
curveVertex(300,80);
curveVertex(350,150);
curveVertex(350,150);
endShape();
  strokeCap(SQUARE);
  line(250,150,250,250);
  //leaf
  translate(250,150);
  noStroke();
  fill(142,175,37);
  rotate(PI/12);
  ellipse(-70,50,150,60);
  rotate(-PI/6);
  ellipse(75,0,150,60);
}

void waterpot(){
beginShape();
stroke(23,90,225);
strokeWeight(3);
fill(185,215,239);
vertex(-11,-6);
vertex(-15,10);
vertex(-95,-14);
////////linestart
vertex(-110,-28);
vertex(-121,23);
vertex(-102,18);
//////lineEnd
vertex(-17,27);
vertex (-33,103);
vertex(122,103);
vertex(96,-6);
 vertex(56,-30);
 vertex(27,-30);
 vertex(-11,-6);
endShape();
ellipse(41,-35,15,15);
line(-95,-14,-102,18);
line(-11,-6,96,-6);
}



