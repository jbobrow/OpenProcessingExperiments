
int eSize = 1;

size(400, 565);
background(255);
smooth();

for(int y = 0; y <= height; y += 2){
  for(int x = 0; x <= width; x += 2){
    if(x < width/2 && y < height/2){
      fill(x);
    }    
    if(x >= width/2 && y < height/2){
      fill(y);
    }
    if(x < width/2 && y >= height/2){
      fill(512-y);
    }    
    if(x >= width/2 && y >= height/2){
      fill(512-x);
    }
    
    ellipse(x, y, eSize, eSize);
  }
}

stroke(0); //line
strokeWeight(1);
line(380, 268, 380, 347);

fill(0); //kuro sannkaku
triangle(-42, 254, -42, 677, 380, 677);

noStroke(); //kuro yokonaga sikaku
rect(71,-1,302,74);

noStroke(); //kuro tatenaga sikaku
rect(334,-49,103,206);



noStroke(); //haimenn ookii maru 
fill(255);
ellipse(325, 383, 96, 96);

fill(191, 26, 32);
triangle(55, -26, -135, 166, 237, 262);

triangle(26, 345, 84, 324, 10, 239);

noStroke(); //haimenn tiisai maru
fill(255);
ellipse(97, 197, 248, 248);

fill(191, 26, 32);
triangle(60, 118, 248, 42, 306, 87);

triangle(382, 68, 427, 260, 223, 300);

triangle(161, 300, 236, 367, 81, 388);

triangle(467, 292, 132, 438, 397, 530);

triangle(-1, 448, 42, 491, 110, 437);

triangle(97, 515, 114, 519, 105, 552);

triangle(189, 464, 214, 509, 151, 540);

triangle(382, 68, 427, 260, 223, 300);

//saizennmenn maru
fill(255);
noStroke();
ellipse(70, 0, 54, 54);

noStroke();
ellipse(287, 84, 39, 39);

noStroke();
ellipse(350, 73, 19, 19);

noStroke();
ellipse(293, 166, 5, 5);

noStroke();
ellipse(278, 282, 63, 63);

noStroke();
ellipse(81, 384, 26, 26);

noStroke();
ellipse(26, 397, 14, 14);

noStroke();
ellipse(124, 469, 38, 38);

noStroke();
ellipse(97, 521, 22, 22);

noStroke();
ellipse(215, 530, 27, 27);

noStroke();
ellipse(389, 510, 231, 231);


