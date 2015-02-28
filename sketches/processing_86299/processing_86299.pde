
size(800,800);
background(100);

for(int y = 400; y>0;y-=10){
  for(int x = 400; x>0;x-=5){
  if(x<400)
    {
      stroke(200);
      line(x*2,y*2,x,y);
      //ㄱㅂㅐㄱㅕㅇ
   
  }
}


smooth();
for(int x = 150;x<600;x+=10){
  noFill();
  stroke(237,255,124);
  ellipse(200,200,x,x);
  //ㅇㅗㅣㄴㅉㅗㄱㅇㅜㅓㄴ
  
}
}

for(int x = 150; x<800;x+=30){
  noFill();
  stroke(113,242,255);
  ellipse(400,400,x,x);
  //ㄱㅏㅇㅜㄴㄷㅔㅇㅜㅓㄴ
}

smooth();
for(int x = 150;x<600;x+=10){
  noFill();
  stroke(255,8,243);
  ellipse(780,780,x,x);
  //ㅇㅏㄹㅐㅇㅜㅓㄴ
  
}

smooth();
for(int x = 150;x<600;x+=10){
  noFill();
  stroke(255,0,68);
  ellipse(400,280,x,x);}
  
smooth();
for(int x = 150;x<600;x+=10){
  noFill();
  stroke(118,255,28);
  ellipse(700,280,x,x);}
  
  
  smooth();
for(int x = 150;x<600;x+=10){
  noFill();
  stroke(3,0,252);
  ellipse(100,700,x,x);}
  
    smooth();
for(int x = 150;x<600;x+=10){
  noFill();
  stroke(150,0,252);
  ellipse(600,30,x,x);}
  
      smooth();
for(int x = 150;x<600;x+=10){
  noFill();
  stroke(255,0,0);
  ellipse(400,780,x,x);}
  
        smooth();
for(int x = 150;x<600;x+=10){
  noFill();
  stroke(16,121,16);
  ellipse(50,400,x,x);}
  
  

    fill(0,76);
    smooth();
    noFill();
    stroke(230,100);
    strokeWeight(1);
    for(int y =-10; y<=800;y+=20){
      for(int x = -10; x<=800; x+=20){
        ellipse(random(width), random(height),random(width),random(height));
      }
    }
    
 



