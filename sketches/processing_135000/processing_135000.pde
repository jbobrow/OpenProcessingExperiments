
int x,y;
int posS2X=600, posS2Y= 600;
int posX= 500, posY= 500;//center square
int size0=150;
int size2=250;
int pos2X= 400, pos2Y=400;///circle 1strow
int pos3X= 600, pos3Y=600;///circle 1strow
int pos4X= 600, pos4Y=400;///circle 1strow
int pos5X= 400, pos5Y=600;///circle 1strow
int size3= 350;
int size4= 450;
int size5= 200;////circle1  2ndrow
int size6= 600;////square 2ndrow
int size7= 300;////circle1  3ndrow
int size8= 750;////square5
int size9= 900;////square6
int size10= 990;////square6
int pos6X= 300, pos6Y=300;//circle1  2ndrow
int pos7X= 700, pos7Y=700;//circle1  2ndrow
int pos8X= 700, pos8Y=300;//circle1  2ndrow
int pos9X= 300, pos9Y=700;//circle1  2ndrow
PImage square1;
int pos10X= 200, pos10Y=200;//circle1  2ndrow
int pos11X= 800, pos11Y=800;//circle1  2ndrow
int pos12X= 800, pos12Y=200;//circle1  2ndrow
int pos13X= 200, pos13Y=800;//circle1  2ndrow


void setup(){
size(1000,1000);
background(0);

}

