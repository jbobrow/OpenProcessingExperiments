
int page = 1;

PFont font;
PFont font2;

PImage silent;

PImage one;
PImage two;

int b1x = 125;
int b1y = 410;
int b1w = 75;
int b1h = 35;

int b2x = 400;
int b2y = 410;
int b2w = 75;
int b2h = 35;

int b3x = 265;
int b3y = 410;
int b3w = 75;
int b3h = 35;

void setup() {
  size(640, 480); 
  smooth();
  font = loadFont("Cochin-14.vlw");
  textFont(font);
  
  silent = loadImage("silentfilm.png");

}

void draw() {
  if (page == 1) {
    pageOne();
  }else if (page == 2) {
    pageTwo();
  }else if (page == 3) {
    pageThree();
  }else if (page == 4) {
    pageFour();
  }else if (page == 5) {
    pageFive();
  }else if (page == 6) {
    pageSix();
  }else if (page == 7) {
    pageSeven();
  }else if (page == 8) {
    pageEight();
  }else if (page == 9) {
    pageNine();
  }else if (page == 10) {
    pageTen();
  }else if (page == 11) {
    pageEleven();
  }else if (page == 12) {
    pageTwelve();
  }else if (page == 13) {
    pageThirteen();
  }else if (page == 14) {
    pageFourteen();
  }else if (page == 15) {
    pageFifteen();
  }else if (page == 16) {
    pageSixteen();
  }else if (page == 17) {
    pageSeventeen();
  }else if (page == 18) {
    pageEighteen();
  }else if (page == 19) {
    pageNineteen();
  }else if (page == 20) {
    pageTwenty();
  }else if (page == 21) {
    pageTwentyone();
  }else if (page == 22) {
    pageTwentytwo();
  }else if (page == 23) {
    pageTwentythree();
  }else if (page == 24) {
    pageTwentyfour();
  }else if (page == 25) {
    pageTwentyfive();
  }else if (page == 26) {
    pageTwentysix();
  }else if (page == 27) {
    pageTwentyseven();
  }else if (page == 28) {
    pageTwentyeight();
  }else if (page == 29) {
    pageTwentynine();
  }else if (page == 30) {
    pageThirty();
  }else if (page == 31) {
    pageThirtyone();
  }else if (page == 32) {
    pageThirtytwo();
  }else if (page == 33) {
    pageThirtythree();
  } else if (page == 34) {
    pageThirtyfour();
  }else if (page == 35) {
    pageThirtyfive();
  }else if (page == 36) {
    pageThirtysix();
  }else if (page == 37) {
    pageThirtyseven();  
  }else if (page == 38) {
    pageThirtyeight();  
  }else if (page == 39) {
    pageThirtynine();  
  }else if (page == 40) {
    pageForty();  
  }else if (page == 41) {
    pageFortyone();  
  }else if (page == 42) {
    pageFortytwo();  
  }else if (page == 43) {
    pageFortythree();  
  }else if (page == 44) {
    pageFortyfour();
  }else if (page == 45) {
    pageFortyfive();
  }else if (page == 46) {
    pageFortysix();
  }else if (page == 47) {
    pageFortyseven();
  }else if (page == 48) {
    pageFortyeight();
  }else if (page == 49) {
    pageFortynine();
  }else if (page == 50) {
    pageFifty();
  }else if (page == 51) {
    pageFiftyone();
  }else if (page == 52) {
    pageFiftytwo();
  }else if (page == 53) {
    pageFiftythree();
  }else if (page == 54) {
    pageFiftyfour();
  }else if (page == 55) {
    pageFiftyfive();
  }else if (page == 56) {
    pageFiftysix();
  }else if (page == 57) {
    pageFiftyseven();
  }else if (page == 58) {
    pageFiftyeight();
  }else if (page == 59) {
    pageFiftynine();
  }else if (page == 60) {
    pageSixty();
  }else if (page == 61) {
    pageSixtyone();
  }else if (page == 62) {
    pageSixtytwo();
  }else if (page == 63) {
    pageSixtythree();
  }else if (page == 64) {
    pageSixtyfour();
  }else if (page == 65) {
    pageSixtyfive();
  }else if (page == 66) {
    pageSixtysix();
  }else if (page == 67) {
    pageSixtyseven();
  }else if (page == 68) {
    pageSixtyeight();
  }else if (page == 69) {
    pageSixtynine();
  }else if (page == 70) {
    pageSeventy();
  }else if (page == 71) {
    pageSeventyone();
  }else if (page == 72) {
    pageSeventytwo();
  }else if (page == 73) {
    pageSeventythree();
  }else if (page == 74) {
    pageSeventyfour();
  }else if (page == 75) {
    pageSeventyfive();
  }else if (page == 76) {
    pageSeventysix();
  }else if (page == 77) {
    pageSeventyseven();
  }else if (page == 78) {
    pageSeventyeight();
  }else if (page == 79) {
    pageSeventynine();
  }else if (page == 80) {
    pageEighty();
  }else if (page == 81) {
    pageEightyone();
  }else if (page == 82) {
    pageEightytwo();
  }else if (page == 83) {
    pageEightythree();
  }else if (page == 84) {
    pageEightyfour();
  }else if (page == 85) {
    pageEightyfive();
  }else if (page == 86) {
    pageEightysix();
  }else if (page == 87) {
    pageEightyseven();
  }else if (page == 88) {
    pageEightyeight();
  }else if (page == 89) {
    pageEightynine();
  }else if (page == 90) {
    pageNinety();
  }else if (page == 91) {
    pageNinetyone();
  }else if (page == 92) {
    pageNinetytwo();
  }else if (page == 93) {
    pageNinetythree();
  }else if (page == 94) {
    pageNinetyfour();
  }else if (page == 95) {
    pageNinetyfive();
  }else if (page == 96) {
    pageNinetysix();
  }else if (page == 97) {
    pageNinetyseven();
  }else if (page == 98) {
    pageNinetyeight();
  }else if (page == 99) {
    pageNinetynine();
  }else if (page == 100) {
    pageHundred();
  }else if (page == 101) {
    pageHundredone();
  }else if (page == 102) {
    pageHundredtwo();
  }else if (page == 103) {
    pageHundredthree();
  }else if (page == 104) {
    pageHundredfour();
  }else if (page == 105) {
    pageHundredfive();
  }else if (page == 106) {
    pageHundredsix();
  }else if (page == 107) {
    pageHundredseven();
  }else if (page == 108) {
    pageHundredeight();
  }else if (page == 109) {
    pageHundrednine();
  }else if (page == 110) {
    pageHundredten();
  }else if (page == 111) {
    pageHundredeleven();
  }else if (page == 112) {
    pageHundredtwelve();
  }else if (page == 113) {
    pageHundredthirteen();
  }else if (page == 114) {
    pageHundredfourteen();
  }else if (page == 115) {
    pageHundredfifteen();
  }
}

