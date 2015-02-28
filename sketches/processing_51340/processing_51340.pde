
color seaGreen = color(200, 236, 230);
color hotRed = color(210, 30, 30);
color darkBlue = color(0, 0, 67);
color gold = color(255, 215, 0);
int value = (0);


void setup() {
  size(480, 550);
  background(255);
  smooth();
  
  
}

void draw() {
  strokeWeight(0);
  //translate(1, 1);
  rectOne();
  rectTwo();
  rectTwoHalf();
  rectThree();
  rectThreeHalf();
  rectFour();
  rectFourHalf();
  rectFive();
  rectSix();
  rectSeven();
  rectEight();
  rectNine();
  rectTen();
  rectEleven();
  rectTwelve();
  rectThirteen();
  rectFourteen();
  rectFifteen();
  rectSixteen();
  rectSeventeen();
  rectEighteen();
  //rectNineteen();
  rectTwenty();
  rectTwentyOne();
  //rectTwentyTwo();
  bottomThing();
  bottomLine();
  }
  
void mouseMoved() {
  value = (value+1);
}

void rectOne() {
  strokeWeight(0);
  if (value>5) {
    strokeWeight(5);
    fill(gold);
    rect(-3, -3, 43, 103);
  //} else {
   // strokeWeight(0);
   // fill(0);
  }
  if (value>120) {
    strokeWeight(5);
    fill(hotRed);
    rect(-3, -3, 43, 103);
  }
  
  if (value>235) {
    strokeWeight(5);
    fill(seaGreen);
    rect(-3, -3, 43, 103);
  }
  
  if (value>370) {
    strokeWeight(5);
    fill(darkBlue);
    rect(-3, -3, 43, 103);
  }
  
  if (value>485) {
    strokeWeight(5);
    fill(gold);
    rect(-3, -3, 43, 103);
  }
    
    
}

void rectTwo() { 
  strokeWeight(0);
  if (value>10) {
  strokeWeight(5);
  fill(hotRed);
  rect(40, 10, 165, 90); 
 // } else {
  //  strokeWeight(0);
  //  fill(0);
  }  
  if (value>125) {
    strokeWeight(5);
    fill(darkBlue);
    rect(40, 10, 165, 90);
  }
    if (value>240) {
    strokeWeight(5);
    fill(seaGreen);
    rect(40, 10, 165, 90);
  }
    if (value>355) {
    strokeWeight(5);
    fill(gold);
    rect(40, 10, 165, 90);
  }
    if (value>470) {
    strokeWeight(5);
    fill(hotRed);
    rect(40, 10, 165, 90);
  }
    
}

void rectTwoHalf() {
  strokeWeight(0);
  if (value>15) {
  strokeWeight(5);
  fill(hotRed);
  rect(40, -5, 165, 15);
 // } else {
  //  strokeWeight(0);
  //  fill(0);
  }
  if (value>130) {
    strokeWeight(5);
    fill(gold);
    rect(40, -5, 165, 15);
  }
   if (value>245) {
    strokeWeight(5);
    fill(darkBlue);
    rect(40, -5, 165, 15);
  }
   if (value>360) {
    strokeWeight(5);
    fill(0);
    rect(40, -5, 165, 15);
  }
     if (value>475) {
    strokeWeight(5);
    fill(hotRed);
    rect(40, -5, 165, 15);
  }
}


void rectThree() {
  strokeWeight(0);
  if (value>20) {
  strokeWeight(5);
  fill(seaGreen);
  rect(205, 10, 90, 90);
  }
 // } else {
  //  strokeWeight(0);
  //  fill(0);
  if (value>135) {
    strokeWeight(5);
    fill(hotRed);
    rect(205, 10, 90, 90);
  }
   if (value>250) {
    strokeWeight(5);
    fill(0);
    rect(205, 10, 90, 90);
  }
   if (value>375) {
    strokeWeight(5);
    fill(gold);
    rect(205, 10, 90, 90);
  }
     if (value>490) {
    strokeWeight(5);
    fill(seaGreen);
    rect(205, 10, 90, 90);
  }
}

void rectThreeHalf() {
  strokeWeight(0);
  if (value>25) {
  strokeWeight(5);
  fill(seaGreen);
  rect(205, -5, 90, 15);
  }
//  }else {
//    strokeWeight(0);
//    fill(0);
  if (value>140) {
    strokeWeight(5);
    fill(0);
    rect(205, -5, 90, 15);
  }
   if (value>265) {
    strokeWeight(5);
    fill(darkBlue);
    rect(205, -5, 90, 15);
  }
   if (value>380) {
    strokeWeight(5);
    fill(hotRed);
    rect(205, -5, 90, 15);
  }
   if (value>495) {
    strokeWeight(5);
    fill(seaGreen);
    rect(205, -5, 90, 15);
   }
}

