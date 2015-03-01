
int xPos = 31;
int yPos = 560;
int cSize = 15;
int cChip = 12;

int R;
int G;
int B;

//int ccolorR = r;
//int ccolorG = g;
//int ccolorB = b;

void setup() {
  size(800, 600);
  background(239, 235, 222);

  //drawing area
  noStroke();

  fill(132, 130, 132);
  rect(0, 0, 800, 551);

  fill(49, 105, 198);
  rect(0, 0, 3, 3);
  rect(375, 0, 3, 3);
  rect(797, 0, 3, 3);
  rect(0, 273, 3, 3);
  rect(797, 273, 3, 3);  
  rect(0, 547, 3, 3);
  rect(375, 547, 3, 3);
  rect(797, 547, 3, 3);

  //pallette area  
  fill(255);
  rect(3, 3, 794, 544);

  rect(0, 552, 800, 1);
  rect(0, 560, 255, 32);

  //gray
  fill(173, 170, 156);
  rect(0, 560, 30, 31);
  //row1
  rect(xPos, yPos, cSize, cSize);
  rect(xPos+cSize+1, yPos, cSize, cSize);
  rect(xPos+cSize*2+2, yPos, cSize, cSize);
  rect(xPos+cSize*3+3, yPos, cSize, cSize);
  rect(xPos+cSize*4+4, yPos, cSize, cSize);
  rect(xPos+cSize*5+5, yPos, cSize, cSize);
  rect(xPos+cSize*6+6, yPos, cSize, cSize);
  rect(xPos+cSize*7+7, yPos, cSize, cSize);
  rect(xPos+cSize*8+8, yPos, cSize, cSize);
  rect(xPos+cSize*9+9, yPos, cSize, cSize);
  rect(xPos+cSize*10+10, yPos, cSize, cSize);
  rect(xPos+cSize*11+11, yPos, cSize, cSize);
  rect(xPos+cSize*12+12, yPos, cSize, cSize);
  rect(xPos+cSize*13+13, yPos, cSize, cSize);
  //row2
  rect(xPos, yPos+cSize+1, cSize, cSize);
  rect(xPos+cSize+1, yPos+cSize+1, cSize, cSize);
  rect(xPos+cSize*2+2, yPos+cSize+1, cSize, cSize);
  rect(xPos+cSize*3+3, yPos+cSize+1, cSize, cSize);
  rect(xPos+cSize*4+4, yPos+cSize+1, cSize, cSize);
  rect(xPos+cSize*5+5, yPos+cSize+1, cSize, cSize);
  rect(xPos+cSize*6+6, yPos+cSize+1, cSize, cSize);
  rect(xPos+cSize*7+7, yPos+cSize+1, cSize, cSize);
  rect(xPos+cSize*8+8, yPos+cSize+1, cSize, cSize);
  rect(xPos+cSize*9+9, yPos+cSize+1, cSize, cSize);
  rect(xPos+cSize*10+10, yPos+cSize+1, cSize, cSize);
  rect(xPos+cSize*11+11, yPos+cSize+1, cSize, cSize);
  rect(xPos+cSize*12+12, yPos+cSize+1, cSize, cSize);
  rect(xPos+cSize*13+13, yPos+cSize+1, cSize, cSize);

  //lightgray
  fill(239, 235, 222);
  rect(1, 561, 29, 30);
  //row1
  rect(xPos+1, yPos+1, cSize-1, cSize-1);
  rect(xPos+cSize+2, yPos+1, cSize-1, cSize-1);
  rect(xPos+cSize*2+3, yPos+1, cSize-1, cSize-1);
  rect(xPos+cSize*3+4, yPos+1, cSize-1, cSize-1);
  rect(xPos+cSize*4+5, yPos+1, cSize-1, cSize-1);
  rect(xPos+cSize*5+6, yPos+1, cSize-1, cSize-1);
  rect(xPos+cSize*6+7, yPos+1, cSize-1, cSize-1);
  rect(xPos+cSize*7+8, yPos+1, cSize-1, cSize-1);
  rect(xPos+cSize*8+9, yPos+1, cSize-1, cSize-1);
  rect(xPos+cSize*9+10, yPos+1, cSize-1, cSize-1);
  rect(xPos+cSize*10+11, yPos+1, cSize-1, cSize-1);
  rect(xPos+cSize*11+12, yPos+1, cSize-1, cSize-1);
  rect(xPos+cSize*12+13, yPos+1, cSize-1, cSize-1);
  rect(xPos+cSize*13+14, yPos+1, cSize-1, cSize-1);
  //row2
  rect(xPos+1, yPos+cSize+2, cSize-1, cSize-1);
  rect(xPos+cSize+2, yPos+cSize+2, cSize-1, cSize-1);
  rect(xPos+cSize*2+3, yPos+cSize+2, cSize-1, cSize-1);
  rect(xPos+cSize*3+4, yPos+cSize+2, cSize-1, cSize-1);
  rect(xPos+cSize*4+5, yPos+cSize+2, cSize-1, cSize-1);
  rect(xPos+cSize*5+6, yPos+cSize+2, cSize-1, cSize-1);
  rect(xPos+cSize*6+7, yPos+cSize+2, cSize-1, cSize-1);
  rect(xPos+cSize*7+8, yPos+cSize+2, cSize-1, cSize-1);
  rect(xPos+cSize*8+9, yPos+cSize+2, cSize-1, cSize-1);
  rect(xPos+cSize*9+10, yPos+cSize+2, cSize-1, cSize-1);
  rect(xPos+cSize*10+11, yPos+cSize+2, cSize-1, cSize-1);
  rect(xPos+cSize*11+12, yPos+cSize+2, cSize-1, cSize-1);
  rect(xPos+cSize*12+13, yPos+cSize+2, cSize-1, cSize-1);
  rect(xPos+cSize*13+14, yPos+cSize+2, cSize-1, cSize-1);

  //black
  fill(0);
  rect(1, 561, 28, 1);
  rect(1, 561, 1, 29);
  //row1
  rect(xPos+1, yPos+1, cSize-2, cSize-2);
  rect(xPos+cSize+2, yPos+1, cSize-2, cSize-2);
  rect(xPos+cSize*2+3, yPos+1, cSize-2, cSize-2);
  rect(xPos+cSize*3+4, yPos+1, cSize-2, cSize-2);
  rect(xPos+cSize*4+5, yPos+1, cSize-2, cSize-2);
  rect(xPos+cSize*5+6, yPos+1, cSize-2, cSize-2);
  rect(xPos+cSize*6+7, yPos+1, cSize-2, cSize-2);
  rect(xPos+cSize*7+8, yPos+1, cSize-2, cSize-2);
  rect(xPos+cSize*8+9, yPos+1, cSize-2, cSize-2);
  rect(xPos+cSize*9+10, yPos+1, cSize-2, cSize-2);
  rect(xPos+cSize*10+11, yPos+1, cSize-2, cSize-2);
  rect(xPos+cSize*11+12, yPos+1, cSize-2, cSize-2);
  rect(xPos+cSize*12+13, yPos+1, cSize-2, cSize-2);
  rect(xPos+cSize*13+14, yPos+1, cSize-2, cSize-2);
  //row2
  rect(xPos+1, yPos+cSize+2, cSize-2, cSize-2);
  rect(xPos+cSize+2, yPos+cSize+2, cSize-2, cSize-2);
  rect(xPos+cSize*2+3, yPos+cSize+2, cSize-2, cSize-2);
  rect(xPos+cSize*3+4, yPos+cSize+2, cSize-2, cSize-2);
  rect(xPos+cSize*4+5, yPos+cSize+2, cSize-2, cSize-2);
  rect(xPos+cSize*5+6, yPos+cSize+2, cSize-2, cSize-2);
  rect(xPos+cSize*6+7, yPos+cSize+2, cSize-2, cSize-2);
  rect(xPos+cSize*7+8, yPos+cSize+2, cSize-2, cSize-2);
  rect(xPos+cSize*8+9, yPos+cSize+2, cSize-2, cSize-2);
  rect(xPos+cSize*9+10, yPos+cSize+2, cSize-2, cSize-2);
  rect(xPos+cSize*10+11, yPos+cSize+2, cSize-2, cSize-2);
  rect(xPos+cSize*11+12, yPos+cSize+2, cSize-2, cSize-2);
  rect(xPos+cSize*12+13, yPos+cSize+2, cSize-2, cSize-2);
  rect(xPos+cSize*13+14, yPos+cSize+2, cSize-2, cSize-2);

  //colorchips
  //row1
  fill(0);
  rect(xPos+2, yPos+2, cChip, cChip);
  fill(132, 130, 132);
  rect(xPos+2+cSize+1, yPos+2, cChip, cChip);
  fill(132, 0, 0);
  rect(xPos+2+cSize*2+2, yPos+2, cChip, cChip);
  fill(132, 130, 0);
  rect(xPos+2+cSize*3+3, yPos+2, cChip, cChip);
  fill(0, 130, 0);
  rect(xPos+2+cSize*4+4, yPos+2, cChip, cChip);
  fill(0, 130, 132);
  rect(xPos+2+cSize*5+5, yPos+2, cChip, cChip);
  fill(0, 0, 132);
  rect(xPos+2+cSize*6+6, yPos+2, cChip, cChip);
  fill(132, 0, 132);
  rect(xPos+2+cSize*7+7, yPos+2, cChip, cChip);
  fill(132, 130, 66);
  rect(xPos+2+cSize*8+8, yPos+2, cChip, cChip);
  fill(0, 65, 66);
  rect(xPos+2+cSize*9+9, yPos+2, cChip, cChip);
  fill(0, 130, 255);
  rect(xPos+2+cSize*10+10, yPos+2, cChip, cChip);
  fill(0, 65, 132);
  rect(xPos+2+cSize*11+11, yPos+2, cChip, cChip);
  fill(132, 0, 255);
  rect(xPos+2+cSize*12+12, yPos+2, cChip, cChip);
  fill(132, 65, 0);
  rect(xPos+2+cSize*13+13, yPos+2, cChip, cChip);
  //row2
  fill(255);
  rect(xPos+2, yPos+2+cSize+1, cChip, cChip);
  fill(198, 195, 198);
  rect(xPos+2+cSize+1, yPos+2+cSize+1, cChip, cChip);
  fill(255, 0, 0);
  rect(xPos+2+cSize*2+2, yPos+2+cSize+1, cChip, cChip);
  fill(255, 255, 0);
  rect(xPos+2+cSize*3+3, yPos+2+cSize+1, cChip, cChip);
  fill(0, 255, 0);
  rect(xPos+2+cSize*4+4, yPos+2+cSize+1, cChip, cChip);
  fill(0, 255, 255);
  rect(xPos+2+cSize*5+5, yPos+2+cSize+1, cChip, cChip);
  fill(0, 0, 255);
  rect(xPos+2+cSize*6+6, yPos+2+cSize+1, cChip, cChip);
  fill(255, 0, 255);
  rect(xPos+2+cSize*7+7, yPos+2+cSize+1, cChip, cChip);
  fill(255, 255, 132);
  rect(xPos+2+cSize*8+8, yPos+2+cSize+1, cChip, cChip);
  fill(0, 255, 132);
  rect(xPos+2+cSize*9+9, yPos+2+cSize+1, cChip, cChip);
  fill(132, 255, 255);
  rect(xPos+2+cSize*10+10, yPos+2+cSize+1, cChip, cChip);
  fill(132, 130, 255);
  rect(xPos+2+cSize*11+11, yPos+2+cSize+1, cChip, cChip);
  fill(255, 0, 132);
  rect(xPos+2+cSize*12+12, yPos+2+cSize+1, cChip, cChip);
  fill(255, 130, 66);
  rect(xPos+2+cSize*13+13, yPos+2+cSize+1, cChip, cChip);

  //current color area
  fill(255);
  //check
  rect(3, 562, 1, 1); 
  rect(5, 562, 1, 1); 
  rect(7, 562, 1, 1); 
  rect(9, 562, 1, 1); 
  rect(11, 562, 1, 1); 
  rect(13, 562, 1, 1); 
  rect(15, 562, 1, 1);
  rect(17, 562, 1, 1); 
  rect(19, 562, 1, 1); 
  rect(21, 562, 1, 1); 
  rect(23, 562, 1, 1); 
  rect(25, 562, 1, 1); 
  rect(27, 562, 1, 1);
  rect(3, 564, 1, 1); 
  rect(5, 564, 1, 1); 
  rect(7, 564, 1, 1); 
  rect(9, 564, 1, 1); 
  rect(11, 564, 1, 1); 
  rect(13, 564, 1, 1); 
  rect(15, 564, 1, 1);
  rect(17, 564, 1, 1); 
  rect(19, 564, 1, 1); 
  rect(21, 564, 1, 1); 
  rect(23, 564, 1, 1); 
  rect(25, 564, 1, 1); 
  rect(27, 564, 1, 1);
  rect(3, 566, 1, 1); 
  rect(5, 566, 1, 1); 
  rect(7, 566, 1, 1); 
  rect(9, 566, 1, 1); 
  rect(11, 566, 1, 1); 
  rect(13, 566, 1, 1); 
  rect(15, 566, 1, 1);
  rect(17, 566, 1, 1); 
  rect(19, 566, 1, 1); 
  rect(21, 566, 1, 1); 
  rect(23, 566, 1, 1); 
  rect(25, 566, 1, 1); 
  rect(27, 566, 1, 1);
  rect(3, 568, 1, 1); 
  rect(5, 568, 1, 1); 
  rect(7, 568, 1, 1); 
  rect(9, 568, 1, 1); 
  rect(11, 568, 1, 1); 
  rect(13, 568, 1, 1); 
  rect(15, 568, 1, 1);
  rect(17, 568, 1, 1); 
  rect(19, 568, 1, 1); 
  rect(21, 568, 1, 1); 
  rect(23, 568, 1, 1); 
  rect(25, 568, 1, 1); 
  rect(27, 568, 1, 1);
  rect(3, 570, 1, 1); 
  rect(5, 570, 1, 1); 
  rect(7, 570, 1, 1); 
  rect(9, 570, 1, 1); 
  rect(11, 570, 1, 1); 
  rect(13, 570, 1, 1); 
  rect(15, 570, 1, 1);
  rect(17, 570, 1, 1); 
  rect(19, 570, 1, 1); 
  rect(21, 570, 1, 1); 
  rect(23, 570, 1, 1); 
  rect(25, 570, 1, 1); 
  rect(27, 570, 1, 1);
  rect(3, 572, 1, 1); 
  rect(5, 572, 1, 1); 
  rect(7, 572, 1, 1); 
  rect(9, 572, 1, 1); 
  rect(11, 572, 1, 1); 
  rect(13, 572, 1, 1); 
  rect(15, 572, 1, 1);
  rect(17, 572, 1, 1); 
  rect(19, 572, 1, 1); 
  rect(21, 572, 1, 1); 
  rect(23, 572, 1, 1); 
  rect(25, 572, 1, 1); 
  rect(27, 572, 1, 1);
  rect(3, 574, 1, 1); 
  rect(5, 574, 1, 1); 
  rect(7, 574, 1, 1); 
  rect(9, 574, 1, 1); 
  rect(11, 574, 1, 1); 
  rect(13, 574, 1, 1); 
  rect(15, 574, 1, 1);
  rect(17, 574, 1, 1); 
  rect(19, 574, 1, 1); 
  rect(21, 574, 1, 1); 
  rect(23, 574, 1, 1); 
  rect(25, 574, 1, 1); 
  rect(27, 574, 1, 1);
  rect(3, 576, 1, 1); 
  rect(5, 576, 1, 1); 
  rect(7, 576, 1, 1); 
  rect(9, 576, 1, 1); 
  rect(11, 576, 1, 1); 
  rect(13, 576, 1, 1); 
  rect(15, 576, 1, 1);
  rect(17, 576, 1, 1); 
  rect(19, 576, 1, 1); 
  rect(21, 576, 1, 1); 
  rect(23, 576, 1, 1); 
  rect(25, 576, 1, 1); 
  rect(27, 576, 1, 1);
  rect(3, 578, 1, 1); 
  rect(5, 578, 1, 1); 
  rect(7, 578, 1, 1); 
  rect(9, 578, 1, 1); 
  rect(11, 578, 1, 1); 
  rect(13, 578, 1, 1); 
  rect(15, 578, 1, 1);
  rect(17, 578, 1, 1); 
  rect(19, 578, 1, 1); 
  rect(21, 578, 1, 1); 
  rect(23, 578, 1, 1); 
  rect(25, 578, 1, 1); 
  rect(27, 578, 1, 1);
  rect(3, 580, 1, 1); 
  rect(5, 580, 1, 1); 
  rect(7, 580, 1, 1); 
  rect(9, 580, 1, 1); 
  rect(11, 580, 1, 1); 
  rect(13, 580, 1, 1); 
  rect(15, 580, 1, 1);
  rect(17, 580, 1, 1); 
  rect(19, 580, 1, 1); 
  rect(21, 580, 1, 1); 
  rect(23, 580, 1, 1); 
  rect(25, 580, 1, 1); 
  rect(27, 580, 1, 1);
  rect(3, 582, 1, 1); 
  rect(5, 582, 1, 1); 
  rect(7, 582, 1, 1); 
  rect(9, 582, 1, 1); 
  rect(11, 582, 1, 1); 
  rect(13, 582, 1, 1); 
  rect(15, 582, 1, 1);
  rect(17, 582, 1, 1); 
  rect(19, 582, 1, 1); 
  rect(21, 582, 1, 1); 
  rect(23, 582, 1, 1); 
  rect(25, 582, 1, 1); 
  rect(27, 582, 1, 1);
  rect(3, 584, 1, 1); 
  rect(5, 584, 1, 1); 
  rect(7, 584, 1, 1); 
  rect(9, 584, 1, 1); 
  rect(11, 584, 1, 1); 
  rect(13, 584, 1, 1); 
  rect(15, 584, 1, 1);
  rect(17, 584, 1, 1); 
  rect(19, 584, 1, 1); 
  rect(21, 584, 1, 1); 
  rect(23, 584, 1, 1); 
  rect(25, 584, 1, 1); 
  rect(27, 584, 1, 1);
  rect(3, 586, 1, 1); 
  rect(5, 586, 1, 1); 
  rect(7, 586, 1, 1); 
  rect(9, 586, 1, 1); 
  rect(11, 586, 1, 1); 
  rect(13, 586, 1, 1); 
  rect(15, 586, 1, 1);
  rect(17, 586, 1, 1); 
  rect(19, 586, 1, 1); 
  rect(21, 586, 1, 1); 
  rect(23, 586, 1, 1); 
  rect(25, 586, 1, 1); 
  rect(27, 586, 1, 1);
  rect(3, 588, 1, 1); 
  rect(5, 588, 1, 1); 
  rect(7, 588, 1, 1); 
  rect(9, 588, 1, 1); 
  rect(11, 588, 1, 1); 
  rect(13, 588, 1, 1); 
  rect(15, 588, 1, 1);
  rect(17, 588, 1, 1); 
  rect(19, 588, 1, 1); 
  rect(21, 588, 1, 1); 
  rect(23, 588, 1, 1); 
  rect(25, 588, 1, 1); 
  rect(27, 588, 1, 1);

  rect(2, 563, 1, 1); 
  rect(4, 563, 1, 1); 
  rect(6, 563, 1, 1); 
  rect(8, 563, 1, 1); 
  rect(10, 563, 1, 1); 
  rect(12, 563, 1, 1); 
  rect(14, 563, 1, 1);
  rect(16, 563, 1, 1); 
  rect(18, 563, 1, 1); 
  rect(20, 563, 1, 1);
  rect(22, 563, 1, 1); 
  rect(24, 563, 1, 1); 
  rect(26, 563, 1, 1); 
  rect(28, 563, 1, 1);
  rect(2, 565, 1, 1); 
  rect(4, 565, 1, 1); 
  rect(6, 565, 1, 1); 
  rect(8, 565, 1, 1); 
  rect(10, 565, 1, 1); 
  rect(12, 565, 1, 1); 
  rect(14, 565, 1, 1);
  rect(16, 565, 1, 1); 
  rect(18, 565, 1, 1); 
  rect(20, 565, 1, 1);
  rect(22, 565, 1, 1); 
  rect(24, 565, 1, 1); 
  rect(26, 565, 1, 1); 
  rect(28, 565, 1, 1);
  rect(2, 567, 1, 1); 
  rect(4, 567, 1, 1); 
  rect(6, 567, 1, 1); 
  rect(8, 567, 1, 1); 
  rect(10, 567, 1, 1); 
  rect(12, 567, 1, 1); 
  rect(14, 567, 1, 1);
  rect(16, 567, 1, 1); 
  rect(18, 567, 1, 1); 
  rect(20, 567, 1, 1);
  rect(22, 567, 1, 1); 
  rect(24, 567, 1, 1); 
  rect(26, 567, 1, 1); 
  rect(28, 567, 1, 1);
  rect(2, 569, 1, 1); 
  rect(4, 569, 1, 1); 
  rect(6, 569, 1, 1); 
  rect(8, 569, 1, 1); 
  rect(10, 569, 1, 1); 
  rect(12, 569, 1, 1); 
  rect(14, 569, 1, 1);
  rect(16, 569, 1, 1); 
  rect(18, 569, 1, 1); 
  rect(20, 569, 1, 1);
  rect(22, 569, 1, 1); 
  rect(24, 569, 1, 1); 
  rect(26, 569, 1, 1); 
  rect(28, 569, 1, 1);
  rect(2, 571, 1, 1); 
  rect(4, 571, 1, 1); 
  rect(6, 571, 1, 1); 
  rect(8, 571, 1, 1); 
  rect(10, 571, 1, 1); 
  rect(12, 571, 1, 1); 
  rect(14, 571, 1, 1);
  rect(16, 571, 1, 1); 
  rect(18, 571, 1, 1); 
  rect(20, 571, 1, 1);
  rect(22, 571, 1, 1); 
  rect(24, 571, 1, 1); 
  rect(26, 571, 1, 1); 
  rect(28, 571, 1, 1);
  rect(2, 573, 1, 1); 
  rect(4, 573, 1, 1); 
  rect(6, 573, 1, 1); 
  rect(8, 573, 1, 1); 
  rect(10, 573, 1, 1); 
  rect(12, 573, 1, 1); 
  rect(14, 573, 1, 1);
  rect(16, 573, 1, 1); 
  rect(18, 573, 1, 1); 
  rect(20, 573, 1, 1);
  rect(22, 573, 1, 1); 
  rect(24, 573, 1, 1); 
  rect(26, 573, 1, 1); 
  rect(28, 573, 1, 1);
  rect(2, 575, 1, 1); 
  rect(4, 575, 1, 1); 
  rect(6, 575, 1, 1); 
  rect(8, 575, 1, 1); 
  rect(10, 575, 1, 1); 
  rect(12, 575, 1, 1); 
  rect(14, 575, 1, 1);
  rect(16, 575, 1, 1); 
  rect(18, 575, 1, 1); 
  rect(20, 575, 1, 1);
  rect(22, 575, 1, 1); 
  rect(24, 575, 1, 1); 
  rect(26, 575, 1, 1); 
  rect(28, 575, 1, 1);
  rect(2, 577, 1, 1); 
  rect(4, 577, 1, 1); 
  rect(6, 577, 1, 1); 
  rect(8, 577, 1, 1); 
  rect(10, 577, 1, 1); 
  rect(12, 577, 1, 1); 
  rect(14, 577, 1, 1);
  rect(16, 577, 1, 1); 
  rect(18, 577, 1, 1); 
  rect(20, 577, 1, 1);
  rect(22, 577, 1, 1); 
  rect(24, 577, 1, 1); 
  rect(26, 577, 1, 1); 
  rect(28, 577, 1, 1);
  rect(2, 579, 1, 1); 
  rect(4, 579, 1, 1); 
  rect(6, 579, 1, 1); 
  rect(8, 579, 1, 1); 
  rect(10, 579, 1, 1); 
  rect(12, 579, 1, 1); 
  rect(14, 579, 1, 1);
  rect(16, 579, 1, 1); 
  rect(18, 579, 1, 1); 
  rect(20, 579, 1, 1);
  rect(22, 579, 1, 1); 
  rect(24, 579, 1, 1); 
  rect(26, 579, 1, 1); 
  rect(28, 579, 1, 1);
  rect(2, 581, 1, 1); 
  rect(4, 581, 1, 1); 
  rect(6, 581, 1, 1); 
  rect(8, 581, 1, 1); 
  rect(10, 581, 1, 1); 
  rect(12, 581, 1, 1); 
  rect(14, 581, 1, 1);
  rect(16, 581, 1, 1); 
  rect(18, 581, 1, 1); 
  rect(20, 581, 1, 1);
  rect(22, 581, 1, 1); 
  rect(24, 581, 1, 1); 
  rect(26, 581, 1, 1); 
  rect(28, 581, 1, 1);
  rect(2, 583, 1, 1); 
  rect(4, 583, 1, 1); 
  rect(6, 583, 1, 1); 
  rect(8, 583, 1, 1); 
  rect(10, 583, 1, 1); 
  rect(12, 583, 1, 1); 
  rect(14, 583, 1, 1);
  rect(16, 583, 1, 1); 
  rect(18, 583, 1, 1); 
  rect(20, 583, 1, 1);
  rect(22, 583, 1, 1); 
  rect(24, 583, 1, 1); 
  rect(26, 583, 1, 1); 
  rect(28, 583, 1, 1);
  rect(2, 585, 1, 1); 
  rect(4, 585, 1, 1); 
  rect(6, 585, 1, 1); 
  rect(8, 585, 1, 1); 
  rect(10, 585, 1, 1); 
  rect(12, 585, 1, 1); 
  rect(14, 585, 1, 1);
  rect(16, 585, 1, 1); 
  rect(18, 585, 1, 1); 
  rect(20, 585, 1, 1);
  rect(22, 585, 1, 1); 
  rect(24, 585, 1, 1); 
  rect(26, 585, 1, 1); 
  rect(28, 585, 1, 1);
  rect(2, 587, 1, 1); 
  rect(4, 587, 1, 1); 
  rect(6, 587, 1, 1); 
  rect(8, 587, 1, 1); 
  rect(10, 587, 1, 1); 
  rect(12, 587, 1, 1); 
  rect(14, 587, 1, 1);
  rect(16, 587, 1, 1); 
  rect(18, 587, 1, 1); 
  rect(20, 587, 1, 1);
  rect(22, 587, 1, 1); 
  rect(24, 587, 1, 1); 
  rect(26, 587, 1, 1); 
  rect(28, 587, 1, 1);
  rect(2, 589, 1, 1); 
  rect(4, 589, 1, 1); 
  rect(6, 589, 1, 1); 
  rect(8, 589, 1, 1); 
  rect(10, 589, 1, 1); 
  rect(12, 589, 1, 1); 
  rect(14, 589, 1, 1);
  rect(16, 589, 1, 1); 
  rect(18, 589, 1, 1); 
  rect(20, 589, 1, 1);
  rect(22, 589, 1, 1); 
  rect(24, 589, 1, 1); 
  rect(26, 589, 1, 1); 
  rect(28, 589, 1, 1);
  
  //colorbox
  rect(4, 565, 15, 15);
  rect(11, 572, 15, 15);
  fill(173, 170, 156);
  rect(12, 573, 14, 14);
  fill(239, 235, 222);
  rect(12, 573, 13, 13);
  fill(255);
  rect(13, 574, 12, 12);
  
  fill(173, 170, 156);
  rect(5, 566, 14, 14);
  fill(239, 235, 222);
  rect(5, 566, 13, 13);
  
  fill(R, G, B);
  noStroke();
  rect(6, 567, cChip, cChip);

}