void mousePressed() {
  if (page == 1) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 2;} 
    else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 3;}
  } else if (page == 2) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 4;}
    else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 5;}
  } else if (page == 3) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 6;}
    else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 7;}
  } else if (page == 4) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 8;}
   } else if (page == 5) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 9;}
    } else if (page == 6) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 10;}
    else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 11;}
    }else if (page == 7) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 12;}
    }else if (page == 8) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 13;}
    else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 14;}
    } else if (page == 9) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 15;}
    else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 16;}
    }
    else if (page == 10) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 17;}
    }else if (page == 11) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 18;}
    }else if (page == 12) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 19;}
    else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 20;}   
    else if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 21;}
    }else if (page == 13) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 22;}
    }else if (page == 14) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 23;
    }
    }else if (page == 15) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 24;
    }
    }else if (page == 16) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 25;
    }
    }else if (page == 17) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 26;
    }
    }else if (page == 18) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 27;
    }   
    else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 28;}
    }else if (page == 19) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 29;
    }
    }else if (page == 20) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 30;
    }
    }else if (page == 21) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 31;
    }
    }else if (page == 22) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 32;
    } else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 33;}
    }else if (page == 23) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 34;
    } else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 35;}
    }else if (page == 24) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 36;
    } else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 37;}
    }else if (page == 25) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 38;
    }else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 39;}
    }else if (page == 26) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 40;
    }else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 41;}
    }else if (page == 27) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 42;
    }else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 43;}
    }else if (page == 28) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 44;}
    }else if (page == 29) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 45;}
      else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 46;}
    }else if (page == 30) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 47;}
      else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 48;}
    }else if (page == 31) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 19;}
      else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 20;}
    }else if (page == 32) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 49;}
    }else if (page == 33) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 50;}
    }else if (page == 34) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 51;}
    }else if (page == 35) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 52;}
    }else if (page == 36) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 53;}
    }else if (page == 37) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 53;}
    }else if (page == 38) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 54;}
    }else if (page == 39) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 55;}
    }else if (page == 39) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 55;}
    }else if (page == 40) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 56;}
      else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 57;}
    }else if (page == 41) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 58;}
      else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 59;}
    }else if (page == 42) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 60;}
    }else if (page == 43) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 61;}
      else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 62;}
    }else if (page == 44) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 63;}
      else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 64;}
    }else if (page == 45) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;}
    }else if (page == 46) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 65;}
    }else if (page == 47) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 66;}
    }else if (page == 48) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 67;}
    }else if (page == 49) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 68;}
    }else if (page == 50) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 69;}
    }else if (page == 51) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 70;}
      else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 71;}
    }else if (page == 52) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 70;}
      else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 71;}
    }else if (page == 53) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 72;}
      else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 73;}
    }else if (page == 54) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 74;}
      else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 75;}
    }else if (page == 55) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 76;}
      else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 75;}
    }else if (page == 56) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 77;}
    }else if (page == 57) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 78;}
    }else if (page == 58) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 77;}
    }else if (page == 59) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 79;}
    }else if (page == 60) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;}
    }else if (page == 61) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 80;}
    }else if (page == 62) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 81;}
    }else if (page == 63) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 82;}
    }else if (page == 64) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 83;}
    }else if (page == 65) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 84;}
    }else if (page == 66) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 85;}
    }else if (page == 66) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 85;}
    }else if (page == 67) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 86;}
    }else if (page == 68) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 87;}
      else if(overButton(b2x, b2y, b2w, b2h) == true) {
      page = 87;}
    }else if (page == 69) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 88;}
      else if(overButton(b2x, b2y, b2w, b2h) == true) {
      page = 89;}
    }else if (page == 70) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;}
    }else if (page == 71) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;}
    }else if (page == 72) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;}
    }else if (page == 73) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 90;}
    }else if (page == 74) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 91;}
    }else if (page == 75) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;}
    }else if (page == 76) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 92;}
      else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 93;}
    }else if (page == 77) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 94;}
    }else if (page == 78) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 95;}
    }else if (page == 79) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 96;}
    }else if (page == 80) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 97;}
    }else if (page == 81) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 98;}
      else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 89;}
    }else if (page == 82) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 99;}
    }else if (page == 83) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 100;}
    }else if (page == 84) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 101;}
    }else if (page == 85) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;}
    }else if (page == 86) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 102;}
    }else if (page == 87) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;}
    }else if (page == 88) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;}
    }else if (page == 89) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;}
    }else if (page == 90) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 103;}
    }else if (page == 91) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 104;}
    }else if (page == 92) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;}
    }else if (page == 93) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 105;}
    }else if (page == 94) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 106;}
    }else if (page == 95) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 107;}
    }else if (page == 96) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 108;}
    }else if (page == 97) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;}
    }else if (page == 98) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;}
    }else if (page == 99) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;}
    }else if (page == 100) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 109;}
    }else if (page == 101) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 110;}
    }else if (page == 102) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 111;}
    else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 89;}
    }else if (page == 103) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 1;} 
    }else if (page == 104) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 1;} 
    }else if (page == 105) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 112;}
    else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 89;}
    }else if (page == 106) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 113;} 
    }else if (page == 107) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 114;} 
    }else if (page == 108) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 115;}
    }else if (page == 109) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;}
    }else if (page == 110) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;} 
    }else if (page == 111) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;} 
    }else if (page == 112) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;} 
    }else if (page == 113) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;} 
    }else if (page == 114) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;} 
    }else if (page == 115) {
    if (overButton(b3x, b3y, b3w, b3h) == true) {
      page = 1;} 
    }
  }

boolean overButton(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true; 
  } 
  else {
    return false; 
  }
}

//PAGE 1

void pageOne() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You emerge from the grave in Rabbit's front yard.",320,25);
  text("In the back of your slowly decaying mind you seek revenge and/or brains.",320,45);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Go into", b1x + b1w/2, b1y+20);
  text("Rabbit's House", b1x + b1w/2, b1y + 40);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Go into", b2x + b2w/2, b2y+20);
  text("Tulgey Woods", b2x + b2w/2, b2y + 40);
  
}

//PAGE 2

void pageTwo() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Rabbit's house is small, cozy and decidedly brain-free.",320,25);
  text("A side table is lined with decadent cakes and fizzy drinks, labelled 'Eat Me' and 'Drink Me.'",320,45);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Eat Me", b1x + b1w/2, b1y+30);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Drink Me", b2x + b2w/2, b2y+30);
  
}

