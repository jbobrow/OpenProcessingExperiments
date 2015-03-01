
int eSize = 4; 

size(400, 400); 
background(#FFFFFF); 
smooth();  



for(int y=2; y< height; y+=2){
  for(int x=2; x< width; x+=2){
 
    if(x < width/3 && y < height/2){ 
      fill(x-180); 
    }   
    if(x >= width/2 && y < height/3){ 
      fill(y-180);  
    }
    if(x < width/3 && y >= height/2){ 
      fill(180-y);  
    }   
    if(x >= width/2 && y >= height/2){  
      fill(180-x);  
    }
 
    rect(x, y, eSize, eSize);
    println("x=" + x + ", y=" + y);  
  }
}





for(int y = 0; y <= 400; y+=5){ 
   stroke(#E0FF00);
   line(200,0,y,200);   
   line(200,400,y,200);

} 

for(int y = 25; y <= 375; y+=5){ 
   stroke(#A1FF00);
   line(200,0,y,200);   
   line(200,400,y,200);

}  

for(int y = 50; y <= 350; y+=5){ 
   stroke(#58FF00);
   line(200,0,y,200);   
   line(200,400,y,200);

}  

for(int y = 75; y <= 325; y+=5){ 
   stroke(#10FF00);
   line(200,0,y,200);   
   line(200,400,y,200);

}  

for(int y = 100; y <= 300; y+=5){ 
   stroke(#00FF00);
   line(200,0,y,200);   
   line(200,400,y,200);

}  

for(int y = 125; y <= 275; y+=5){ 
   stroke(#00FF39);
   line(200,0,y,200);   
   line(200,400,y,200);

}  

for(int y = 150; y <= 250; y+=5){ 
   stroke(#00FF86);
   line(200,0,y,200);   
   line(200,400,y,200);

}

for(int y = 175; y <= 225; y+=5){ 
   stroke(#00FFCE);
   line(200,0,y,200);   
   line(200,400,y,200);

}  



