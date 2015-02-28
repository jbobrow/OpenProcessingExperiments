
int i = 0;
int eSize=100;

size(510,510);
background(255);
smooth();
  
for(int y=0; y<=height;y+=10){
for(int x=0; x<=width; x+=10){
  //stroke(x,0,y,250);
  //ellipse(random(width),random(height),eSize,eSize);
 
 
 stroke(x,200,y,250);
 line(x,y,255,255);
 
 //line(510-x,510-y,255,255);
 
 //fill(x,y,240);
 //ellipse(255,255,150,150);
 //fill(229,181,76);

//ellipse(255,255,100,100);
//ellipse(255,255,50,50);
  
  }
}




