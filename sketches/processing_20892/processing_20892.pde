
PFont fontX;
PFont fontY;


void setup(){
  
  
  size(1220,200);
  smooth();
  fontX=loadFont("ArialMT-10.vlw");
  fontY=loadFont("ArialMT-20.vlw");
  textFont(fontX);
  ellipseMode(CENTER);
  

  
}




void pageSetup(){
  
  
background(255);

  int m=minute(); 
  int s=second(); 
  int h=hour();




//draws the timeline itself and the end lines.
line(10,(2*height/3),width-10,(2*height/3));
line(10,(2*height/3)-10,10,(2*height/3)+10);  
line(width-10,(2*height/3)-10,width-10,(2*height/3)+10);  

//draws the month marks
for (int i=0; i<1300;i=i+100){
  line((i+10),(2*height/3)-10,(i+10),(2*height/3)+10);
  
  
  line((i+35),(2*height/3)-5,(i+35),(2*height/3)+5);
  line((i+60),(2*height/3)-5,(i+60),(2*height/3)+5);
  line((i+85),(2*height/3)-5,(i+85),(2*height/3)+5);
}
  
  textFont(fontY);
//Month Names
fill(0);
text("Jan",(10),(2*height/3)-10);
text("Feb",(110),(2*height/3)-10);
text("Mar",(210),(2*height/3)-10);
text("Apr",(310),(2*height/3)-10);
text("May",(410),(2*height/3)-10);
text("Jun",(510),(2*height/3)-10);
text("Jul",(610),(2*height/3)-10);
text("Aug",(710),(2*height/3)-10);
text("Sep",(810),(2*height/3)-10);
text("Oct",(910),(2*height/3)-10);
text("Nov",(1010),(2*height/3)-10);
text("Dec",(1110),(2*height/3)-10);


}