//PAGE 3

void pageThree() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You enter the woods and encounter a merry tea party.",320,25);
  text("The guests appear to be a rabbit, a fat mouse and a man with a large hat.",320,45);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Drink and", b1x + b1w/2, b1y+20);
  text("make conversation", b1x + b1w/2, b1y + 40);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat their", b2x + b2w/2, b2y+20);
  text("brains", b2x + b2w/2, b2y + 40);
  
}

//PAGE 4

void pageFour() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You eat the cake greedily, and immediately shoot upwards in size.",320,25);
  text("Your limbs stick out of the doors and windows, filling the entire house with your zombie body.",320,45);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

//PAGE 5

void pageFive() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You gulp down the drink, and shrink rapidly to a very small size.",320,25);
  text("Very confused, you amble uncoordinatedly towards the door and climb out the keyhole.",320,45);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

//PAGE 6

void pageSix() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You sit at the table, where the man in the hat proceeds to annoy you with riddles. Your patience is waning.",320,25);
  text("Everyone changes seats and the 'Mad Hatter' offers you tea.",320,45);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Drink tea", b1x + b1w/2, b1y+30);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Refuse and leave", b2x + b2w/2, b2y+30);
  
}

//PAGE 7

void pageSeven() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You devour the brains of all three members of the tea party, without asking for names or even saying hello.",320,25);
  text("When the police find this you will probably be wanted for murder. Your kill count has raised to 3.",320,45);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

//PAGE 8

void pageEight() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("All of a sudden a panicked Rabbit arrives, with a Dodo bird and a Lizard gardener in tow.",320,25);
  text("They discuss setting the house on fire to smoke you out. You have to act fast.",320,45);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Grab a carrot", b1x + b1w/2, b1y+20);
  text("from the garden", b1x + b1w/2, b1y+40);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat their brains", b2x + b2w/2, b2y+30);
  
}

//PAGE 9

void pageNine() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You amble into the garden, where you encounter a large foul-smelling Caterpillar smoking hookah.",320,25);
  text("He asks you for a favor, for which he says you will be rewarded.",320,45);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Listen to the", b1x + b1w/2, b1y+20);
  text("Caterpillar", b1x + b1w/2, b1y+40);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat its brains", b2x + b2w/2, b2y+30);
  
}

//PAGE 10

void pageTen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Immediately after your first sip you feel a weird sensation and numbness from your head to toes.",320,25);
  text("The 'Mad Hatter' is really a Necromancer! He now has complete control over your decisions.",320,45);
  text("You should have known better.",320,65);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageEleven() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You gurgle a goodbye and wander away from the tea party. They don't seem to notice your absence.",320,25);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageTwelve() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Deeper into the woods you meet a grinning tabby cat at a fork in the road. 'Alice,' it says, grinning wider.",320,25);
  text("'You've changed so much since our paths last crossed.'",320,45);
  text("All you can do is gurgle, as your vocal chords decayed sometime while eating the tea party.",320,65);
  
    //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Go left", b1x + b1w/2, b1y+30);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Go right", b2x + b2w/2, b2y+30);
  
      //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Eat its brains", b3x + b3w/2, b3y+30);
  
}

//PAGE 13

void pageThirteen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You nibble on a carrot and shrink just as rapidly as you grew.",320,25);
  text("As quickly as possible you zombie-shuffle out the front door.",320,45);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

//PAGE 14

void pageFourteen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You snatch up and mercilessly devour all three aggravators.",320,25);
  text("Animal brains are not particularly satisfying, but it's all you have on hand.",320,45);
  text("When the police find this you will probably be wanted for murder. Your kill count has raised to 3.",320,65);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

// PAGE 15

void pageFifteen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("The Caterpillar gives you a broken hookah pipe and asks you to take it to the castle to be repaired.",320,25);
  text("As payment up front, he gives you a mushroom that makes you grow bigger or smaller.",320,45);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

// PAGE 16

void pageSixteen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Voraciously you eat the Caterpillar's tiny brain. It is barely filling and withered from too much smoking.",320,25);
  text("Caterpillars are too small to be noticed by police, so you are probably safe. Your kill count has raised to 1.",320,45);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

// PAGE 17

void pageSeventeen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("The guests send you out into the woods. 'I have a task for you,' says the voice of the Hatter in your head.",320,25);
  text("'With my cunning and magic and your brute strength you will accomplish it easily.",320,45);
  text("I need you to kill the Queen of Hearts.'",320,65);
  
    //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageEighteen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Deeper into the woods you meet a grinning tabby cat in a tree",320,25);
  text("It pulls a branch and opens a secret passage in the tree. 'If you want to find out why you're dead,",320,45);
  text("I'd advise you seek your answers through here,' says the Cat enigmatically.",320,65);
  
    //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Go through", b1x + b1w/2, b1y+20);
  text("secret passage", b1x + b1w/2, b1y+40);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat its brains", b2x + b2w/2, b2y+30);
  
}

// PAGE 19

void pageNineteen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You go down the left path.",320,25);
  text("At the end of the path you see a house in a clearing. Outside are two footmen standing by the door.",320,45);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

// PAGE 20

void pageTwenty() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You go down the right path.",320,25);
  text("Further down the road you see the White Rabbit. You decide to follow him closely.",320,45);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

// PAGE 21

void pageTwentyone() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You leap at the Cat, but he vanishes between your fingers like smoke.",320,25);
  text("All that you see before he disappears completely are two eyes, glowing white without pupils,",320,45);
  text(" and a set of white teeth fixed in a wicked smile.",320,65);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

// PAGE 22

void pageTwentytwo() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You enter the woods and encounter a merry tea party.",320,25);
  text("The guests appear to be a rabbit, a fat mouse and a man with a large hat.",320,45);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Drink and", b1x + b1w/2, b1y+20);
  text("make conversation", b1x + b1w/2, b1y + 40);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat their", b2x + b2w/2, b2y+20);
  text("brains", b2x + b2w/2, b2y + 40);
  
}

// PAGE 23

void pageTwentythree() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You hurry through the woods as fast as you can. Three of your toes decay off your feet and are left behind.",320,25);
  text("At the end of the path is a grinning tabby cat in a tree.",320,45);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Talk to", b1x + b1w/2, b1y+20);
  text("Cheshire Cat", b1x + b1w/2, b1y + 40);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat its", b2x + b2w/2, b2y+20);
  text("brains", b2x + b2w/2, b2y + 40);
  
}

// PAGE 24


