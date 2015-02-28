
//keyPressed = black background
//mousePressed = red/green


float barOne;
float barTwo;
float barThree;
float barFour;
float barFive;
float barSix;
float barSeven;
float barEight;
float barNine;
float barTen;
float barEleven;
float barTwelve;
float barThirteen;
float barFourteen;
float barFifteen;
float barSixteen;
float barSeventeen;
float barEighteen;
float barNineteen;
float barTwenty;
float barTwentyOne;
float barTwentyTwo;
float barTwentyThree;
float barTwentyFour;
float barTwentyFive;
float barTwentySix;
float barTwentySeven;
float barTwentyEight;
float barTwentyNine;
float barThirty;
float barThirtyOne;
float barThirtyTwo;
float barThirtyThree;
float barThirtyFour;
float barThirtyFive;
float barThirtySix;
float barThirtySeven;
float barThirtyEight;
float barThirtyNine;
float barForty;
float barFortyOne;
float barFortyTwo;
float barFortyThree;
float barFortyFour;
float barFortyFive;
float barFortySix;
float barFortySeven;
float barFortyEight;
float barFortyNine;
float barFifty;

void setup() {
  size(246, 900);
  smooth();
}

void draw() {
  background(255);


  if (keyPressed) {
    background(0);
  }

  fill(255, 0, 0, 95);
  rect(0, 0, barOne, 900);
  stroke(255);
  barOne+=.2;
  if ( barOne > 246) {
    barOne=0;
  }

  fill(255, 166, 0, 75);
  stroke(255);
  rect(0, 0, barTwo, 890);
  barTwo+=.09;
  if (barTwo>120) {
    barTwo=0;
  }
  fill(255, 166, 0, 75);
  stroke(255);
  rect(0, 0, barThree, 880);
  barThree+=.09;
  if (barThree>102) {
    barThree=0;
  }
  fill(20, 255, 0, 75);
  stroke(255);
  rect(0, 0, barFour, 870);
  barFour+=.09;
  if (barFour>96) {
    barFour=0;
  }


  fill(0, 255, 249, 75);
  rect(0, 0, barFive, 860);
  barFive+=.09;
  if (barFive>93) {
    barFive=0;
  }

  fill(0, 23, 255, 75);
  stroke(255);
  rect(0, 0, barSix, 850);
  barSix+=.09;
  if (barSix>90) {
    barSix=0;
  }

  fill(207, 0, 255, 75);
  stroke(255);
  rect(0, 0, barSeven, 840);
  barSeven+=.09;
  if (barSeven>87) {
    barSeven=0;
  }
  fill(135, 20, 167, 75);
  stroke(255);
  rect(0, 0, barEight, 830);
  barEight+=.09;
  if (barEight>87) {
    barEight=0;
  }
  fill(255, 0, 166, 75);
  stroke(255);
  rect(0, 0, barNine, 820);
  barNine+=.09;
  if (barNine>84) {
    barNine=0;
  }
  fill(255, 0, 0, 75);
  stroke(255);
  rect(0, 0, barTen, 810);
  barTen+=.09;
  if (barTen>81) {
    barTen=0;
  }
  fill(255, 166, 0, 75);
  stroke(255);
  rect(20, 0, barEleven, 800);
  barEleven+=.09;
  if (barEleven>75) {
    barEleven=0;
  }
  fill(255, 166, 0, 75);
  stroke(255);
  rect(20, 0, barTwelve, 790);
  barTwelve+=.09;
  if (barTwelve>69) {
    barTwelve=0;
  }
  fill(20, 255, 0, 75);
  stroke(255);
  rect(20, 0, barThirteen, 780);
  barThirteen+=.09;
  if (barThirteen>69) {
    barThirteen=0;
  }
  fill(0, 255, 249, 75);
  stroke(255);
  rect(20, 0, barFourteen, 770);
  barFourteen+=.09;
  if (barFourteen>69) {
    barFourteen=0;
  }
  fill(0, 23, 255, 75);
  stroke(255);
  rect(20, 0, barFifteen, 760);
  barFifteen+=.09;
  if (barFifteen>66) {
    barFifteen=0;
  }
  fill(207, 0, 255, 75);
  stroke(255);
  rect(20, 0, barSixteen, 750);
  barSixteen+=.09;
  if (barSixteen>66) {
    barSixteen=0;
  }
  fill(135, 20, 167, 75);
  stroke(255);
  rect(20, 0, barSeventeen, 740);
  barSeventeen+=.09;
  if (barSeventeen>63) {
    barSeventeen=0;
  }
  fill(255, 0, 166, 75);
  stroke(255);
  rect(20, 0, barEighteen, 730);
  barEighteen+=.09;
  if (barEighteen>63) {
    barEighteen=0;
  }
  fill(255, 0, 0, 75);
  stroke(255);
  rect(20, 0, barNineteen, 720);
  barNineteen+=.09;
  if (barNineteen>60) {
    barNineteen=0;
  }
  fill(255, 166, 0, 75);
  stroke(255);
  rect(20, 0, barTwenty, 710);
  barTwenty+=.09;
  if (barTwenty>54) {
    barTwenty=0;
  }
  fill(255, 166, 0, 75);
  stroke(255);
  rect(40, 30, barTwentyOne, 700);
  barTwentyOne+=.09;
  if (barTwentyOne>54) {
    barTwentyOne=0;
  }
  fill(20, 255, 0, 75);
  stroke(255);
  rect(40, 30, barTwentyTwo, 690);
  barTwentyTwo+=.09;
  if (barTwentyTwo>51) {
    barTwentyTwo=0;
  }
  fill(0, 255, 249, 75);
  stroke(255);
  rect(40, 30, barTwentyThree, 680);
  barTwentyThree+=.09;
  if (barTwentyThree>51) {
    barTwentyThree=0;
  }
  fill(0, 23, 255, 75);
  stroke(255);
  rect(40, 30, barTwentyFour, 670);
  barTwentyFour+=.09;
  if (barTwentyFour>48) {
    barTwentyFour=0;
  }
  fill(207, 0, 255, 75);
  stroke(255);
  rect(40, 30, barTwentyFive, 660);
  barTwentyFive+=.09;
  if (barTwentyFive>48) {
    barTwentyFive=0;
  }
  fill(135, 20, 167, 75);
  stroke(255);
  rect(40, 30, barTwentySix, 650);
  barTwentySix+=.09;
  if (barTwentySix>45) {
    barTwentySix=0;
  }
  fill(255, 0, 166, 75);
  stroke(255);
  rect(40, 30, barTwentySeven, 640);
  barTwentySeven+=.09;
  if (barTwentySeven>45) {
    barTwentySeven=0;
  }
  fill(255, 0, 0, 75);
  stroke(255);
  rect(40, 30, barTwentyEight, 630);
  barTwentyEight+=.09;
  if (barTwentyEight>45) {
    barTwentyEight=0;
  }
  fill(255, 166, 0, 75);
  stroke(255);
  rect(40, 30, barTwentyNine, 620);
  barTwentyNine+=.09;
  if (barTwentyNine>45) {
    barTwentyNine=0;
  }
  fill(255, 166, 0, 75);
  stroke(255);
  rect(0, 50, barThirty, 610);
  barThirty+=.09;
  if (barThirty>42) {
    barThirty=0;
  }
  fill(20, 255, 0, 75);
  stroke(255);
  rect(0, 50, barThirtyOne, 600);
  barThirtyOne+=.09;
  if (barThirtyOne>42) {
    barThirtyOne=0;
  }
  fill(0, 255, 249, 75);
  stroke(255);
  rect(0, 50, barThirtyTwo, 590);
  barThirtyTwo+=.09;
  if (barThirtyTwo>42) {
    barThirtyTwo=0;
  }
  fill(0, 23, 255, 75);
  stroke(255);
  rect(0, 50, barThirtyThree, 580);
  barThirtyThree+=.09;
  if (barThirtyThree>39) {
    barThirtyThree=0;
  }
  fill(207, 0, 255, 75);
  stroke(255);
  rect(0, 50, barThirtyFour, 570);
  barThirtyFour+=.09;
  if (barThirtyFour>39) {
    barThirtyFour=0;
  }
  fill(135, 20, 167, 75);
  stroke(255);
  rect(0, 50, barThirtyFive, 560);
  barThirtyFive+=.09;
  if (barThirtyFive>39) {
    barThirtyFive=0;
  }
  fill(255, 0, 166, 75);
  stroke(255);
  rect(0, 50, barThirtySix, 550);
  barThirtySix+=.09;
  if (barThirtySix>39) {
    barThirtySix=0;
  }
  fill(255, 0, 0, 75);
  stroke(255);
  rect(0, 50, barThirtySeven, 540);
  barThirtySeven+=.09;
  if (barThirtySeven>36) {
    barThirtySeven=0;
  }
  fill(255, 166, 0, 75);
  stroke(255);
  rect(0, 50, barThirtyEight, 530);
  barThirtyEight+=.09;
  if (barThirtyEight>36) {
    barThirtyEight=0;
  }
  fill(255, 166, 0, 75);
  stroke(255);
  rect(0, 50, barThirtyNine, 520);
  barThirtyNine+=.09;
  if (barThirtyNine>36) {
    barThirtyNine=0;
  }
  fill(20, 255, 0, 75);
  stroke(255);
  rect(40, 30, barSeven, 510);
  barSeven+=.09;
  if (barSeven>36) {
    barSeven=0;
  }
  fill(0, 255, 249, 75);
  stroke(255);
  rect(40, 30, barForty, 500);
  barForty+=.09;
  if (barForty>36) {
    barForty=0;
  }
  fill(0, 23, 255, 75);
  stroke(255);
  rect(40, 30, barFortyOne, 490);
  barFortyOne+=.09;
  if (barFortyOne>36) {
    barFortyOne=0;
  }
  fill(207, 0, 255, 75);
  stroke(255);
  rect(40, 30, barFortyTwo, 480);
  barFortyTwo+=.09;
  if (barFortyTwo>36) {
    barFortyTwo=0;
  }
  fill(135, 20, 167, 75);
  stroke(255);
  rect(40, 30, barFortyThree, 470);
  barFortyThree+=.09;
  if (barFortyThree>33) {
    barFortyThree=0;
  }
  fill(255, 0, 166, 75);
  stroke(255);
  rect(40, 30, barFortyFour, 460);
  barFortyFour+=.09;
  if (barFortyFour>33) {
    barFortyFour=0;
  }
  fill(255, 0, 0, 75);
  stroke(255);
  rect(40, 30, barFortyFive, 450);
  barFortyFive+=.09;
  if (barFortyFive>33) {
    barFortyFive=0;
  }
  fill(255, 166, 0, 75);
  stroke(255);
  rect(40, 30, barFortySix, 440);
  barFortySix+=.09;
  if (barFortySix>33) {
    barFortySix=0;
  }
  fill(255, 243, 0, 75);
  stroke(255);
  rect(40, 30, barFortySeven, 430);
  barFortySeven+=.09;
  if (barFortySeven>33) {
    barFortySeven=0;
  }
  fill(20, 255, 0, 75);
  stroke(255);
  rect(40, 30, barFortyEight, 420);
  barFortyEight+=.09;
  if (barFortyEight>33) {
    barFortyEight=0;
  }
  fill(0, 255, 249, 75);
  stroke(255);
  rect(40, 30, barFortyNine, 410);
  barFortyNine+=.09;
  if (barFortyNine>33) {
    barFortyNine=0;
  }
  fill(0, 23, 255, 75);
  stroke(255);
  rect(40, 30, barFifty, 405);
  barFifty+=.09;
  if (barFifty>33) {
    barFifty=0;
  }
  
  
  

  if (mousePressed) {

    //1%
    fill(255, 0, 0, 95);
    rect(0, 0, barOne, 900);
    stroke(255);
    barOne+=.2;
    if ( barOne > 246) {
      barOne=0;
    }

    fill(255, 0, 0, 75);
    stroke(255);
    rect(0, 0, barTwo, 890);
    barTwo+=.09;
    if (barTwo>120) {
      barTwo=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(0, 0, barThree, 880);
    barThree+=.09;
    if (barThree>102) {
      barThree=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(0, 0, barFour, 870);
    barFour+=.09;
    if (barFour>96) {
      barFour=0;
    }


    fill(255, 0, 0, 75);
    rect(0, 0, barFive, 860);
    barFive+=.09;
    if (barFive>93) {
      barFive=0;
    }

    fill(255, 0, 0, 75);
    stroke(255);
    rect(0, 0, barSix, 850);
    barSix+=.09;
    if (barSix>90) {
      barSix=0;
    }

    fill(255, 0, 0, 75);
    stroke(255);
    rect(0, 0, barSeven, 840);
    barSeven+=.09;
    if (barSeven>87) {
      barSeven=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(0, 0, barEight, 830);
    barEight+=.09;
    if (barEight>87) {
      barEight=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(0, 0, barNine, 820);
    barNine+=.09;
    if (barNine>84) {
      barNine=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(0, 0, barTen, 810);
    barTen+=.09;
    if (barTen>81) {
      barTen=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(20, 0, barEleven, 800);
    barEleven+=.09;
    if (barEleven>75) {
      barEleven=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(20, 0, barTwelve, 790);
    barTwelve+=.09;
    if (barTwelve>69) {
      barTwelve=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(20, 0, barThirteen, 780);
    barThirteen+=.09;
    if (barThirteen>69) {
      barThirteen=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(20, 0, barFourteen, 770);
    barFourteen+=.09;
    if (barFourteen>69) {
      barFourteen=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(20, 0, barFifteen, 760);
    barFifteen+=.09;
    if (barFifteen>66) {
      barFifteen=0;
    }
    fill(3, 255, 0, 75);
    stroke(255);
    rect(20, 0, barSixteen, 750);
    barSixteen+=.09;
    if (barSixteen>66) {
      barSixteen=0;
    }
    fill(3, 255, 0, 75);
    stroke(255);
    rect(20, 0, barSeventeen, 740);
    barSeventeen+=.09;
    if (barSeventeen>63) {
      barSeventeen=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(20, 0, barEighteen, 730);
    barEighteen+=.09;
    if (barEighteen>63) {
      barEighteen=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(20, 0, barNineteen, 720);
    barNineteen+=.09;
    if (barNineteen>60) {
      barNineteen=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(20, 0, barTwenty, 710);
    barTwenty+=.09;
    if (barTwenty>54) {
      barTwenty=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(40, 30, barTwentyOne, 700);
    barTwentyOne+=.09;
    if (barTwentyOne>54) {
      barTwentyOne=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(40, 30, barTwentyTwo, 690);
    barTwentyTwo+=.09;
    if (barTwentyTwo>51) {
      barTwentyTwo=0;
    }
    fill(3, 255, 0, 75);
    stroke(255);
    rect(40, 30, barTwentyThree, 680);
    barTwentyThree+=.09;
    if (barTwentyThree>51) {
      barTwentyThree=0;
    }
    fill(3, 255, 0, 75);
    stroke(255);
    rect(40, 30, barTwentyFour, 670);
    barTwentyFour+=.09;
    if (barTwentyFour>48) {
      barTwentyFour=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(40, 30, barTwentyFive, 660);
    barTwentyFive+=.09;
    if (barTwentyFive>48) {
      barTwentyFive=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(40, 30, barTwentySix, 650);
    barTwentySix+=.09;
    if (barTwentySix>45) {
      barTwentySix=0;
    }
    fill(3, 255, 0, 75);
    stroke(255);
    rect(40, 30, barTwentySeven, 640);
    barTwentySeven+=.09;
    if (barTwentySeven>45) {
      barTwentySeven=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(40, 30, barTwentyEight, 630);
    barTwentyEight+=.09;
    if (barTwentyEight>45) {
      barTwentyEight=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(40, 30, barTwentyNine, 620);
    barTwentyNine+=.09;
    if (barTwentyNine>45) {
      barTwentyNine=0;
    }
    fill(3, 255, 0, 75);
    stroke(255);
    rect(0, 50, barThirty, 610);
    barThirty+=.09;
    if (barThirty>42) {
      barThirty=0;
    }
    fill(3, 255, 0, 75);
    stroke(255);
    rect(0, 50, barThirtyOne, 600);
    barThirtyOne+=.09;
    if (barThirtyOne>42) {
      barThirtyOne=0;
    }
    fill(3, 255, 0, 75);
    stroke(255);
    rect(0, 50, barThirtyTwo, 590);
    barThirtyTwo+=.09;
    if (barThirtyTwo>42) {
      barThirtyTwo=0;
    }
    fill(3, 255, 0, 75);
    stroke(255);
    rect(0, 50, barThirtyThree, 580);
    barThirtyThree+=.09;
    if (barThirtyThree>39) {
      barThirtyThree=0;
    }
    fill(3, 255, 0, 75);
    stroke(255);
    rect(0, 50, barThirtyFour, 570);
    barThirtyFour+=.09;
    if (barThirtyFour>39) {
      barThirtyFour=0;
    }
    fill(3, 255, 0, 75);
    stroke(255);
    rect(0, 50, barThirtyFive, 560);
    barThirtyFive+=.09;
    if (barThirtyFive>39) {
      barThirtyFive=0;
    }
    fill(3, 255, 0, 75);
    stroke(255);
    rect(0, 50, barThirtySix, 550);
    barThirtySix+=.09;
    if (barThirtySix>39) {
      barThirtySix=0;
    }
    fill(3, 255, 0, 75);
    stroke(255);
    rect(0, 50, barThirtySeven, 540);
    barThirtySeven+=.09;
    if (barThirtySeven>36) {
      barThirtySeven=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(0, 50, barThirtyEight, 530);
    barThirtyEight+=.09;
    if (barThirtyEight>36) {
      barThirtyEight=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(0, 50, barThirtyNine, 520);
    barThirtyNine+=.09;
    if (barThirtyNine>36) {
      barThirtyNine=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(40, 30, barSeven, 510);
    barSeven+=.09;
    if (barSeven>36) {
      barSeven=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(40, 30, barForty, 500);
    barForty+=.09;
    if (barForty>36) {
      barForty=0;
    }
    fill(3, 255, 0, 75);
    stroke(255);
    rect(40, 30, barFortyOne, 490);
    barFortyOne+=.09;
    if (barFortyOne>36) {
      barFortyOne=0;
    }
    fill(3, 255, 0, 75);
    stroke(255);
    rect(40, 30, barFortyTwo, 480);
    barFortyTwo+=.09;
    if (barFortyTwo>36) {
      barFortyTwo=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(40, 30, barFortyThree, 470);
    barFortyThree+=.09;
    if (barFortyThree>33) {
      barFortyThree=0;
    }
    fill(3, 255, 0, 75);
    stroke(255);
    rect(40, 30, barFortyFour, 460);
    barFortyFour+=.09;
    if (barFortyFour>33) {
      barFortyFour=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(40, 30, barFortyFive, 450);
    barFortyFive+=.09;
    if (barFortyFive>33) {
      barFortyFive=0;
    }
    fill(3, 255, 0, 75);
    stroke(255);
    rect(40, 30, barFortySix, 440);
    barFortySix+=.09;
    if (barFortySix>33) {
      barFortySix=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(40, 30, barFortySeven, 430);
    barFortySeven+=.09;
    if (barFortySeven>33) {
      barFortySeven=0;
    }
    fill(3, 255, 0, 75);
    stroke(255);
    rect(40, 30, barFortyEight, 420);
    barFortyEight+=.09;
    if (barFortyEight>33) {
      barFortyEight=0;
    }
    fill(3, 255, 0, 75);
    stroke(255);
    rect(40, 30, barFortyNine, 410);
    barFortyNine+=.09;
    if (barFortyNine>33) {
      barFortyNine=0;
    }
    fill(255, 0, 0, 75);
    stroke(255);
    rect(40, 30, barFifty, 405);
    barFifty+=.09;
    if (barFifty>33) {
      barFifty=0;
    }
  }
}



