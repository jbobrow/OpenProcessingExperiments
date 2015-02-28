
//Control 2 - Repetition
//Exercise #1
/*1. Draw a regular pattern with five lines. Rewrite the code 
using a for structure.*/



size (400,400);

for (int y = 10; y<400; y *=2) {
  strokeWeight(y* 0.1);
  line (0,y,400,y);
}
   
/*
strokeWeight(1);
line (0,10,400,10);

strokeWeight(2);
line (0,30,400,30);

strokeWeight(4);
line (0,70,400,70);


strokeWeight(8);
line (0,130,400,130);

strokeWeight(16);
line (0,210,400,210);

strokeWeight(32);
line (0, 370, 400, 370);

*/


