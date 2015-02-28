

int eSize = 3;

size(510, 510);
background(255);
stroke(0);
fill(0);



 for(int x= 100; x <= 255; x +=5 ){

 noStroke();
 fill(x,x,20,255);
 ellipse(width/2, 120, 280, 280);
 
   rectMode(CENTER);
 fill(x,50,x,100);
 noStroke(); 
 rect(width/2, 255, 60, 60);
 }

 for(int x = 100; x <= 255; x ++ ){
 
   rectMode(CENTER);
 fill(175,195,x,30);
 noStroke(); 
 rect(255,175 , x, 75);
 
 
 }

 for(int x = width*0; x <= width; x ++ ){
 
   
    stroke(135, x,135,50);
  line(0, 0, 510, x);  
   line(0, 0, x, 510);    
  
  line(510, 0, 0, x);  
   line(510, 0, 510-x, 510); 
   
    stroke(230,30,0,50);
  line(width/2, 120, x, 510); 
  
    stroke(230,30,0,50);
  line(width/2, 120, 510-x, 510); 
 }

for(int x = 60; x <= 175; x +=2 ) {  
     stroke(50,50,x+40,70);
  line(x, x, 40, 395); 
     stroke(50,50,x+40,70);
  line(x, x, 255, 395); 

    stroke(50,50,x+40,70);
  line(510-x,x, 470, 395); 
     stroke(50,50,x+40,70);
  line(510-x,x, 255, 395); 


    stroke(40,x+40,50,70);
  line(x, x+100, 40, 500); 
      stroke(40,x+40,50,70);
  line(x, x+100, 125, 500); 

    stroke(40,x+40,50,70);
  line(510-x,x+100, 450, 500); 
      stroke(40,x+40,50,70);
  line(510-x,x+100, 380, 500); 

}
 
 


