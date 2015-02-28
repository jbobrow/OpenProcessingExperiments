
size (600, 600);

//variable declaration
int i = 1;
while (i<=5) { //conditional


//5 times
int j=1;
while (j<=7){

fill (#A55353); 

//every circle
noStroke();
ellipse (i*100,j*100, 50, 50);


fill (255);
ellipse (i*100 -10, j*100 -10,5,5);
ellipse (i*100 +10, j*100 -10, 5,5);
arc(i*100, j*100, i*4, j*4, 0, PI);

j= j+1; 

}



//(1)use random () for the x,y position of your shape
fill (#A55353); 





//increment
i=i+1;


}