void draw(){
  x = mouseX;
  y = mouseY;
   ///////////Square7
  if (x > posX - size10/2 && x < posX + size10/2 && y > posY - size10/2 && y < posY + size10/2)
  {       fill(0);
        
     }
     else{   
        fill(255);
          }         
  if (mousePressed ){
 fill(255,0,0);///////////////////REDD
}
     rectMode(CENTER);
     rect(posX, posY, size10, size10);
   ///////////Square6
  if (x > posX - size9/2 && x < posX + size9/2 && y > posY - size9/2 && y < posY + size9/2)
  {       fill(255);
        
     }
     else{   
        fill(0);
          }       
         if (mousePressed ){
 fill(0);//////////////////BLACKKK
 }  
     rectMode(CENTER);
     rect(posX, posY, size9, size9);
   ///////////Square5
  if (x > posX - size8/2 && x < posX + size8/2 && y > posY - size8/2 && y < posY + size8/2)
  {       fill(0);
        
     }
     else{   
        fill(255);
          }     
        if (mousePressed ){
 fill(255,0,0);
}    
     rectMode(CENTER);
     rect(posX, posY, size8, size8);
    //////////////////////////////////Circle4 3ndrow
    if (x > pos13X - size/2 && x < pos13X + size/2 && y > pos13Y - size/2 && y < pos13Y + size /2){    
       fill(95,95,95);/////gray
     }
     else{  
       fill(24,24,24);
          }
         ellipse(pos13X,pos13Y,size7,size7);
   //////////////////////////////////Circle3 3ndrow
    if (x > pos12X - size/2 && x < pos12X + size/2 && y > pos12Y - size/2 && y < pos12Y + size /2){    
       fill(95,95,95);/////gray
     }
     else{  
       fill(24,24,24);
          }
         ellipse(pos12X,pos12Y,size7,size7);
   //////////////////////////////////Circle2 3ndrow
    if (x > pos11X - size/2 && x < pos11X + size/2 && y > pos11Y - size/2 && y < pos11Y + size /2){    
      fill(95,95,95);/////gray
     }
     else{  
      fill(24,24,24);
          }
         ellipse(pos11X,pos11Y,size7,size7);
  //////////////////////////////////Circle1 3ndrow
    if (x > pos10X - size/2 && x < pos10X + size/2 && y > pos10Y - size/2 && y < pos10Y + size /2){    
      fill(95,95,95);/////gray
     }
     else{  
      fill(24,24,24);
          }
         ellipse(pos10X,pos10Y,size7,size7);
  ///////////Square4
  if (x > posX - size6/2 && x < posX + size6/2 && y > posY - size6/2 && y < posY + size6/2)
  {       fill(255);
        
     }
     else{   
        fill(0);
          }    
     if (mousePressed ){
 fill(0);//////////////////BLACKKK
 }       
     rectMode(CENTER);
     rect(posX, posY, size6, size6);
   //////////////////////////////////Circle4 2ndrow
    if (x > pos9X - size/2 && x < pos9X + size/2 && y > pos9Y - size/2 && y < pos9Y + size /2){    
       fill(95,95,95);/////gray
     }
     else{  
       fill(24,24,24);
          }
         ellipse(pos9X,pos9Y,size5,size5);
   //////////////////////////////////Circle3 2ndrow
    if (x > pos8X - size/2 && x < pos8X + size/2 && y > pos8Y - size/2 && y < pos8Y + size /2){    
       fill(95,95,95);/////gray
     }
     else{  
       fill(24,24,24);
          }
         ellipse(pos8X,pos8Y,size5,size5);
   //////////////////////////////////Circle2 2ndrow
    if (x > pos7X - size/2 && x < pos7X + size/2 && y > pos7Y - size/2 && y < pos7Y + size /2){    
       fill(95,95,95);/////gray
     }
     else{  
      fill(24,24,24);
          }
         ellipse(pos7X,pos7Y,size5,size5);
  //////////////////////////////////Circle1 2ndrow
    if (x > pos6X - size/2 && x < pos6X + size/2 && y > pos6Y - size/2 && y < pos6Y + size /2){    
       fill(95,95,95);/////gray
     }
     else{  
       fill(24,24,24);
          }
         ellipse(pos6X,pos6Y,size5,size5);
   
  ///////////Square4
  if (x > posX - size4/2 && x < posX + size4/2 && y > posY - size4/2 && y < posY + size4/2)
  {       
        fill(0);
     }
     else{   
        fill(255);
          } 
    if (mousePressed ){
 fill(255,0,0);
}        
     rectMode(CENTER);
     rect(posX, posY, size4, size4);
     
     
////////////////////////////Square3  
  if (x > posX - size3/2 && x < posX + size3/2 && y > posY - size3/2 && y < posY + size3 /2){ 
      fill(255);
     }
     else{
    fill(0);       
     } 
if (mousePressed ){
 fill(0);//////////////////BLACKKK
 }       
     rectMode(CENTER);
     rect(posX, posY, size3, size3);
     
     
  /////////////////// Circle1    
     if (x > pos2X - size/2 && x < pos2X + size/2 && y > pos2Y - size/2 && y < pos2Y + size /2){     
       fill(95,95,95);/////gray
     }
     else{     
       fill(24,24,24);
          }        
     ellipse(pos2X,pos2Y,size,size);
     
     
     //////////////////////Circle 2
     if (x > pos3X - size/2 && x < pos3X + size/2 && y > pos3Y - size/2 && y < pos3Y + size /2){     
       fill(95,95,95);/////gray
     }
     else{     
       fill(24,24,24);
          }
     ellipse(pos3X,pos3Y,size,size);
     
     
//////////////////////////////////Circle 3
  if (x > pos4X - size/2 && x < pos4X + size/2 && y > pos4Y - size/2 && y < pos4Y + size /2){     
      fill(95,95,95);/////gray
     }
     else{ 
       fill(24,24,24);
          }
         ellipse(pos4X,pos4Y,size,size);
 
         
//////////////////////////////////Circle 4
    if (x > pos5X - size/2 && x < pos5X + size/2 && y > pos5Y - size/2 && y < pos5Y + size /2){    
       fill(95,95,95);/////gray
     }
     else{  
       fill(24,24,24);
          }
         ellipse(pos5X,pos5Y,size,size);
   
    
////////////////////////////////square2
  if (x > posX - size2/2 && x < posX + size2/2 && y > posY - size2/2 && y < posY + size /2){     
       fill(0);/////
     }
     else{      
       fill(255);///black
          }
          if (mousePressed ){
 fill(255,0,0);///////////////////REDD
}
     rectMode(CENTER);
     rect(posX, posY, size2, size2);
     
     
  ////////////////main circle  
 fill(0);
ellipse(500,500, 300,300);


/////////////////Center Square Color Change
     if (x > posX - size0/2 && x < posX + size0/2 && y > posY - size0/2 && y < posY + size0 /2){
           fill(255);
     }
     else{ 
       fill(0);
          }      
          if (mousePressed ){
 fill(0);//////////////////BLACKKK
 }  
     rectMode(CENTER);
     rect(posX, posY, size0, size0);

     //////////////////////////////
     

}



