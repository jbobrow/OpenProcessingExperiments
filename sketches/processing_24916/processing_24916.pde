
/////////////////////////////////////////////////////////////////
////////////////Wallpaper two by George Bristow//////////////////
/////////////////////////////////////////////////////////////////

int x = 70;
int z = x*2;

void setup(){
  size (300,600);

  background(255);
  smooth();


   
   //Outlines
  rect (0,0,130,310);
  rect (0,470,300,130);
  rect(200,0,100,180);
  rect(0,0,300,600);
  
  fill(255);
  rect (20,150,x,z);
  
  //Yellow rect's//
  fill(252,228,0,128);
  
  //box 1
  rect (0,30,x,z);
  rect(60,180,70,x);
  rect(100,60,30,x);
  rect(0,300,100,10);
  //box 2
  rect(200,-50,x,z);
  rect(200,130,100,50);
  //box 3
  rect(30,550,x,z);
  rect(110,470,z,x);
  rect(0,470,x,50);
  rect(200,550,z,x);
  
  
  //green rect's
  fill(21,162,22,128);
   //box 1 
  rect(0,200,50,x);
  rect(50,10,80,x);
  rect(110,220,20,90);
  rect(0,0,30,110);
  //box 2
  rect(250,30,x,z);
  rect(200,70,30,x);
  //box 3
  rect(0,500,z,x);
  rect(160,490,x,z);
  rect(270,470,30,100);
  
  
  
          //**********White filling rect's**********//
  fill(255);
  
  //Top left box
  rect(0,30,30,80);
  rect(50,30,20,50);
  rect(100,60,30,20);
  rect(110,220,20,30);
  
  //Top right box
  rect(200,70,30,20);
  rect(250,30,20,60);
  rect(200,130,30,10);
  rect(250,130,50,40);
  
  //Bottom box
  rect(0,500,70,20);
  rect(110,500,30,40);
  rect(30,540,70,30);
  rect(160,490,70,50);
  rect(200,550,30,50);
  rect(270,550,30,20);
  
  
                 //**********Detail**********//
                 
  //Detail outline rect's
  rect(20,150,50,20);
  rect(20,200,30,70);
  rect(60,180,30,70);
  //Inner detail
  rect(30,220,15,30);
  
  //Black/grey rect's        ***
  fill(50,50,50,128);
  //Top box
  rect(20,160,10,10);
  rect(32,152.5,30,15);
  //Left box
  rect(20,240,8,30);
  rect(20,210,22,15);
  rect(40,235,10,30);
  
  //Right box
  rect(67,180,15,25);
  rect(65,215,25,15);
  rect(60,235,15,15);
  rect(84,233,6,15);
  
  //Yellow rect's            ***
  fill(252,228,0,128);
  //Top box
  rect(25,150,15,20);  
  rect(50,150,20,6);
  rect(55,160,15,10);
  
  //Left box
  rect(20,200,7,30);
  rect(38,200,12,15);
  rect(20,243,15,15);
  rect(33,260,15,10);
  
  //Right box
  rect(60,190,13,30);
  rect(78,180,12,5);
  rect(80,202,10,15);
  rect(70,225,20,15);
 
  //Detail detail
  fill(255);
  rect(30,220,12,5);
  rect(30,243,5,7);
  rect(40,235,5,15);
  fill(180,24,198,128);
  rect(30,220,12,5);
  rect(30,243,5,7);
  rect(40,235,5,15);
  
  //Detail white filling rect's
  fill(255);
  
 
  
  //Top box
  rect(25,160,5,10);
  rect(32,152,10,15);
  rect(50,152,12,4);
  rect(55,160,7,7);
  
  //Left box
  rect(20,210,7,15);
  rect(38,210,4,5);
  rect(20,243,8,15);
  rect(40,260,8,5);
 
  //Right box
  rect(67,190,6,15);
  rect(78,180,5,5);
  rect(80,202,3,3);
  rect(65,215,8,5);
  rect(70,225,20,5);
  rect(70,235,5,5);
  rect(84,233,6,7);
  rect(80,215,10,2);
  
  
  
  
  

    
  
}


