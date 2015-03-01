
int eSize = 10;
size(400, 400);
 
background(255);
smooth();

for (int y = 0; y <= 400; y += 20) { 

for (int x = 0; x <= 400; x += 20) { 


  
 

   if(x > 100 && x < 300 && y > 0 && y < 400){ 

     fill(200,100,100,x);  


    }else{    

fill(210,y,x,300);    


    } 

rect(x, y, eSize, eSize); 



} 


} 

stroke(0);
strokeWeight(5);
noFill();



stroke(200,200,330,300);
strokeWeight(5);

stroke(10);
fill(400);
ellipse(200,200,200,200);

stroke(10);
fill(0,0,0,200);
ellipse(200,200,180,180);

stroke(10);
fill(400,400,400,100);
ellipse(200,200,150,150);

 
 triangle(200,200,0,0,400,0);
 
 triangle(200,200,0,400,400,400);
  
 rectMode(CENTER);
 
 fill(100,100,200,50);

rect(200,200,100,100);

rect(200,200,300,300);
 
rect(200,200,400,400);
 
 


