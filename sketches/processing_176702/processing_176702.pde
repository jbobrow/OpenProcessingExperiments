
//mueve el raton para mas colores
int y=0;
int t=0;
int u=0;
int m=0;
void setup()
{  size(500,500);
  
   background(255);
}

void draw()
{
 
 background(mouseX,mouseY,mouseY,mouseX);
 fill(random(255),random(255),random(255));
 
 //primer cuadrado
   rect(20,y,40,40);
   fill(random(255),random(255),random(255));
   for(int i= 0; i<5;i++){
  y=y+1;
  if (y >500){
   y = 0 ;
  
}
//segundo cuadrado
rect(120,t,40,40);

  for(int q= 0; q<3;q++){
    t=t+1;
    if (t > 500){
      
      t=0;
    }
  //tercer cuadrado

  rect (240,u,40,40);
  for(int z=0;z<3;z++){
    u=u+1;
    if (u>500){
      u=0;
    }
     // cuarto cuadrado
     
     rect (350,m,40,40);
     for(int w=0;w<2;w++){
       m=m+1;
       if (m>500){
         m=0;
       }
}
}
}
}
}   