void pageTwentyfour() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You hurry further into the woods, still tiny, and soon become lost.",320,25);
  text("A group of nearby sentient flowers start haranguing you, calling you names like 'weed' and 'dumb zombie.'",320,45);
  text("You were Oxford educated. You don't have to put up with this.",320,65);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Eat the", b1x + b1w/2, b1y+20);
  text("mushrooms", b1x + b1w/2, b1y+40);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Destroy the", b2x + b2w/2, b2y+20);
  text("flowers", b2x + b2w/2, b2y + 40);
}

// PAGE 25

void pageTwentyfive() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You break into a run, which is really a sort of pathetic hobble at this point, until something stops you.", 320, 25);
  text("A large, hungry-looking puppy is blocking your path, wagging its tail with its eyes fixed on you.", 320,45);
  
   //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Play with the", b1x + b1w/2, b1y+20);
  text("puppy", b1x + b1w/2, b1y+40);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Run for your", b2x + b2w/2, b2y+20);
  text("life", b2x + b2w/2, b2y + 40);
}

// PAGE 26

void pageTwentysix() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("The Hatter gives you directions to a large, peppery-smelling house.", 320, 25);
  text("'You need to acquire an invitation to the palace from the Duchess,' says the Hatter.", 320,45);
  text("A frog and a fish footman are standing attentively outside the door, which seems to be ajar.", 320,65);
  
   //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Go inside", b1x + b1w/2, b1y+30);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Talk to the", b2x + b2w/2, b2y+20);
  text("footmen", b2x + b2w/2, b2y + 40);
}

// PAGE 26

void pageTwentyseven() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Crawling awkwardly through the door in the tree, you enter a garden.", 320, 25);
  text("Three anthropomorphic cards are painting white roses with red paint. They're not doing a great job.", 320,45);
  
   //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Help them paint", b1x + b1w/2, b1y+30);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Continue through", b2x + b2w/2, b2y+20);
  text("the garden", b2x + b2w/2, b2y + 40);
}

// PAGE 28

void pageTwentyeight() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You leap at the Cat, but he vanishes between your fingers like smoke.",320,25);
  text("All that you see before he disappears completely are two eyes, glowing white without pupils,",320,45);
  text(" and a set of white teeth fixed in a wicked smile.",320,65);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

// PAGE 29

void pageTwentynine() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You bypass the footmen and enter the house.",320,25);
  text("Inside are a duchess with a large head, a large wailing baby, a nurse and a cat.",320,45);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Talk to the", b1x + b1w/2, b1y+20);
  text("Duchess", b1x + b1w/2, b1y+40);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat their brains", b2x + b2w/2, b2y+30);
  
}

// PAGE 30

void pageThirty() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You catch up to the White Rabbit at the edge of a river.",320,25);
  text("The Rabbit looks nervous. You get the feeling that the Rabbit is hiding something.",320,45);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Interrogate the", b1x + b1w/2, b1y+20);
  text("Rabbit", b1x + b1w/2, b1y+40);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat its brains", b2x + b2w/2, b2y+30);
  
}

//PAGE 31

void pageThirtyone(){
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Catless, you return to the road.",320,25);
  
    //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Go left", b1x + b1w/2, b1y+30);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Go right", b2x + b2w/2, b2y+30);
  
}

//PAGE 32

void pageThirtytwo() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You sit down for tea and try to be civil.",320,25);
  text("The man in the hat leaps up just as you sit down. 'And now for the dinner entertainment!' he proclaims.",320,45);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

//PAGE 33

void pageThirtythree() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You devour the brains of all three members of the tea party, without asking for names or even saying hello.",320,25);
  text("When the police find this you will probably be wanted for murder. Your kill count has raised to 3.",320,45);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}


//PAGE 34

void pageThirtyfour() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("The cat hands you a jeweled sword, and solemnly points into the woods ahead.",320,25);
  text("'That thing that lies ahead,' it says, 'is tempermental and extremely dangerous.",320,45);
  text("I'd be wary if I were you.' His mouth splits into a wicked grin.",320,65);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
}

//PAGE 35
void pageThirtyfive() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You leap at the Cat, but he vanishes between your fingers like smoke.",320,25);
  text("All that you see before he disappears completely are two eyes, glowing white without pupils,",320,45);
  text("and a set of white teeth fixed in a wicked smile.",320,65);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
}


//PAGE 36
void pageThirtysix() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You eat the mushroom and grow to normal size.",320,25);
  text("All this growing and shrinking so quickly is taking a toll on your undead body,",320,45);
  text("and one of your hands drops to the ground as you continue on your way.",320,65);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
}

//PAGE 37
void pageThirtyseven() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("With an incredibly intimidating moan you hack and mangle every flower within reach.",320,25);
  text("Flowers have no brains to speak of, so you feel less satisfaction afterwards with the carnage you've created,",320,45);
  text("and one of your hands drops to the ground as you continue on your way.",320,65);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
}

//PAGE 38
void pageThirtyeight() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You throw a stick around and try to amuse the puppy.",320,25);
  text("The puppy runs around for a bit before it gets tired. You get away quite safely.",320,45);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
}

//PAGE 39
void pageThirtynine() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Immediately you break into your signature run, but are of course too slow for a large four-legged animal.",320,25);
  text("The puppy excitedly leaps and bites off one of your arms as you run past. Way to go.",320,45);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
}

//PAGE 40
void pageForty() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Inside you see the Duchess, a nasty ill-tempered woman with a large head.",320,25);
  text("She throws her baby at you and screeches about the croquet game at the Palace she is about to attend.",320,45);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Ask about the", b1x + b1w/2, b1y+20);
  text("game", b1x + b1w/2, b1y+40);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat their brains", b2x + b2w/2, b2y+30);
}

//PAGE 41
void pageFortyone() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("The footmen are very unhelpful, as they can only make their respective animal noises. What a shame.",320,25);
  text("One of them is holding an unlabelled envelope, which may or may not be the invitation.",320,45);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Ask about the", b1x + b1w/2, b1y+20);
  text("envelope", b1x + b1w/2, b1y+40);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat their brains", b2x + b2w/2, b2y+30);
}

//PAGE 42
void pageFortytwo() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You grab a brush and try to remedy their paint job, but you are a zombie, and your motor skills are weak.",320,25);
  text("What's more, your arm drops clean off from all the strain of holding your arm up.",320,45);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
}

//PAGE 43
void pageFortythree() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Walking through the garden, you encounter a croquet game.",320,25);
  text("The Queen of Hearts is playing, as are several other royal guests.",320,45);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Join the game", b1x + b1w/2, b1y+30);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat her brains", b2x + b2w/2, b2y+30);
}

