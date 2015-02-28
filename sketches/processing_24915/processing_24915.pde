
//////////////////////////////////////////////////////////////////
////////////////Wallpaper one by George Bristow//////////////////
//////////////////////////////////////////////////////////////////

int x = 70;
int z = x*2;

void setup(){
  size (300,600);

  background(255);
  smooth();

  //Box outlines
  noFill();
  rect(170,280,x,z);
  rect(0,120,300,310);
  rect(0,0,300,600);
  rect(120,0,180,50);
  rect(0,510,90,90);
   
                     //*****Blue rect's*****//
                 
  fill(0,27,252,128);
  
  //Top box 
  rect(220,20,x,30);
  rect(120,0,40,50);
  
  //Center box
  rect(90,130,x,z);
  rect(180,130,z,x);
  rect(-70,120,z,30);
  rect(270,230,x,z);
  rect(-80,240,z,x);
  rect(170,400,z,30);
  rect(90,330,x,100);
  rect(0,340,60,x);
  
  //Bottom box
  rect(0,550,60,50);
  
  
                   //*****Yellow rect's*****//
                   
  fill(252,228,0,128);
  
  //Top box
  rect(180,0,z,30);
  
  //Center box
  rect(260,350,x,x);
  rect(50,120,z,50);
  rect(220,180,x,z);
  rect(130,210,x,z);
  rect(-30,290,z,x);
  rect(-40,120,x,z);
  rect(250,120,50,20);
  rect(50,390,x,40);
  
  //Bottom box
  rect(0,510,x,30);
  rect(40,560,50,40);
  
           //**********White filling rect's**********//
           
  fill(255);
    
  //Top box
  rect(220,20,70,10);
    
  //Middle box
  rect(0,120,30,30);
  rect(50,120,20,30);
  rect(90,130,70,40);
  rect(180,130,10,40);
  rect(250,130,50,10);
  rect(220,180,70,20);
  rect(130,210,30,60);
  rect(0,240,30,20);
  rect(0,290,60,20);
  rect(0,340,60,20);
  rect(90,330,20,30);
  rect(130,330,30,20);
  rect(50,390,10,20);
  rect(90,390,30,40);
  rect(270,350,30,20);
  rect(260,400,40,20);
  rect(270,230,20,90); 
    
  //Bottom box
  rect(40,560,20,40);
  
 
              //**********Detail rect's***********//
              
  rect(170,280,30,70);
  rect(220,280,20,40);
  rect(170,400,70,20);
  //Inner detail//
  noFill();
  rect(175,315,15,30);
  
  //Green rect's              ***
  fill(21,162,22,128);
  
  //Top left box
  rect(170,280,7.5,9.3);
  rect(181.2,283,18.8,15);
  rect(170,325,11,15);
  rect(197,330,3,20);
  
  //Top right box
  rect(230,287,10,30);
  rect(220,296,6,15);
  
  //Bottom box
  rect(170,404,25,12);
  rect(205,404,12,16);
  rect(234,400,6,16);
  
  
  
  //Yellow rect's            ***
  
  fill(252,228,0,128);
  
  //Top left box
  rect(170,289.3,15,30);
  rect(186,321,14,15);
  rect(170,348,23,2);
  rect(195,295,5,15);
  
  //Top right box
  rect(220,280,15,20);
  rect(220,310,20,10);
  
  //Bottom box
  rect(170,400,12.5,7);
  rect(175,412,12,8);
  rect(190,400,30,12);
  rect(221,414,19,6);
  
  //Detail white rect's
  fill(255);
  
  //Top left corner
  rect(170,289.3,7.5,16);
  rect(181.2,289.3,4,9);
  rect(195,295,5,3);
  rect(197,330,3,6);
  
  
  //Top right corner
  rect(230,287,5,13);
  rect(220,296,6,4);
  rect(220,310,6,2);
  rect(230,310,10,7);
  
  //Bottom 
  rect(170,404,12,3);
  rect(190,404,5,8);
  rect(175,412,12,4);
  rect(205,404,12,8);
  rect(234,414,6,3);
  
  //Detail detail
  fill(255);
  rect(185,321,5,15);
  rect(175,315,10,4);
  rect(175,325,6,15);
  fill(50,50,50,128);
  rect(185,321,5,15);
  rect(175,315,10,4);
  rect(175,325,6,15);
  
//************************************************************//

    
  
}

