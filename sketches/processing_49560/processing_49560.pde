
//Melanie Danver mdanver
//copyright 2010


size(400,400);
smooth();
background(108,91,123);
noStroke();

//D
stroke(192,108,132);
strokeWeight(10);
line(215,100,215,300);
strokeWeight(30);
noFill();
ellipse(215,200,300,200);
fill(108,91,123);
noStroke();
rect(0,0,211,317);

//first M
stroke(192,108,132);
strokeWeight(10);
line(10,10,10,300);
line(12,13,75,150);
line(12,53,60,165);
strokeWeight(10);
line(62,167,149,50);
strokeWeight(20);
line(150,56,150,260);

//second M
strokeWeight(30);
line(110,212,110,400);
strokeWeight(20);
line(110,205,170,300);
line(170,300,200,250);
strokeWeight(9);
line(206,250,206,400);

//dots 
noStroke();
   int distance = 50;
for (int x=-height; x<=height; x= x+100)
{
  for (int j=0; j<=width && j<=height; j++) {
    fill(66,44,85,j*10);
      ellipse(((x +j*distance)-(j)), (j*distance)-(j), 8*j, 8*j);
    }}



                
                
