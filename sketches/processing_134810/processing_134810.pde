
int x = 0;
int bounce = 10;

float temp = 0;

void setup(){
  size(800,600);

}

void draw(){
 
 noStroke();
  
 rect(x,10,20,20);
 rect(x,20,20,20);
 rect(x,30,20,20);
 rect(x,40,20,20);
 rect(x,50,20,20);
 rect(x,60,20,20);
 rect(x,70,20,20);
 rect(x,80,20,20);
 rect(x,90,20,20);
 rect(x,100,20,20);
 rect(x,110,20,20);
 rect(x,120,20,20);
 rect(x,130,20,20);
 
 rect(width-x,160,20,20);
 rect(width-x,170,20,20);
 rect(width-x,180,20,20);
 rect(width-x,190,20,20);
 rect(width-x,200,20,20);
 rect(width-x,210,20,20);
 rect(width-x,220,20,20);
 rect(width-x,240,20,20);
 rect(width-x,250,20,20);
 rect(width-x,260,20,20);
 rect(width-x,270,20,20);
 rect(width-x,280,20,20);
 rect(width-x,290,20,20);
 
 rect(x,320,20,20);
 rect(x,330,20,20);
 rect(x,340,20,20);
 rect(x,350,20,20);
 rect(x,360,20,20);
 rect(x,370,20,20);
 rect(x,380,20,20);
 rect(x,390,20,20);
 rect(x,400,20,20);
 rect(x,410,20,20);
 rect(x,420,20,20);
 rect(x,430,20,20);
 
 rect(width-x,460,20,20);
 rect(width-x,470,20,20);
 rect(width-x,480,20,20);
 rect(width-x,490,20,20);
 rect(width-x,500,20,20);
 rect(width-x,510,20,20);
 rect(width-x,520,20,20);
 rect(width-x,530,20,20);
 rect(width-x,540,20,20);
 rect(width-x,550,20,20);
 rect(width-x,560,20,20);
 rect(width-x,570,20,20);

 rect(10,x,20,20);
 rect(20,x,20,20);
 rect(30,x,20,20);
 rect(40,x,20,20);
 rect(50,x,20,20);
 rect(60,x,20,20);
 rect(70,x,20,20);
 rect(80,x,20,20);
 rect(90,x,20,20);
 rect(100,x,20,20);
 rect(110,x,20,20);
 rect(120,x,20,20);
 
 rect(180,height-x,20,20);
 rect(190,height-x,20,20);
 rect(200,height-x,20,20);
 rect(210,height-x,20,20);
 rect(220,height-x,20,20);
 rect(230,height-x,20,20);
 rect(240,height-x,20,20);
 rect(250,height-x,20,20);
 rect(260,height-x,20,20);
 rect(270,height-x,20,20);
 rect(280,height-x,20,20);
 rect(290,height-x,20,20);
 
 rect(350,x,20,20);
 rect(360,x,20,20);
 rect(370,x,20,20);
 rect(380,x,20,20);
 rect(390,x,20,20);
 rect(400,x,20,20);
 rect(410,x,20,20);
 rect(420,x,20,20);
 rect(430,x,20,20);
 rect(440,x,20,20);
 rect(450,x,20,20);
 
 rect(510,height-x,20,20);
 rect(520,height-x,20,20);
 rect(530,height-x,20,20);
 rect(540,height-x,20,20);
 rect(550,height-x,20,20);
 rect(560,height-x,20,20);
 rect(570,height-x,20,20);
 rect(580,height-x,20,20);
 rect(590,height-x,20,20);
 rect(600,height-x,20,20);
 rect(610,height-x,20,20);
 
 rect(670,x,20,20);
 rect(680,x,20,20);
 rect(690,x,20,20);
 rect(700,x,20,20);
 rect(710,x,20,20);
 rect(720,x,20,20);
 rect(730,x,20,20);
 rect(740,x,20,20);
 rect(750,x,20,20);
 rect(760,x,20,20);
 rect(770,x,20,20);
 //rect(680,x,20,20);
 

 x = x + bounce;

 
 if(x >= width){
   x=width;
  background(random(255),random(255),random(255));

   fill(random(255),random(255),random(255));
   
   bounce = bounce * -1;
 }
 
if(x <= 0)
{
background(random(255));
fill(random(255),random(255),random(255));
bounce = bounce * -1;
}
//  
//  for (int x = 0; x <= width; x = x + 20) 
//  {
//  temp = int(random(400));
//  cubes_from_space(x, temp);
//  cubes_from_space2(x, temp);
//  temp = 0;
//  }
//}
//
//void cubes_from_space(int xpos,float ysize){ 
//  noStroke();  
//  fill(random(255),random(255));
//  rect(xpos, 800, 20, -ysize);
//}
//
//void cubes_from_space2(int xpos,float ysize){ 
//  noStroke();  
//  fill(random(255),random(255),random(255));
//  rect(xpos, 0, 20, ysize);
}