//PAGE 44
void pageFortyfour() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Catless, you return to the road. The secret passage is gone, so you continue through the woods.",320,25);
  text("You reach a riverbank where a lobster seems to be preening itself.",320,45);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Talk to the", b1x + b1w/2, b1y+20);
  text("lobster", b1x + b1w/2, b1y+40);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat its brains", b2x + b2w/2, b2y+30);
}

//PAGE 45
void pageFortyfive() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You try to talk to the Duchess, but your vocal chords have long since disintegrated.",320,25);
  text("With one swift stroke the Duchess stands and swipes at you with a katana. You had forgotten that she is",320,45);
  text("a trained samurai swordsmaster, but by this time you have already been chopped in half. Too late.",320,65);
  
  text("Kill Count: 3",300,395);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("Game Over", b3x + b3w/2, b3y+30);
}

//PAGE 46
void pageFortysix() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You efficiently devour the brains and limbs of the Duchess, the nurse and the cat, as well as the two guards.",320,25);
  text("The baby has turned into a pig, but you do not eat it, as you have to keep kosher.",320,45);
  text("You are already wanted. Your kill count has raised to 8.",320,65);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

//PAGE 47

void pageFortyseven() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You attempt to interrogate the rabbit, but your vocal chords are gone.",320,25);
  text("You end up just shaking him rigorously by his waistcoat. 'Okay, okay!' he exclaims. 'I think I",320,45);
  text("know what you want! You want to know why you're dead. Follow me.'",320,65);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
}

//PAGE 48
void pageFortyeight() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Without question you destroy and mangle the Rabbit and consume his brains.",320,25);
  text("It's not a great way to get answers, but you're too hungry to care.",320,45);
  text("You are already wanted. Your kill count has raised to 4.",320,65);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

//PAGE 49

void pageFortynine() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You sit down at the table as the curtain opens.",320,25);
  text("A familiar looking man is sitting on the stage, strumming his guitar and singing in a low sultry voice.",320,45);
  text("You barely stifle a gasp as the realization dawns on you...",320,65);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
}

//PAGE 50
void pageFifty() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("As you leave the tea party, a group of guards immediately leaps upon you.",320,25);
  text("'This is a crime scene, and you are under arrest,' announce the guards. Bad luck. They take you to trial.",320,45);
  
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

//PAGE 51
void pageFiftyone() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You hobble ahead with the sword and reach a giant Jabberwocky. You thought it was only a legend.",320,25);
  text("The creature is huge, and extremely pissed off. This could be your moment of glory.",320,45);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Use the sword", b1x + b1w/2, b1y+30);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat its brains", b2x + b2w/2, b2y+30);
  
}

//PAGE 52
void pageFiftytwo() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Catless, you return to the road.",320,25);
  text("You hobble ahead with the sword and reach a giant Jabberwocky! These things are legendary.",320,45);
  text("The creature is huge, and extremely pissed off. This could be your moment of glory.",320,65);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Use the sword", b1x + b1w/2, b1y+30);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat its brains", b2x + b2w/2, b2y+30);
  
}

//PAGE 53
void pageFiftythree() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("After eating the mushrooms, you walk for what seems like forever, holding a hookah pipe in your",320,25);
  text("remaining hand. You reach the Castle and don't know which way to enter.",320,45);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Front gate", b1x + b1w/2, b1y+30);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Back gate", b2x + b2w/2, b2y+30);
  
}

//PAGE 54
void pageFiftyfour() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("After eating the mushroom, you walk for what seems like forever, and reach the Castle.",320,25);
  text("You have a hunch there are answers hidden here. There is a croquet game in progress on the lawn.",320,45);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Join the game", b1x + b1w/2, b1y+30);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Enter the", b2x + b2w/2, b2y+20);
  text("front gate", b2x + b2w/2, b2y+40);
  
}

//PAGE 55
void pageFiftyfive() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Minus an arm you continue to walk for what seems like forever, and reach the Castle.",320,25);
  text("You have a hunch there are answers hidden here. There is a croquet game in progress on the lawn.",320,45);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Join the game", b1x + b1w/2, b1y+30);
  
    //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Enter the front gate", b2x + b2w/2, b2y+30);
  
}

