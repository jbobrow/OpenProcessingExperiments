
float angle=0;
void setup()


{
  size(800,800);
  background( 250);
  smooth();
  noStroke();
  fill(30);
  
}

void draw(){
background(125,10);
translate(400,400);
smooth();


angle += 0.01;
for (int i=0; i<500; i++)
{
   if(i<250)
   {fill(30,80);
   

     rotate(PI/3.2);
   
    ellipse(random(20),random(20),random(5),mouseY/1.5);
   }
   
 
   else
   {fill(255,60);
   
   rotate(PI/3.2);
    rect(sin(angle+i/20.0)*100,cos(angle+i/20.0)*100,1,1);
    ellipse(sin(angle+i/20.0)*100,cos(angle+i/20.0)*100,mouseX,1);
  }
}
}

