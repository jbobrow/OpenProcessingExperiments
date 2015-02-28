
int eSize = 3;
 
size(510, 510);
background(250);



for(int x = 0; x <= width; x ++){
  
   //migiue naname
   stroke(0,10,x,60);
   line(height,x,x,0);
   
   //hidarisita naname
   stroke(0,180,x,60);
   line(x,width,0,x);
   
   //migisita naname
   stroke(0,x,210,80);
   line(510,x,510-x,510);
   
   //hidariue naname
   stroke(0,x,210,80);
   //x1,y1,x2,y2
   line(0,x,510-x,0);
   
   
     stroke(0,x,10,60);
   //x1,y1,x2,y2
   line(x,width,x,0);
   
      
     stroke(0,x,10,60);
   //x1,y1,x2,y2
   line(height,x,x,0);
   
}



stroke(80,130,200);
for(int y=0; y <= width; y +=10){
  
  line(y,width-y,255,y);
  
stroke(80,130,200);
line(255,width-y,y,y);

}




strokeWeight(20);
stroke(0,0,100,130);
noFill();
ellipse(255, 255, 600, 600);


strokeWeight(8);
stroke(0,0,100,110);
noFill();
ellipse(255, 255, 560, 560);


strokeWeight(8);
stroke(0,0,100,90);
noFill();
ellipse(255, 255, 520, 520);



strokeWeight(20);
stroke(0,0,100,50);
noFill();
ellipse(255, 255, 480, 480);