void pageFiftysix() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You ask the duchess about the game, but all she does is screech and carry on.",320,25);
  text("You notice an official looking envelope on the table, and snatch it before leaving the house.",320,45);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageFiftyseven() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You efficiently devour the brains and limbs of the Duchess, the nurse and the cat.",320,25);
  text("The baby has turned into a pig, but you do not eat it, as you have to keep kosher.",320,45);
  text("When the police find this you will probably be wanted for murder. Your kill count has raised to 3.",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageFiftyeight() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You ask the footmen about the envelope, but all they do is ribbit and glug, which is unfortunate.",320,25);
  text("You snatch the envelope from their fingers and make a break for it, banking on the hope that",320,45);
  text("zombies are faster than fish and/or frogs.",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageFiftynine() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You efficiently devour the brains the footmen, and then eat the Duchess, the nurse and the cat.",320,25);
  text("The baby has turned into a pig, but you do not eat it, as you have to keep kosher.",320,45);
  text("When the police find this you will probably be wanted for murder. Your kill count has raised to 5.",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageSixty() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Suddenly security guards raid the site and arrest everyone for destruction of property.",320,25);
  text("You try to fight them off, but you are half-armless and can't put up much of a fight.",320,45);
  text("The riot police quickly put you down.",320,65);
  
  text("Kill Count: 0",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("Game Over", b3x + b3w/2, b3y+30);
  
}

void pageSixtyone() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You grab a flamingo and join the croquet game. While playing, you overhear small pieces of a casual",320,25);
  text("conversation that seems to be about you. You move closer and decide to listen in.",320,45);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageSixtytwo() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Subtlety was never your strong suit. You run at the Queen and attempt to eat her brains, but of course",320,25);
  text("she has armed security guards, who quickly subdue you and take you to trial.",320,45);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageSixtythree() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("The lobster agrees to give you passage across the river, but warns that someone on the other side",320,25);
  text("has a vendetta against you, and you need to be prepared. With that, you cross the river.",320,45);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageSixtyfour() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Lobsters don't really have much of a brain, only a series of nerve endings, really.",320,25);
  text("Not having learned this, you devour the lobster's brain and find yourself disappointed. Now you're without",320,45);
  text("a way to get across the river.",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageSixtyfive() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You leave the house and take the subway to the Castle. You're on a killing spree now, and",320,25);
  text("there are plenty of bodies and brains to be had before your revenge will be fulfilled.",320,45);
  text("You resolved that you would stop at nothing to have the tastiest of brains in all of Wonderland...",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageSixtysix() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("The Rabbit leads you to a large house, that looks familiar and smells strangely of pepper.",320,25);
  text("'This is the house of the Duchess,' explains the Rabbit. 'She ordered me to give her your",320,45);
  text("whereabouts, and ended your life herself. She's a trained samurai, so be careful.'",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

//PAGE
void pageSixtyseven() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You wade into the river and attempt to swim across.",320,25);
  text("A Dormouse swims past and asks if you need passage, but you have no voice so you can't ask him for help.",320,45);
  text("You make it to the other side, but one of your arms peels off and floats downstream.",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

//PAGE 68

void pageSixtyeight() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("IT'S JOHN MAYER.",320,25);
  text("JOHN #*%@ING MAYER. He starts playing 'Your Body Is A Wonderland.'",320,45);
  text("You become enraged at the terrible pun.",320,65);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Eat his brains", b1x + b1w/2, b1y+30);
  
  //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat his brains", b2x + b2w/2, b2y+30);
}

//PAGE 69

void pageSixtynine() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("The trial begins. The King reads out the sentence as the Queen presides over the court.",320,25);
  text("You realize after some time that the trial makes absolutely no sense. You have to get out or your",320,45);
  text("faith in judicial proceedings will be lost forever.",320,65);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Make a run for it", b1x + b1w/2, b1y+30);
  
  //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat everyone's", b2x + b2w/2, b2y+20);
  text("brains", b2x + b2w/2, b2y+40);
}

//PAGE 70
void pageSeventy() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You fight valiantly with the sword. The Jabberwocky lashes its tail and gives a terrifying howl, and you",320,25);
  text("slice off his head, killing it instantly. You are a hero of Wonderland, forgiven for your murders, knighted",320,45);
  text("and given a nice home in the woods to decay in peace. What's more, you get to keep the brain as a reward.",320,65);
  
  text("Kill Count: 4",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("You Win", b3x + b3w/2, b3y+30);
  
}

//PAGE 71
void pageSeventyone() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Did you really think it would be that easy? This is a legendary beast, and a good amount of your",320,25);
  text("toes are missing. These are both factors working against you.",320,45);
  text("You leap at the Jabberwocky, and of course it strikes you down. Dead. The End.",320,65);
  
  text("Kill Count: 3",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("Game Over.", b3x + b3w/2, b3y+30);
  
}

//PAGE 72
void pageSeventytwo() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You walk in the front gate, unafraid and with a clean record.",320,25);
  text("By an unfortunate stroke of luck, one of the guards is asleep at the wheel and the gate.",320,45);
  text("crushes you as you're entering. What a shame.",320,65);
  
  text("Kill Count: 0",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("Game Over.", b3x + b3w/2, b3y+30);
  
}

//PAGE 73
void pageSeventythree() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You creep in the back gate and find the smoke shop. The man laments that he will be up all night working,",320,25);
  text("and gives you his royal summons instead. You proceed up to the castle and the guards let you pass.",320,45);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

//PAGE 74
void pageSeventyfour() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You grab a flamingo and join the croquet game. While playing, you overhear small pieces of a casual",320,25);
  text("conversation that seems to be about you. You move closer and decide to listen in.",320,45);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

//PAGE 75
void pageSeventyfive() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You walk in the front gate, with no fear of retribution for the Caterpillar's death.",320,25);
  text("By an unfortunate stroke of luck, one of the guards is asleep at the wheel and the gate.",320,45);
  text("crushes you as you're entering. Karma's a bitch.",320,65);
  
  text("Kill Count: 1",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("Game Over.", b3x + b3w/2, b3y+30);
  
}

//PAGE 74
void pageSeventysix() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You grab a flamingo and join the croquet game. You do a pretty shoddy job of trying to play, as",320,25);
  text("you are missing an arm. Everyone eyes you suspiciously. The Queen herself walks over in your direction.",320,45);
  text("Quick impulsive thinking!",320,65);
    
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Challenge her", b1x + b1w/2, b1y+20);
  text("to a duel", b1x + b1w/2, b1y+40);
  
  //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat her brains", b2x + b2w/2, b2y+30);
  
}

void pageSeventyseven() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You leave the house and take Wonderland's recently-installed subway to the Castle.",320,25);
  text("During the ride he Hatter enigmatically tells you that 'it would be in your best interest to",320,45);
  text("fulfill this quest.' What could he mean by that...?",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageSeventyeight() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You clean up, leave the house and take Wonderland's recently-installed subway to the Castle.",320,25);
  text("During the ride he Hatter enigmatically tells you that 'it would be in your best interest to",320,45);
  text("fulfill this quest.' What could he mean by that...?",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageSeventynine() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You clean up, leave the house and take Wonderland's recently-installed subway to the Castle.",320,25);
  text("During the ride he Hatter enigmatically tells you that 'it would be in your best interest to",320,45);
  text("fulfill this quest.' What could he mean by that...?",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageEighty() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("'..Red Queen...' '...no improvement in her temper...' '...ever since she had that",320,25);
  text("Alice girl killed...' '...maybe she felt threatened by her?...'",320,45);
  text("With this your resolve is firm, and you drop your flamingo and approach the Queen.",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageEightyone() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("The trial begins. The King reads out the sentence as the Queen presides over the court.",320,25);
  text("You realize after some time that the trial makes absolutely no sense. You have to get out or your",320,45);
  text("faith in judicial proceedings will be lost forever.",320,65);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Make a run for it", b1x + b1w/2, b1y+30);
  
  //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat everyone's", b2x + b2w/2, b2y+20);
  text("brains", b2x + b2w/2, b2y+40);
}

void pageEightytwo() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You cross the shore and enter a clearing, where a figure is waiting for you.",320,25);
  text("The Dodo bird! It all makes sense now. The Dodo was always angry at you for",320,45);
  text("not participating in caucus races. The Dodo stares you down, ready to attack...",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

//PAGE 83
void pageEightythree() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Without transportation, you wade into the river and attempt to swim across.",320,25);
  text("A Dormouse swims past and asks if you need passage.",320,45);
  text("You grab onto its back and swim across.",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

//PAGE 84
void pageEightyfour() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You reach the castle and storm through the front gates, killing and mangling about",320,25);
  text("7 guards as you go. Your kill count has raised to an impressive 15.",320,45);
  text("You proceed up into the main chamber, where the King and Queen reside.",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageEightyfive() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You enter the house where the Duchess is waiting. She has an evil glare in her eyes. You grab a sword",320,25);
  text("laying on the table, and the two of you battle until you trick her into a disadvantaged position. She knows",320,45);
  text("that you must kill her with honor, which you do, before taking your own life, revenge achieved at last.'",320,65);
  
  text("Kill Count: 4",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("You Win", b3x + b3w/2, b3y+30);
  
}

void pageEightysix() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You stumble upon a patrol of guards, who recognize you as a wanted criminal and snatch you",320,25);
  text("up before you have a chance to eat their brains.",320,45);
  text("You are taken to trial.'",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageEightyseven() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You leap with incredible agility onto the stage, and violently rip open his head and consume his brains.",320,25);
  text("Concert security guards run in from all sides and beat you to a pulp, but your soul is at peace.",320,45);
  text("Your kill count has been raised to a glorious 1.",320,65);
  
  text("Kill Count: 1",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("In a way,",b3x + b3w/2, b3y+20);
  text("Everyone Wins",b3x + b3w/2, b3y+40);
  
}

void pageEightyeight() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You make a run for it, and the Queen opens her mouth to order the guards to stop you. But",320,25);
  text("a hovering face with glowing white eyes appears overhead and she panicks. You laugh to yourself as you",320,45);
  text("escape. Maybe there was a good reason for you to have died, now you know",320,65);
  text("there's not just one zombie in Wonderland after all...",320,85);

  
  text("Kill Count: 3",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("You Win",b3x + b3w/2, b3y+30);
  
}

void pageEightynine() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You enter Zombie Beserker mode, and proceed to terrorize the courtroom, tearing apart guests and jury",320,25);
  text("alike. Amidst the panic you crawl up to the stand and violently eat the brains of the King and Queen, the",320,45);
  text("Rabbit, the Duchess, the Hatter, the Hare... Those still alive in Wonderland crown you queen afterwards.",320,65);
  
  text("Kill Count: Unmatched",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("You Win",b3x + b3w/2, b3y+30);
  
}

//PAGE 90
void pageNinety() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You enter the royal chamber, and the Queen eyes you. 'Didn't I kill you already?' she remarks.",320,25);
  text("Your blood boils, and you're starting to see red.",320,45);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageNinetyone(){
 background(0);
  fill(255);
  textAlign(CENTER);
  text("'..Red Queen...' '...no improvement in her temper...' '...ever since she had that",320,25);
  text("Alice girl killed...' '...maybe she felt threatened by her?...'",320,45);
  text("With this your resolve is firm, and you drop your flamingo and approach the Queen.",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
 
}

void pageNinetytwo(){
 background(0);
  fill(255);
  textAlign(CENTER);
  text("The Queen accepts your challenge. You duel on the croquet grounds until you vanquish her",320,25);
  text("with a swift kick in the leg. She pulls out a .44 and shoots you in the chest. Dirty cheater.",320,45);
    
  text("Kill Count: 1",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("Game Over", b3x + b3w/2, b3y+30);
 
}

void pageNinetythree(){
 background(0);
  fill(255);
  textAlign(CENTER);
  text("Subtlety was never your strong suit. You run at the Queen and attempt to eat her brains, but of course",320,25);
  text("she has armed security guards, who quickly subdue you and take you to trial.",320,45);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
 
}

void pageNinetyfour() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You reach the castle and encounter royal guards. For lack of time as well as reasoning",320,25);
  text("power (your brain is disintegrating fast), you devour all three. Your kill count has raised to 3.",320,45);
  text("You proceed up the hall into the royal chambers.",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageNinetyfive() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You reach the castle and encounter royal guards. For lack of time as well as reasoning",320,25);
  text("power (your brain is disintegrating fast), you devour all three. Your kill count has raised to 6.",320,45);
  text("You proceed up the hall into the royal chambers.",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageNinetysix() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You reach the castle and encounter royal guards. For lack of time as well as reasoning",320,25);
  text("power (your brain is disintegrating fast), you devour all three. Your kill count has raised to 8.",320,45);
  text("You proceed up the hall into the royal chambers.",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageNinetyseven(){
 background(0);
  fill(255);
  textAlign(CENTER);
  text("You challenge her to a duel, and the surprised Queen accepts your challenge. You duel on the grounds",320,25);
  text("until you jump at her and take a bite out of her head. Her skull has a satisfying crunch. The guards",320,45);
  text("arrive on the scene and spear you, but your revenge quest is complete and your body crumbles to dust.",320,65);
    
  text("Kill Count: 1",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("You Win", b3x + b3w/2, b3y+30);
 
}

void pageNinetyeight(){
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You make a run for it, and the Queen opens her mouth to order the guards to stop you. But",320,25);
  text("a hovering face with glowing white eyes appears overhead and she panicks. You laugh to yourself as you",320,45);
  text("escape. Maybe there was a good reason for you to have died, now you know",320,65);
  text("there's not just one zombie in Wonderland after all...",320,85);

  
  text("Kill Count: 0",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("You Win",b3x + b3w/2, b3y+30);
  
}

void pageNinetynine(){
  background(0);
  fill(255);
  textAlign(CENTER);
  text("...but the Dodo is extinct for a reason. With hunter-like strength and accuracy you snatch the bird",320,25);
  text("and hurl it into a tree. You break its neck and devour its brain and entrails. Revenge is indeed sweet.",320,45);
  text("You move into the Dodo's house and decay happily ever after.",320,65);

  
  text("Kill Count: 1",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("You Win",b3x + b3w/2, b3y+30);
  
}

void pageHundred() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You cross the shore and enter a clearing, where a figure is waiting for you.",320,25);
  text("The Dodo bird! It all makes sense now. The Dodo was always angry at you for",320,45);
  text("not participating in caucus races. The Dodo stares you down, ready to attack...",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

//PAGE 101
void pageHundredone() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("In the chamber, you mangle about six more guards before reaching the throne.",320, 25);
  text("Your kill count is raised to 21.",320,45);
  text("The Queen is shocked. 'Off with her head!' she exclaims.",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageHundredtwo(){
  background(0);
  fill(255);
  textAlign(CENTER);
  text("The trial begins. The King reads out the sentence as the Queen presides over the court.",320,25);
  text("You realize after some time that the trial makes absolutely no sense. You have to get out or your",320,45);
  text("faith in judicial proceedings will be lost forever.",320,65);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Make a run for it", b1x + b1w/2, b1y+30);
  
  //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat everyone's", b2x + b2w/2, b2y+20);
  text("brains", b2x + b2w/2, b2y+40);
  
}


void pageHundredthree(){
  background(0);
  fill(255);
  textAlign(CENTER);
  text("The Queen leaps down from her throne, and you see an opportunity to attack. You latch on to her neck,",320,25);
  text("and the two of you struggle until she hits the ground. You sink your teeth into her and rip her head",320,45);
  text("right off of her body. You feast on the brain with satisfaction. Caterpillar rewards you later for your trouble,",320,65);
  text("and you retire to the Tulgey Woods until at last your body peacefully disintegrates in your sleep.",320,85);
  
  text("Kill Count: 1",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("You Win", b3x + b3w/2, b3y+30);
  
}

void pageHundredfour(){
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You challenge her to a duel, and the surprised Queen accepts your challenge. You duel on the grounds",320,25);
  text("until you jump at her and take a bite out of her head. Her skull has a satisfying crunch. The guards",320,45);
  text("arrive on the scene and spear you, but your revenge quest is complete and your body crumbles to dust.",320,65);
  
  text("Kill Count: 2",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("You Win", b3x + b3w/2, b3y+30);
  
}


void pageHundredfive() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("The trial begins. The King reads out the sentence as the Queen presides over the court.",320,25);
  text("You realize after some time that the trial makes absolutely no sense. You have to get out or your",320,45);
  text("faith in judicial proceedings will be lost forever.",320,65);
  
  //Left Button
  if (overButton(b1x, b1y, b1w, b1h) == true) {
    image(silent,b1x-22,b1y-5);
  }

  fill(0);
  rect(b1x, b1y, b1w, b1h);
  fill(255);
  text("Make a run for it", b1x + b1w/2, b1y+30);
  
  //Right Button
  if (overButton(b2x, b2y, b2w, b2h) == true) {
    image(silent,b2x-22,b2y-5);
  }

  fill(0);
  rect(b2x, b2y, b2w, b2h);
  fill(255);
  text("Eat everyone's", b2x + b2w/2, b2y+20);
  text("brains", b2x + b2w/2, b2y+40);
}

//PAGE
void pageHundredsix() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You enter the royal chamber, and the Queen eyes you. 'Didn't I kill you already?' she remarks.",320,25);
  text("Now you know why it's in your best interest to help the Hatter.",320,45);
  text("Your blood boils, and you're starting to see red.",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageHundredseven() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You enter the royal chamber, and the Queen eyes you. 'Didn't I kill you already?' she remarks.",320,25);
  text("Now you know why it's in your best interest to help the Hatter.",320,45);
  text("Your blood boils, and you're starting to see red.",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageHundredeight() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You enter the royal chamber, and the Queen eyes you. 'Didn't I kill you already?' she remarks.",320,25);
  text("Now you know why it's in your best interest to help the Hatter.", 320,45);
  text("Your blood boils, and you're starting to see red.",320,65);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255);
  text("Continue", b3x + b3w/2, b3y+30);
  
}

void pageHundrednine() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("...but the Dodo is extinct for a reason. With hunter-like strength and accuracy you snatch the bird",320,25);
  text("and hurl it into a tree. You break its neck and devour its brain and entrails. Revenge is indeed sweet.",320,45);
  text("You move into the Dodo's house and decay happily ever after.",320,65);

  
  text("Kill Count: 2",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("You Win",b3x + b3w/2, b3y+30);
  
}

void pageHundredten() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("'No,' you snarl. 'Off with yours.'",320,25);
  text("With an inhuman jump you land on the throne and gnaw the Queen's head clean off. The King shrieks",320,45);
  text("and runs, never to be seen again, making you ruler of Wonderland.",320,65);

  
  text("Kill Count: 22",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("You Win",b3x + b3w/2, b3y+30);
  
}

void pageHundredeleven(){
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You make a run for it, and the Queen opens her mouth to order the guards to stop you. But",320,25);
  text("a hovering face with glowing white eyes appears overhead and she panicks. You laugh to yourself as you",320,45);
  text("escape. Maybe there was a good reason for you to have died, now you know",320,65);
  text("there's not just one zombie in Wonderland after all...",320,85);

  
  text("Kill Count: 4",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("You Win",b3x + b3w/2, b3y+30);
  
}

void pageHundredtwelve(){
  background(0);
  fill(255);
  textAlign(CENTER);
  text("You make a run for it, and the Queen opens her mouth to order the guards to stop you. But",320,25);
  text("a hovering face with glowing white eyes appears overhead and she panicks. You laugh to yourself as you",320,45);
  text("escape. Maybe there was a good reason for you to have died, now you know",320,65);
  text("there's not just one zombie in Wonderland after all...",320,85);

  
  text("Kill Count: 1",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("You Win",b3x + b3w/2, b3y+30);
  
}

void pageHundredthirteen(){
  background(0);
  fill(255);
  textAlign(CENTER);
  text("The Queen leaps down from her throne, and you see an opportunity to attack. You latch on to her neck,",320,25);
  text("and the two of you struggle until she hits the ground. You sink your teeth into her and rip her head",320,45);
  text("right off of her body. You feast on the brain with satisfaction. The Hatter's revenge and yours are fulfilled,",320,65);
  text("and you retire to the Tulgey Woods until at last your body peacefully disintegrates in your sleep.",320,85);
  
  text("Kill Count: 4",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("You Win", b3x + b3w/2, b3y+30);
  
}

void pageHundredfourteen(){
  background(0);
  fill(255);
  textAlign(CENTER);
  text("The Queen leaps down from her throne, and you see an opportunity to attack. You latch on to her neck,",320,25);
  text("and the two of you struggle until she hits the ground. You sink your teeth into her and rip her head",320,45);
  text("right off of her body. You feast on the brain with satisfaction. The Hatter's revenge and yours are fulfilled,",320,65);
  text("and you retire to the Tulgey Woods until at last your body peacefully disintegrates in your sleep.",320,85);
  
  text("Kill Count: 7",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("You Win", b3x + b3w/2, b3y+30);
  
}

void pageHundredfifteen(){
  background(0);
  fill(255);
  textAlign(CENTER);
  text("The Queen leaps down from her throne, and you see an opportunity to attack. You latch on to her neck,",320,25);
  text("and the two of you struggle until she hits the ground. You sink your teeth into her and rip her head",320,45);
  text("right off of her body. You feast on the brain with satisfaction. The Hatter's revenge and yours are fulfilled,",320,65);
  text("and you retire to the Tulgey Woods until at last your body peacefully disintegrates in your sleep.",320,85);
  
  text("Kill Count: 9",300,395);
  
    
  //Center Button
  if (overButton(b3x, b3y, b3w, b3h) == true) {
    image(silent,b3x-22,b3y-5);
  }

  fill(0);
  rect(b3x, b3y, b3w, b3h);
  fill(255,0,0);
  text("You Win", b3x + b3w/2, b3y+30);
  
}