void draw() {
  
  //current color
  fill(R, G, B);
  noStroke();
  rect(6, 567, cChip, cChip);
  
  if(mousePressed) {
    
    if(mouseX > 3 && mouseX < 797 && mouseY > 3 && mouseY < 547) {
      stroke(R,G,B);
      strokeWeight(2);
      line(pmouseX,pmouseY,mouseX,mouseY);      
    }
    
    //color row 1
    if(mouseX > xPos+2 && mouseX < xPos+2+cChip && mouseY > yPos+2 && mouseY < yPos+2+cChip) {
      R=0;
      G=0;
      B=0;
    }
    if(mouseX > xPos+2+cSize+1 && mouseX < xPos+2+cSize+1+cChip && mouseY > yPos+2 && mouseY < yPos+2+cChip) {
      R=132;
      G=130;
      B=132;
    }
    if(mouseX > xPos+2+cSize*2+2 && mouseX < xPos+2+cSize*2+2+cChip && mouseY > yPos+2 && mouseY < yPos+2+cChip) {
      R=132;
      G=0;
      B=0;
    }
    if(mouseX > xPos+2+cSize*3+3 && mouseX < xPos+2+cSize*3+3+cChip && mouseY > yPos+2 && mouseY < yPos+2+cChip) {
      R=132;
      G=130;
      B=0;
    }
    if(mouseX > xPos+2+cSize*4+4 && mouseX < xPos+2+cSize*4+4+cChip && mouseY > yPos+2 && mouseY < yPos+2+cChip) {
      R=0;
      G=130;
      B=0;
    }
    if(mouseX > xPos+2+cSize*5+5 && mouseX < xPos+2+cSize*5+5+cChip && mouseY > yPos+2 && mouseY < yPos+2+cChip) {
      R=0;
      G=130;
      B=132;
    }
    if(mouseX > xPos+2+cSize*6+6 && mouseX < xPos+2+cSize*6+6+cChip && mouseY > yPos+2 && mouseY < yPos+2+cChip) {
      R=0;
      G=0;
      B=132;
    }
    if(mouseX > xPos+2+cSize*7+7 && mouseX < xPos+2+cSize*7+7+cChip && mouseY > yPos+2 && mouseY < yPos+2+cChip) {
      R=132;
      G=0;
      B=132;
    }
    if(mouseX > xPos+2+cSize*8+8 && mouseX < xPos+2+cSize*8+8+cChip && mouseY > yPos+2 && mouseY < yPos+2+cChip) {
      R=132;
      G=130;
      B=66;
    }
    if(mouseX > xPos+2+cSize*9+9 && mouseX < xPos+2+cSize*9+9+cChip && mouseY > yPos+2 && mouseY < yPos+2+cChip) {
      R=0;
      G=65;
      B=66;
    }
    if(mouseX > xPos+2+cSize*10+10 && mouseX < xPos+2+cSize*10+10+cChip && mouseY > yPos+2 && mouseY < yPos+2+cChip) {
      R=0;
      G=130;
      B=255;
    }
    if(mouseX > xPos+2+cSize*11+11 && mouseX < xPos+2+cSize*11+11+cChip && mouseY > yPos+2 && mouseY < yPos+2+cChip) {
      R=0;
      G=65;
      B=132;
    }
    if(mouseX > xPos+2+cSize*12+12 && mouseX < xPos+2+cSize*12+12+cChip && mouseY > yPos+2 && mouseY < yPos+2+cChip) {
      R=132;
      G=0;
      B=255;
    }
    if(mouseX > xPos+2+cSize*13+13 && mouseX < xPos+2+cSize*13+13+cChip && mouseY > yPos+2 && mouseY < yPos+2+cChip) {
      R=132;
      G=65;
      B=0;
    }
    
    //color row 2
    if(mouseX > xPos+2 && mouseX < xPos+2+cChip && mouseY > yPos+2+cSize+1 && mouseY < yPos+2+cSize+1+cChip) {
      R=255;
      G=255;
      B=255;
    }
    if(mouseX > xPos+2+cSize+1 && mouseX < xPos+2+cSize+1+cChip && mouseY > yPos+2+cSize+1 && mouseY < yPos+2+cSize+1+cChip) {
      R=198;
      G=195;
      B=198;
    }
    if(mouseX > xPos+2+cSize*2+2 && mouseX < xPos+2+cSize*2+2+cChip && mouseY > yPos+2+cSize+1 && mouseY < yPos+2+cSize+1+cChip) {
      R=255;
      G=0;
      B=0;
    }
    if(mouseX > xPos+2+cSize*3+3 && mouseX < xPos+2+cSize*3+3+cChip && mouseY > yPos+2+cSize+1 && mouseY < yPos+2+cSize+1+cChip) {
      R=255;
      G=255;
      B=0;
    }
    if(mouseX > xPos+2+cSize*4+4 && mouseX < xPos+2+cSize*4+4+cChip && mouseY > yPos+2+cSize+1 && mouseY < yPos+2+cSize+1+cChip) {
      R=0;
      G=255;
      B=0;
    }
    if(mouseX > xPos+2+cSize*5+5 && mouseX < xPos+2+cSize*5+5+cChip && mouseY > yPos+2+cSize+1 && mouseY < yPos+2+cSize+1+cChip) {
      R=0;
      G=255;
      B=255;
    }
    if(mouseX > xPos+2+cSize*6+6 && mouseX < xPos+2+cSize*6+6+cChip && mouseY > yPos+2+cSize+1 && mouseY < yPos+2+cSize+1+cChip) {
      R=0;
      G=0;
      B=255;
    }
    if(mouseX > xPos+2+cSize*7+7 && mouseX < xPos+2+cSize*7+7+cChip && mouseY > yPos+2+cSize+1 && mouseY < yPos+2+cSize+1+cChip) {
      R=255;
      G=0;
      B=255;
    }
    if(mouseX > xPos+2+cSize*8+8 && mouseX < xPos+2+cSize*8+8+cChip && mouseY > yPos+2+cSize+1 && mouseY < yPos+2+cSize+1+cChip) {
      R=255;
      G=255;
      B=132;
    }
    if(mouseX > xPos+2+cSize*9+9 && mouseX < xPos+2+cSize*9+9+cChip && mouseY > yPos+2+cSize+1 && mouseY < yPos+2+cSize+1+cChip) {
      R=0;
      G=255;
      B=132;
    }
    if(mouseX > xPos+2+cSize*10+10 && mouseX < xPos+2+cSize*10+10+cChip && mouseY > yPos+2+cSize+1 && mouseY < yPos+2+cSize+1+cChip) {
      R=132;
      G=255;
      B=255;
    }
    if(mouseX > xPos+2+cSize*11+11 && mouseX < xPos+2+cSize*11+11+cChip && mouseY > yPos+2+cSize+1 && mouseY < yPos+2+cSize+1+cChip) {
      R=132;
      G=130;
      B=255;
    }
    if(mouseX > xPos+2+cSize*12+12 && mouseX < xPos+2+cSize*12+12+cChip && mouseY > yPos+2+cSize+1 && mouseY < yPos+2+cSize+1+cChip) {
      R=255;
      G=0;
      B=132;
    }
    if(mouseX > xPos+2+cSize*13+13 && mouseX < xPos+2+cSize*13+13+cChip && mouseY > yPos+2+cSize+1 && mouseY < yPos+2+cSize+1+cChip) {
      R=255;
      G=130;
      B=66;
    }
    
  }
  
}