void rectFour() {
  strokeWeight(0);
  if (value>30) {
  strokeWeight(5);
  fill(seaGreen);
  rect(295, -5, 165, 50);
  }
   if (value>145) {
    strokeWeight(5);
    fill(hotRed);
    rect(295, -5, 165, 50);
  }
   if (value>260) {
    strokeWeight(5);
    fill(seaGreen);
    rect(295, -5, 165, 50);
  }
   if (value>375) {
    strokeWeight(5);
    fill(gold);
    rect(295, -5, 165, 50);
  }
   if (value>490) {
    strokeWeight(5);
    fill(seaGreen);
    rect(295, -5, 165, 50);
}

//  } else {
//    strokeWeight(0);
 //   fill(0);
  }


void rectFourHalf() {
  strokeWeight(0);
  if (value>35) {
  strokeWeight(5);
  fill(seaGreen);
  rect(455, -5, 30, 210);
 // } else {
 //   strokeWeight(0);
 //   fill(0);
 }
  if (value>150) {
    strokeWeight(5);
    fill(gold);
    rect(455, -5, 30, 210);
  }
   if (value>265) {
    strokeWeight(5);
    fill(hotRed);
    rect(455, -5, 30, 210);
  }
   if (value>380) {
    strokeWeight(5);
    fill(0);
    rect(455, -5, 30, 210);
  }
   if (value>495) {
    strokeWeight(5);
    fill(seaGreen);
    rect(455, -5, 30, 210);
  }
}

void rectFive() {
  strokeWeight(0);
  if (value>40) {
  strokeWeight(5);
  fill(seaGreen);
  rect(-5, 100, 45, 395);
//  } else {
 //   strokeWeight(0);
  //  fill(0);
  }
  if (value>155) {
    strokeWeight(5);
    fill(0);
    rect(-5, 100, 45, 395);
  }
   if (value>270) {
    strokeWeight(5);
    fill(gold);
    rect(-5, 100, 45, 395);
  }
   if (value>385) {
    strokeWeight(5);
    fill(darkBlue);
    rect(-5, 100, 45, 395);
  }
   if (value>500) {
    strokeWeight(5);
    fill(seaGreen);
    rect(-5, 100, 45, 395);
  }
}

void rectSix() {
  strokeWeight(0);
  if (value>45) {
  strokeWeight(5);
  fill(darkBlue);
  rect(40, 100, 165, 190);
  //  } else {
  //  strokeWeight(0);
  //  fill(0);
   }
  if (value>160) {
    strokeWeight(5);
    fill(seaGreen);
    rect(40, 100, 165, 190);
  }
   if (value>275) {
    strokeWeight(5);
    fill(darkBlue);
    rect(40, 100, 165, 190);
  }
   if (value>390) {
    strokeWeight(5);
    fill(gold);
    rect(40, 100, 165, 190);
  }
   if (value>505) {
    strokeWeight(5);
    fill(darkBlue);
    rect(40, 100, 165, 190);
  }
}

void rectSeven() {
  strokeWeight(0);
  if (value>50) {
  strokeWeight(5);
  fill(0);
  rect(205, 100, 90, 190);
 //   } else {
 //   strokeWeight(0);
 //   fill(0);
 }
  if (value>165) {
    strokeWeight(5);
    fill(hotRed);
    rect(205, 100, 90, 190);
  }
   if (value>280) {
    strokeWeight(5);
    fill(darkBlue);
    rect(205, 100, 90, 190);
  }
   if (value>395) {
    strokeWeight(5);
    fill(seaGreen);
    rect(205, 100, 90, 190);
  }
   if (value>510) {
    strokeWeight(5);
    fill(0);
    rect(205, 100, 90, 190);
  }
}

void rectEight() {
  strokeWeight(0);
  if (value>55) {
  strokeWeight(5);
  fill(gold);
  rect(295, 45, 160, 160);
 //   } else {
 //   strokeWeight(0);
 //   fill(0);
  }
  if (value>170) {
    strokeWeight(5);
    fill(hotRed);
    rect(295, 45, 160, 160);
  }
   if (value>285) {
    strokeWeight(5);
    fill(darkBlue);
    rect(295, 45, 160, 160);
  }
   if (value>400) {
    strokeWeight(5);
    fill(seaGreen);
    rect(295, 45, 160, 160);
  }
   if (value>515) {
    strokeWeight(5);
    fill(gold);
    rect(295, 45, 160, 160);
  }
}

void rectNine() {
  strokeWeight(0);
  if (value>60) {
  strokeWeight(5);
  fill(seaGreen);
  rect(40, 290, 165, 35);
 //   } else {
 //   strokeWeight(0);
 //   fill(0);
  }
  if (value>175) {
    strokeWeight(5);
    fill(gold);
    rect(40, 290, 165, 35);
  }
   if (value>290) {
    strokeWeight(5);
    fill(0);
    rect(40, 290, 165, 35);
  }
   if (value>405) {
    strokeWeight(5);
    fill(darkBlue);
    rect(40, 290, 165, 35);
  }
   if (value>520) {
    strokeWeight(5);
    fill(seaGreen);
    rect(40, 290, 165, 35);
  }
}

