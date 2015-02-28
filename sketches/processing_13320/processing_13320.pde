
size(200,200);
background(246, 142, 86);
noStroke();  
 
 
//ears
fill(#ffffff);
int[] e={30,50};
for(int i=0; i<2; i=i+1){
  ellipse(e[i],70,10,30);
}

//head
int a=30;
ellipse(40,95,a,a);


//eyes
fill(0,0,0);
ellipse(30,95,2,2);
ellipse(50,95,2,2);

//mouse
stroke(0,0,0);
strokeWeight(1);
line(38,100,45,103);
line(43,100,40,103);
