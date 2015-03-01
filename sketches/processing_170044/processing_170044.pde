

 size(400,400);
 colorMode(RGB);
 background(0);
 
int eSize=5,diameter,i;
     

//DR_BLUE_box----------------------------------------

 //BLUE_ellipse
  noStroke();
  fill(67,116,255,200);
  diameter = 230;
   for(i=0; i<16; i++){
  
      if(i>5&&i<10){
         fill(0);
       }else{
         fill(67,116,255,50);
       }
  
    ellipse(310,155,diameter,diameter);
    diameter = diameter - 10;
    } 
    
//DL_GREEN_box--------------------------------------

 //GREEN_ellipse
  noStroke();
  fill(67,255,122,200);
   diameter = 230;
     for(i=0; i<16; i++){
       
        if(i>5&&i<10){
           fill(0);
         }else{
           fill(67,225,122,50);
         }
       
     ellipse(245,310,diameter,diameter);
     diameter = diameter - 10;
     } 

//UL_YELLOW_box----------------------------------------

 //YELLOW_ellipse
  noStroke();
  fill(255,248,67,200);
   diameter = 230;
     for(i=0; i<16; i++){
       
        if(i>5&&i<10){
           fill(0);
         }else{
           fill(255,248,67,50);
         }
       
     ellipse(90,245,diameter,diameter);
     diameter = diameter - 10;
     }
    
//UR_RED_box----------------------------------------
 
 //RED_ellipse
  noStroke();
  fill(255,67,67,200);
   diameter = 230;
     for(i=0; i<16; i++){
       
        if(i>5&&i<10){
           fill(0);
         }else{
           fill(255,67,67,50);
         }       
       
       
     ellipse(155,90,diameter,diameter);
     diameter = diameter - 10;
     }
     

    
//WHITE_cover-------------------------------------------
 //U1
 noStroke();
 strokeWeight(1);
 fill(0);
 rect(0,0,400,50);
   //U2
   noStroke();
   strokeWeight(1);
   fill(0);
   rect(260,0,10,131);
   
 //R1
 noStroke();
 strokeWeight(1);
 fill(0);
 rect(350,0,50,400);
   //R2
   noStroke();
   strokeWeight(1);
   fill(0);
   rect(270,260,130,10);
   
 //L1
 noStroke();
 strokeWeight(1);
 fill(0);
 rect(0,0,50,400);
   //L2
   noStroke();
   strokeWeight(1);
   fill(0);
   rect(0,131,131,9);
   
 //D1
 noStroke();
 strokeWeight(1);
 fill(0);
 rect(0,350,400,50);
   //D2
   noStroke();
   strokeWeight(1);
   fill(0);
   rect(131,270,10,129);
   
 //center_box
 noStroke();
 strokeWeight(1);
 fill(0);
 rect(131,131,139,139);

  //ball--------------------------------------------------
  
/*
  for(int y=0; y<=height; y+=20){
   for(int x=0; x <=width; x+=20){
    
    if(y==50||y==100||x==50||x==100){ 
     smooth(500);
     fill(0,0,0,0);
  }else{
    fill(0);
  }

  
  rect(x,y,eSize,eSize);
  println(x);
  }
  }
  
  */


