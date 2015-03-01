
int eSize = 3;

size(400,400);
background(255);
noStroke();
fill(0);

for(int x=0; x<=400; x+= 2) {
  
  
 stroke(0,x,200,230);
line(0,200,x,height); 
line(200,0,width,x);
line(0,350,x,0);

stroke(0,x,200,255);
line(0,150,x,height);
line(220,0,width,x);
line(0,360,x,0);

stroke(255,x,170,255);
line(0,280,x,0);
line(350,400,width,x);
line(320,400,width,x);
line(0,340,x,height);
line(340,0,width,x);




}


