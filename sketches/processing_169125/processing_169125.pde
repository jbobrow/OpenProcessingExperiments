

size(400,400);
background(200,250,50);
noStroke();
fill(0);

int eSize =20; 
for(int y = 50; y<=350; y+=20){ 
for(int x = 50; x<=350; x+=20){ 
   fill(y/7,x/2,200); 
  ellipse(x,y,eSize,eSize);
}
} 




int eSize1 =8; 
for(int y = 0; y<=200; y+=10){ 
for(int x = 0; x<=400; x+=10){ 
fill(y/8,x/1,200,100); 
rect(x,y,eSize1,eSize1);
}
} 

int eSize2 =8; 
for(int y = 200; y<=400; y+=10){ 
for(int x = 0; x<=400; x+=10){ 
fill(y/1,x/8,200,100); 
rect(x,y,eSize2,eSize2);
}
} 



//1
fill(0, 255, 0);
rect(50, 50, 300, 300);  

//1-1
fill(200, 250, 50);
rect(50, 50, 50, 50); 

fill(100, 250, 50);
rect(60, 60, 30, 30);


//1-2
fill(200, 250, 50);
rect(300, 300, 50, 50);

fill(100, 250, 50);
rect(310, 310, 30, 30);


//1-3
fill(200, 250, 50);
rect(300, 50, 50, 50);

fill(100, 250, 50);
rect(310, 60, 30, 30);


//1-4
fill(200, 250, 50);
rect(50, 300, 50, 50);

fill(100, 250, 50);
rect(60, 310, 30, 30);



//2
fill(0, 200, 0);
rect(100, 100, 200, 200);   
  


//3
fill(0, 150, 0);
rect(120, 120, 160, 160);   


//4
fill(0, 125, 0);
rect(140, 140, 120, 120); 

//5
fill(0, 100, 0);
rect(160, 160, 80, 80); 

//6
fill(0, 75, 0);
rect(180, 180, 40, 40); 

//7
fill(0, 50, 0);
rect(190, 190, 20, 20); 

int eSize3 =10; 
for(int y = 55; y<=345; y+=20){ 
for(int x = 55; x<=345; x+=20){ 
   fill(y/1,x/8,200,50); 
  ellipse(x,y,eSize3,eSize3);
}
} 

fill(50, 20, 50,50);
rect(65, 65, 270, 270); 


