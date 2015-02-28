
int x = 70;
int z = x*2;

void setup(){
  size (300,600);
  background(255);
  smooth();


   
   
  rect (0,0,130,310);
  rect (0,470,300,130);
  rect(200,0,100,180);
  
  
  fill(255);
  rect (20,160,x,z);
  
  //yellow rect's
  fill(252,228,0,128);
  
  //box 1
  rect (0,0,x,z);
  rect(60,180,70,x);
  rect(100,60,30,x);
  rect(0,290,100,20);
  //box 2
  rect(200,-50,x,z);
  rect(200,140,100,40);
  //box 3
  rect(30,550,x,z);
  rect(120,470,z,x);
  rect(-40,470,x,50);
  rect(200,550,z,x);
  
  
  //green rect's
    fill(21,162,22,128);
   //box 1 
  rect(0,200,50,x);
  rect(50,10,80,x);
  rect(110,220,20,90);
  //box 2
  rect(250,30,x,z);
  //box 3
  rect(0,500,z,x);
  rect(220,470,x,z);
  
  
    
  
}