void orbSetup(){
 int s=second();
 int m=minute();
 int h=hour();
 int d=day();
 int mo=month();

 
 textMode(CENTER);

 
 textFont(fontY);
 
 
 
 
  //jan
 if(mo>0&&mo<2){
   
   
 fill(0);
 if(h<10){
   text(h,(d*(100/31))+5,(2*height/3)+5);
 }else{
   text(h,(d*(100/31)),(2*height/3)+5);
 }
   
   
   
    noFill();
    ellipse((d*(100/31))+10,(2*height/3),30,30);
 
fill(0,0,0,100);
  
  if(h>12){
    ellipse((d*(100/31))+10,(2*height/3),m/2,m/2);
  }else{
    ellipse((d*(100/31))+10,(2*height/3),m/2,m/2);
  }

  
 if (h<13){
   fill(255,0,0);
   arc((d*(100/31))+10, (2*height/3), 30, 30, radians(((s-1)*6)-90), radians(((s+1)*6)-90));
 }else{
   fill(255,0,0);
    arc((d*(100/31))+10, (2*height/3), 30, 30, radians(((s-0.5)*6)-90), radians((s*6)-90));
 }
 }
 
 
  //feb
 if(mo>1&&mo<3){
   
 fill(0);
 if(h<10){
   text(h,(d*(25/7))+105,(2*height/3)+5);
 }else{
   text(h,(d*(25/7))+100,(2*height/3)+5);
 }
   
   
    noFill();
    ellipse((d*(25/7))+110,(2*height/3),30,30);
 
fill(0,0,0,100);
  
  if(h>12){
    ellipse((d*(25/7))+110,(2*height/3),m/2,m/2);
  }else{
    ellipse((d*(25/7))+110,(2*height/3),m/2,m/2);
  }

  
 if (h<13){
   fill(255,0,0);
   arc((d*(25/7))+110, (2*height/3), 30, 30, radians(((s-1)*6)-90), radians(((s+1)*6)-90));
 }else{
   fill(255,0,0);
    arc((d*(25/7))+110, (2*height/3), 30, 30, radians(((s-0.5)*6)-90), radians((s*6)-90));
 }
 }
 
 
 
   //mar
 if(mo>2&&mo<4){
   
 fill(0);
 if(h<10){
   text(h,(d*(100/31))+205,(2*height/3)+5);
 }else{
   text(h,(d*(100/31))+200,(2*height/3)+5);
 }   
   
   
   
    noFill();
    ellipse((d*(100/31))+210,(2*height/3),30,30);
 
fill(0,0,0,100);
  
  if(h>12){
    ellipse((d*(100/31))+210,(2*height/3),m/2,m/2);
  }else{
    ellipse((d*(100/31))+210,(2*height/3),m/2,m/2);
  }

  
 if (h<13){
   fill(255,0,0);
   arc((d*(100/31))+210, (2*height/3), 30, 30, radians(((s-1)*6)-90), radians(((s+1)*6)-90));
 }else{
   fill(255,0,0);
    arc((d*(100/31))+210, (2*height/3), 30, 30, radians(((s-0.5)*6)-90), radians((s*6)-90));
 }
 }
 
    //apr
 if(mo>3&&mo<5){
   
   
 fill(0);
 if(h<10){
   text(h,(d*(10/30))+305,(2*height/3)+5);
 }else{
   text(h,(d*(10/30))+300,(2*height/3)+5);
 }
   
   
   
    noFill();
    ellipse((d*(10/3))+310,(2*height/3),30,30);
 
fill(0,0,0,100);
  
  if(h>12){
    ellipse((d*(10/3))+310,(2*height/3),m/2,m/2);
  }else{
    ellipse((d*(10/3))+310,(2*height/3),m/2,m/2);
  }

  
 if (h<13){
   fill(255,0,0);
   arc((d*(10/3))+310, (2*height/3), 30, 30, radians(((s-1)*6)-90), radians(((s+1)*6)-90));
 }else{
   fill(255,0,0);
    arc((d*(10/3))+310, (2*height/3), 30, 30, radians(((s-0.5)*6)-90), radians((s*6)-90));
 }
 }
 
 

 //may
 
 
 if(mo>4&&mo<6){
   
 fill(0);
 
 
 if(h<10){
   text(h,(d*(100/31))+405,(2*height/3)+5);
 }else{
   text(h,(d*(100/31))+400,(2*height/3)+5);
 }
    
    
    
    noFill();  
    
    
    ellipse((d*(100/31))+410,(2*height/3),30,30);
 
 
 
 
  fill(0,0,0,100);
  
  if(h>12){
    ellipse((d*(100/31))+410,(2*height/3),(m)/2,(m)/2);
  }else{
    ellipse((d*(100/31))+410,(2*height/3),(m)/2,(m)/2);
  }

  
 if (h<13){
   fill(255,0,0);
   arc((d*(100/31))+410, (2*height/3), 30, 30, radians(((s-1)*6)-90), radians(((s+1)*6)-90));
 }else{
   fill(255,0,0);
    arc((d*(100/31))+410, (2*height/3), 30, 30, radians(((s-0.5)*6)-90), radians((s*6)-90));
 }
 
 
 line((d*(100/31))+410,(2*height/3),555,40);
   
 }
 
     //jun
 if(mo>5&&mo<7){
   
   
 fill(0);
 if(h<10){
   text(h,(d*(100/30))+505,(2*height/3)+5);
 }else{
   text(h,(d*(100/30))+500,(2*height/3)+5);
 }

 
    noFill();
    ellipse((d*(10/3))+510,(2*height/3),30,30);
 
fill(0,0,0,100);
  
  if(h>12){
    ellipse((d*(10/3))+510,(2*height/3),m/2,m/2);
  }else{
    ellipse((d*(10/3))+510,(2*height/3),m/2,m/2);
  }

  
 if (h<13){
   fill(255,0,0);
   arc((d*(10/3))+510, (2*height/3), 30, 30, radians(((s-1)*6)-90), radians(((s+1)*6)-90));
 }else{
   fill(255,0,0);
    arc((d*(10/3))+510, (2*height/3), 30, 30, radians(((s-0.5)*6)-90), radians((s*6)-90));
 }
 }
 
 
 
 
 
 
   
   
     //jul
 if(mo>6&&mo<8){
   
   
 fill(0);
 if(h<10){
   text(h,(d*(100/31))+605,(2*height/3)+5);
 }else{
   text(h,(d*(100/31))+600,(2*height/3)+5);
 }   

   
    noFill();
    ellipse((d*(100/31))+610,(2*height/3),30,30);
 
fill(0,0,0,100);
  
  if(h>12){
    ellipse((d*(100/31))+610,(2*height/3),m/2,m/2);
  }else{
    ellipse((d*(100/31))+610,(2*height/3),m/2,m/2);
  }

  
 if (h<13){
   fill(255,0,0);
   arc((d*(100/31))+610, (2*height/3), 30, 30, radians(((s-1)*6)-90), radians(((s+1)*6)-90));
 }else{
   fill(255,0,0);
    arc((d*(100/31))+610, (2*height/3), 30, 30, radians(((s-0.5)*6)-90), radians((s*6)-90));
 }
 }
  
  println(mo);
  
       //aug
 if(mo>7&&mo<9){
   
   
   
 fill(0);
 if(h<10){
   text(h,(d*(100/31))+705,(2*height/3)+5);
 }else{
   text(h,(d*(100/31))+700,(2*height/3)+5);
 }
   
   
    noFill();
    ellipse((d*(100/31))+710,(2*height/3),30,30);
 
fill(0,0,0,100);
  
  if(h>12){
    ellipse((d*(100/31))+710,(2*height/3),m/2,m/2);
  }else{
    ellipse((d*(100/31))+710,(2*height/3),m/2,m/2);
  }

  
 if (h<13){
   fill(255,0,0);
   arc((d*(100/31))+710, (2*height/3), 30, 30, radians(((s-1)*6)-90), radians(((s+1)*6)-90));
 }else{
   fill(255,0,0);
    arc((d*(100/31))+710, (2*height/3), 30, 30, radians(((s-0.5)*6)-90), radians((s*6)-90));
 }
 }
 
 
     //sep
 if(mo>8&&mo<10){
   
   
 fill(0);
 if(h<10){
   text(h,(d*(100/30))+805,(2*height/3)+5);
 }else{
   text(h,(d*(100/30))+800,(2*height/3)+5);
 }   
   
   
   
    noFill();
    ellipse((d*(10/3))+810,(2*height/3),30,30);
 
 fill(0,0,0,100);
  
  if(h>12){
    ellipse((d*(10/3))+810,(2*height/3),m/2,m/2);
  }else{
    ellipse((d*(10/3))+810,(2*height/3),m/2,m/2);
  }

  
 if (h<13){
   fill(255,0,0);
   arc((d*(10/3))+810, (2*height/3), 30, 30, radians(((s-1)*6)-90), radians(((s+1)*6)-90));
 }else{
   fill(255,0,0);
    arc((d*(10/3))+810, (2*height/3), 30, 30, radians(((s-0.5)*6)-90), radians((s*6)-90));
 }
 }
 
 
 
 
 


     //oct
 if(mo>9&&mo<11){
   
   
 fill(0);
 if(h<10){
   text(h,(d*(100/31))+905,(2*height/3)+5);
 }else{
   text(h,(d*(100/31))+900,(2*height/3)+5);
 }
   
    noFill();
    ellipse((d*(100/31))+910,(2*height/3),30,30);
 
fill(0,0,0,100);
  
  if(h>12){
    ellipse((d*(100/31))+910,(2*height/3),m/2,m/2);
  }else{
    ellipse((d*(100/31))+910,(2*height/3),m/2,m/2);
  }

  
 if (h<13){
   fill(255,0,0);
   arc((d*(100/31))+910, (2*height/3), 30,30, radians(((s-1)*6)-90), radians(((s+1)*6)-90));
 }else{
   fill(255,0,0);
    arc((d*(100/31))+910, (2*height/3), 30, 30, radians(((s-0.5)*6)-90), radians((s*6)-90));
 }
 } 
 
 
     //nov
 if(mo>10&&mo<12){
   
 fill(0);
 if(h<10){
   text(h,(d*(100/30))+1005,(2*height/3)+5);
 }else{
   text(h,(d*(100/30))+1000,(2*height/3)+5);
 }
   
    noFill();
    ellipse((d*(10/3))+1010,(2*height/3),30,30);
 
  fill(0,0,0,100);
  
  if(h>12){
    ellipse((d*(10/3))+1010,(2*height/3),m/2,m/2);
  }else{
    ellipse((d*(10/3))+1010,(2*height/3),m/2,m/2);
  }

  
 if (h<13){
   fill(255,0,0);
   arc((d*(10/3))+1010, (2*height/3), 30, 30, radians(((s-1)*6)-90), radians(((s+1)*6)-90));
 }else{
   fill(255,0,0);
    arc((d*(10/3))+1010, (2*height/3), 30, 30, radians(((s-0.5)*6)-90), radians((s*6)-90));
 }
 }
 
 
 
 
 
      //dec
 if(mo>11&&mo<13){
   
 fill(0);
 if(h<10){
   text(h,(d*(100/31))+1105,(2*height/3)+5);
 }else{
   text(h,(d*(100/31))+1100,(2*height/3)+5);
 }
   
    noFill();
    ellipse((d*(100/31))+1110,(2*height/3),30,30);
 
  fill(0,0,0,100);
  
  if(h>12){
    ellipse((d*(100/31))+1110,(2*height/3),m/2,m/2);
  }else{
    ellipse((d*(100/31))+1110,(2*height/3),m/2,m/2);
  }

  
 if (h<13){
   fill(255,0,0);
   arc((d*(100/31))+1110, (2*height/3), 30, 30, radians(((s-1)*6)-90), radians(((s+1)*6)-90));
 }else{
   fill(255,0,0);
    arc((d*(100/31))+1110, (2*height/3), 30, 30, radians(((s-0.5)*6)-90), radians((s*6)-90));
 }
 }
   
   
   
   
   
   
   
   
   
 }
 
 
void largerClock(){
  int d=day();
  int h =hour();
  int s=second();
  int m=minute();
  
   if(h<10){
   text(h,1000,30);
 }else{
   text(h,590,55);
 }
   
    noFill();
    ellipse(600,50,90,90);
 
  fill(0,0,0,100);
  
 
    ellipse(600,50,m*1.5,m*1.5);


  
 
   fill(255,0,0);
   arc(600, 50, 90, 90, radians(((s-1)*6)-90), radians(((s+1)*6)-90));
   


  
  
  
  
}

 




void draw(){
pageSetup();
orbSetup();

largerClock();





}

