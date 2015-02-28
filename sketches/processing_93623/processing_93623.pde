
//Brennda
size(200,200);
background(#5C9D91);
noStroke();
fill(#346A4A);
int i=-100;
int j=-100;
while(i<200){
  ellipse(i+100,j+100,10,10);
  ellipse(-i+100,-j+100,10,10);
  ellipse(j+100,i+100,10,10);
  ellipse(-j+100,-i+100,10,10);
  i=i+10;
  j=i*i/100;
}