void rectTen() {
  strokeWeight(0);
  if (value>65) {
  strokeWeight(5);
  fill(seaGreen);
  rect(295, 205, 130, 85);
  //  } else {
  //  strokeWeight(0);
  //  fill(0);
  }
  if (value>180) {
    strokeWeight(5);
    fill(0);
    rect(295, 205, 130, 85);
  }
   if (value>295) {
    strokeWeight(5);
    fill(gold);
    rect(295, 205, 130, 85);
  }
   if (value>410) {
    strokeWeight(5);
    fill(hotRed);
    rect(295, 205, 130, 85);
  }
   if (value>525) {
    strokeWeight(5);
    fill(seaGreen);
    rect(295, 205, 130, 85);
  }
}

void rectEleven() {
  strokeWeight(0);
  if (value>70) {
  strokeWeight(5);
  fill(0);
  rect(425, 205, 55, 205);
 //   } else {
 //   strokeWeight(0);
 //   fill(0);
  }
  if (value>185) {
    strokeWeight(5);
    fill(hotRed);
    rect(425, 205, 55, 205);
  }
   if (value>300) {
    strokeWeight(5);
    fill(seaGreen);
    rect(425, 205, 55, 205);
  }
   if (value>415) {
    strokeWeight(5);
    fill(gold);
    rect(425, 205, 55, 205);
  }
   if (value>530) {
    strokeWeight(5);
    fill(0);
    rect(425, 205, 55, 205);
  }
}

void rectTwelve() {
  strokeWeight(0);
  if (value>75) {
  strokeWeight(5);
  fill(seaGreen);
  rect(40, 325, 165, 170);
  }
    if (value>190) {
    strokeWeight(5);
    fill(0);
    rect(40, 325, 165, 170);
  }
   if (value>305) {
    strokeWeight(5);
    fill(gold);
    rect(40, 325, 165, 170);
  }
   if (value>420) {
    strokeWeight(5);
    fill(0);
    rect(40, 325, 165, 170);
  }
   if (value>535) {
    strokeWeight(5);
    fill(seaGreen);
    rect(40, 325, 165, 170);
  }
}

void rectThirteen() {
  strokeWeight(0);
  if (value>80) {
  strokeWeight(5);
  fill(hotRed);
  rect(205, 290, 90, 120);
  }
   if (value>195) {
    strokeWeight(5);
    fill(darkBlue);
    rect(205, 290, 90, 120);
  }
   if (value>310) {
    strokeWeight(5);
    fill(hotRed);
    rect(205, 290, 90, 120);
  }
   if (value>425) {
    strokeWeight(5);
    fill(seaGreen);
    rect(205, 290, 90, 120);
  }
   if (value>540) {
    strokeWeight(5);
    fill(hotRed);
    rect(205, 290, 90, 120);
  }
}

void rectFourteen() {
  strokeWeight(0);
  if (value>85) {
  strokeWeight(5);
  fill(hotRed);
  rect(295, 290, 130, 120);
  }
     if (value>200) {
    strokeWeight(5);
    fill(gold);
    rect(295, 290, 130, 120);
  }
   if (value>315) {
    strokeWeight(5);
    fill(darkBlue);
    rect(295, 290, 130, 120);
  }
   if (value>430) {
    strokeWeight(5);
    fill(gold);
    rect(295, 290, 130, 120);
  }
   if (value>545) {
    strokeWeight(5);
    fill(hotRed);
    rect(295, 290, 130, 120);
  }
}

void rectFifteen() {
  strokeWeight(0);
  if (value>90) {
  strokeWeight(5);
  fill(darkBlue);
  rect(205, 410, 155, 85);
  }
   if (value>205) {
    strokeWeight(5);
    fill(seaGreen);
    rect(205, 410, 155, 85);
  }
   if (value>320) {
    strokeWeight(5);
    fill(hotRed);
    rect(205, 410, 155, 85);
  }
   if (value>435) {
    strokeWeight(5);
    fill(seaGreen);
    rect(205, 410, 155, 85);
  }
   if (value>550) {
    strokeWeight(5);
    fill(darkBlue);
    rect(205, 410, 155, 85);
  }
}

void rectSixteen() {
  strokeWeight(0);
  if (value>95) {
  strokeWeight(5);
  fill(seaGreen);
  rect(360, 410, 65, 85);
  }
   if (value>210) {
    strokeWeight(5);
    fill(0);
    rect(205, 410, 155, 85);
  }
   if (value>325) {
    strokeWeight(5);
    fill(gold);
    rect(205, 410, 155, 85);
  }
   if (value>440) {
    strokeWeight(5);
    fill(hotRed);
    rect(205, 410, 155, 85);
  }
   if (value>555) {
    strokeWeight(5);
    fill(seaGreen);
    rect(205, 410, 155, 85);
  }
}

