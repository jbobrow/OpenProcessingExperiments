
int eSize = 3;



size(510,510);
background(0,100,0);




for(int x= 0; x <= width; x ++) {
   
   stroke(x,x,0,255);
   line(0,x,x,510);
   
   stroke(x,x,0,255);
   line(x,0,510,x);  
}   



for(int x= 0; x <= width; x+=5){
  stroke(x,x,0,255);
   line(0,x,x,510);
   
   stroke(0,255,0,255);
   line(x,0,510,x);
}

strokeWeight(3);
line(0, 0, 510, 510);

strokeWeight(3);
line(50,50,50,5);

strokeWeight(3);
line(100,100,9,100);

strokeWeight(3);
line(200,200,30,200);

strokeWeight(3);
line(150,150,150,20);

strokeWeight(3);
line(300,300,300,70);

strokeWeight(3);
line(350,350,90,350);

strokeWeight(3);
line(400,400,400,150);

for(int x= 0; x <= width; x+=5){
  stroke(x,x,255,255);
   line(0,x,x,510);
   
   stroke(x,x,255,255);
   line(x,0,510,x);
}

for(int x= 0; x <= width; x+=5){
  stroke(0,x,255,255);
   line(0,x,x,510);
   
   stroke(0,x,255,255);
   line(x,0,510,x);
}

fill(0,0,100,100);
rect(0,0,510,510);





for(int x= 10; x <= 500; x+=40){
  stroke(x,200,x,x);
  noFill();
   ellipse(200,70,x,x);
   
   
   
   stroke(0,x,50,x);
   noFill();
   ellipse(400,400,x,x);
   

}

for(int x= 10; x <= 500; x+=60){
  stroke(0,x,x,x);
  noFill();
   ellipse(200,70,x,x);
   
   
   
   stroke(x,130,x,x);
   noFill();
   ellipse(400,400,x,x);
   

}





for(int x= 10; x <= 500; x+=50){
  stroke(0,190,x,x);
  noFill();
   ellipse(0,510,x,x);
   


}

for(int x= 10; x <= 500; x+=60){
  stroke(0,250,x,x);
  noFill();
   ellipse(0,510,x,x);
   


}

for(int x= 10; x <= 500; x+=70){
  stroke(x,x,100,x);
  noFill();
   ellipse(0,510,x,x);
   


}





