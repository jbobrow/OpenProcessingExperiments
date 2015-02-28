


char nombre[] = {'N','A','T','Y','A','R','I','T','H'};
int i;
float a =100;


void setup()
{
  size(600, 500);
 
fill(255,0,0);
}


void draw()

{
   background(255,209,252);
   textFont(createFont("Comic Sans MS",50)); 
   a-=1;
   println(i); 
   if(a<=8)  
{
   text("N", 170, height/2); 
} 
  else
{
   text(nombre[0], 
   random(-500,500), random(-500,500));
}
   if(a<=7) 
{
   text("A", 210, height/2);
}  
 else  
{
   text(nombre[1],random(-500,500),random(-500,500));
}
   if(a<=6)
{
   text("T", 250, height/2);
}
 else 
{
   text(nombre[2],random(-500,500),random(-500,500));

} 
   if(a<=5)
{
   text("Y", 290, height/2);
}
  else
{
   text(nombre[3], random(-500,500),random(-500,500));
}
   if(a<=4)
{
   text("A", 330, height/2);
}
  else
{
   text(nombre[4], random(-500,500),random(-500,500));
}
   if(a<=3)
{
   text("R", 370, height/2);
}
  else
  
{
   text(nombre[5], random(-500,500),random(-500,500));
} 
   if(a<=2)
{
   text("I", 410, height/2);
}
  else
{ 
   text(nombre[6], random(-500,500),random(-500,500));
} 
   if(a<=1)
{
   text("T", 450, height/2);
}
  else
 
{
   text(nombre[7], random(-500,500),random(-500,500));
} 
   if(a<=0)
{
   text("H", 490, height/2);
}
 else 
{
   text(nombre[8],random(-500,500),random(-500,500));
}

}


