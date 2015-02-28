
// Amauri - 18/12/2013 - TRABALHO 2
/* A melhor parte de todos os meus dias de 2013 é quando estou
voltando para casa*/
float   x = 0.0;
float   y = 0.0;
float   z = 0.0;

void setup(){
  size(400,200);
  smooth();
  fill(0);
}
void draw() {
  background(29,155,210);
  stroke(70);
  strokeWeight(1);
  
  rectMode(CENTER);
  
  fill(220,210,255);//prédio ao fundo 1
  rect(x-50,160,60,150);
  for(y = 100; y <= 190; y += 20){
    fill(112,185,190);
    rect(x-45,y, 10,10,2);
  }
  
  fill(220,255,200);//prédio ao fundo 2
  rect(x-170,130,80,180,3);
  for(y = 60; y <= 200; y += 20){
    fill(120,190,180);
    rect(x-180,y, 50, 10,1);
  }
  
  fill(167,137,129);//prédio ao fundo 3
  rect(x-300,130,100,180,3);
  for(y = 60; y <= 200; y += 30){
    fill(100);
   rect(x-300,y,80,20);
  } 
  
  fill(87,98,71);//prèdio 1
  rect(x, 130,70,150,3);
  for(y = 65; y <= 195; y += 20){
   fill(112,185,206);
   rect(x,y, 70,10,2);
  }
  fill(87,98,85);//prédio 2
  rect(x-100,110,80,180,3);
  float x1 = 0.0;
  for(y = 40; y <= 180; y += 25){
    for(x1 = x-125; x1 <= x-70 ; x1 += 25){
      fill(112,185,220);
      rect(x1,y,15,15,2);
    }
  }
  fill(220,210,190);//prédio 3
  rect(x-250,150,170,90,3);
  fill(112,185,215);
  rect(x-290,155,70,50);
  fill(144,124,57);
  rect(x-190,180,20,40);
  fill(176,178,135);
  rect(x-185,182,5,2);
  
  rect(x-400, 110, 90,210,3);//prèdio 4
  for(y = 25; y <= 180; y += 15){
   fill(137,198,209); 
   rect(x-400,y, 75,10,1);
  }  
  
  
  
  fill(129,104,51);//árvore 1
  rect(x-170,180,10,40);
  fill(55,134,43);
  rect(x-170, 150, 40,20,10);
  
  fill(130,100,50);//árvore 2
  rect(x-95,170, 5,60);
  fill(55,140,50);
  rect(x-95,130, 25,25,10);
  
  fill(245,220,135);//pessoa 1
  rect(x-260,175,3,4);
  ellipse(x-260,170,10,10);
  fill(105,28,134);
  rect(x-260, 186,10,18,2);
  
  fill(245,193,129);//pessoa 2
  rect(x-370,175,3,4);
  ellipse(x-370,170, 11,11);
  fill(93,84,73);
  rect(x-370,186,10,20,2);
  
  fill(80,42,12);//árvore 3
  rect(x-460,175,10,80);
  fill(63,131,48);
  arc(x-460,155,40,60,PI, PI+QUARTER_PI*4);
  
  
  
  fill(224,82,43);//ônibus
  rect(z-300,190,450,150,5);
  float z1 = 0.0;
  float z2 = 0.0;
  fill(224,222,222);
  rect(z-83,187,15,10,1);
  fill(172,50,16);
  rect(z-517,187,15,10,1);
  fill(88,85,84);
  for(z1 = z-490; z1 <= z-100; z1 += 80){
   rect(z1, 145, 70,50);
   rect(z-93, 150, 35,55,2);
  }
  fill(149,141,139);
  rect(z-300,190, 70,153,3);
  for(z1 = z-330; z1 <= z-270; z1 += 10){
    line(z1,115,z1,260);
  }
  
  
 fill(90);//interior ônibus
 rect(200,200,400,12);
 rect(200,70,400,5);
 rect(200,70,5,248);
 fill(254,255,52);
 rect(380,70,12,300);
 rect(200,0,430,10);
 fill(183,183,135);
 rect(380,0,20,20,5);
 
 
  
  
  
  
  
   
  x += 1.2;
  z += 2.3;
  if (x > 880) {
    x = -30.0;
  }
  if(z > 950) {
    z = -50.0;
  }
 }
 
 




  




