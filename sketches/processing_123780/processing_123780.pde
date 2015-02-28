
size (400,400);
translate(width/2,height/2);
int n=6;
background (#2B0489);


for (int i=0;i<6;i++){
  
  

 strokeWeight (30);
 stroke (#F8F7FA);
 line (0,0,100,0);
 ellipse (50,10,10,10);
 line (70,0,70,15);
 
 scale(1,-1);
 ellipse (50,10,10,10);
 scale (1,-1);
 
 scale (1,-1);
  line (70,0,70,15);
  scale (1,-1);
 
rotate (2*PI/n);


for (int j=0;j<1000;j++){
 stroke (255,random (50,255)); 
strokeWeight (2);
point(random (-200,200),random (-200,200));
}
 

  
}  

