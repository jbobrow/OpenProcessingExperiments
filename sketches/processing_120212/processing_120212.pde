
int eSize = 3;

size(400,565);
background(200);
smooth();


 //sen
 for(int y=0; y<=height; y+=20){
 for(int x=0; x<=width; x+=20){
   if(x >300 && x<100 && y > 300 && y <100){
   }
   
   line(x,y,eSize,eSize);
   fill(255,0,5);
 }
}
 //usiro sikaku
 for(int i = 0; i < 400; i                 ++){
  noStroke();
 
 fill(255,0,0,255 / 10 * i);
 rect(0, height / 10 * i, 50, 50);
 
 
 fill(255,255,0,255 / 10 * i);
  rect(60, height / 10 * i, 50, 50);
  
  fill(255,200,100,255 / 10 * i);
  rect(120, height / 10 * i, 50, 50);
  
  fill(255,255,255,255 / 10 * i);
  rect(180, height / 10 * i, 50, 50);
   
    fill(255,163,255,255 / 10 * i);
  rect(240, height / 10 * i, 50, 50);
 
  fill(255,255,255,255 / 10 * i);
  rect(300, height / 10 * i, 50, 50);
  
  fill(255,200,255,255 / 10 * i);
  rect(360, height / 10 * i, 50, 50);
 
 
}



 smooth();
 //rittai
 fill(255,0,0);
 quad(193,150,295,160,250,370,150,360);
 fill(0,0,0);
 quad(295,160,343,205,300,400,250,370);
 fill(0);
 quad(150,360,250,370,300,400,210,385);
 

 fill(20);
 quad(210,510,300,540,250,570,150,560);




