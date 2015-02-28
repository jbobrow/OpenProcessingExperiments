

float zum = 1.0;
float i, j = 0.1;



void setup()
{
size(730, 700, P3D);
smooth();
}

void draw()
{
 
j += 0.005;
  if(j > TWO_PI) { 
    j = 0.0; 
  }
  
  
  i += 0.005;
  if(i > TWO_PI) { 
    i = 0.0; 
  }
  
 
  
 if(mousePressed) { 
    zum += 0.1; 
  } else {
    zum -= 0.1; 
  }
  if(zum > 2.5) { zum = 2.5; }
  if(zum < 1.0) { zum = 1.0; }
 
translate(width/2.0, height/2);

 
 
rotateZ(i/1.1);
rotateY(j/0.1);
scale(0.15);
scale(zum);

beginShape();
fill(i,10, 12, 0.0001);
stroke(255, 102, 0);
for(int i =0;i <9; i=i+5) 
bezier(600,100,500,500,600,600,i,i);
endShape();
 
stroke(242, 66, 66);
beginShape();
for(int i =0;i <900; i=i+400) 
bezier(900,200,100,100,900,900,i,800);
endShape();

beginShape();
stroke(93, 127, 219);
for(int i =0;i <900; i=i+400) 
bezier(1500,400,300,400,1500,1500,i,1400);
endShape();

beginShape();
stroke(97, 183, 52);
for(int i =0;i <900; i=i+400) 
bezier(1800,500,400,500,1800,1800,i,1600);
endShape();

}



