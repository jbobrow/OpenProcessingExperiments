
size(800,800);
background(0);
smooth();
fill(255);
noStroke();
int eSize =10;
float color1,color2;

//背景//



for(int x=0; x<=800; x+=10){
  for(int y=0; y<=400; y+=10){
    fill(y,0,0,20);

    
    if(y<200){
      fill(random(50),random(20),random(10),50);
      ellipse(800-x*10,500-x,random(150),random(200));
   }else{
         fill(random(150),random(100),random(50),6);
    ellipse(800-x*5,200+x,random(200),random(250));
    }
   
    
  }
}


//線//
for(int x = 0; x<=800; x+=5){
  for(int y =0; y<800; y+=5){
    color1 = (float)x / 800 * 255;
    color2 = (float)x / 1000 * 255;
  fill(color1,255);
  ellipse(x,200,eSize,eSize);
 
  fill(color1,100);
  ellipse(x,400,10,eSize-5);
  ellipse(x+100,650,30,20);
    ellipse(x-200,320,15,15);

  fill(color1,200);
  ellipse(-y/20+600,y/20+100,10,5);
  ellipse(x-240,140,10,5);
  ellipse(y/20+400,y/20+555,eSize,eSize);
  
  fill(color2,100);
  ellipse(x-400,555,eSize,eSize);
  
  


 
  if(x > 200){  
     fill(50,255,color2);
  }
  else{    
    fill(0,x,0,20);
  }
 ellipse(x+300,230,eSize,eSize);
  
 /* fill(0,2);
  ellipse(x/2,230,30,30);
    
  fill(0,1);
  ellipse(x-300,230,30,30);*/
  
}
}

for(int i = 0; i<=800; i+=5){
    for(int t = 0; t<=300; t+=5){
  fill(i,i,i);
  ellipse(i,600,eSize,eSize+10);
  ellipse(i,100,10,eSize-5);

  fill(t,255);
  ellipse(t,205,eSize,eSize);
  ellipse(t*2,450,eSize+10,eSize);
  
  fill(t,100,200);
  ellipse(t*3,520,30,eSize);
}
}

//線ここまで//




