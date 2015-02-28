
size(400,400);

int GREEN = #87F514;
 
int[][] myArray = {  {236, #232D81, 189,   0},
                     {10,  80, 189, 189},
                     {236,   0, #232D81,  80},
                     {236, GREEN, #232D81,  80}  };
                      

int s = 100;
 
for (int row = 0 ; row<4; row++) {
  for (int col = 0 ; col<4; col++) {
     fill(myArray[row][col]);
     rect(col*s,row*s,s,s);
     
  }
}
