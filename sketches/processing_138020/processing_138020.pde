

size (600, 600);

int HORIZ_NUM = 5;
int VERT_NUM = 5;

//variable declaration
int i = 1;
while (i<= HORIZ_NUM) { //conditional


  //5 times
  int j=1;
  while (j<=VERT_NUM) {

    fill (#A55353); 

    //every circle
    noStroke();
    ellipse (i*100, j*100, 50, 50);


    fill (255);
    ellipse (i*100 -10, j*100 -10, 5, 5);
    ellipse (i*100 +10, j*100 -10, 5, 5);
    
    //smile
    //arc(i*100, j*100, i*4, j*4, 0, PI);
    arc(i*100, j*100, 40,40, 0, map(i, 1,HORIZ_NUM, 0,PI/2)+map(j, 1,VERT_NUM, 0,PI/2) );

    j= j+1;
  }



  //(1)use random () for the x,y position of your shape
  fill (#A55353); 





  //increment
  i=i+1;
}





