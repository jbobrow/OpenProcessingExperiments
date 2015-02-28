
int x = 70;
int z = x*2;

void setup(){
  size (300,600);
  background(255);
  smooth();
  
  
  //Box outlines
  rect(0,0,220,180);     //Top box
  rect(0,430,100,300);   //Left box
  rect(150,300,150,300); //Right box
  
  //Purple rect's
    fill(180,24,198,128);
  //box 1
  rect(0,50,z,x);
  rect(160,0,60,50);
  rect(100,160,70,20);
  rect(190,100,30,80);
  //box 2
  rect(0,430,80,50);
  rect(50,520,50,80);
  rect(0,540,30,60);
  //box 3
  rect(230,450,z,x);
  rect(150,460,60,z);
  rect(150,360,x,x);
  rect(250,300,50,30);
  
  //Yellow rect's
  fill(252,228,0,128);
  
  //box 1
  rect(50,0,70,30);
  rect(110,60,110,70);
  rect(0,140,40,40);
  rect(160,150,60,30);
  //box 2
  rect(30,430,70,30);
  rect(0,500,70,70);
  //box 3
  rect(200,300,x,80);
  rect(180,570,120,30);
  rect(270,400,z,x);
  rect(180,400,x,z);
  
  //White filling rect's
  fill(255);
  
  //Top box
  rect(110,60,30,60);
  rect(190,100,30,30);
  rect(190,150,30,30);
  rect(160,160,10,20);
  
  //Bottom left box
  rect(30,430,50,30);
  rect(0,540,30,30);
  rect(50,520,20,50);
  
  //Right box
  rect(180,400,40,30);
  rect(200,360,20,20);
  rect(250,300,20,30);
  rect(270,450,30,20);
  rect(230,450,20,70);
  rect(180,460,30,80);
  rect(180,570,30,30);
  
   //box zoom in
    noFill();
  rect(20,20,x,z);
  
  //Detail
  
  //Top box
  rect(50,20,7,10);
  rect(62,20,28,5);
  rect(70,23,15,7);
  
  //Middle box 
  rect(20,50,15,7);
  rect(20,50,7,30);
  rect(20,75,13,15);
  rect(20,85,23,15);
  rect(20,95,13,15);
  rect(30,50,30,10);
  rect(38,52,15,30);
  rect(38,95,15,25);  
  
  
  
}  
  


