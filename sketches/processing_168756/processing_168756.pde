


size(400,400);
fill(200,40,250);
background(100);
noStroke();

for(int y=0; y < 400; y+=20){
    for(int x=0; x < 400; x+=10){
        fill(65,179,240,80);
        rect(x,y,8,8);
    }
 } 
 
for(int y=0; y< 400; y+=10){
  for(int x=0; x < 400; x+=20){

fill(x,y,30);
ellipse(x,y,250,250);

  }
}

for(int x = 0; x<=400; x +=15){

 stroke(250,250,30);
 line(0,x,600-x,400);
 stroke(190,200,40);
 line(0,400-x,400,400); 
 stroke(60,200,70);
 line(0,0,400,400-x); 
 stroke(20,120,170);
 line(400,400-x,x,400);
 stroke(20,120,170);
 line(400,400-x,400-x,0);  
}
for(int x = 0; x<=400; x +=10){
 stroke(10,200,160);
 line(400-x,0,0,400);
 stroke(20,120,170);
 line(0,x,x,400); 
 stroke(230,60,30);
 line(400,0,400-x,400);  
 stroke(20,120,170);
 line(0,400-x,x,0);   
}