void rectSeventeen() {
  strokeWeight(0);
  if (value>100) {
  strokeWeight(5);
  fill(seaGreen);
  rect(425, 410, 40, 85);
  }
    if (value>215) {
    strokeWeight(5);
    fill(darkBlue);
    rect(425, 410, 40, 85);
  }
   if (value>330) {
    strokeWeight(5);
    fill(hotRed);
    rect(425, 410, 40, 85);
  }
   if (value>445) {
    strokeWeight(5);
    fill(gold);
    rect(425, 410, 40, 85);
  }
   if (value>560) {
    strokeWeight(5);
    fill(seaGreen);
    rect(425, 410, 40, 85);
  }
}

void rectEighteen() {
  strokeWeight(0);
  if (value>105) {
  strokeWeight(5);
  fill(0);
  rect(465, 410, 15, 120);
  }
  if (value>220) {
    strokeWeight(5);
    fill(hotRed);
    rect(465, 410, 15, 120);
  }
   if (value>335) {
    strokeWeight(5);
    fill(seaGreen);
    rect(465, 410, 15, 120);
  }
   if (value>450) {
    strokeWeight(5);
    fill(gold);
    rect(465, 410, 15, 120);
  }
   if (value>565) {
    strokeWeight(5);
    fill(0);
    rect(465, 410, 15, 120);
  }
}

void rectTwenty() {
  strokeWeight(0);
  if (value>110) {
  strokeWeight(5);
  fill(gold);
  rect(40, 495, 320, 35);
  }
   if (value>225) {
    strokeWeight(5);
    fill(darkBlue);
    rect(40, 495, 320, 35);
  }
   if (value>340) {
    strokeWeight(5);
    fill(seaGreen);
    rect(40, 495, 320, 35);
  }
   if (value>455) {
    strokeWeight(5);
    fill(hotRed);
    rect(40, 495, 320, 35);
  }
   if (value>570) {
    strokeWeight(5);
    fill(gold);
    rect(40, 495, 320, 35);
  }
}

void rectTwentyOne() {
  strokeWeight(0);
  if (value>115) {
  strokeWeight(5);
  fill(seaGreen);
  rect(360, 495, 105, 35);
  }
   if (value>230) {
    strokeWeight(5);
    fill(gold);
    rect(360, 495, 105, 35);
  }
   if (value>345) {
    strokeWeight(5);
    fill(darkBlue);
    rect(360, 495, 105, 35);
  }
   if (value>460) {
    strokeWeight(5);
    fill(gold);
    rect(360, 495, 105, 35);
  }
   if (value>575) {
    strokeWeight(5);
    fill(seaGreen);
    rect(360, 495, 105, 35);
  }
}

void bottomThing() {
  strokeWeight(0);
  if (value>120) {
  strokeWeight(5);
  fill(seaGreen);
  strokeJoin(PROJECT);
  beginShape();
  vertex(-3, 495);
  vertex(40, 495);
  vertex(40, 530);
  vertex(490, 530);
  vertex(490, 560);
  vertex(-3, 560);
  endShape(CLOSE);
  }
   if (value>235) {
    strokeWeight(5);
    fill(hotRed);
     beginShape();
  vertex(-3, 495);
  vertex(40, 495);
  vertex(40, 530);
  vertex(490, 530);
  vertex(490, 560);
  vertex(-3, 560);
  endShape(CLOSE);
  }
   if (value>350) {
    strokeWeight(5);
    fill(gold);
     beginShape();
  vertex(-3, 495);
  vertex(40, 495);
  vertex(40, 530);
  vertex(490, 530);
  vertex(490, 560);
  vertex(-3, 560);
  endShape(CLOSE);
  }
   if (value>465) {
    strokeWeight(5);
    fill(hotRed);
     beginShape();
  vertex(-3, 495);
  vertex(40, 495);
  vertex(40, 530);
  vertex(490, 530);
  vertex(490, 560);
  vertex(-3, 560);
  endShape(CLOSE);
  }
   if (value>580) {
    strokeWeight(5);
    fill(seaGreen);
     beginShape();
  vertex(-3, 495);
  vertex(40, 495);
  vertex(40, 530);
  vertex(490, 530);
  vertex(490, 560);
  vertex(-3, 560);
  endShape(CLOSE);
  }
}

void bottomLine() {
  strokeWeight(0);
  if (value>120) {
  strokeWeight(5);
  strokeCap(SQUARE);
  line(40, 495, 40, 543);
  }
}

  


  
  




  
  


  





