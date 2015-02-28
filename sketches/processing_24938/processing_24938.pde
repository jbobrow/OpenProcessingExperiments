
//////////////////////////////////////////////////////////////////
////////////////Wallpaper three by George Bristow/////////////////
//////////////////////////////////////////////////////////////////

int x = 70;
int z = x*2;

void setup(){
  size (300,600);

  background(255);
  smooth();
  
  
  //Box outlines
  rect(0,0,210,90);
  rect(0,230,140,300);
  rect(180,140,120,300);
  rect(0,0,300,600);
  
  //Black/grey rect's
  fill(50,50,50,128);
  //Top box
  rect(60,10,z,x);
  rect(0,50,40,40);
  //Left box
  rect(-40,270,z,x);
  rect(90,370,50,z);
  rect(0,390,40,z);
  
  //Right box
  rect(210,140,x,100);
  rect(180,370,x,70);
  rect(200,270,z,x);
  rect(280,360,20,x);
  
  //Yellow rect's
   fill(252,228,0,128);
  
  //Top box
  rect(20,0,x,90);
  rect(150,50,60,40);
  rect(110,0,100,30);
  //Left box
  rect(0,400,x,x);
  rect(60,490,x,40);
  rect(70,230,x,60);
  rect(0,230,30,z);
  
  //Right box
  rect(180,170,60,z);
  rect(220,320,90,x);
  rect(270,220,30,x);
  rect(260,140,40,20);
  
  //White filling rect's
  fill(255);
  
  //Top box
  rect(20,50,20,40);
  rect(60,10,30,70);
  rect(110,10,90,20);
  rect(150,50,50,30);
  
  //Left box
  rect(0,270,30,70);
  rect(70,270,30,20);
  rect(0,400,40,70);
  rect(90,490,40,20);
  
  //Right box
  rect(210,170,30,70);
  rect(260,140,20,20);
  rect(270,220,10,20);
  rect(270,270,30,20);
  rect(200,270,40,40);
  rect(220,320,80,20);
  rect(220,370,30,20);
  rect(280,360,20,30);
  
  
  //Box zoom in
  noFill();
  rect(50,300,x,z);
  
  
                  //*********Detail**********//

 
  fill(255);
  
  rect(50,300,50,40);
  rect(50,400,20,40);
  rect(90,370,30,70);
  noFill();
  rect(55,305,15,30);
  
  //Purple rect's           ***
  fill(180,24,198,128);
  
  //Top box
  rect(50,310,30,15);
  rect(93,323,7,17);
  rect(73,335,15,5);
  
  //Bottom left box
  rect(50,400,16,11);
  rect(50,425,7,15);
  rect(60,422,10,18);
  
  //Bottom right box
  rect(90,382,15,15);
  rect(110,370,10,7);
  rect(90,410,12,30);
  rect(105,405,15,15);
  
  
  //Yellow rect's            ***
  fill(252,228,0,128);
  
  //Top box
  rect(60,300,15,7);
  rect(50,330,10,10);
  rect(75,315,25,15);
  rect(86,333,14,7);
  rect(88,300,12,12);
  
  //Bottom Left box
  rect(57,400,13,7);
  rect(50,417,15,15);
  
  //Bottom right box
  rect(100,370,15,17);
  rect(96,392,15,30);
  rect(114,392,6,15);
  rect(96,433,24,7);
  
  //**********White detail rect's**********//
  
  fill(255);
  
  //Top box
  rect(75,315,5,10);
  rect(86,335,2,5);
  rect(93,323,7,7);
  rect(93,333,7,7);
  
  
  //Bottom left box
  rect(57,400,9,7);
  rect(50,425,7,7);
  rect(60,422,5,10);
 
  //Bottom right box
  rect(100,382,5,5);
  rect(96,392,9,5);
  rect(110,370,5,7);
  rect(96,410,6,12);
  rect(96,433,6,7);
  rect(105,405,6,15);
  rect(114,405,6,2);
  
  //Detail detail
  rect(55,310,15,15);
  rect(60,305,10,2);
  rect(55,330,5,5);
  fill(0,27,252,128);
  rect(55,310,15,15);
  rect(60,305,10,2);
  rect(55,330,5,5);
  
  
  
  

  
  
  
  
}  

