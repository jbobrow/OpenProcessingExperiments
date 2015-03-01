
int eSize = 20;
size(400, 400);  
background(255);  
smooth();  
noStroke();

 fill(244,245,0,100);
 ellipse(320,150,300, 300);
fill(255,220);
 ellipse(320,150,295, 295);

fill(244,245,0,150);
 ellipse(320,150,200,200);
fill(255,200);
 ellipse(320,150,195,195);
 
 fill(244,245,0,300);
 ellipse(320,150,70, 70);
fill(255,150);
 ellipse(320,150,65, 65);//kiero

 fill(0,255,0,100);
 ellipse(30,300,300, 300);
fill(255,220);
 ellipse(30,300,295, 295);

fill(0,255,0,150);
 ellipse(30,300,200,200);
fill(255,200);
 ellipse(30,300,195,195);
 
 fill(0,255,0,300);
 ellipse(30,300,70, 70);
fill(255,180);
 ellipse(30,300,65, 65);

noFill();
  stroke(0, 255, 0,200); 

 ellipse(100,190,150, 150);
 ellipse(50,80,200, 200);

stroke(244, 255, 0,250); 

ellipse(320,250,110, 110);

ellipse(300,300,70, 70);

ellipse(280,340,50, 50);


noStroke();
for(int y=0; y<=height; y+=50){
for(int x=0; x<=width; x+=50){
  
  if(x < width/2 && y < height/2){  
fill(x,255,x);
   }
    else if(x >= width/2 && y < height/2){  
     fill(255,255,350-x);  
   }
 else if(x < width/2 && y >= height/2){  
   fill(x,255,x);  
  }
  else if(x >= width/2 && y >= height/2){  
fill(255,255,350-x);  
   }
      ellipse(x, y, eSize, eSize);
println("x=" + x + ", y=" + y);  
}
}   

 
for(int y = 0; y <= 200; y += 1) {  

  stroke(0, 0, 0,200);     
line(y,400,0,y+200);
line(y,0,0,200-y);
line(400,y,y+200,0);
line(400,400-y,y+200,400);

}  
noStroke();


  
     


