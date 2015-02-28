
//Left Eye starting X coordinates ORIGINALS

float lEO1x = 213;
float lEO2x = 220;
float lEO3x =234 ;
float lEO4x = 261;
float lEO5x = 292;
float lEO6x = 329;
float lEO7x = 347;
float lEO8x = 359;
float lEO9x = 371;
float lEO10x = 380;
float lEO11x = 383;
float lEO12x = 358;
float lEO13x = 350;
float lEO14x = 326;
float lEO15x = 295;
float lEO16x = 276;
float lEO17x  = 251;
float lEO18x = 229;
float lEO19x = 219;
float lEO20x = 213;

//Left Eye starting Y coordinates ORIGINALS
float lEO1y = 224;
float lEO2y = 213;
float lEO3y = 195;
float lEO4y = 180;
float lEO5y = 180;
float lEO6y = 192;
float lEO7y = 213;
float lEO8y = 220;
float lEO9y = 228;
float lEO10y = 233;
float lEO11y = 246;
float lEO12y = 243;
float lEO13y =242;
float lEO14y =241 ;
float lEO15y = 244;
float lEO16y = 245;
float lEO17y = 245;
float lEO18y = 238;
float lEO19y = 232;
float lEO20y =230;

//Left Eye starting X coordinates TARGETS

float lET1x = 213;
float lET2x = 220;
float lET3x =234 ;
float lET4x = 261;
float lET5x = 292;
float lET6x = 329;
float lET7x = 347;
float lET8x = 359;
float lET9x =371;
float lET10x = 380;
float lET11x = 383;
float lET12x = 358;
float lET13x = 350;
float lET14x = 326;
float lET15x = 295;
float lET16x = 276;
float lET17x  = 251;
float lET18x = 229;
float lET19x = 219;
float lET20x = 213;

//Left Eye starting Y coordinates TARGETS
float lET1y = 224;
float lET2y = 213;
float lET3y = 195;
float lET4y = 180;
float lET5y = 180;
float lET6y = 192;
float lET7y = 213;
float lET8y = 220;
float lET9y = 228;
float lET10y = 233;
float lET11y = 246;
float lET12y = 243;
float lET13y =242;
float lET14y =241 ;
float lET15y = 244;
float lET16y = 245;
float lET17y = 245;
float lET18y = 238;
float lET19y = 232;
float lET20y =230;

//RIGHT Eye starting X coordinates ORIGINAL

float rEO1x = 619 ;
float rEO2x = 633;
float rEO3x = 645;
float rEO4x = 657;
float rEO5x = 678;
float rEO6x = 700;
float rEO7x = 725;
float rEO8x = 760;
float rEO9x = 776;
float rEO10x = 784;
float rEO11x = 784;
float rEO12x = 775;
float rEO13x = 764;
float rEO14x = 738;
float rEO15x = 718;
float rEO16x = 703;
float rEO17x = 681;
float rEO18x = 656;
float rEO19x = 651;
float rEO20x = 624;

//RIGHT Eye starting Y coordinates TARGETS

float rET1y = 234;
float rET2y = 219;
float rET3y = 213;
float rET4y = 205;
float rET5y = 184;
float rET6y = 175;
float rET7y = 173;
float rET8y = 185;
float rET9y = 195;
float rET10y = 211;
float rET11y = 219;
float rET12y = 229;
float rET13y = 236;
float rET14y = 242;
float rET15y = 241;
float rET16y = 240;
float rET17y = 237;
float rET18y = 236;
float rET19y = 238;
float rET20y = 240;

//RIGHT Eye starting X coordinates TARGETS

float rET1x = 619 ;
float rET2x = 633;
float rET3x = 645;
float rET4x = 657;
float rET5x = 678;
float rET6x = 700;
float rET7x = 725;
float rET8x = 760;
float rET9x = 776;
float rET10x = 784;
float rET11x = 784;
float rET12x = 775;
float rET13x = 764;
float rET14x = 738;
float rET15x = 718;
float rET16x = 703;
float rET17x = 681;
float rET18x = 656;
float rET19x = 651;
float rET20x = 624;

//RIGHT Eye starting Y coordinates ORIGINALS

float rEO1y = 234;
float rEO2y = 219;
float rEO3y = 213;
float rEO4y = 205;
float rEO5y = 184;
float rEO6y = 175;
float rEO7y = 173;
float rEO8y = 185;
float rEO9y = 195;
float rEO10y = 211;
float rEO11y = 219;
float rEO12y = 229;
float rEO13y = 236;
float rEO14y = 242;
float rEO15y = 241;
float rEO16y = 240;
float rEO17y = 237;
float rEO18y = 236;
float rEO19y = 238;
float rEO20y = 240;

//float leftEyeBallTargetX;
//float leftEyeBallTargetY;
//float rightEyeBallTargetX;
//float rightEyeBallTargetY;
//float leftEyeMoveX;
//float leftEyeMoveY;
//float  rightEyeMoveX;
//float  rightEyeMoveY; 

// smoothing setup

float sm = 0.15;

void setup() {

  size (1000, 367 );
  smooth();
  frameRate(30);
  // background (230, 191, 57, 10);
  background (255);
  loop();
  noStroke();
}


void draw () {

  //CONDITIONALS SETUP ZONES

  // 1st case 0<x< 154    ;  0 <y< 129

  if ( mouseX>0 && mouseX<154 && mouseY>0 && mouseY<129 ) {

    println("ZONE 1! YESS!!!");

    //LEFT Eye ZONE 1 X TARGETS (-20)

    lET1x =  219;
    lET2x =  219;
    lET3x =  224;
    lET4x =  244;
    lET5x =  261;
    lET6x =  287;
    lET7x =  315;
    lET8x =  326;
    lET9x =  349;
    lET10x = 358;
    lET11x = 364;
    lET12x = 338;
    lET13x = 316;
    lET14x = 286;
    lET15x = 278;
    lET16x = 265;
    lET17x = 260;
    lET18x = 240;
    lET19x = 228;
    lET20x = 218;

    //Left Eye ZONE 1 Y TARGETS (-10)

    lET1y =  218;
    lET2y =  209;
    lET3y =  190;
    lET4y =  175;
    lET5y =  171;
    lET6y =  174;
    lET7y =  188;
    lET8y =  203;
    lET9y =  219;
    lET10y = 223;
    lET11y = 236;
    lET12y = 232;
    lET13y = 229;
    lET14y = 228;
    lET15y = 228;
    lET16y = 229;
    lET17y = 230;
    lET18y = 230;
    lET19y = 231;
    lET20y = 228;

    //RIGHT Eye ZONE 1 X TARGETS (-20)

    rET1x = 583;
    rET2x = 593;
    rET3x = 600;
    rET4x = 625;
    rET5x = 648;
    rET6x = 670;
    rET7x = 685;
    rET8x = 697;
    rET9x = 721;
    rET10x = 740;
    rET11x = 733;
    rET12x = 718;
    rET13x = 698;
    rET14x = 668;
    rET15x = 651;
    rET16x = 639;
    rET17x = 629;
    rET18x = 620; 
    rET19x = 605;
    rET20x = 587;

    //RIGHT Eye ZONE 1 Y TARGETS (-10)

    rET1y =  234;
    rET2y =  226;
    rET3y =  223;
    rET4y =  193;
    rET5y =  180;
    rET6y =  179;
    rET7y =  183;
    rET8y =  186;
    rET9y =  199;
    rET10y = 222;
    rET11y = 234;
    rET12y = 234;
    rET13y = 234;
    rET14y = 232;
    rET15y = 232;
    rET16y = 233;
    rET17y = 234;
    rET18y = 236;
    rET19y = 237;
    rET20y = 243;
  }

  // 2nd case 163 <x< 416   ;  0 <y< 129

  if ( mouseX>163 && mouseX<416 && mouseY>0 && mouseY<129 ) {


    println("ZONE 2! YESS!!!");

    //LEFT Eye ZONE 2 X TARGETS (-10)


    lET1x =  227;
    lET2x =  224;
    lET3x = 236;
    lET4x =  252;
    lET5x =  278;
    lET6x =  303;
    lET7x =  322;
    lET8x =  343;
    lET9x = 356;
    lET10x = 368;
    lET11x = 361;
    lET12x = 343;
    lET13x = 332;
    lET14x = 328;
    lET15x = 291;
    lET16x = 268;
    lET17x = 252;
    lET18x = 238;
    lET19x = 229;
    lET20x = 225;

    //Left Eye ZONE 2 Y TARGETS (-5)

    lET1y =  222;
    lET2y =  210;
    lET3y =  192;
    lET4y =  174;
    lET5y =  168;
    lET6y =  176;
    lET7y =  193;
    lET8y =  213;
    lET9y =  224;
    lET10y = 237;
    lET11y = 241;
    lET12y = 234;
    lET13y = 232;
    lET14y = 231;
    lET15y = 232;
    lET16y = 231;
    lET17y = 233;
    lET18y = 232;
    lET19y = 233;
    lET20y = 230;

    //RIGHT Eye ZONE 2 X TARGETS (-10)

    rET1x =  597;
    rET2x = 611;
    rET3x = 619;
    rET4x = 632;
    rET5x = 653;
    rET6x = 670;
    rET7x = 688;
    rET8x = 729;
    rET9x = 744;
    rET10x = 754;
    rET11x = 760;
    rET12x = 751;
    rET13x = 725;
    rET14x = 688;
    rET15x = 668;
    rET16x = 651;
    rET17x = 638;
    rET18x = 630; 
    rET19x = 615;
    rET20x = 593;

    //RIGHT Eye ZONE 2 Y TARGETS (-5)
    rET1y =  232;
    rET2y =  226;
    rET3y =  220;
    rET4y =  202;
    rET5y =  188;
    rET6y =  174;
    rET7y =  167;
    rET8y =  182;
    rET9y =  195;
    rET10y = 215;
    rET11y = 218;
    rET12y = 230;
    rET13y = 228;
    rET14y = 232;
    rET15y = 230;
    rET16y = 230;
    rET17y = 231;
    rET18y = 232;
    rET19y = 240;
    rET20y = 241;
  } 

  // 3rd case  423<x< 579   ;   0 <y< 129

  if ( mouseX>423 && mouseX<579 && mouseY>0 && mouseY<129 ) {


    println("ZONE 3! YESS!!!");

    //RIGHT Eye ZONE 3 X TARGETS (-20)

    rET1x = 583 ;
    rET2x =593;
    rET3x = 600;
    rET4x = 625;
    rET5x = 648;
    rET6x = 670;
    rET7x = 685;
    rET8x = 697;
    rET9x = 721;
    rET10x = 740;
    rET11x = 733;
    rET12x = 718;
    rET13x = 698;
    rET14x = 668;
    rET15x = 651;
    rET16x = 639;
    rET17x = 629;
    rET18x = 620; 
    rET19x = 605;
    rET20x = 587;

    //RIGHT Eye ZONE 3 Y TARGETS (-10)


    rET1y =  234;
    rET2y =  226;
    rET3y =  223;
    rET4y =  193;
    rET5y =  180;
    rET6y =  179;
    rET7y =  183;
    rET8y =  186;
    rET9y =  199;
    rET10y = 222;
    rET11y = 234;
    rET12y = 234;
    rET13y = 234;
    rET14y = 232;
    rET15y = 232;
    rET16y = 233;
    rET17y = 234;
    rET18y = 236;
    rET19y = 237;
    rET20y = 243;

    //LEFT Eye ZONE 3 X TARGETS (+20)

    lET1x = 241;
    lET2x = 264;
    lET3x = 289;
    lET4x = 318;
    lET5x = 349;
    lET6x =  369;
    lET7x =  379;
    lET8x =  387;
    lET9x =  396;
    lET10x = 403;
    lET11x = 404;
    lET12x = 387;
    lET13x = 378;
    lET14x = 356;
    lET15x = 333;
    lET16x = 291;
    lET17x = 273;
    lET18x = 265;
    lET19x = 258;
    lET20x = 243;

    //Left Eye ZONE 3 Y TARGETS (-10)

    lET1y =  219;
    lET2y =  198;
    lET3y =  180;
    lET4y =  170;
    lET5y =  171;
    lET6y =  190;
    lET7y =  205;
    lET8y =  213;
    lET9y =  222;
    lET10y = 227;
    lET11y = 240;
    lET12y = 233;
    lET13y = 230;
    lET14y = 226;
    lET15y = 226;
    lET16y = 228;
    lET17y = 228;
    lET18y = 227;
    lET19y = 228;
    lET20y = 225;
  }

  // 4th case  584<x< 838  ;   0<y< 129

  if ( mouseX>584 && mouseX<838 && mouseY>0 && mouseY<129 ) {

    println("ZONE 4! YESS!!!");

    //LEFT Eye ZONE 4 X TARGETS (+10)

    lET1x = 234+10;
    lET2x = 243+10;
    lET3x = 257+10;
    lET4x = 284+10;
    lET5x = 302+10;
    lET6x = 323+10;
    lET7x = 345+10;
    lET8x = 362+10;
    lET9x = 375+10;
    lET10x =385+10;
    lET11x =383+10;
    lET12x =366+10;
    lET13x =353+10;
    lET14x =341+10;
    lET15x =328+10;
    lET16x =308+10;
    lET17x =281+10;
    lET18x =262+10;
    lET19x =246+10;
    lET20x =228+10;

    //Left Eye ZONE 4 Y TARGETS

    lET1y =  221;
    lET2y =  204;
    lET3y =  189;
    lET4y =  173;
    lET5y =  171;
    lET6y =  179;
    lET7y =  193;
    lET8y =  219;
    lET9y =  227;
    lET10y = 235;
    lET11y = 245;
    lET12y = 241;
    lET13y = 238;
    lET14y = 235;
    lET15y = 234;
    lET16y = 235;
    lET17y = 235;
    lET18y = 236;
    lET19y = 236;
    lET20y = 233;

    //RIGHT Eye ZONE 4 X TARGETS

    rET1x = 607;
    rET2x = 625;
    rET3x = 643;
    rET4x = 656;
    rET5x = 669;
    rET6x = 686;
    rET7x = 719;
    rET8x = 742;
    rET9x = 760;
    rET10x =770;
    rET11x =760;
    rET12x =746;
    rET13x =733;
    rET14x =707;
    rET15x =685;
    rET16x =666;
    rET17x =655;
    rET18x =648; 
    rET19x =641;
    rET20x =605;

    //RIGHT Eye ZONE 1 4 TARGETS

    rET1y =  236;
    rET2y =  223;
    rET3y =  214;
    rET4y =  203;
    rET5y =  191;
    rET6y =  177;
    rET7y =  172;
    rET8y =  182;
    rET9y =  204;
    rET10y = 221;
    rET11y = 235;
    rET12y = 236;
    rET13y = 237;
    rET14y = 234;
    rET15y = 233;
    rET16y = 234;
    rET17y = 233;
    rET18y = 233;
    rET19y = 237;
    rET20y = 245;
  }

  // 5th case  846 <x< 1000   ;   0<y< 129 

  if ( mouseX>846 && mouseX<width && mouseY>0 && mouseY<129 ) {


    println("ZONE 5! YESS!!!");

    //LEFT Eye ZONE 5 X TARGETS (+20)

    lET1x = 241;
    lET2x = 264;
    lET3x = 289;
    lET4x = 318;
    lET5x = 349;
    lET6x =  369;
    lET7x =  379;
    lET8x =  387;
    lET9x =  396;
    lET10x = 403;
    lET11x = 404;
    lET12x = 387;
    lET13x = 378;
    lET14x = 356;
    lET15x = 333;
    lET16x = 291;
    lET17x = 273;
    lET18x = 265;
    lET19x = 258;
    lET20x = 243;

    //Left Eye ZONE 5 Y TARGETS (-10)

    lET1y =  219;
    lET2y =  198;
    lET3y =  180;
    lET4y =  170;
    lET5y =  171;
    lET6y =  190;
    lET7y =  205;
    lET8y =  213;
    lET9y =  222;
    lET10y = 227;
    lET11y = 240;
    lET12y = 233;
    lET13y = 230;
    lET14y = 226;
    lET15y = 226;
    lET16y = 228;
    lET17y = 228;
    lET18y = 227;
    lET19y = 228;
    lET20y = 225;

    //RIGHT Eye ZONE 5 X TARGETS (+30)

    rET1x =  633;
    rET2x = 653;
    rET3x = 676;
    rET4x = 685;
    rET5x = 700;
    rET6x = 721;
    rET7x = 744;
    rET8x = 766;
    rET9x = 778;
    rET10x = 779;
    rET11x = 775;
    rET12x = 770;
    rET13x = 760;
    rET14x = 719;
    rET15x = 705;
    rET16x = 695;
    rET17x = 683;
    rET18x = 678; 
    rET19x = 667;
    rET20x = 653;

    //RIGHT Eye ZONE 5 Y TARGETS (-10)

    rET1y =  236;
    rET2y =  216;
    rET3y =  202;
    rET4y =  189;
    rET5y =  179;
    rET6y =  170;
    rET7y =  167;
    rET8y =  172;
    rET9y =  186;
    rET10y = 187;
    rET11y = 226;
    rET12y = 228;
    rET13y = 227;
    rET14y = 227;
    rET15y = 226;
    rET16y = 226;
    rET17y = 225;
    rET18y = 227;
    rET19y = 229;
    rET20y = 236;
  }

  // 6th case  0<x< 154   ;   145<y< 275

  if ( mouseX>0 && mouseX<154 && mouseY>145 && mouseY<275 ) {


    println("ZONE 6! YESS!!!");

    //LEFT Eye ZONE 6 X TARGETS  (-20)

    lET1x =  246-25;
    lET2x =  247-25;
    lET3x =  251-25;
    lET4x =  261-25;
    lET5x =  285-25;
    lET6x =  308-25;
    lET7x =  331-25;
    lET8x =  344-25;
    lET9x =  375-25;
    lET10x = 387-25;
    lET11x = 387-25;
    lET12x = 356-25;
    lET13x = 345-25;
    lET14x = 328-25;
    lET15x = 311-25;
    lET16x =294-25;
    lET17x = 277-25;
    lET18x = 265-25;
    lET19x = 253-25;
    lET20x = 246-25;

    //Left Eye ZONE 6 Y TARGETS 

    lET1y =  216;
    lET2y =  207;
    lET3y =  198;
    lET4y =  190;
    lET5y =  183;
    lET6y =  185;
    lET7y =  192;
    lET8y =  204;
    lET9y =  228;
    lET10y = 238;
    lET11y = 246;
    lET12y = 239;
    lET13y = 235;
    lET14y = 237;
    lET15y = 236;
    lET16y = 237;
    lET17y = 239;
    lET18y = 239;
    lET19y = 236;
    lET20y = 228;

    //RIGHT Eye ZONE 6 X TARGETS

    rET1x = 609-25;
    rET2x = 618-25;
    rET3x = 629-25;
    rET4x = 644-25;
    rET5x = 670-25;
    rET6x = 697-25;
    rET7x = 725-25;
    rET8x = 741-25;
    rET9x = 758-25;
    rET10x =774-25;
    rET11x =774-25;
    rET12x =773-25;
    rET13x =758-25;
    rET14x =747-25;
    rET15x =728-25;
    rET16x =705-25;
    rET17x =677-25;
    rET18x =637-25;
    rET19x =633-25;
    rET20x =605-25;

    //RIGHT Eye ZONE 6 Y TARGETS
    rET1y =  239;
    rET2y =  227;
    rET3y =  218;
    rET4y =  202;
    rET5y =  188;
    rET6y =  185;
    rET7y =  190;
    rET8y =  195;
    rET9y =  206;
    rET10y = 221;
    rET11y = 231;
    rET12y = 231;
    rET13y = 235;
    rET14y = 239;
    rET15y = 242;
    rET16y = 244;
    rET17y = 242;
    rET18y = 239;
    rET19y = 240;
    rET20y = 247;
  }

  // 7th case  163<x< 416   ;  145<y< 275

  if ( mouseX>136 && mouseX<416 && mouseY>145 && mouseY<275 ) {


    println("ZONE 7! YESS!!!");

    //LEFT Eye ZONE 7 X coordinates TARGETS


    lET1x = 213;
    lET2x = 220;
    lET3x =234 ;
    lET4x = 261;
    lET5x = 292;
    lET6x = 329;
    lET7x = 347;
    lET8x = 359;
    lET9x =371;
    lET10x = 380;
    lET11x = 383;
    lET12x = 358;
    lET13x = 350;
    lET14x = 326;
    lET15x = 295;
    lET16x = 276;
    lET17x  = 251;
    lET18x = 229;
    lET19x = 219;
    lET20x = 213;

    //Left Eye starting Y coordinates TARGETS

    lET1y = 224;
    lET2y = 213;
    lET3y = 195;
    lET4y = 180;
    lET5y = 180;
    lET6y = 192;
    lET7y = 213;
    lET8y = 220;
    lET9y = 228;
    lET10y = 233;
    lET11y = 246;
    lET12y = 243;
    lET13y =242;
    lET14y =241 ;
    lET15y = 244;
    lET16y = 245;
    lET17y = 245;
    lET18y = 238;
    lET19y = 232;
    lET20y =230;

    //RIGHT Eye ZONE 7 X coordinates TARGETS

    rET1x = 619 ;
    rET2x = 633;
    rET3x = 645;
    rET4x = 657;
    rET5x = 678;
    rET6x = 700;
    rET7x = 725;
    rET8x = 760;
    rET9x = 776;
    rET10x = 784;
    rET11x = 784;
    rET12x = 775;
    rET13x = 764;
    rET14x = 738;
    rET15x = 718;
    rET16x = 703;
    rET17x = 681;
    rET18x = 656;
    rET19x = 651;
    rET20x = 624;

    //RIGHT Eye ZONE 7 Y coordinates TARGETS
    rET1y = 234;
    rET2y = 219;
    rET3y = 213;
    rET4y = 205;
    rET5y = 184;
    rET6y = 175;
    rET7y = 173;
    rET8y = 185;
    rET9y = 195;
    rET10y = 211;
    rET11y = 219;
    rET12y = 229;
    rET13y = 236;
    rET14y = 242;
    rET15y = 241;
    rET16y = 240;
    rET17y = 237;
    rET18y = 236;
    rET19y = 238;
    rET20y = 240;
  }

  // 8th case  423<x< 579   ;   145<y< 275

  if ( mouseX>423 && mouseX<579 && mouseY>145 && mouseY<275 ) {


    println("ZONE 8! YESS!!!");

    //LEFT Eye ZONE 8 X TARGETS (+20) (from 10)

    lET1x =221+20;
    lET2x = 232+20 ;
    lET3x =  250+20;
    lET4x =  278+20;
    lET5x =  304+20;
    lET6x =335+20;
    lET7x =  354+20;
    lET8x =  368+20;
    lET9x =  371+20;
    lET10x = 377+20;
    lET11x = 366+20;
    lET12x = 360+20;
    lET13x =347+20;
    lET14x =329+20;
    lET15x =308+20;
    lET16x =290+20;
    lET17x = 264+20;
    lET18x = 245+20;
    lET19x =231+20;
    lET20x = 221+20;

    //Left Eye ZONE 8 Y TARGETS (-5) (from 10)

    lET1y = 225-5 ;
    lET2y =  211-5;
    lET3y =  197-5;
    lET4y =190-5;
    lET5y =  187-5;
    lET6y =  195-5;
    lET7y =  217-5;
    lET8y =  226-5;
    lET9y =  234-5;
    lET10y = 242-5;
    lET11y = 250-5;
    lET12y = 247-5;
    lET13y = 242-5;
    lET14y = 243-5;
    lET15y = 244-5;
    lET16y = 244-5;
    lET17y = 244-5;
    lET18y = 240-5;
    lET19y = 238-5;
    lET20y = 237-5;

    //RIGHT Eye ZONE 8 X TARGETS (from 6)

    rET1x =  609-25;
    rET2x = 618-25;
    rET3x = 629-25;
    rET4x = 644-25;
    rET5x =670-25;
    rET6x = 697-25;
    rET7x = 725-25;
    rET8x = 741-25;
    rET9x = 758-25;
    rET10x =774-25;
    rET11x =774-25;
    rET12x = 773-25;
    rET13x = 758-25;
    rET14x = 747-25;
    rET15x = 728-25;
    rET16x = 705-25;
    rET17x = 677-25;
    rET18x = 637-25;
    rET19x = 633-25;
    rET20x = 605-25;

    //RIGHT Eye ZONE 8 Y TARGETS (from 6)
    rET1y =  239;
    rET2y =  227;
    rET3y =  218;
    rET4y =  202;
    rET5y =  188;
    rET6y =  185;
    rET7y =  190;
    rET8y =  195;
    rET9y =  206;
    rET10y = 221;
    rET11y = 231;
    rET12y = 231;
    rET13y = 235;
    rET14y = 239;
    rET15y = 242;
    rET16y = 244;
    rET17y = 242;
    rET18y = 239;
    rET19y = 240;
    rET20y = 247;
  }


  // 9th case  584<x<839    ;  145 <y< 275

  if ( mouseX>584 && mouseX<839 && mouseY>145 && mouseY<275 ) {


    println("ZONE 9! YESS!!!");

    //LEFT Eye ZONE 9 X coordinates TARGETS


    lET1x = 213;
    lET2x = 220;
    lET3x =234 ;
    lET4x = 261;
    lET5x = 292;
    lET6x = 329;
    lET7x = 347;
    lET8x = 359;
    lET9x =371;
    lET10x = 380;
    lET11x = 383;
    lET12x = 358;
    lET13x = 350;
    lET14x = 326;
    lET15x = 295;
    lET16x = 276;
    lET17x  = 251;
    lET18x = 229;
    lET19x = 219;
    lET20x = 213;

    //Left Eye ZONE 9 Y coordinates TARGETS

    lET1y = 224;
    lET2y = 213;
    lET3y = 195;
    lET4y = 180;
    lET5y = 180;
    lET6y = 192;
    lET7y = 213;
    lET8y = 220;
    lET9y = 228;
    lET10y = 233;
    lET11y = 246;
    lET12y = 243;
    lET13y =242;
    lET14y =241 ;
    lET15y = 244;
    lET16y = 245;
    lET17y = 245;
    lET18y = 238;
    lET19y = 232;
    lET20y =230;

    //RIGHT Eye ZONE 9 X coordinates TARGETS

    rET1x = 619 ;
    rET2x = 633;
    rET3x = 645;
    rET4x = 657;
    rET5x = 678;
    rET6x = 700;
    rET7x = 725;
    rET8x = 760;
    rET9x = 776;
    rET10x = 784;
    rET11x = 784;
    rET12x = 775;
    rET13x = 764;
    rET14x = 738;
    rET15x = 718;
    rET16x = 703;
    rET17x = 681;
    rET18x = 656;
    rET19x = 651;
    rET20x = 624;

    //RIGHT Eye ZONE 9 Y coordinates TARGETS

    rET1y = 234;
    rET2y = 219;
    rET3y = 213;
    rET4y = 205;
    rET5y = 184;
    rET6y = 175;
    rET7y = 173;
    rET8y = 185;
    rET9y = 195;
    rET10y = 211;
    rET11y = 219;
    rET12y = 229;
    rET13y = 236;
    rET14y = 242;
    rET15y = 241;
    rET16y = 240;
    rET17y = 237;
    rET18y = 236;
    rET19y = 238;
    rET20y = 240;
  }

  // 10th case  846<x<1000    ;   145 <y<  275

  if ( mouseX>846 && mouseX<1000 && mouseY>145 && mouseY<275 ) {


    println("ZONE 10! YESS!!!");

    //LEFT Eye ZONE 10 X TARGETS (+20)


    lET1x =221+20;
    lET2x = 232+20 ;
    lET3x =  250+20;
    lET4x =  278+20;
    lET5x =  304+20;
    lET6x =335+20;
    lET7x =  354+20;
    lET8x =  368+20;
    lET9x =  371+20;
    lET10x = 377+20;
    lET11x = 366+20;
    lET12x = 360+20;
    lET13x =347+20;
    lET14x =329+20;
    lET15x =308+20;
    lET16x =290+20;
    lET17x = 264+20;
    lET18x = 245+20;
    lET19x =231+20;
    lET20x = 221+20;

    //Left Eye ZONE 10 Y TARGETS (-5)
    lET1y = 225-5 ;
    lET2y =  211-5;
    lET3y =  197-5;
    lET4y =190-5;
    lET5y =  187-5;
    lET6y =  195-5;
    lET7y =  217-5;
    lET8y =  226-5;
    lET9y =  234-5;
    lET10y = 242-5;
    lET11y = 250-5;
    lET12y = 247-5;
    lET13y = 242-5;
    lET14y = 243-5;
    lET15y = 244-5;
    lET16y = 244-5;
    lET17y = 244-5;
    lET18y = 240-5;
    lET19y = 238-5;
    lET20y = 237-5;

    //RIGHT Eye ZONE 10 X TARGETS (+25)

    rET1x = 599+25;
    rET2x = 629+25;
    rET3x = 636+25;
    rET4x = 648+25;
    rET5x =661+25;
    rET6x = 682+25;
    rET7x = 701+25;
    rET8x = 725+25;
    rET9x =738+25;
    rET10x = 751+25;
    rET11x = 752+25;
    rET12x = 742+25;
    rET13x = 726+25;
    rET14x =709+25;
    rET15x =695+25;
    rET16x =680+25;
    rET17x =665+25;
    rET18x = 648+25;
    rET19x =629+25;
    rET20x = 600+25;

    //RIGHT Eye ZONE 10 Y TARGETS (-5)
    rET1y =  237-5;
    rET2y =  224-5;
    rET3y =  217-5;
    rET4y =  203-5;
    rET5y =  195-5;
    rET6y =  192-5;
    rET7y =  193-5;
    rET8y =  193-5;
    rET9y =  200-5;
    rET10y = 209-5;
    rET11y = 230-5;
    rET12y = 236-5;
    rET13y = 237-5;
    rET14y = 236-5;
    rET15y = 234-5;
    rET16y = 236-5;
    rET17y = 235-5;
    rET18y = 235-5;
    rET19y = 236-5;
    rET20y = 247-5;
  }

  // 11th case  0<x<154    ;   283<y< 367

  if ( mouseX>0 && mouseX<154 && mouseY>283 && mouseY<367 ) {


    println("ZONE 11! YESS!!!");

    //LEFT Eye ZONE 11 X TARGETS (-35)

    lET1x =  199;
    lET2x =  210;
    lET3x =  236;
    lET4x =  253;
    lET5x =  275;
    lET6x =  298;
    lET7x =  311;
    lET8x =  326;
    lET9x =  348;
    lET10x = 358;
    lET11x = 366;
    lET12x = 332;
    lET13x = 322;
    lET14x = 302;
    lET15x = 264;
    lET16x = 263;
    lET17x = 233;
    lET18x = 222;
    lET19x = 213;
    lET20x = 206;

    //Left Eye ZONE 11 Y TARGETS (+25)
    lET1y =  242;
    lET2y =  234;
    lET3y =  226;
    lET4y =  223;
    lET5y =  222;
    lET6y =  224;
    lET7y =  230;
    lET8y =  242;
    lET9y =  249;
    lET10y = 252;
    lET11y = 266;
    lET12y = 263;
    lET13y = 264;
    lET14y = 266;
    lET15y = 270;
    lET16y = 272;
    lET17y = 275;
    lET18y = 267;
    lET19y = 259;
    lET20y = 252;

    //RIGHT Eye ZONE 11 X TARGETS (-35)

    rET1x = 619-35 ;
    rET2x = 626-35;
    rET3x = 631-35;
    rET4x = 642-35;
    rET5x =660-35;
    rET6x = 682-35;
    rET7x = 720-35;
    rET8x = 751-35;
    rET9x = 772-35;
    rET10x = 784-35;
    rET11x = 781-35;
    rET12x =772-35;
    rET13x = 761-35;
    rET14x = 738-35;
    rET15x = 710-35;
    rET16x =679-35;
    rET17x = 659-35;
    rET18x = 646-35; 
    rET19x = 639-35;
    rET20x = 614-35;

    //RIGHT Eye ZONE 1 Y TARGETS (+25)

    rET1y =  223+25;
    rET2y =  218+25;
    rET3y =  210+25;
    rET4y =  202+25;
    rET5y =  196+25;
    rET6y =  191+25;
    rET7y =  190+25;
    rET8y =  195+25;
    rET9y =  202+25;
    rET10y = 207+25;
    rET11y = 218+25;
    rET12y = 226+25;
    rET13y = 235+25;
    rET14y = 242+25;
    rET15y = 248+25;
    rET16y = 245+25;
    rET17y = 238+25;
    rET18y = 238+25;
    rET19y = 240+25;
    rET20y = 235+25;
  }

  // 12th case  163<x<416    ;   283<y< 367

  if ( mouseX>163 && mouseX<416 && mouseY>283 && mouseY<367 ) {


    println("ZONE 12! YESS!!!");


    //LEFT Eye ZONE 12 X TARGETS (-15)

    lET1x =  204;
    lET2x =  219;
    lET3x =  237;
    lET4x =  255;
    lET5x =  287;
    lET6x =  308;
    lET7x =  330;
    lET8x =  340;
    lET9x =  352;
    lET10x = 366;
    lET11x = 364;
    lET12x = 341;
    lET13x = 335;
    lET14x = 324;
    lET15x = 300;
    lET16x = 281;
    lET17x = 259;
    lET18x = 237;
    lET19x = 221;
    lET20x = 203;

    //Left Eye ZONE 12 Y TARGETS (+15)

    lET1y =  236;
    lET2y =  227;
    lET3y =  221;
    lET4y =  214;
    lET5y =  213;
    lET6y =  218;
    lET7y =  232;
    lET8y =  238;
    lET9y =  245;
    lET10y = 255;
    lET11y = 262;
    lET12y = 258;
    lET13y = 257;
    lET14y = 257;
    lET15y = 263;
    lET16y = 268;
    lET17y = 269;
    lET18y = 264;
    lET19y = 254;
    lET20y = 244;


    //RIGHT Eye ZONE 12 X TARGETS (-15)

    rET1x =598;
    rET2x =609;
    rET3x = 617;
    rET4x = 633;
    rET5x = 652;
    rET6x = 673;
    rET7x = 704;
    rET8x = 727;
    rET9x = 744;
    rET10x = 754;
    rET11x = 756;
    rET12x = 743;
    rET13x = 726;
    rET14x = 706;
    rET15x = 676;
    rET16x = 658;
    rET17x = 645;
    rET18x = 632; 
    rET19x = 621;
    rET20x = 593;

    //RIGHT Eye ZONE 12 Y TARGETS (+15)

    rET1y =  243;
    rET2y =  236;
    rET3y =  230;
    rET4y =  220;
    rET5y =  210;
    rET6y =  205;
    rET7y =  205;
    rET8y =  211;
    rET9y =  217;
    rET10y = 224;
    rET11y = 234;
    rET12y = 244;
    rET13y = 254;
    rET14y = 260;
    rET15y = 261;
    rET16y = 257;
    rET17y = 254;
    rET18y = 253;
    rET19y = 253;
    rET20y = 253;
  }

  // 13th case  423<x< 579   ;   283<y< 367 

  if ( mouseX>423 && mouseX<579 && mouseY>283 && mouseY<367 ) {

    println("ZONE 13! YESS!!!");

    //LEFT Eye ZONE 13 X TARGETS (+30)

    lET1x =  235;
    lET2x =  242;
    lET3x =  263;
    lET4x =  291;
    lET5x =  318;
    lET6x =  350;
    lET7x =  377;
    lET8x =  397;
    lET9x =  401;
    lET10x = 405;
    lET11x = 411;
    lET12x = 390;
    lET13x = 384;
    lET14x = 372;
    lET15x = 349;
    lET16x = 319;
    lET17x = 288;
    lET18x = 269;
    lET19x = 246;
    lET20x = 236;

    //Left Eye ZONE 13 Y TARGETS (+10)

    lET1y =  235;
    lET2y =  229;
    lET3y =  221;
    lET4y =  215;
    lET5y =  211;
    lET6y =  211;
    lET7y =  219;
    lET8y =  230;
    lET9y =  233;
    lET10y = 235;
    lET11y = 250;
    lET12y = 253;
    lET13y = 254;
    lET14y = 253;
    lET15y = 259;
    lET16y = 261;
    lET17y = 258;
    lET18y = 259;
    lET19y = 243;
    lET20y = 239;

    //RIGHT Eye ZONE 13 X TARGETS (-35)

    rET1x = 619-35 ;
    rET2x = 626-35;
    rET3x = 631-35;
    rET4x = 642-35;
    rET5x =660-35;
    rET6x = 682-35;
    rET7x = 720-35;
    rET8x = 751-35;
    rET9x = 772-35;
    rET10x = 784-35;
    rET11x = 781-35;
    rET12x =772-35;
    rET13x = 761-35;
    rET14x = 738-35;
    rET15x = 710-35;
    rET16x =679-35;
    rET17x = 659-35;
    rET18x = 646-35; 
    rET19x = 639-35;
    rET20x = 614-35;

    //RIGHT Eye ZONE 13 Y TARGETS (+25)

    rET1y =  223+15;
    rET2y =  218+15;
    rET3y =  210+15;
    rET4y =  202+15;
    rET5y =  196+15;
    rET6y =  191+15;
    rET7y =  190+15;
    rET8y =  195+15;
    rET9y =  202+15;
    rET10y = 207+15;
    rET11y = 218+15;
    rET12y = 226+15;
    rET13y = 235+15;
    rET14y = 242+15;
    rET15y = 248+15;
    rET16y = 245+15;
    rET17y = 238+15;
    rET18y = 238+15;
    rET19y = 240+15;
    rET20y = 235+15;
  }

  // 14th case 584 <x< 838   ;  283<y< 367

  if ( mouseX>584 && mouseX<837 && mouseY>283 && mouseY<367 ) {


    println("ZONE 14! YESS!!!");

    //LEFT Eye ZONE 14 X TARGETS (+20)


    lET1x =  227;
    lET2x =  240;
    lET3x =  260;
    lET4x =  281;
    lET5x =  309;
    lET6x =  331;
    lET7x =  357;
    lET8x =  365;
    lET9x =  383;
    lET10x = 394;
    lET11x = 394;
    lET12x = 372;
    lET13x = 343;
    lET14x = 324;
    lET15x = 304;
    lET16x = 285;
    lET17x = 262;
    lET18x = 248;
    lET19x = 242;
    lET20x = 226;

    //Left Eye ZONE 14 Y TARGETS (+5)

    lET1y =  227;
    lET2y =  217;
    lET3y =  208;
    lET4y =  205;
    lET5y =  203;
    lET6y =  208;
    lET7y =  222;
    lET8y =  228;
    lET9y =  234;
    lET10y = 245;
    lET11y = 253;
    lET12y = 252;
    lET13y = 250;
    lET14y = 258;
    lET15y = 261;
    lET16y = 263;
    lET17y = 257;
    lET18y = 251;
    lET19y = 247;
    lET20y = 234;



    //RIGHT Eye ZONE 14 X TARGETS (+20)

    rET1x = 625;
    rET2x = 639;
    rET3x = 645;
    rET4x = 666;
    rET5x = 683;
    rET6x = 709;
    rET7x = 738;
    rET8x = 760;
    rET9x = 778;
    rET10x =788;
    rET11x =790;
    rET12x = 778;
    rET13x = 759;
    rET14x = 718;
    rET15x = 698;     
    rET16x = 699;
    rET17x = 671;
    rET18x = 659; 
    rET19x = 653;
    rET20x = 625;

    //RIGHT Eye ZONE 14 Y TARGETS (+5)

    rET1y =  235;
    rET2y =  227;
    rET3y =  220;
    rET4y =  211;
    rET5y =  200;
    rET6y =  194;
    rET7y =  195;
    rET8y =  198;
    rET9y =  205;
    rET10y = 215;
    rET11y = 221;
    rET12y = 235;
    rET13y = 248;
    rET14y = 253;
    rET15y = 249;
    rET16y = 250;
    rET17y = 242;
    rET18y = 244;
    rET19y = 245;
    rET20y = 233;
  }

  // 15th case  846<x<1000    ;   283<y< 367 

  if ( mouseX>846 && mouseX<1000 && mouseY>283 && mouseY<367 ) {


    println("ZONE 15! YESS!!!");

    //LEFT Eye ZONE 15 X TARGETS (+30)


    lET1x =  235;
    lET2x =  242;
    lET3x =  263;
    lET4x =  291;
    lET5x =  318;
    lET6x =  350;
    lET7x =  377;
    lET8x =  397;
    lET9x =  401;
    lET10x = 405;
    lET11x = 411;
    lET12x = 390;
    lET13x = 384;
    lET14x = 372;
    lET15x = 349;
    lET16x = 319;
    lET17x = 288;
    lET18x = 269;
    lET19x = 246;
    lET20x = 236;

    //Left Eye ZONE 15 Y TARGETS (+10)

    lET1y =  235;
    lET2y =  229;
    lET3y =  221;
    lET4y =  215;
    lET5y =  211;
    lET6y =  211;
    lET7y =  219;
    lET8y =  230;
    lET9y =  233;
    lET10y = 235;
    lET11y = 250;
    lET12y = 253;
    lET13y = 254;
    lET14y = 253;
    lET15y = 259;
    lET16y = 261;
    lET17y = 258;
    lET18y = 259;
    lET19y = 243;
    lET20y = 239;



    //RIGHT Eye ZONE 15 X TARGETS (+30)

    rET1x =  639;
    rET2x = 665;
    rET3x = 692;
    rET4x = 706;
    rET5x = 722;
    rET6x = 734;
    rET7x = 766;
    rET8x = 776;
    rET9x = 788;
    rET10x = 799;
    rET11x =797;
    rET12x = 795;
    rET13x = 790;
    rET14x = 785;
    rET15x = 774;
    rET16x = 755;
    rET17x = 731;
    rET18x = 686; 
    rET19x = 671;
    rET20x = 636;

    //RIGHT Eye ZONE 15 Y TARGETS (+10)
    rET1y =  239;
    rET2y =  233;
    rET3y =  216;
    rET4y =  209;
    rET5y =  203;
    rET6y =  204;
    rET7y =  206;
    rET8y =  207;
    rET9y =  209;
    rET10y = 211;
    rET11y = 220;
    rET12y = 227;
    rET13y = 236;
    rET14y = 244;
    rET15y = 247;
    rET16y = 249;
    rET17y = 245;
    rET18y = 242;
    rET19y = 245;
    rET20y = 246;
  }

  //smoothing PART AFTER SETTING UP THE NEW VALUES

  // X CORDINATES

  lEO1x += (lET1x - lEO1x) * sm;
  lEO1y += (lET1y - lEO1y) * sm;
  lEO2x += (lET2x - lEO2x) * sm;
  lEO2y += (lET2y - lEO2y) * sm;
  lEO3x += (lET3x - lEO3x) * sm;
  lEO3y += (lET3y - lEO3y) * sm;
  lEO4x += (lET4x - lEO4x) * sm;
  lEO4y += (lET4y - lEO4y) * sm;
  lEO5x += (lET5x - lEO5x) * sm;
  lEO5y += (lET5y - lEO5y) * sm;
  lEO6x += (lET6x - lEO6x) * sm;
  lEO6y += (lET6y - lEO6y) * sm;
  lEO7x += (lET7x - lEO7x) * sm;
  lEO7y += (lET7y - lEO7y) * sm;
  lEO8x += (lET8x - lEO8x) * sm;
  lEO8y += (lET8y - lEO8y) * sm;
  lEO9x += (lET9x - lEO9x) * sm;
  lEO9y += (lET9y - lEO9y) * sm;
  lEO10x +=(lET10x - lEO10x) * sm;
  lEO10y +=(lET10y - lEO10y) * sm;
  lEO11x +=(lET11x - lEO11x) * sm;
  lEO11y +=(lET11y - lEO11y) * sm;
  lEO12x +=(lET12x - lEO12x) * sm;
  lEO12y +=(lET12y - lEO12y) * sm;
  lEO13x +=(lET13x - lEO13x) * sm;
  lEO13y +=(lET13y - lEO13y) * sm;
  lEO14x +=(lET14x - lEO14x) * sm;
  lEO14y +=(lET14y - lEO14y) * sm;
  lEO15x +=(lET15x - lEO15x) * sm;
  lEO15y +=(lET15y - lEO15y) * sm;
  lEO16x +=(lET16x - lEO16x) * sm;
  lEO16y +=(lET16y - lEO16y) * sm;
  lEO17x +=(lET17x - lEO17x) * sm;
  lEO17y +=(lET17y - lEO17y) * sm;
  lEO18x +=(lET18x - lEO18x) * sm;
  lEO18y +=(lET18y - lEO18y) * sm;
  lEO19x +=(lET19x - lEO19x) * sm;
  lEO19y +=(lET19y - lEO19y) * sm;
  lEO20x +=(lET20x - lEO20x) * sm;
  lEO20y +=(lET20y - lEO20y) * sm;

  // X CORDINATES

  rEO1x += (rET1x - rEO1x) * sm;
  rEO1y += (rET1y - rEO1y) * sm;
  rEO2x += (rET2x - rEO2x) * sm;
  rEO2y += (rET2y - rEO2y) * sm;
  rEO3x += (rET3x - rEO3x) * sm;
  rEO3y += (rET3y - rEO3y) * sm;
  rEO4x += (rET4x - rEO4x) * sm;
  rEO4y += (rET4y - rEO4y) * sm;
  rEO5x += (rET5x - rEO5x) * sm;
  rEO5y += (rET5y - rEO5y) * sm;
  rEO6x += (rET6x - rEO6x) * sm;
  rEO6y += (rET6y - rEO6y) * sm;
  rEO7x += (rET7x - rEO7x) * sm;
  rEO7y += (rET7y - rEO7y) * sm;
  rEO8x += (rET8x - rEO8x) * sm;
  rEO8y += (rET8y - rEO8y) * sm;
  rEO9x += (rET9x - rEO9x) * sm;
  rEO9y += (rET9y - rEO9y) * sm;
  rEO10x +=(rET10x - rEO10x) * sm;
  rEO10y +=(rET10y - rEO10y) * sm;
  rEO11x +=(rET11x - rEO11x) * sm;
  rEO11y +=(rET11y - rEO11y) * sm;
  rEO12x +=(rET12x - rEO12x) * sm;
  rEO12y +=(rET12y - rEO12y) * sm;
  rEO13x +=(rET13x - rEO13x) * sm;
  rEO13y +=(rET13y - rEO13y) * sm;
  rEO14x +=(rET14x - rEO14x) * sm;
  rEO14y +=(rET14y - rEO14y) * sm;
  rEO15x +=(rET15x - rEO15x) * sm;
  rEO15y +=(rET15y - rEO15y) * sm;
  rEO16x +=(rET16x - rEO16x) * sm;
  rEO16y +=(rET16y - rEO16y) * sm;
  rEO17x +=(rET17x - rEO17x) * sm;
  rEO17y +=(rET17y - rEO17y) * sm;
  rEO18x +=(rET18x - rEO18x) * sm;
  rEO18y +=(rET18y - rEO18y) * sm;
  rEO19x +=(rET19x - rEO19x) * sm;
  rEO19y +=(rET19y - rEO19y) * sm;
  rEO20x +=(rET20x - rEO20x) * sm;
  rEO20y +=(rET20y - rEO20y) * sm;

  // FADING EFFECT WITH AN OPACE(?) BOX
  fill(230, 191, 57, 50);
  rect(0, 0, width, height); 

  //LEFT EYE ORIGINALS
  fill (239, 210, 204, 30);
  //1
  quad(lEO1x, lEO1y, lEO2x, lEO2y, lEO19x, lEO19y, lEO20x, lEO20y);
  //2
  quad(lEO2x, lEO2y, lEO3x, lEO3y, lEO18x, lEO18y, lEO19x, lEO19y);
  //3
  quad(lEO3x, lEO3y, lEO4x, lEO4y, lEO17x, lEO17y, lEO18x, lEO18y);
  //4
  quad(lEO4x, lEO4y, lEO5x, lEO5y, lEO16x, lEO16y, lEO17x, lEO17y);
  //5
  quad(lEO5x, lEO5y, lEO6x, lEO6y, lEO15x, lEO15y, lEO16x, lEO16y);
  //6
  quad(lEO6x, lEO6y, lEO7x, lEO7y, lEO14x, lEO14y, lEO15x, lEO15y);
  //7
  quad(lEO7x, lEO7y, lEO8x, lEO8y, lEO13x, lEO13y, lEO14x, lEO14y);
  //8
  fill(170, 91, 85, 30);
  quad(lEO8x, lEO8y, lEO9x, lEO9y, lEO12x, lEO12y, lEO13x, lEO13y);
  //9
  fill(163, 69, 70, 30);
  quad(lEO9x, lEO9y, lEO10x, lEO10y, lEO11x, lEO11y, lEO12x, lEO12y);

  //LEFT EYE ORIGINALS
  fill (239, 210, 204, 30);
  //1
  fill(170, 91, 85, 30);
  quad(rEO1x, rEO1y, rEO2x, rEO2y, rEO19x, rEO19y, rEO20x, rEO20y);
  //2
  fill(163, 69, 70, 30);
  quad(rEO2x, rEO2y, rEO3x, rEO3y, rEO18x, rEO18y, rEO19x, rEO19y);
  //3
  fill (239, 210, 204, 30);
  quad(rEO3x, rEO3y, rEO4x, rEO4y, rEO17x, rEO17y, rEO18x, rEO18y);
  //4
  quad(rEO4x, rEO4y, rEO5x, rEO5y, rEO16x, rEO16y, rEO17x, rEO17y);
  //5
  quad(rEO5x, rEO5y, rEO6x, rEO6y, rEO15x, rEO15y, rEO16x, rEO16y);
  //6
  quad(rEO6x, rEO6y, rEO7x, rEO7y, rEO14x, rEO14y, rEO15x, rEO15y);
  //7
  quad(rEO7x, rEO7y, rEO8x, rEO8y, rEO13x, rEO13y, rEO14x, rEO14y);
  //8
  quad(rEO8x, rEO8y, rEO9x, rEO9y, rEO12x, rEO12y, rEO13x, rEO13y);
  //9
  quad(rEO9x, rEO9y, rEO10x, rEO10y, rEO11x, rEO11y, rEO12x, rEO12y);

  //EYE MOVEMENT

  float leftEyeMoveX = map(mouseX, 0, width, 240, 370);
  float leftEyeMoveY = map(mouseY, 0, height, 204, 249);

  float rightEyeMoveX = map(mouseX, 0, width, 620, 776);
  float rightEyeMoveY = map(mouseY, 0, height, 200, 248); 


  if ( mouseX>423 && mouseX<579) {
    //LEFT IRIS + PUPIL
    leftEyeMoveX = map(mouseX, 0, width, 240, 370);
    

    rightEyeMoveX = map(mouseX, 0, width, 620, 776);
      }

  else if (mouseX<423 || mouseX > 579)  
  { 
    leftEyeMoveX = map(mouseX, 0, width, 240, 370);



    rightEyeMoveX = map(mouseX, 0, width, 620, 776);
  }
  //rEO20y +=(rET20y - rEO20y) * sm;

  fill(54, 53, 55, 30);
  stroke(0);
  //leftEYe
//float leftEyeBallTargetX;
//float leftEyeBallTargetY;
//float rightEyeBallOriginalTargetX;
//float rightEyeBallTargetY;
//float leftEyeMoveX;
//float leftEyeMoveY;


  //LEFT IRIS + PUPIL
  ellipse (leftEyeMoveX, leftEyeMoveY, 75, 75);
  fill (0);
  ellipse (leftEyeMoveX, leftEyeMoveY, 25, 25);
  //right eye
  fill(54, 53, 55, 30);
  ellipse (rightEyeMoveX, rightEyeMoveY, 75, 75);
  fill (0);
  ellipse (rightEyeMoveX, rightEyeMoveY, 25, 25);
  noStroke();

  //LEFT EYE COVERS TOP SO THE IRIS WOULD DISAPPEAR
  fill(230, 191, 57);
  //1
  quad(lEO1x, lEO1y, lEO2x, lEO2y, 175, 184, 164, 244);
  //2
  quad(lEO2x, lEO2y, lEO3x, lEO3y, 212, 150, 175, 184);
  //3
  quad(lEO3x, lEO3y, lEO4x, lEO4y, 252, 138, 212, 150);
  //4
  quad(lEO4x, lEO4y, lEO5x, lEO5y, 300, 134, 252, 138);
  //5
  quad(lEO5x, lEO5y, lEO6x, lEO6y, 344, 144, 300, 134);
  //6
  quad(lEO6x, lEO6y, lEO7x, lEO7y, 387, 162, 344, 144);
  //7
  quad(lEO7x, lEO7y, lEO8x, lEO8y, 395, 167, 387, 162);
  //8
  quad(lEO8x, lEO8y, lEO9x, lEO9y, 405, 181, 395, 167);
  //9  
  quad(lEO9x, lEO9y, lEO10x, lEO10y, 417, 195, 405, 181);

  // LEFT EYE COVERS BOTTOM SO THE IRIS WOULD DISAPPEAR

  quad(lEO20x, lEO20y, lEO1x, lEO1y, 161, 224, 165, 234 );

  quad(lEO19x, lEO19y, lEO20x, lEO20y, 165, 234, 197, 287);

  quad(lEO18x, lEO18y, lEO19x, lEO19y, 197, 287, 231, 292);

  quad(lEO17x, lEO17y, lEO18x, lEO18y, 231, 292, 246, 294);

  quad(lEO16x, lEO16y, lEO17x, lEO17y, 246, 294, 267, 295);

  quad(lEO15x, lEO15y, lEO16x, lEO16y, 267, 295, 287, 295);

  quad(lEO14x, lEO14y, lEO15x, lEO15y, 287, 295, 306, 295);

  quad(lEO13x, lEO13y, lEO14x, lEO14y, 306, 295, 330, 295);

  quad(lEO12x, lEO12y, lEO13x, lEO13y, 330, 295, 358, 295);

  quad(lEO11x, lEO11y, lEO12x, lEO12y, 358, 295, 413, 290);

  quad(lEO10x, lEO10y, lEO11x, lEO11y, 413, 290, 417, 195);

  //RIGHT EYE COVERS TOP SO THE IRIS WOULD DISAPPEAR
  fill(230, 191, 57);
  //1
  quad(rEO1x, rEO1y, rEO2x, rEO2y, 573, 119, 516, 185);
  //2
  quad(rEO2x, rEO2y, rEO3x, rEO3y, 614, 103, 573, 119);
  //3
  quad(rEO3x, rEO3y, rEO4x, rEO4y, 648, 95, 614, 103);
  //4
  quad(rEO4x, rEO4y, rEO5x, rEO5y, 679, 92, 648, 95);
  //5
  quad(rEO5x, rEO5y, rEO6x, rEO6y, 701, 93, 679, 92);
  //6
  quad(rEO6x, rEO6y, rEO7x, rEO7y, 730, 94, 701, 93);
  //7
  quad(rEO7x, rEO7y, rEO8x, rEO8y, 773, 103, 730, 94);
  //8
  quad(rEO8x, rEO8y, rEO9x, rEO9y, 825, 123, 773, 103);
  //9  

  // RIGHT EYE COVERS BOTTOM SO THE IRIS WOULD DISAPPEAR

  quad(rEO9x, rEO9y, rEO10x, rEO10y, 850, 198, 825, 123);
  quad(rEO10x, rEO10y, rEO11x, rEO11y, 852, 199, 850, 198);
  quad(rEO11x, rEO11y, rEO12x, rEO12y, 850, 198, 852, 199);
  quad(rEO12x, rEO12y, rEO13x, rEO13y, 867, 273, 825, 123);
  quad(rEO13x, rEO13y, rEO14x, rEO14y, 786, 319, 867, 273);
  quad(rEO14x, rEO14y, rEO15x, rEO15y, 735, 329, 786, 319);
  quad(rEO15x, rEO15y, rEO16x, rEO16y, 715, 332, 735, 329);
  quad(rEO16x, rEO16y, rEO17x, rEO17y, 703, 332, 715, 332);
  quad(rEO17x, rEO17y, rEO18x, rEO18y, 684, 329, 703, 332);
  quad(rEO18x, rEO18y, rEO19x, rEO19y, 667, 332, 684, 329);
  quad(rEO19x, rEO19y, rEO20x, rEO20y, 566, 321, 667, 332);
  quad(rEO20x, rEO20y, rEO1x, rEO1y, 517, 187, 566, 321);

  //sketchy outlines neigbouring dots

  //R 1-2 (REPETITION 1x/X)
  stroke (0, 0, 0, random (-255, 75));
  line(rEO1x+random (-3, 3), rEO1y+random (-3, 3), rEO2x+random (-3, 3), rEO2y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO1x+random (-3, 3), rEO1y+random (-3, 3), rEO2x+random (-3, 3), rEO2y+random (-3, 3));
  //R 2-3
  stroke (0, 0, 0, random (-255, 75));
  line(rEO2x+random (-3, 3), rEO2y+random (-3, 3), rEO3x+random (-3, 3), rEO3y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO2x+random (-3, 3), rEO2y+random (-3, 3), rEO3x+random (-3, 3), rEO3y+random (-3, 3));
  //R 3-4
  stroke (0, 0, 0, random (-255, 75));
  line(rEO3x+random (-3, 3), rEO3y+random (-3, 3), rEO4x+random (-3, 3), rEO4y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO3x+random (-3, 3), rEO3y+random (-3, 3), rEO4x+random (-3, 3), rEO4y+random (-3, 3));

  //R 4-5
  stroke (0, 0, 0, random (-255, 75));
  line(rEO4x+random (-3, 3), rEO4y+random (-3, 3), rEO5x+random (-3, 3), rEO5y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO4x+random (-3, 3), rEO4y+random (-3, 3), rEO5x+random (-3, 3), rEO5y+random (-3, 3));
  //R 5-6
  stroke (0, 0, 0, random (-255, 75));
  line(rEO5x+random (-3, 3), rEO5y+random (-3, 3), rEO6x+random (-3, 3), rEO6y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO5x+random (-3, 3), rEO5y+random (-3, 3), rEO6x+random (-3, 3), rEO6y+random (-3, 3));
  //R 6-7
  stroke (0, 0, 0, random (-255, 75));
  line(rEO6x+random (-3, 3), rEO6y+random (-3, 3), rEO7x+random (-3, 3), rEO7y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO6x+random (-3, 3), rEO6y+random (-3, 3), rEO7x+random (-3, 3), rEO7y+random (-3, 3));


  //R 7-8
  stroke (0, 0, 0, random (-255, 75));
  line(rEO7x+random (-3, 3), rEO7y+random (-3, 3), rEO8x+random (-3, 3), rEO8y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO7x+random (-3, 3), rEO7y+random (-3, 3), rEO8x+random (-3, 3), rEO8y+random (-3, 3));

  //R 8-9
  stroke (0, 0, 0, random (-255, 75));
  line(rEO8x+random (-3, 3), rEO8y+random (-3, 3), rEO9x+random (-3, 3), rEO9y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO8x+random (-3, 3), rEO8y+random (-3, 3), rEO9x+random (-3, 3), rEO9y+random (-3, 3));
  //R 9-10
  stroke (0, 0, 0, random (-255, 75));
  line(rEO9x+random (-3, 3), rEO3y+random (-3, 3), rEO10x+random (-3, 3), rEO10y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO9x+random (-3, 3), rEO3y+random (-3, 3), rEO10x+random (-3, 3), rEO10y+random (-3, 3));
  //R 10-11
  stroke (0, 0, 0, random (-255, 75));
  line(rEO10x+random (-3, 3), rEO10y+random (-3, 3), rEO11x+random (-3, 3), rEO11y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO10x+random (-3, 3), rEO10y+random (-3, 3), rEO11x+random (-3, 3), rEO11y+random (-3, 3));

  //R 11-12
  stroke (0, 0, 0, random (-255, 75));
  line(rEO11x+random (-3, 3), rEO11y+random (-3, 3), rEO12x+random (-3, 3), rEO12y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO11x+random (-3, 3), rEO11y+random (-3, 3), rEO12x+random (-3, 3), rEO12y+random (-3, 3));

  //R 12-13
  stroke (0, 0, 0, random (-255, 75));
  line(rEO12x+random (-3, 3), rEO12y+random (-3, 3), rEO13x+random (-3, 3), rEO13y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO12x+random (-3, 3), rEO12y+random (-3, 3), rEO13x+random (-3, 3), rEO13y+random (-3, 3));

  //R 13-14
  stroke (0, 0, 0, random (-255, 75));
  line(rEO13x+random (-3, 3), rEO13y+random (-3, 3), rEO14x+random (-3, 3), rEO14y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO13x+random (-3, 3), rEO13y+random (-3, 3), rEO14x+random (-3, 3), rEO14y+random (-3, 3));
  //R 14-15
  stroke (0, 0, 0, random (-255, 75));
  line(rEO14x+random (-3, 3), rEO14y+random (-3, 3), rEO15x+random (-3, 3), rEO15y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO14x+random (-3, 3), rEO14y+random (-3, 3), rEO15x+random (-3, 3), rEO15y+random (-3, 3));
  //R 15-16
  stroke (0, 0, 0, random (-255, 75));
  line(rEO15x+random (-3, 3), rEO15y+random (-3, 3), rEO16x+random (-3, 3), rEO16y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO15x+random (-3, 3), rEO15y+random (-3, 3), rEO16x+random (-3, 3), rEO16y+random (-3, 3));

  //R 16-17
  stroke (0, 0, 0, random (-255, 75));
  line(rEO16x+random (-3, 3), rEO16y+random (-3, 3), rEO17x+random (-3, 3), rEO17y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO16x+random (-3, 3), rEO16y+random (-3, 3), rEO17x+random (-3, 3), rEO17y+random (-3, 3));
  //R 17-18
  stroke (0, 0, 0, random (-255, 75));
  line(rEO17x+random (-3, 3), rEO17y+random (-3, 3), rEO18x+random (-3, 3), rEO18y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO17x+random (-3, 3), rEO17y+random (-3, 3), rEO18x+random (-3, 3), rEO18y+random (-3, 3));
  //R 18-19
  stroke (0, 0, 0, random (-255, 75));
  line(rEO18x+random (-3, 3), rEO18y+random (-3, 3), rEO19x+random (-3, 3), rEO19y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO18x+random (-3, 3), rEO18y+random (-3, 3), rEO19x+random (-3, 3), rEO19y+random (-3, 3));
  //R 19-20
  stroke (0, 0, 0, random (-255, 75));
  line(rEO19x+random (-3, 3), rEO19y+random (-3, 3), rEO20x+random (-3, 3), rEO20y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO19x+random (-3, 3), rEO19y+random (-3, 3), rEO20x+random (-3, 3), rEO20y+random (-3, 3));
  //R 20-1
  stroke (0, 0, 0, random (-255, 75));
  line(rEO20x+random (-3, 3), rEO20y+random (-3, 3), rEO1x+random (-3, 3), rEO1y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO20x+random (-3, 3), rEO20y+random (-3, 3), rEO1x+random (-3, 3), rEO1y+random (-3, 3));

  // REPETITION OF THE ABOVE LINES (REPETITION 2x/X)

  //R 1-2
  stroke (0, 0, 0, random (-255, 75));
  line(rEO1x+random (-3, 3), rEO1y+random (-3, 3), rEO2x+random (-3, 3), rEO2y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO1x+random (-3, 3), rEO1y+random (-3, 3), rEO2x+random (-3, 3), rEO2y+random (-3, 3));
  //R 2-3
  stroke (0, 0, 0, random (-255, 75));
  line(rEO2x+random (-3, 3), rEO2y+random (-3, 3), rEO3x+random (-3, 3), rEO3y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO2x+random (-3, 3), rEO2y+random (-3, 3), rEO3x+random (-3, 3), rEO3y+random (-3, 3));
  //R 3-4
  stroke (0, 0, 0, random (-255, 75));
  line(rEO3x+random (-3, 3), rEO3y+random (-3, 3), rEO4x+random (-3, 3), rEO4y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO3x+random (-3, 3), rEO3y+random (-3, 3), rEO4x+random (-3, 3), rEO4y+random (-3, 3));

  //R 4-5
  stroke (0, 0, 0, random (-255, 75));
  line(rEO4x+random (-3, 3), rEO4y+random (-3, 3), rEO5x+random (-3, 3), rEO5y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO4x+random (-3, 3), rEO4y+random (-3, 3), rEO5x+random (-3, 3), rEO5y+random (-3, 3));
  //R 5-6
  stroke (0, 0, 0, random (-255, 75));
  line(rEO5x+random (-3, 3), rEO5y+random (-3, 3), rEO6x+random (-3, 3), rEO6y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO5x+random (-3, 3), rEO5y+random (-3, 3), rEO6x+random (-3, 3), rEO6y+random (-3, 3));
  //R 6-7
  stroke (0, 0, 0, random (-255, 75));
  line(rEO6x+random (-3, 3), rEO6y+random (-3, 3), rEO7x+random (-3, 3), rEO7y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO6x+random (-3, 3), rEO6y+random (-3, 3), rEO7x+random (-3, 3), rEO7y+random (-3, 3));


  //R 7-8
  stroke (0, 0, 0, random (-255, 75));
  line(rEO7x+random (-3, 3), rEO7y+random (-3, 3), rEO8x+random (-3, 3), rEO8y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO7x+random (-3, 3), rEO7y+random (-3, 3), rEO8x+random (-3, 3), rEO8y+random (-3, 3));

  //R 8-9
  stroke (0, 0, 0, random (-255, 75));
  line(rEO8x+random (-3, 3), rEO8y+random (-3, 3), rEO9x+random (-3, 3), rEO9y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO8x+random (-3, 3), rEO8y+random (-3, 3), rEO9x+random (-3, 3), rEO9y+random (-3, 3));
  //R 9-10
  stroke (0, 0, 0, random (-255, 75));
  line(rEO9x+random (-3, 3), rEO9y+random (-3, 3), rEO10x+random (-3, 3), rEO10y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO9x+random (-3, 3), rEO9y+random (-3, 3), rEO10x+random (-3, 3), rEO10y+random (-3, 3));
  //R 10-11
  stroke (0, 0, 0, random (-255, 75));
  line(rEO10x+random (-3, 3), rEO10y+random (-3, 3), rEO11x+random (-3, 3), rEO11y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO10x+random (-3, 3), rEO10y+random (-3, 3), rEO11x+random (-3, 3), rEO11y+random (-3, 3));

  //R 11-12
  stroke (0, 0, 0, random (-255, 75));
  line(rEO11x+random (-3, 3), rEO11y+random (-3, 3), rEO12x+random (-3, 3), rEO12y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO11x+random (-3, 3), rEO11y+random (-3, 3), rEO12x+random (-3, 3), rEO12y+random (-3, 3));

  //R 12-13
  stroke (0, 0, 0, random (-255, 75));
  line(rEO12x+random (-3, 3), rEO12y+random (-3, 3), rEO13x+random (-3, 3), rEO13y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO12x+random (-3, 3), rEO12y+random (-3, 3), rEO13x+random (-3, 3), rEO13y+random (-3, 3));

  //R 13-14
  stroke (0, 0, 0, random (-255, 75));
  line(rEO13x+random (-3, 3), rEO13y+random (-3, 3), rEO14x+random (-3, 3), rEO14y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO13x+random (-3, 3), rEO13y+random (-3, 3), rEO14x+random (-3, 3), rEO14y+random (-3, 3));
  //R 14-15
  stroke (0, 0, 0, random (-255, 75));
  line(rEO14x+random (-3, 3), rEO14y+random (-3, 3), rEO15x+random (-3, 3), rEO15y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO14x+random (-3, 3), rEO14y+random (-3, 3), rEO15x+random (-3, 3), rEO15y+random (-3, 3));
  //R 15-16
  stroke (0, 0, 0, random (-255, 75));
  line(rEO15x+random (-3, 3), rEO15y+random (-3, 3), rEO16x+random (-3, 3), rEO16y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO15x+random (-3, 3), rEO15y+random (-3, 3), rEO16x+random (-3, 3), rEO16y+random (-3, 3));

  //R 16-17
  stroke (0, 0, 0, random (-255, 75));
  line(rEO16x+random (-3, 3), rEO16y+random (-3, 3), rEO17x+random (-3, 3), rEO17y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO16x+random (-3, 3), rEO16y+random (-3, 3), rEO17x+random (-3, 3), rEO17y+random (-3, 3));
  //R 17-18
  stroke (0, 0, 0, random (-255, 75));
  line(rEO17x+random (-3, 3), rEO17y+random (-3, 3), rEO18x+random (-3, 3), rEO18y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO17x+random (-3, 3), rEO17y+random (-3, 3), rEO18x+random (-3, 3), rEO18y+random (-3, 3));
  //R 18-19
  stroke (0, 0, 0, random (-255, 75));
  line(rEO18x+random (-3, 3), rEO18y+random (-3, 3), rEO19x+random (-3, 3), rEO19y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO18x+random (-3, 3), rEO18y+random (-3, 3), rEO19x+random (-3, 3), rEO19y+random (-3, 3));
  //R 19-20
  stroke (0, 0, 0, random (-255, 75));
  line(rEO19x+random (-3, 3), rEO19y+random (-3, 3), rEO20x+random (-3, 3), rEO20y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO19x+random (-3, 3), rEO19y+random (-3, 3), rEO20x+random (-3, 3), rEO20y+random (-3, 3));
  //R 20-1
  stroke (0, 0, 0, random (-255, 75));
  line(rEO20x+random (-3, 3), rEO20y+random (-3, 3), rEO1x+random (-3, 3), rEO1y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO20x+random (-3, 3), rEO20y+random (-3, 3), rEO1x+random (-3, 3), rEO1y+random (-3, 3));
  //R 1-2
  stroke (0, 0, 0, random (-255, 75));
  line(rEO1x+random (-3, 3), rEO1y+random (-3, 3), rEO2x+random (-3, 3), rEO2y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO1x+random (-3, 3), rEO1y+random (-3, 3), rEO2x+random (-3, 3), rEO2y+random (-3, 3));
  //R 2-3
  stroke (0, 0, 0, random (-255, 75));
  line(rEO2x+random (-3, 3), rEO2y+random (-3, 3), rEO3x+random (-3, 3), rEO3y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO2x+random (-3, 3), rEO2y+random (-3, 3), rEO3x+random (-3, 3), rEO3y+random (-3, 3));
  //R 3-4
  stroke (0, 0, 0, random (-255, 75));
  line(rEO3x+random (-3, 3), rEO3y+random (-3, 3), rEO4x+random (-3, 3), rEO4y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO3x+random (-3, 3), rEO3y+random (-3, 3), rEO4x+random (-3, 3), rEO4y+random (-3, 3));

  //R 4-5
  stroke (0, 0, 0, random (-255, 75));
  line(rEO4x+random (-3, 3), rEO4y+random (-3, 3), rEO5x+random (-3, 3), rEO5y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO4x+random (-3, 3), rEO4y+random (-3, 3), rEO5x+random (-3, 3), rEO5y+random (-3, 3));
  //R 5-6
  stroke (0, 0, 0, random (-255, 75));
  line(rEO5x+random (-3, 3), rEO5y+random (-3, 3), rEO6x+random (-3, 3), rEO6y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO5x+random (-3, 3), rEO5y+random (-3, 3), rEO6x+random (-3, 3), rEO6y+random (-3, 3));
  //R 6-7
  stroke (0, 0, 0, random (-255, 75));
  line(rEO6x+random (-3, 3), rEO6y+random (-3, 3), rEO7x+random (-3, 3), rEO7y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO6x+random (-3, 3), rEO6y+random (-3, 3), rEO7x+random (-3, 3), rEO7y+random (-3, 3));


  //R 7-8
  stroke (0, 0, 0, random (-255, 75));
  line(rEO7x+random (-3, 3), rEO7y+random (-3, 3), rEO8x+random (-3, 3), rEO8y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO7x+random (-3, 3), rEO7y+random (-3, 3), rEO8x+random (-3, 3), rEO8y+random (-3, 3));

  //R 8-9
  stroke (0, 0, 0, random (-255, 75));
  line(rEO8x+random (-3, 3), rEO8y+random (-3, 3), rEO9x+random (-3, 3), rEO9y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO8x+random (-3, 3), rEO8y+random (-3, 3), rEO9x+random (-3, 3), rEO9y+random (-3, 3));
  //R 9-10
  stroke (0, 0, 0, random (-255, 75));
  line(rEO9x+random (-3, 3), rEO9y+random (-3, 3), rEO10x+random (-3, 3), rEO10y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO9x+random (-3, 3), rEO9y+random (-3, 3), rEO10x+random (-3, 3), rEO10y+random (-3, 3));
  //R 10-11
  stroke (0, 0, 0, random (-255, 75));
  line(rEO10x+random (-3, 3), rEO10y+random (-3, 3), rEO11x+random (-3, 3), rEO11y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO10x+random (-3, 3), rEO10y+random (-3, 3), rEO11x+random (-3, 3), rEO11y+random (-3, 3));

  //R 11-12
  stroke (0, 0, 0, random (-255, 75));
  line(rEO11x+random (-3, 3), rEO11y+random (-3, 3), rEO12x+random (-3, 3), rEO12y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO11x+random (-3, 3), rEO11y+random (-3, 3), rEO12x+random (-3, 3), rEO12y+random (-3, 3));

  //R 12-13
  stroke (0, 0, 0, random (-255, 75));
  line(rEO12x+random (-3, 3), rEO12y+random (-3, 3), rEO13x+random (-3, 3), rEO13y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO12x+random (-3, 3), rEO12y+random (-3, 3), rEO13x+random (-3, 3), rEO13y+random (-3, 3));

  //R 13-14
  stroke (0, 0, 0, random (-255, 75));
  line(rEO13x+random (-3, 3), rEO13y+random (-3, 3), rEO14x+random (-3, 3), rEO14y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO13x+random (-3, 3), rEO13y+random (-3, 3), rEO14x+random (-3, 3), rEO14y+random (-3, 3));
  //R 14-15
  stroke (0, 0, 0, random (-255, 75));
  line(rEO14x+random (-3, 3), rEO14y+random (-3, 3), rEO15x+random (-3, 3), rEO15y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO14x+random (-3, 3), rEO14y+random (-3, 3), rEO15x+random (-3, 3), rEO15y+random (-3, 3));
  //R 15-16
  stroke (0, 0, 0, random (-255, 75));
  line(rEO15x+random (-3, 3), rEO15y+random (-3, 3), rEO16x+random (-3, 3), rEO16y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO15x+random (-3, 3), rEO15y+random (-3, 3), rEO16x+random (-3, 3), rEO16y+random (-3, 3));

  //R 16-17
  stroke (0, 0, 0, random (-255, 75));
  line(rEO16x+random (-3, 3), rEO16y+random (-3, 3), rEO17x+random (-3, 3), rEO17y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO16x+random (-3, 3), rEO16y+random (-3, 3), rEO17x+random (-3, 3), rEO17y+random (-3, 3));
  //R 17-18
  stroke (0, 0, 0, random (-255, 75));
  line(rEO17x+random (-3, 3), rEO17y+random (-3, 3), rEO18x+random (-3, 3), rEO18y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO17x+random (-3, 3), rEO17y+random (-3, 3), rEO18x+random (-3, 3), rEO18y+random (-3, 3));
  //R 18-19
  stroke (0, 0, 0, random (-255, 75));
  line(rEO18x+random (-3, 3), rEO18y+random (-3, 3), rEO19x+random (-3, 3), rEO19y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO18x+random (-3, 3), rEO18y+random (-3, 3), rEO19x+random (-3, 3), rEO19y+random (-3, 3));
  //R 19-20
  stroke (0, 0, 0, random (-255, 75));
  line(rEO19x+random (-3, 3), rEO19y+random (-3, 3), rEO20x+random (-3, 3), rEO20y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO19x+random (-3, 3), rEO19y+random (-3, 3), rEO20x+random (-3, 3), rEO20y+random (-3, 3));
  //R 20-1
  stroke (0, 0, 0, random (-255, 75));
  line(rEO20x+random (-3, 3), rEO20y+random (-3, 3), rEO1x+random (-3, 3), rEO1y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO20x+random (-3, 3), rEO20y+random (-3, 3), rEO1x+random (-3, 3), rEO1y+random (-3, 3));

  //R 1-2 (REPETITION 1x/X)
  stroke (0, 0, 0, random (-255, 75));
  line(rEO1x+random (-3, 3), rEO1y+random (-3, 3), rEO2x+random (-3, 3), rEO2y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO1x+random (-3, 3), rEO1y+random (-3, 3), rEO2x+random (-3, 3), rEO2y+random (-3, 3));
  //R 2-3
  stroke (0, 0, 0, random (-255, 75));
  line(rEO2x+random (-3, 3), rEO2y+random (-3, 3), rEO3x+random (-3, 3), rEO3y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO2x+random (-3, 3), rEO2y+random (-3, 3), rEO3x+random (-3, 3), rEO3y+random (-3, 3));
  //R 3-4
  stroke (0, 0, 0, random (-255, 75));
  line(rEO3x+random (-3, 3), rEO3y+random (-3, 3), rEO4x+random (-3, 3), rEO4y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO3x+random (-3, 3), rEO3y+random (-3, 3), rEO4x+random (-3, 3), rEO4y+random (-3, 3));

  //R 4-5
  stroke (0, 0, 0, random (-255, 75));
  line(rEO4x+random (-3, 3), rEO4y+random (-3, 3), rEO5x+random (-3, 3), rEO5y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO4x+random (-3, 3), rEO4y+random (-3, 3), rEO5x+random (-3, 3), rEO5y+random (-3, 3));
  //R 5-6
  stroke (0, 0, 0, random (-255, 75));
  line(rEO5x+random (-3, 3), rEO5y+random (-3, 3), rEO6x+random (-3, 3), rEO6y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO5x+random (-3, 3), rEO5y+random (-3, 3), rEO6x+random (-3, 3), rEO6y+random (-3, 3));
  //R 6-7
  stroke (0, 0, 0, random (-255, 75));
  line(rEO6x+random (-3, 3), rEO6y+random (-3, 3), rEO7x+random (-3, 3), rEO7y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO6x+random (-3, 3), rEO6y+random (-3, 3), rEO7x+random (-3, 3), rEO7y+random (-3, 3));


  //R 7-8
  stroke (0, 0, 0, random (-255, 75));
  line(rEO7x+random (-3, 3), rEO7y+random (-3, 3), rEO8x+random (-3, 3), rEO8y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO7x+random (-3, 3), rEO7y+random (-3, 3), rEO8x+random (-3, 3), rEO8y+random (-3, 3));

  //R 8-9
  stroke (0, 0, 0, random (-255, 75));
  line(rEO8x+random (-3, 3), rEO8y+random (-3, 3), rEO9x+random (-3, 3), rEO9y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO8x+random (-3, 3), rEO8y+random (-3, 3), rEO9x+random (-3, 3), rEO9y+random (-3, 3));
  //R 9-10
  stroke (0, 0, 0, random (-255, 75));
  line(rEO9x+random (-3, 3), rEO9y+random (-3, 3), rEO10x+random (-3, 3), rEO10y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO9x+random (-3, 3), rEO9y+random (-3, 3), rEO10x+random (-3, 3), rEO10y+random (-3, 3));
  //R 10-11
  stroke (0, 0, 0, random (-255, 75));
  line(rEO10x+random (-3, 3), rEO10y+random (-3, 3), rEO11x+random (-3, 3), rEO11y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO10x+random (-3, 3), rEO10y+random (-3, 3), rEO11x+random (-3, 3), rEO11y+random (-3, 3));

  //R 11-12
  stroke (0, 0, 0, random (-255, 75));
  line(rEO11x+random (-3, 3), rEO11y+random (-3, 3), rEO12x+random (-3, 3), rEO12y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO11x+random (-3, 3), rEO11y+random (-3, 3), rEO12x+random (-3, 3), rEO12y+random (-3, 3));

  //R 12-13
  stroke (0, 0, 0, random (-255, 75));
  line(rEO12x+random (-3, 3), rEO12y+random (-3, 3), rEO13x+random (-3, 3), rEO13y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO12x+random (-3, 3), rEO12y+random (-3, 3), rEO13x+random (-3, 3), rEO13y+random (-3, 3));

  //R 13-14
  stroke (0, 0, 0, random (-255, 75));
  line(rEO13x+random (-3, 3), rEO13y+random (-3, 3), rEO14x+random (-3, 3), rEO14y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO13x+random (-3, 3), rEO13y+random (-3, 3), rEO14x+random (-3, 3), rEO14y+random (-3, 3));
  //R 14-15
  stroke (0, 0, 0, random (-255, 75));
  line(rEO14x+random (-3, 3), rEO14y+random (-3, 3), rEO15x+random (-3, 3), rEO15y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO14x+random (-3, 3), rEO14y+random (-3, 3), rEO15x+random (-3, 3), rEO15y+random (-3, 3));
  //R 15-16
  stroke (0, 0, 0, random (-255, 75));
  line(rEO15x+random (-3, 3), rEO15y+random (-3, 3), rEO16x+random (-3, 3), rEO16y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO15x+random (-3, 3), rEO15y+random (-3, 3), rEO16x+random (-3, 3), rEO16y+random (-3, 3));

  //R 16-17
  stroke (0, 0, 0, random (-255, 75));
  line(rEO16x+random (-3, 3), rEO16y+random (-3, 3), rEO17x+random (-3, 3), rEO17y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO16x+random (-3, 3), rEO16y+random (-3, 3), rEO17x+random (-3, 3), rEO17y+random (-3, 3));
  //R 17-18
  stroke (0, 0, 0, random (-255, 75));
  line(rEO17x+random (-3, 3), rEO17y+random (-3, 3), rEO18x+random (-3, 3), rEO18y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO17x+random (-3, 3), rEO17y+random (-3, 3), rEO18x+random (-3, 3), rEO18y+random (-3, 3));
  //R 18-19
  stroke (0, 0, 0, random (-255, 75));
  line(rEO18x+random (-3, 3), rEO18y+random (-3, 3), rEO19x+random (-3, 3), rEO19y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO18x+random (-3, 3), rEO18y+random (-3, 3), rEO19x+random (-3, 3), rEO19y+random (-3, 3));
  //R 19-20
  stroke (0, 0, 0, random (-255, 75));
  line(rEO19x+random (-3, 3), rEO19y+random (-3, 3), rEO20x+random (-3, 3), rEO20y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO19x+random (-3, 3), rEO19y+random (-3, 3), rEO20x+random (-3, 3), rEO20y+random (-3, 3));
  //R 20-1
  stroke (0, 0, 0, random (-255, 75));
  line(rEO20x+random (-3, 3), rEO20y+random (-3, 3), rEO1x+random (-3, 3), rEO1y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO20x+random (-3, 3), rEO20y+random (-3, 3), rEO1x+random (-3, 3), rEO1y+random (-3, 3));

  //R 1-2
  stroke (0, 0, 0, random (-255, 75));
  line(rEO1x+random (-3, 3), rEO1y+random (-3, 3), rEO2x+random (-3, 3), rEO2y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO1x+random (-3, 3), rEO1y+random (-3, 3), rEO2x+random (-3, 3), rEO2y+random (-3, 3));
  //R 2-3
  stroke (0, 0, 0, random (-255, 75));
  line(rEO2x+random (-3, 3), rEO2y+random (-3, 3), rEO3x+random (-3, 3), rEO3y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO2x+random (-3, 3), rEO2y+random (-3, 3), rEO3x+random (-3, 3), rEO3y+random (-3, 3));
  //R 3-4
  stroke (0, 0, 0, random (-255, 75));
  line(rEO3x+random (-3, 3), rEO3y+random (-3, 3), rEO4x+random (-3, 3), rEO4y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO3x+random (-3, 3), rEO3y+random (-3, 3), rEO4x+random (-3, 3), rEO4y+random (-3, 3));

  //R 4-5
  stroke (0, 0, 0, random (-255, 75));
  line(rEO4x+random (-3, 3), rEO4y+random (-3, 3), rEO5x+random (-3, 3), rEO5y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO4x+random (-3, 3), rEO4y+random (-3, 3), rEO5x+random (-3, 3), rEO5y+random (-3, 3));
  //R 5-6
  stroke (0, 0, 0, random (-255, 75));
  line(rEO5x+random (-3, 3), rEO5y+random (-3, 3), rEO6x+random (-3, 3), rEO6y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO5x+random (-3, 3), rEO5y+random (-3, 3), rEO6x+random (-3, 3), rEO6y+random (-3, 3));
  //R 6-7
  stroke (0, 0, 0, random (-255, 75));
  line(rEO6x+random (-3, 3), rEO6y+random (-3, 3), rEO7x+random (-3, 3), rEO7y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO6x+random (-3, 3), rEO6y+random (-3, 3), rEO7x+random (-3, 3), rEO7y+random (-3, 3));


  //R 7-8
  stroke (0, 0, 0, random (-255, 75));
  line(rEO7x+random (-3, 3), rEO7y+random (-3, 3), rEO8x+random (-3, 3), rEO8y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO7x+random (-3, 3), rEO7y+random (-3, 3), rEO8x+random (-3, 3), rEO8y+random (-3, 3));

  //R 8-9
  stroke (0, 0, 0, random (-255, 75));
  line(rEO8x+random (-3, 3), rEO8y+random (-3, 3), rEO9x+random (-3, 3), rEO9y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO8x+random (-3, 3), rEO8y+random (-3, 3), rEO9x+random (-3, 3), rEO9y+random (-3, 3));
  //R 9-10
  stroke (0, 0, 0, random (-255, 75));
  line(rEO9x+random (-3, 3), rEO9y+random (-3, 3), rEO10x+random (-3, 3), rEO10y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO9x+random (-3, 3), rEO9y+random (-3, 3), rEO10x+random (-3, 3), rEO10y+random (-3, 3));
  //R 10-11
  stroke (0, 0, 0, random (-255, 75));
  line(rEO10x+random (-3, 3), rEO10y+random (-3, 3), rEO11x+random (-3, 3), rEO11y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO10x+random (-3, 3), rEO10y+random (-3, 3), rEO11x+random (-3, 3), rEO11y+random (-3, 3));

  //R 11-12
  stroke (0, 0, 0, random (-255, 75));
  line(rEO11x+random (-3, 3), rEO11y+random (-3, 3), rEO12x+random (-3, 3), rEO12y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO11x+random (-3, 3), rEO11y+random (-3, 3), rEO12x+random (-3, 3), rEO12y+random (-3, 3));

  //R 12-13
  stroke (0, 0, 0, random (-255, 75));
  line(rEO12x+random (-3, 3), rEO12y+random (-3, 3), rEO13x+random (-3, 3), rEO13y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO12x+random (-3, 3), rEO12y+random (-3, 3), rEO13x+random (-3, 3), rEO13y+random (-3, 3));

  //R 13-14
  stroke (0, 0, 0, random (-255, 75));
  line(rEO13x+random (-3, 3), rEO13y+random (-3, 3), rEO14x+random (-3, 3), rEO14y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO13x+random (-3, 3), rEO13y+random (-3, 3), rEO14x+random (-3, 3), rEO14y+random (-3, 3));
  //R 14-15
  stroke (0, 0, 0, random (-255, 75));
  line(rEO14x+random (-3, 3), rEO14y+random (-3, 3), rEO15x+random (-3, 3), rEO15y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO14x+random (-3, 3), rEO14y+random (-3, 3), rEO15x+random (-3, 3), rEO15y+random (-3, 3));
  //R 15-16
  stroke (0, 0, 0, random (-255, 75));
  line(rEO15x+random (-3, 3), rEO15y+random (-3, 3), rEO16x+random (-3, 3), rEO16y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO15x+random (-3, 3), rEO15y+random (-3, 3), rEO16x+random (-3, 3), rEO16y+random (-3, 3));

  //R 16-17
  stroke (0, 0, 0, random (-255, 75));
  line(rEO16x+random (-3, 3), rEO16y+random (-3, 3), rEO17x+random (-3, 3), rEO17y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO16x+random (-3, 3), rEO16y+random (-3, 3), rEO17x+random (-3, 3), rEO17y+random (-3, 3));
  //R 17-18
  stroke (0, 0, 0, random (-255, 75));
  line(rEO17x+random (-3, 3), rEO17y+random (-3, 3), rEO18x+random (-3, 3), rEO18y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO17x+random (-3, 3), rEO17y+random (-3, 3), rEO18x+random (-3, 3), rEO18y+random (-3, 3));
  //R 18-19
  stroke (0, 0, 0, random (-255, 75));
  line(rEO18x+random (-3, 3), rEO18y+random (-3, 3), rEO19x+random (-3, 3), rEO19y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO18x+random (-3, 3), rEO18y+random (-3, 3), rEO19x+random (-3, 3), rEO19y+random (-3, 3));
  //R 19-20
  stroke (0, 0, 0, random (-255, 75));
  line(rEO19x+random (-3, 3), rEO19y+random (-3, 3), rEO20x+random (-3, 3), rEO20y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO19x+random (-3, 3), rEO19y+random (-3, 3), rEO20x+random (-3, 3), rEO20y+random (-3, 3));
  //R 20-1
  stroke (0, 0, 0, random (-255, 75));
  line(rEO20x+random (-3, 3), rEO20y+random (-3, 3), rEO1x+random (-3, 3), rEO1y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO20x+random (-3, 3), rEO20y+random (-3, 3), rEO1x+random (-3, 3), rEO1y+random (-3, 3));

  //R 1-2 (REPETITION 3x/X)
  stroke (0, 0, 0, random (-255, 75));
  line(rEO1x+random (-3, 3), rEO1y+random (-3, 3), rEO2x+random (-3, 3), rEO2y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO1x+random (-3, 3), rEO1y+random (-3, 3), rEO2x+random (-3, 3), rEO2y+random (-3, 3));
  //R 2-3
  stroke (0, 0, 0, random (-255, 75));
  line(rEO2x+random (-3, 3), rEO2y+random (-3, 3), rEO3x+random (-3, 3), rEO3y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO2x+random (-3, 3), rEO2y+random (-3, 3), rEO3x+random (-3, 3), rEO3y+random (-3, 3));
  //R 3-4
  stroke (0, 0, 0, random (-255, 75));
  line(rEO3x+random (-3, 3), rEO3y+random (-3, 3), rEO4x+random (-3, 3), rEO4y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO3x+random (-3, 3), rEO3y+random (-3, 3), rEO4x+random (-3, 3), rEO4y+random (-3, 3));

  //R 4-5
  stroke (0, 0, 0, random (-255, 75));
  line(rEO4x+random (-3, 3), rEO4y+random (-3, 3), rEO5x+random (-3, 3), rEO5y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO4x+random (-3, 3), rEO4y+random (-3, 3), rEO5x+random (-3, 3), rEO5y+random (-3, 3));
  //R 5-6
  stroke (0, 0, 0, random (-255, 75));
  line(rEO5x+random (-3, 3), rEO5y+random (-3, 3), rEO6x+random (-3, 3), rEO6y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO5x+random (-3, 3), rEO5y+random (-3, 3), rEO6x+random (-3, 3), rEO6y+random (-3, 3));
  //R 6-7
  stroke (0, 0, 0, random (-255, 75));
  line(rEO6x+random (-3, 3), rEO6y+random (-3, 3), rEO7x+random (-3, 3), rEO7y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO6x+random (-3, 3), rEO6y+random (-3, 3), rEO7x+random (-3, 3), rEO7y+random (-3, 3));


  //R 7-8
  stroke (0, 0, 0, random (-255, 75));
  line(rEO7x+random (-3, 3), rEO7y+random (-3, 3), rEO8x+random (-3, 3), rEO8y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO7x+random (-3, 3), rEO7y+random (-3, 3), rEO8x+random (-3, 3), rEO8y+random (-3, 3));

  //R 8-9
  stroke (0, 0, 0, random (-255, 75));
  line(rEO8x+random (-3, 3), rEO8y+random (-3, 3), rEO9x+random (-3, 3), rEO9y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO8x+random (-3, 3), rEO8y+random (-3, 3), rEO9x+random (-3, 3), rEO9y+random (-3, 3));
  //R 9-10
  stroke (0, 0, 0, random (-255, 75));
  line(rEO9x+random (-3, 3), rEO9y+random (-3, 3), rEO10x+random (-3, 3), rEO10y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO9x+random (-3, 3), rEO9y+random (-3, 3), rEO10x+random (-3, 3), rEO10y+random (-3, 3));
  //R 10-11
  stroke (0, 0, 0, random (-255, 75));
  line(rEO10x+random (-3, 3), rEO10y+random (-3, 3), rEO11x+random (-3, 3), rEO11y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO10x+random (-3, 3), rEO10y+random (-3, 3), rEO11x+random (-3, 3), rEO11y+random (-3, 3));

  //R 11-12
  stroke (0, 0, 0, random (-255, 75));
  line(rEO11x+random (-3, 3), rEO11y+random (-3, 3), rEO12x+random (-3, 3), rEO12y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO11x+random (-3, 3), rEO11y+random (-3, 3), rEO12x+random (-3, 3), rEO12y+random (-3, 3));

  //R 12-13
  stroke (0, 0, 0, random (-255, 75));
  line(rEO12x+random (-3, 3), rEO12y+random (-3, 3), rEO13x+random (-3, 3), rEO13y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO12x+random (-3, 3), rEO12y+random (-3, 3), rEO13x+random (-3, 3), rEO13y+random (-3, 3));

  //R 13-14
  stroke (0, 0, 0, random (-255, 75));
  line(rEO13x+random (-3, 3), rEO13y+random (-3, 3), rEO14x+random (-3, 3), rEO14y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO13x+random (-3, 3), rEO13y+random (-3, 3), rEO14x+random (-3, 3), rEO14y+random (-3, 3));
  //R 14-15
  stroke (0, 0, 0, random (-255, 75));
  line(rEO14x+random (-3, 3), rEO14y+random (-3, 3), rEO15x+random (-3, 3), rEO15y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO14x+random (-3, 3), rEO14y+random (-3, 3), rEO15x+random (-3, 3), rEO15y+random (-3, 3));
  //R 15-16
  stroke (0, 0, 0, random (-255, 75));
  line(rEO15x+random (-3, 3), rEO15y+random (-3, 3), rEO16x+random (-3, 3), rEO16y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO15x+random (-3, 3), rEO15y+random (-3, 3), rEO16x+random (-3, 3), rEO16y+random (-3, 3));

  //R 16-17
  stroke (0, 0, 0, random (-255, 75));
  line(rEO16x+random (-3, 3), rEO16y+random (-3, 3), rEO17x+random (-3, 3), rEO17y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO16x+random (-3, 3), rEO16y+random (-3, 3), rEO17x+random (-3, 3), rEO17y+random (-3, 3));
  //R 17-18
  stroke (0, 0, 0, random (-255, 75));
  line(rEO17x+random (-3, 3), rEO17y+random (-3, 3), rEO18x+random (-3, 3), rEO18y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO17x+random (-3, 3), rEO17y+random (-3, 3), rEO18x+random (-3, 3), rEO18y+random (-3, 3));
  //R 18-19
  stroke (0, 0, 0, random (-255, 75));
  line(rEO18x+random (-3, 3), rEO18y+random (-3, 3), rEO19x+random (-3, 3), rEO19y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO18x+random (-3, 3), rEO18y+random (-3, 3), rEO19x+random (-3, 3), rEO19y+random (-3, 3));
  //R 19-20
  stroke (0, 0, 0, random (-255, 75));
  line(rEO19x+random (-3, 3), rEO19y+random (-3, 3), rEO20x+random (-3, 3), rEO20y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO19x+random (-3, 3), rEO19y+random (-3, 3), rEO20x+random (-3, 3), rEO20y+random (-3, 3));
  //R 20-1
  stroke (0, 0, 0, random (-255, 75));
  line(rEO20x+random (-3, 3), rEO20y+random (-3, 3), rEO1x+random (-3, 3), rEO1y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO20x+random (-3, 3), rEO20y+random (-3, 3), rEO1x+random (-3, 3), rEO1y+random (-3, 3));

  //R 1-2
  stroke (0, 0, 0, random (-255, 75));
  line(rEO1x+random (-3, 3), rEO1y+random (-3, 3), rEO2x+random (-3, 3), rEO2y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO1x+random (-3, 3), rEO1y+random (-3, 3), rEO2x+random (-3, 3), rEO2y+random (-3, 3));
  //R 2-3
  stroke (0, 0, 0, random (-255, 75));
  line(rEO2x+random (-3, 3), rEO2y+random (-3, 3), rEO3x+random (-3, 3), rEO3y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO2x+random (-3, 3), rEO2y+random (-3, 3), rEO3x+random (-3, 3), rEO3y+random (-3, 3));
  //R 3-4
  stroke (0, 0, 0, random (-255, 75));
  line(rEO3x+random (-3, 3), rEO3y+random (-3, 3), rEO4x+random (-3, 3), rEO4y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO3x+random (-3, 3), rEO3y+random (-3, 3), rEO4x+random (-3, 3), rEO4y+random (-3, 3));

  //R 4-5
  stroke (0, 0, 0, random (-255, 75));
  line(rEO4x+random (-3, 3), rEO4y+random (-3, 3), rEO5x+random (-3, 3), rEO5y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO4x+random (-3, 3), rEO4y+random (-3, 3), rEO5x+random (-3, 3), rEO5y+random (-3, 3));
  //R 5-6
  stroke (0, 0, 0, random (-255, 75));
  line(rEO5x+random (-3, 3), rEO5y+random (-3, 3), rEO6x+random (-3, 3), rEO6y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO5x+random (-3, 3), rEO5y+random (-3, 3), rEO6x+random (-3, 3), rEO6y+random (-3, 3));
  //R 6-7
  stroke (0, 0, 0, random (-255, 75));
  line(rEO6x+random (-3, 3), rEO6y+random (-3, 3), rEO7x+random (-3, 3), rEO7y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO6x+random (-3, 3), rEO6y+random (-3, 3), rEO7x+random (-3, 3), rEO7y+random (-3, 3));


  //R 7-8
  stroke (0, 0, 0, random (-255, 75));
  line(rEO7x+random (-3, 3), rEO7y+random (-3, 3), rEO8x+random (-3, 3), rEO8y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO7x+random (-3, 3), rEO7y+random (-3, 3), rEO8x+random (-3, 3), rEO8y+random (-3, 3));

  //R 8-9
  stroke (0, 0, 0, random (-255, 75));
  line(rEO8x+random (-3, 3), rEO8y+random (-3, 3), rEO9x+random (-3, 3), rEO9y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO8x+random (-3, 3), rEO8y+random (-3, 3), rEO9x+random (-3, 3), rEO9y+random (-3, 3));
  //R 9-10
  stroke (0, 0, 0, random (-255, 75));
  line(rEO9x+random (-3, 3), rEO9y+random (-3, 3), rEO10x+random (-3, 3), rEO10y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO9x+random (-3, 3), rEO9y+random (-3, 3), rEO10x+random (-3, 3), rEO10y+random (-3, 3));
  //R 10-11
  stroke (0, 0, 0, random (-255, 75));
  line(rEO10x+random (-3, 3), rEO10y+random (-3, 3), rEO11x+random (-3, 3), rEO11y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO10x+random (-3, 3), rEO10y+random (-3, 3), rEO11x+random (-3, 3), rEO11y+random (-3, 3));

  //R 11-12
  stroke (0, 0, 0, random (-255, 75));
  line(rEO11x+random (-3, 3), rEO11y+random (-3, 3), rEO12x+random (-3, 3), rEO12y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO11x+random (-3, 3), rEO11y+random (-3, 3), rEO12x+random (-3, 3), rEO12y+random (-3, 3));

  //R 12-13
  stroke (0, 0, 0, random (-255, 75));
  line(rEO12x+random (-3, 3), rEO12y+random (-3, 3), rEO13x+random (-3, 3), rEO13y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO12x+random (-3, 3), rEO12y+random (-3, 3), rEO13x+random (-3, 3), rEO13y+random (-3, 3));

  //R 13-14
  stroke (0, 0, 0, random (-255, 75));
  line(rEO13x+random (-3, 3), rEO13y+random (-3, 3), rEO14x+random (-3, 3), rEO14y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO13x+random (-3, 3), rEO13y+random (-3, 3), rEO14x+random (-3, 3), rEO14y+random (-3, 3));
  //R 14-15
  stroke (0, 0, 0, random (-255, 75));
  line(rEO14x+random (-3, 3), rEO14y+random (-3, 3), rEO15x+random (-3, 3), rEO15y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO14x+random (-3, 3), rEO14y+random (-3, 3), rEO15x+random (-3, 3), rEO15y+random (-3, 3));
  //R 15-16
  stroke (0, 0, 0, random (-255, 75));
  line(rEO15x+random (-3, 3), rEO15y+random (-3, 3), rEO16x+random (-3, 3), rEO16y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO15x+random (-3, 3), rEO15y+random (-3, 3), rEO16x+random (-3, 3), rEO16y+random (-3, 3));

  //R 16-17
  stroke (0, 0, 0, random (-255, 75));
  line(rEO16x+random (-3, 3), rEO16y+random (-3, 3), rEO17x+random (-3, 3), rEO17y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO16x+random (-3, 3), rEO16y+random (-3, 3), rEO17x+random (-3, 3), rEO17y+random (-3, 3));
  //R 17-18
  stroke (0, 0, 0, random (-255, 75));
  line(rEO17x+random (-3, 3), rEO17y+random (-3, 3), rEO18x+random (-3, 3), rEO18y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO17x+random (-3, 3), rEO17y+random (-3, 3), rEO18x+random (-3, 3), rEO18y+random (-3, 3));
  //R 18-19
  stroke (0, 0, 0, random (-255, 75));
  line(rEO18x+random (-3, 3), rEO18y+random (-3, 3), rEO19x+random (-3, 3), rEO19y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO18x+random (-3, 3), rEO18y+random (-3, 3), rEO19x+random (-3, 3), rEO19y+random (-3, 3));
  //R 19-20
  stroke (0, 0, 0, random (-255, 75));
  line(rEO19x+random (-3, 3), rEO19y+random (-3, 3), rEO20x+random (-3, 3), rEO20y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO19x+random (-3, 3), rEO19y+random (-3, 3), rEO20x+random (-3, 3), rEO20y+random (-3, 3));
  //R 20-1
  stroke (0, 0, 0, random (-255, 75));
  line(rEO20x+random (-3, 3), rEO20y+random (-3, 3), rEO1x+random (-3, 3), rEO1y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO20x+random (-3, 3), rEO20y+random (-3, 3), rEO1x+random (-3, 3), rEO1y+random (-3, 3));

  //R 1-2 (REPETITION 4x/X)
  stroke (0, 0, 0, random (-255, 75));
  line(rEO1x+random (-3, 3), rEO1y+random (-3, 3), rEO2x+random (-3, 3), rEO2y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO1x+random (-3, 3), rEO1y+random (-3, 3), rEO2x+random (-3, 3), rEO2y+random (-3, 3));
  //R 2-3
  stroke (0, 0, 0, random (-255, 75));
  line(rEO2x+random (-3, 3), rEO2y+random (-3, 3), rEO3x+random (-3, 3), rEO3y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO2x+random (-3, 3), rEO2y+random (-3, 3), rEO3x+random (-3, 3), rEO3y+random (-3, 3));
  //R 3-4
  stroke (0, 0, 0, random (-255, 75));
  line(rEO3x+random (-3, 3), rEO3y+random (-3, 3), rEO4x+random (-3, 3), rEO4y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO3x+random (-3, 3), rEO3y+random (-3, 3), rEO4x+random (-3, 3), rEO4y+random (-3, 3));

  //R 4-5
  stroke (0, 0, 0, random (-255, 75));
  line(rEO4x+random (-3, 3), rEO4y+random (-3, 3), rEO5x+random (-3, 3), rEO5y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO4x+random (-3, 3), rEO4y+random (-3, 3), rEO5x+random (-3, 3), rEO5y+random (-3, 3));
  //R 5-6
  stroke (0, 0, 0, random (-255, 75));
  line(rEO5x+random (-3, 3), rEO5y+random (-3, 3), rEO6x+random (-3, 3), rEO6y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO5x+random (-3, 3), rEO5y+random (-3, 3), rEO6x+random (-3, 3), rEO6y+random (-3, 3));
  //R 6-7
  stroke (0, 0, 0, random (-255, 75));
  line(rEO6x+random (-3, 3), rEO6y+random (-3, 3), rEO7x+random (-3, 3), rEO7y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO6x+random (-3, 3), rEO6y+random (-3, 3), rEO7x+random (-3, 3), rEO7y+random (-3, 3));


  //R 7-8
  stroke (0, 0, 0, random (-255, 75));
  line(rEO7x+random (-3, 3), rEO7y+random (-3, 3), rEO8x+random (-3, 3), rEO8y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO7x+random (-3, 3), rEO7y+random (-3, 3), rEO8x+random (-3, 3), rEO8y+random (-3, 3));

  //R 8-9
  stroke (0, 0, 0, random (-255, 75));
  line(rEO8x+random (-3, 3), rEO8y+random (-3, 3), rEO9x+random (-3, 3), rEO9y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO8x+random (-3, 3), rEO8y+random (-3, 3), rEO9x+random (-3, 3), rEO9y+random (-3, 3));
  //R 9-10
  stroke (0, 0, 0, random (-255, 75));
  line(rEO9x+random (-3, 3), rEO9y+random (-3, 3), rEO10x+random (-3, 3), rEO10y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO9x+random (-3, 3), rEO9y+random (-3, 3), rEO10x+random (-3, 3), rEO10y+random (-3, 3));
  //R 10-11
  stroke (0, 0, 0, random (-255, 75));
  line(rEO10x+random (-3, 3), rEO10y+random (-3, 3), rEO11x+random (-3, 3), rEO11y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO10x+random (-3, 3), rEO10y+random (-3, 3), rEO11x+random (-3, 3), rEO11y+random (-3, 3));

  //R 11-12
  stroke (0, 0, 0, random (-255, 75));
  line(rEO11x+random (-3, 3), rEO11y+random (-3, 3), rEO12x+random (-3, 3), rEO12y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO11x+random (-3, 3), rEO11y+random (-3, 3), rEO12x+random (-3, 3), rEO12y+random (-3, 3));

  //R 12-13
  stroke (0, 0, 0, random (-255, 75));
  line(rEO12x+random (-3, 3), rEO12y+random (-3, 3), rEO13x+random (-3, 3), rEO13y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO12x+random (-3, 3), rEO12y+random (-3, 3), rEO13x+random (-3, 3), rEO13y+random (-3, 3));

  //R 13-14
  stroke (0, 0, 0, random (-255, 75));
  line(rEO13x+random (-3, 3), rEO13y+random (-3, 3), rEO14x+random (-3, 3), rEO14y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO13x+random (-3, 3), rEO13y+random (-3, 3), rEO14x+random (-3, 3), rEO14y+random (-3, 3));
  //R 14-15
  stroke (0, 0, 0, random (-255, 75));
  line(rEO14x+random (-3, 3), rEO14y+random (-3, 3), rEO15x+random (-3, 3), rEO15y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO14x+random (-3, 3), rEO14y+random (-3, 3), rEO15x+random (-3, 3), rEO15y+random (-3, 3));
  //R 15-16
  stroke (0, 0, 0, random (-255, 75));
  line(rEO15x+random (-3, 3), rEO15y+random (-3, 3), rEO16x+random (-3, 3), rEO16y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO15x+random (-3, 3), rEO15y+random (-3, 3), rEO16x+random (-3, 3), rEO16y+random (-3, 3));

  //R 16-17
  stroke (0, 0, 0, random (-255, 75));
  line(rEO16x+random (-3, 3), rEO16y+random (-3, 3), rEO17x+random (-3, 3), rEO17y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO16x+random (-3, 3), rEO16y+random (-3, 3), rEO17x+random (-3, 3), rEO17y+random (-3, 3));
  //R 17-18
  stroke (0, 0, 0, random (-255, 75));
  line(rEO17x+random (-3, 3), rEO17y+random (-3, 3), rEO18x+random (-3, 3), rEO18y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO17x+random (-3, 3), rEO17y+random (-3, 3), rEO18x+random (-3, 3), rEO18y+random (-3, 3));
  //R 18-19
  stroke (0, 0, 0, random (-255, 75));
  line(rEO18x+random (-3, 3), rEO18y+random (-3, 3), rEO19x+random (-3, 3), rEO19y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO18x+random (-3, 3), rEO18y+random (-3, 3), rEO19x+random (-3, 3), rEO19y+random (-3, 3));
  //R 19-20
  stroke (0, 0, 0, random (-255, 75));
  line(rEO19x+random (-3, 3), rEO19y+random (-3, 3), rEO20x+random (-3, 3), rEO20y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO19x+random (-3, 3), rEO19y+random (-3, 3), rEO20x+random (-3, 3), rEO20y+random (-3, 3));
  //R 20-1
  stroke (0, 0, 0, random (-255, 75));
  line(rEO20x+random (-3, 3), rEO20y+random (-3, 3), rEO1x+random (-3, 3), rEO1y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(rEO20x+random (-3, 3), rEO20y+random (-3, 3), rEO1x+random (-3, 3), rEO1y+random (-3, 3));


  // LEFT EYE SKETCHY LINES

  //L 1-2 (REPETITION 1x/X)
  stroke (0, 0, 0, random (-255, 75));
  line(lEO1x+random (-3, 3), lEO1y+random (-3, 3), lEO2x+random (-3, 3), lEO2y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO1x+random (-3, 3), lEO1y+random (-3, 3), lEO2x+random (-3, 3), lEO2y+random (-3, 3));
  //L 2-3
  stroke (0, 0, 0, random (-255, 75));
  line(lEO2x+random (-3, 3), lEO2y+random (-3, 3), lEO3x+random (-3, 3), lEO3y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO2x+random (-3, 3), lEO2y+random (-3, 3), lEO3x+random (-3, 3), lEO3y+random (-3, 3));
  //L 3-4
  stroke (0, 0, 0, random (-255, 75));
  line(lEO3x+random (-3, 3), lEO3y+random (-3, 3), lEO4x+random (-3, 3), lEO4y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO3x+random (-3, 3), lEO3y+random (-3, 3), lEO4x+random (-3, 3), lEO4y+random (-3, 3));

  //L 4-5
  stroke (0, 0, 0, random (-255, 75));
  line(lEO4x+random (-3, 3), lEO4y+random (-3, 3), lEO5x+random (-3, 3), lEO5y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO4x+random (-3, 3), lEO4y+random (-3, 3), lEO5x+random (-3, 3), lEO5y+random (-3, 3));
  //L 5-6
  stroke (0, 0, 0, random (-255, 75));
  line(lEO5x+random (-3, 3), lEO5y+random (-3, 3), lEO6x+random (-3, 3), lEO6y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO5x+random (-3, 3), lEO5y+random (-3, 3), lEO6x+random (-3, 3), lEO6y+random (-3, 3));
  //L 6-7
  stroke (0, 0, 0, random (-255, 75));
  line(lEO6x+random (-3, 3), lEO6y+random (-3, 3), lEO7x+random (-3, 3), lEO7y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO6x+random (-3, 3), lEO6y+random (-3, 3), lEO7x+random (-3, 3), lEO7y+random (-3, 3));


  //L 7-8
  stroke (0, 0, 0, random (-255, 75));
  line(lEO7x+random (-3, 3), lEO7y+random (-3, 3), lEO8x+random (-3, 3), lEO8y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO7x+random (-3, 3), lEO7y+random (-3, 3), lEO8x+random (-3, 3), lEO8y+random (-3, 3));

  //L 8-9
  stroke (0, 0, 0, random (-255, 75));
  line(lEO8x+random (-3, 3), lEO8y+random (-3, 3), lEO9x+random (-3, 3), lEO9y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO8x+random (-3, 3), lEO8y+random (-3, 3), lEO9x+random (-3, 3), lEO9y+random (-3, 3));
  //L 9-10
  stroke (0, 0, 0, random (-255, 75));
  line(lEO9x+random (-3, 3), lEO9y+random (-3, 3), lEO10x+random (-3, 3), lEO10y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO9x+random (-3, 3), lEO9y+random (-3, 3), lEO10x+random (-3, 3), lEO10y+random (-3, 3));
  //L 10-11
  stroke (0, 0, 0, random (-255, 75));
  line(lEO10x+random (-3, 3), lEO10y+random (-3, 3), lEO11x+random (-3, 3), lEO11y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO10x+random (-3, 3), lEO10y+random (-3, 3), lEO11x+random (-3, 3), lEO11y+random (-3, 3));

  //L 11-12
  stroke (0, 0, 0, random (-255, 75));
  line(lEO11x+random (-3, 3), lEO11y+random (-3, 3), lEO12x+random (-3, 3), lEO12y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO11x+random (-3, 3), lEO11y+random (-3, 3), lEO12x+random (-3, 3), lEO12y+random (-3, 3));

  //L 12-13
  stroke (0, 0, 0, random (-255, 75));
  line(lEO12x+random (-3, 3), lEO12y+random (-3, 3), lEO13x+random (-3, 3), lEO13y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO12x+random (-3, 3), lEO12y+random (-3, 3), lEO13x+random (-3, 3), lEO13y+random (-3, 3));

  //L 13-14
  stroke (0, 0, 0, random (-255, 75));
  line(lEO13x+random (-3, 3), lEO13y+random (-3, 3), lEO14x+random (-3, 3), lEO14y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO13x+random (-3, 3), lEO13y+random (-3, 3), lEO14x+random (-3, 3), lEO14y+random (-3, 3));
  //L 14-15
  stroke (0, 0, 0, random (-255, 75));
  line(lEO14x+random (-3, 3), lEO14y+random (-3, 3), lEO15x+random (-3, 3), lEO15y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO14x+random (-3, 3), lEO14y+random (-3, 3), lEO15x+random (-3, 3), lEO15y+random (-3, 3));
  //L 15-16
  stroke (0, 0, 0, random (-255, 75));
  line(lEO15x+random (-3, 3), lEO15y+random (-3, 3), lEO16x+random (-3, 3), lEO16y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO15x+random (-3, 3), lEO15y+random (-3, 3), lEO16x+random (-3, 3), lEO16y+random (-3, 3));

  //L 16-17
  stroke (0, 0, 0, random (-255, 75));
  line(lEO16x+random (-3, 3), lEO16y+random (-3, 3), lEO17x+random (-3, 3), lEO17y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO16x+random (-3, 3), lEO16y+random (-3, 3), lEO17x+random (-3, 3), lEO17y+random (-3, 3));
  //L 17-18
  stroke (0, 0, 0, random (-255, 75));
  line(lEO17x+random (-3, 3), lEO17y+random (-3, 3), lEO18x+random (-3, 3), lEO18y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO17x+random (-3, 3), lEO17y+random (-3, 3), lEO18x+random (-3, 3), lEO18y+random (-3, 3));
  //L 18-19
  stroke (0, 0, 0, random (-255, 75));
  line(lEO18x+random (-3, 3), lEO18y+random (-3, 3), lEO19x+random (-3, 3), lEO19y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO18x+random (-3, 3), lEO18y+random (-3, 3), lEO19x+random (-3, 3), lEO19y+random (-3, 3));
  //L 19-20
  stroke (0, 0, 0, random (-255, 75));
  line(lEO19x+random (-3, 3), lEO19y+random (-3, 3), lEO20x+random (-3, 3), lEO20y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO19x+random (-3, 3), lEO19y+random (-3, 3), lEO20x+random (-3, 3), lEO20y+random (-3, 3));
  //L 20-1
  stroke (0, 0, 0, random (-255, 75));
  line(lEO20x+random (-3, 3), lEO20y+random (-3, 3), lEO1x+random (-3, 3), lEO1y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO20x+random (-3, 3), lEO20y+random (-3, 3), lEO1x+random (-3, 3), lEO1y+random (-3, 3));

  // LEFT EYE REPETITIONS (REPETITION 2x/X)

  //L 1-2 
  stroke (0, 0, 0, random (-255, 75));
  line(lEO1x+random (-3, 3), lEO1y+random (-3, 3), lEO2x+random (-3, 3), lEO2y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO1x+random (-3, 3), lEO1y+random (-3, 3), lEO2x+random (-3, 3), lEO2y+random (-3, 3));
  //L 2-3
  stroke (0, 0, 0, random (-255, 75));
  line(lEO2x+random (-3, 3), lEO2y+random (-3, 3), lEO3x+random (-3, 3), lEO3y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO2x+random (-3, 3), lEO2y+random (-3, 3), lEO3x+random (-3, 3), lEO3y+random (-3, 3));
  //L 3-4
  stroke (0, 0, 0, random (-255, 75));
  line(lEO3x+random (-3, 3), lEO3y+random (-3, 3), lEO4x+random (-3, 3), lEO4y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO3x+random (-3, 3), lEO3y+random (-3, 3), lEO4x+random (-3, 3), lEO4y+random (-3, 3));

  //L 4-5
  stroke (0, 0, 0, random (-255, 75));
  line(lEO4x+random (-3, 3), lEO4y+random (-3, 3), lEO5x+random (-3, 3), lEO5y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO4x+random (-3, 3), lEO4y+random (-3, 3), lEO5x+random (-3, 3), lEO5y+random (-3, 3));
  //L 5-6
  stroke (0, 0, 0, random (-255, 75));
  line(lEO5x+random (-3, 3), lEO5y+random (-3, 3), lEO6x+random (-3, 3), lEO6y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO5x+random (-3, 3), lEO5y+random (-3, 3), lEO6x+random (-3, 3), lEO6y+random (-3, 3));
  //L 6-7
  stroke (0, 0, 0, random (-255, 75));
  line(lEO6x+random (-3, 3), lEO6y+random (-3, 3), lEO7x+random (-3, 3), lEO7y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO6x+random (-3, 3), lEO6y+random (-3, 3), lEO7x+random (-3, 3), lEO7y+random (-3, 3));


  //L 7-8
  stroke (0, 0, 0, random (-255, 75));
  line(lEO7x+random (-3, 3), lEO7y+random (-3, 3), lEO8x+random (-3, 3), lEO8y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO7x+random (-3, 3), lEO7y+random (-3, 3), lEO8x+random (-3, 3), lEO8y+random (-3, 3));

  //L 8-9
  stroke (0, 0, 0, random (-255, 75));
  line(lEO8x+random (-3, 3), lEO8y+random (-3, 3), lEO9x+random (-3, 3), lEO9y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO8x+random (-3, 3), lEO8y+random (-3, 3), lEO9x+random (-3, 3), lEO9y+random (-3, 3));
  //L 9-10
  stroke (0, 0, 0, random (-255, 75));
  line(lEO9x+random (-3, 3), lEO9y+random (-3, 3), lEO10x+random (-3, 3), lEO10y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO9x+random (-3, 3), lEO9y+random (-3, 3), lEO10x+random (-3, 3), lEO10y+random (-3, 3));
  //L 10-11
  stroke (0, 0, 0, random (-255, 75));
  line(lEO10x+random (-3, 3), lEO10y+random (-3, 3), lEO11x+random (-3, 3), lEO11y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO10x+random (-3, 3), lEO10y+random (-3, 3), lEO11x+random (-3, 3), lEO11y+random (-3, 3));

  //L 11-12
  stroke (0, 0, 0, random (-255, 75));
  line(lEO11x+random (-3, 3), lEO11y+random (-3, 3), lEO12x+random (-3, 3), lEO12y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO11x+random (-3, 3), lEO11y+random (-3, 3), lEO12x+random (-3, 3), lEO12y+random (-3, 3));

  //L 12-13
  stroke (0, 0, 0, random (-255, 75));
  line(lEO12x+random (-3, 3), lEO12y+random (-3, 3), lEO13x+random (-3, 3), lEO13y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO12x+random (-3, 3), lEO12y+random (-3, 3), lEO13x+random (-3, 3), lEO13y+random (-3, 3));

  //L 13-14
  stroke (0, 0, 0, random (-255, 75));
  line(lEO13x+random (-3, 3), lEO13y+random (-3, 3), lEO14x+random (-3, 3), lEO14y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO13x+random (-3, 3), lEO13y+random (-3, 3), lEO14x+random (-3, 3), lEO14y+random (-3, 3));
  //L 14-15
  stroke (0, 0, 0, random (-255, 75));
  line(lEO14x+random (-3, 3), lEO14y+random (-3, 3), lEO15x+random (-3, 3), lEO15y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO14x+random (-3, 3), lEO14y+random (-3, 3), lEO15x+random (-3, 3), lEO15y+random (-3, 3));
  //L 15-16
  stroke (0, 0, 0, random (-255, 75));
  line(lEO15x+random (-3, 3), lEO15y+random (-3, 3), lEO16x+random (-3, 3), lEO16y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO15x+random (-3, 3), lEO15y+random (-3, 3), lEO16x+random (-3, 3), lEO16y+random (-3, 3));

  //L 16-17
  stroke (0, 0, 0, random (-255, 75));
  line(lEO16x+random (-3, 3), lEO16y+random (-3, 3), lEO17x+random (-3, 3), lEO17y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO16x+random (-3, 3), lEO16y+random (-3, 3), lEO17x+random (-3, 3), lEO17y+random (-3, 3));
  //L 17-18
  stroke (0, 0, 0, random (-255, 75));
  line(lEO17x+random (-3, 3), lEO17y+random (-3, 3), lEO18x+random (-3, 3), lEO18y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO17x+random (-3, 3), lEO17y+random (-3, 3), lEO18x+random (-3, 3), lEO18y+random (-3, 3));
  //L 18-19
  stroke (0, 0, 0, random (-255, 75));
  line(lEO18x+random (-3, 3), lEO18y+random (-3, 3), lEO19x+random (-3, 3), lEO19y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO18x+random (-3, 3), lEO18y+random (-3, 3), lEO19x+random (-3, 3), lEO19y+random (-3, 3));
  //L 19-20
  stroke (0, 0, 0, random (-255, 75));
  line(lEO19x+random (-3, 3), lEO19y+random (-3, 3), lEO20x+random (-3, 3), lEO20y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO19x+random (-3, 3), lEO19y+random (-3, 3), lEO20x+random (-3, 3), lEO20y+random (-3, 3));
  //L 20-1
  stroke (0, 0, 0, random (-255, 75));
  line(lEO20x+random (-3, 3), lEO20y+random (-3, 3), lEO1x+random (-3, 3), lEO1y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO20x+random (-3, 3), lEO20y+random (-3, 3), lEO1x+random (-3, 3), lEO1y+random (-3, 3));


  //L 1-2 ((REPETITION 3x/X)
  stroke (0, 0, 0, random (-255, 75));
  line(lEO1x+random (-3, 3), lEO1y+random (-3, 3), lEO2x+random (-3, 3), lEO2y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO1x+random (-3, 3), lEO1y+random (-3, 3), lEO2x+random (-3, 3), lEO2y+random (-3, 3));
  //L 2-3
  stroke (0, 0, 0, random (-255, 75));
  line(lEO2x+random (-3, 3), lEO2y+random (-3, 3), lEO3x+random (-3, 3), lEO3y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO2x+random (-3, 3), lEO2y+random (-3, 3), lEO3x+random (-3, 3), lEO3y+random (-3, 3));
  //L 3-4
  stroke (0, 0, 0, random (-255, 75));
  line(lEO3x+random (-3, 3), lEO3y+random (-3, 3), lEO4x+random (-3, 3), lEO4y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO3x+random (-3, 3), lEO3y+random (-3, 3), lEO4x+random (-3, 3), lEO4y+random (-3, 3));

  //L 4-5
  stroke (0, 0, 0, random (-255, 75));
  line(lEO4x+random (-3, 3), lEO4y+random (-3, 3), lEO5x+random (-3, 3), lEO5y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO4x+random (-3, 3), lEO4y+random (-3, 3), lEO5x+random (-3, 3), lEO5y+random (-3, 3));
  //L 5-6
  stroke (0, 0, 0, random (-255, 75));
  line(lEO5x+random (-3, 3), lEO5y+random (-3, 3), lEO6x+random (-3, 3), lEO6y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO5x+random (-3, 3), lEO5y+random (-3, 3), lEO6x+random (-3, 3), lEO6y+random (-3, 3));
  //L 6-7
  stroke (0, 0, 0, random (-255, 75));
  line(lEO6x+random (-3, 3), lEO6y+random (-3, 3), lEO7x+random (-3, 3), lEO7y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO6x+random (-3, 3), lEO6y+random (-3, 3), lEO7x+random (-3, 3), lEO7y+random (-3, 3));


  //L 7-8
  stroke (0, 0, 0, random (-255, 75));
  line(lEO7x+random (-3, 3), lEO7y+random (-3, 3), lEO8x+random (-3, 3), lEO8y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO7x+random (-3, 3), lEO7y+random (-3, 3), lEO8x+random (-3, 3), lEO8y+random (-3, 3));

  //L 8-9
  stroke (0, 0, 0, random (-255, 75));
  line(lEO8x+random (-3, 3), lEO8y+random (-3, 3), lEO9x+random (-3, 3), lEO9y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO8x+random (-3, 3), lEO8y+random (-3, 3), lEO9x+random (-3, 3), lEO9y+random (-3, 3));
  //L 9-10
  stroke (0, 0, 0, random (-255, 75));
  line(lEO9x+random (-3, 3), lEO9y+random (-3, 3), lEO10x+random (-3, 3), lEO10y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO9x+random (-3, 3), lEO9y+random (-3, 3), lEO10x+random (-3, 3), lEO10y+random (-3, 3));
  //L 10-11
  stroke (0, 0, 0, random (-255, 75));
  line(lEO10x+random (-3, 3), lEO10y+random (-3, 3), lEO11x+random (-3, 3), lEO11y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO10x+random (-3, 3), lEO10y+random (-3, 3), lEO11x+random (-3, 3), lEO11y+random (-3, 3));

  //L 11-12
  stroke (0, 0, 0, random (-255, 75));
  line(lEO11x+random (-3, 3), lEO11y+random (-3, 3), lEO12x+random (-3, 3), lEO12y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO11x+random (-3, 3), lEO11y+random (-3, 3), lEO12x+random (-3, 3), lEO12y+random (-3, 3));

  //L 12-13
  stroke (0, 0, 0, random (-255, 75));
  line(lEO12x+random (-3, 3), lEO12y+random (-3, 3), lEO13x+random (-3, 3), lEO13y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO12x+random (-3, 3), lEO12y+random (-3, 3), lEO13x+random (-3, 3), lEO13y+random (-3, 3));

  //L 13-14
  stroke (0, 0, 0, random (-255, 75));
  line(lEO13x+random (-3, 3), lEO13y+random (-3, 3), lEO14x+random (-3, 3), lEO14y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO13x+random (-3, 3), lEO13y+random (-3, 3), lEO14x+random (-3, 3), lEO14y+random (-3, 3));
  //L 14-15
  stroke (0, 0, 0, random (-255, 75));
  line(lEO14x+random (-3, 3), lEO14y+random (-3, 3), lEO15x+random (-3, 3), lEO15y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO14x+random (-3, 3), lEO14y+random (-3, 3), lEO15x+random (-3, 3), lEO15y+random (-3, 3));
  //L 15-16
  stroke (0, 0, 0, random (-255, 75));
  line(lEO15x+random (-3, 3), lEO15y+random (-3, 3), lEO16x+random (-3, 3), lEO16y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO15x+random (-3, 3), lEO15y+random (-3, 3), lEO16x+random (-3, 3), lEO16y+random (-3, 3));

  //L 16-17
  stroke (0, 0, 0, random (-255, 75));
  line(lEO16x+random (-3, 3), lEO16y+random (-3, 3), lEO17x+random (-3, 3), lEO17y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO16x+random (-3, 3), lEO16y+random (-3, 3), lEO17x+random (-3, 3), lEO17y+random (-3, 3));
  //L 17-18
  stroke (0, 0, 0, random (-255, 75));
  line(lEO17x+random (-3, 3), lEO17y+random (-3, 3), lEO18x+random (-3, 3), lEO18y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO17x+random (-3, 3), lEO17y+random (-3, 3), lEO18x+random (-3, 3), lEO18y+random (-3, 3));
  //L 18-19
  stroke (0, 0, 0, random (-255, 75));
  line(lEO18x+random (-3, 3), lEO18y+random (-3, 3), lEO19x+random (-3, 3), lEO19y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO18x+random (-3, 3), lEO18y+random (-3, 3), lEO19x+random (-3, 3), lEO19y+random (-3, 3));
  //L 19-20
  stroke (0, 0, 0, random (-255, 75));
  line(lEO19x+random (-3, 3), lEO19y+random (-3, 3), lEO20x+random (-3, 3), lEO20y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO19x+random (-3, 3), lEO19y+random (-3, 3), lEO20x+random (-3, 3), lEO20y+random (-3, 3));
  //L 20-1
  stroke (0, 0, 0, random (-255, 75));
  line(lEO20x+random (-3, 3), lEO20y+random (-3, 3), lEO1x+random (-3, 3), lEO1y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO20x+random (-3, 3), lEO20y+random (-3, 3), lEO1x+random (-3, 3), lEO1y+random (-3, 3));


  //L 1-2 (REPETITION 4x/X)
  stroke (0, 0, 0, random (-255, 75));
  line(lEO1x+random (-3, 3), lEO1y+random (-3, 3), lEO2x+random (-3, 3), lEO2y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO1x+random (-3, 3), lEO1y+random (-3, 3), lEO2x+random (-3, 3), lEO2y+random (-3, 3));
  //L 2-3
  stroke (0, 0, 0, random (-255, 75));
  line(lEO2x+random (-3, 3), lEO2y+random (-3, 3), lEO3x+random (-3, 3), lEO3y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO2x+random (-3, 3), lEO2y+random (-3, 3), lEO3x+random (-3, 3), lEO3y+random (-3, 3));
  //L 3-4
  stroke (0, 0, 0, random (-255, 75));
  line(lEO3x+random (-3, 3), lEO3y+random (-3, 3), lEO4x+random (-3, 3), lEO4y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO3x+random (-3, 3), lEO3y+random (-3, 3), lEO4x+random (-3, 3), lEO4y+random (-3, 3));

  //L 4-5
  stroke (0, 0, 0, random (-255, 75));
  line(lEO4x+random (-3, 3), lEO4y+random (-3, 3), lEO5x+random (-3, 3), lEO5y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO4x+random (-3, 3), lEO4y+random (-3, 3), lEO5x+random (-3, 3), lEO5y+random (-3, 3));
  //L 5-6
  stroke (0, 0, 0, random (-255, 75));
  line(lEO5x+random (-3, 3), lEO5y+random (-3, 3), lEO6x+random (-3, 3), lEO6y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO5x+random (-3, 3), lEO5y+random (-3, 3), lEO6x+random (-3, 3), lEO6y+random (-3, 3));
  //L 6-7
  stroke (0, 0, 0, random (-255, 75));
  line(lEO6x+random (-3, 3), lEO6y+random (-3, 3), lEO7x+random (-3, 3), lEO7y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO6x+random (-3, 3), lEO6y+random (-3, 3), lEO7x+random (-3, 3), lEO7y+random (-3, 3));


  //L 7-8
  stroke (0, 0, 0, random (-255, 75));
  line(lEO7x+random (-3, 3), lEO7y+random (-3, 3), lEO8x+random (-3, 3), lEO8y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO7x+random (-3, 3), lEO7y+random (-3, 3), lEO8x+random (-3, 3), lEO8y+random (-3, 3));

  //L 8-9
  stroke (0, 0, 0, random (-255, 75));
  line(lEO8x+random (-3, 3), lEO8y+random (-3, 3), lEO9x+random (-3, 3), lEO9y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO8x+random (-3, 3), lEO8y+random (-3, 3), lEO9x+random (-3, 3), lEO9y+random (-3, 3));
  //L 9-10
  stroke (0, 0, 0, random (-255, 75));
  line(lEO9x+random (-3, 3), lEO9y+random (-3, 3), lEO10x+random (-3, 3), lEO10y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO9x+random (-3, 3), lEO9y+random (-3, 3), lEO10x+random (-3, 3), lEO10y+random (-3, 3));
  //L 10-11
  stroke (0, 0, 0, random (-255, 75));
  line(lEO10x+random (-3, 3), lEO10y+random (-3, 3), lEO11x+random (-3, 3), lEO11y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO10x+random (-3, 3), lEO10y+random (-3, 3), lEO11x+random (-3, 3), lEO11y+random (-3, 3));

  //L 11-12
  stroke (0, 0, 0, random (-255, 75));
  line(lEO11x+random (-3, 3), lEO11y+random (-3, 3), lEO12x+random (-3, 3), lEO12y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO11x+random (-3, 3), lEO11y+random (-3, 3), lEO12x+random (-3, 3), lEO12y+random (-3, 3));

  //L 12-13
  stroke (0, 0, 0, random (-255, 75));
  line(lEO12x+random (-3, 3), lEO12y+random (-3, 3), lEO13x+random (-3, 3), lEO13y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO12x+random (-3, 3), lEO12y+random (-3, 3), lEO13x+random (-3, 3), lEO13y+random (-3, 3));

  //L 13-14
  stroke (0, 0, 0, random (-255, 75));
  line(lEO13x+random (-3, 3), lEO13y+random (-3, 3), lEO14x+random (-3, 3), lEO14y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO13x+random (-3, 3), lEO13y+random (-3, 3), lEO14x+random (-3, 3), lEO14y+random (-3, 3));
  //L 14-15
  stroke (0, 0, 0, random (-255, 75));
  line(lEO14x+random (-3, 3), lEO14y+random (-3, 3), lEO15x+random (-3, 3), lEO15y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO14x+random (-3, 3), lEO14y+random (-3, 3), lEO15x+random (-3, 3), lEO15y+random (-3, 3));
  //L 15-16
  stroke (0, 0, 0, random (-255, 75));
  line(lEO15x+random (-3, 3), lEO15y+random (-3, 3), lEO16x+random (-3, 3), lEO16y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO15x+random (-3, 3), lEO15y+random (-3, 3), lEO16x+random (-3, 3), lEO16y+random (-3, 3));

  //L 16-17
  stroke (0, 0, 0, random (-255, 75));
  line(lEO16x+random (-3, 3), lEO16y+random (-3, 3), lEO17x+random (-3, 3), lEO17y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO16x+random (-3, 3), lEO16y+random (-3, 3), lEO17x+random (-3, 3), lEO17y+random (-3, 3));
  //L 17-18
  stroke (0, 0, 0, random (-255, 75));
  line(lEO17x+random (-3, 3), lEO17y+random (-3, 3), lEO18x+random (-3, 3), lEO18y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO17x+random (-3, 3), lEO17y+random (-3, 3), lEO18x+random (-3, 3), lEO18y+random (-3, 3));
  //L 18-19
  stroke (0, 0, 0, random (-255, 75));
  line(lEO18x+random (-3, 3), lEO18y+random (-3, 3), lEO19x+random (-3, 3), lEO19y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO18x+random (-3, 3), lEO18y+random (-3, 3), lEO19x+random (-3, 3), lEO19y+random (-3, 3));
  //L 19-20
  stroke (0, 0, 0, random (-255, 75));
  line(lEO19x+random (-3, 3), lEO19y+random (-3, 3), lEO20x+random (-3, 3), lEO20y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO19x+random (-3, 3), lEO19y+random (-3, 3), lEO20x+random (-3, 3), lEO20y+random (-3, 3));
  //L 20-1
  stroke (0, 0, 0, random (-255, 75));
  line(lEO20x+random (-3, 3), lEO20y+random (-3, 3), lEO1x+random (-3, 3), lEO1y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO20x+random (-3, 3), lEO20y+random (-3, 3), lEO1x+random (-3, 3), lEO1y+random (-3, 3));


  //L 1-2
  stroke (0, 0, 0, random (-255, 75));
  line(lEO1x+random (-3, 3), lEO1y+random (-3, 3), lEO2x+random (-3, 3), lEO2y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO1x+random (-3, 3), lEO1y+random (-3, 3), lEO2x+random (-3, 3), lEO2y+random (-3, 3));
  //L 2-3
  stroke (0, 0, 0, random (-255, 75));
  line(lEO2x+random (-3, 3), lEO2y+random (-3, 3), lEO3x+random (-3, 3), lEO3y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO2x+random (-3, 3), lEO2y+random (-3, 3), lEO3x+random (-3, 3), lEO3y+random (-3, 3));
  //L 3-4
  stroke (0, 0, 0, random (-255, 75));
  line(lEO3x+random (-3, 3), lEO3y+random (-3, 3), lEO4x+random (-3, 3), lEO4y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO3x+random (-3, 3), lEO3y+random (-3, 3), lEO4x+random (-3, 3), lEO4y+random (-3, 3));

  //L 4-5
  stroke (0, 0, 0, random (-255, 75));
  line(lEO4x+random (-3, 3), lEO4y+random (-3, 3), lEO5x+random (-3, 3), lEO5y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO4x+random (-3, 3), lEO4y+random (-3, 3), lEO5x+random (-3, 3), lEO5y+random (-3, 3));
  //L 5-6
  stroke (0, 0, 0, random (-255, 75));
  line(lEO5x+random (-3, 3), lEO5y+random (-3, 3), lEO6x+random (-3, 3), lEO6y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO5x+random (-3, 3), lEO5y+random (-3, 3), lEO6x+random (-3, 3), lEO6y+random (-3, 3));
  //L 6-7
  stroke (0, 0, 0, random (-255, 75));
  line(lEO6x+random (-3, 3), lEO6y+random (-3, 3), lEO7x+random (-3, 3), lEO7y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO6x+random (-3, 3), lEO6y+random (-3, 3), lEO7x+random (-3, 3), lEO7y+random (-3, 3));


  //L 7-8
  stroke (0, 0, 0, random (-255, 75));
  line(lEO7x+random (-3, 3), lEO7y+random (-3, 3), lEO8x+random (-3, 3), lEO8y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO7x+random (-3, 3), lEO7y+random (-3, 3), lEO8x+random (-3, 3), lEO8y+random (-3, 3));

  //L 8-9
  stroke (0, 0, 0, random (-255, 75));
  line(lEO8x+random (-3, 3), lEO8y+random (-3, 3), lEO9x+random (-3, 3), lEO9y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO8x+random (-3, 3), lEO8y+random (-3, 3), lEO9x+random (-3, 3), lEO9y+random (-3, 3));
  //L 9-10
  stroke (0, 0, 0, random (-255, 75));
  line(lEO9x+random (-3, 3), lEO9y+random (-3, 3), lEO10x+random (-3, 3), lEO10y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO9x+random (-3, 3), lEO9y+random (-3, 3), lEO10x+random (-3, 3), lEO10y+random (-3, 3));
  //L 10-11
  stroke (0, 0, 0, random (-255, 75));
  line(lEO10x+random (-3, 3), lEO10y+random (-3, 3), lEO11x+random (-3, 3), lEO11y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO10x+random (-3, 3), lEO10y+random (-3, 3), lEO11x+random (-3, 3), lEO11y+random (-3, 3));

  //L 11-12
  stroke (0, 0, 0, random (-255, 75));
  line(lEO11x+random (-3, 3), lEO11y+random (-3, 3), lEO12x+random (-3, 3), lEO12y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO11x+random (-3, 3), lEO11y+random (-3, 3), lEO12x+random (-3, 3), lEO12y+random (-3, 3));

  //L 12-13
  stroke (0, 0, 0, random (-255, 75));
  line(lEO12x+random (-3, 3), lEO12y+random (-3, 3), lEO13x+random (-3, 3), lEO13y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO12x+random (-3, 3), lEO12y+random (-3, 3), lEO13x+random (-3, 3), lEO13y+random (-3, 3));

  //L 13-14
  stroke (0, 0, 0, random (-255, 75));
  line(lEO13x+random (-3, 3), lEO13y+random (-3, 3), lEO14x+random (-3, 3), lEO14y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO13x+random (-3, 3), lEO13y+random (-3, 3), lEO14x+random (-3, 3), lEO14y+random (-3, 3));
  //L 14-15
  stroke (0, 0, 0, random (-255, 75));
  line(lEO14x+random (-3, 3), lEO14y+random (-3, 3), lEO15x+random (-3, 3), lEO15y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO14x+random (-3, 3), lEO14y+random (-3, 3), lEO15x+random (-3, 3), lEO15y+random (-3, 3));
  //L 15-16
  stroke (0, 0, 0, random (-255, 75));
  line(lEO15x+random (-3, 3), lEO15y+random (-3, 3), lEO16x+random (-3, 3), lEO16y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO15x+random (-3, 3), lEO15y+random (-3, 3), lEO16x+random (-3, 3), lEO16y+random (-3, 3));

  //L 16-17
  stroke (0, 0, 0, random (-255, 75));
  line(lEO16x+random (-3, 3), lEO16y+random (-3, 3), lEO17x+random (-3, 3), lEO17y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO16x+random (-3, 3), lEO16y+random (-3, 3), lEO17x+random (-3, 3), lEO17y+random (-3, 3));
  //L 17-18
  stroke (0, 0, 0, random (-255, 75));
  line(lEO17x+random (-3, 3), lEO17y+random (-3, 3), lEO18x+random (-3, 3), lEO18y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO17x+random (-3, 3), lEO17y+random (-3, 3), lEO18x+random (-3, 3), lEO18y+random (-3, 3));
  //L 18-19
  stroke (0, 0, 0, random (-255, 75));
  line(lEO18x+random (-3, 3), lEO18y+random (-3, 3), lEO19x+random (-3, 3), lEO19y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO18x+random (-3, 3), lEO18y+random (-3, 3), lEO19x+random (-3, 3), lEO19y+random (-3, 3));
  //L 19-20
  stroke (0, 0, 0, random (-255, 75));
  line(lEO19x+random (-3, 3), lEO19y+random (-3, 3), lEO20x+random (-3, 3), lEO20y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO19x+random (-3, 3), lEO19y+random (-3, 3), lEO20x+random (-3, 3), lEO20y+random (-3, 3));
  //L 20-1
  stroke (0, 0, 0, random (-255, 75));
  line(lEO20x+random (-3, 3), lEO20y+random (-3, 3), lEO1x+random (-3, 3), lEO1y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO20x+random (-3, 3), lEO20y+random (-3, 3), lEO1x+random (-3, 3), lEO1y+random (-3, 3));


  //L 1-2
  stroke (0, 0, 0, random (-255, 75));
  line(lEO1x+random (-3, 3), lEO1y+random (-3, 3), lEO2x+random (-3, 3), lEO2y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO1x+random (-3, 3), lEO1y+random (-3, 3), lEO2x+random (-3, 3), lEO2y+random (-3, 3));
  //L 2-3
  stroke (0, 0, 0, random (-255, 75));
  line(lEO2x+random (-3, 3), lEO2y+random (-3, 3), lEO3x+random (-3, 3), lEO3y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO2x+random (-3, 3), lEO2y+random (-3, 3), lEO3x+random (-3, 3), lEO3y+random (-3, 3));
  //L 3-4
  stroke (0, 0, 0, random (-255, 75));
  line(lEO3x+random (-3, 3), lEO3y+random (-3, 3), lEO4x+random (-3, 3), lEO4y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO3x+random (-3, 3), lEO3y+random (-3, 3), lEO4x+random (-3, 3), lEO4y+random (-3, 3));

  //L 4-5
  stroke (0, 0, 0, random (-255, 75));
  line(lEO4x+random (-3, 3), lEO4y+random (-3, 3), lEO5x+random (-3, 3), lEO5y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO4x+random (-3, 3), lEO4y+random (-3, 3), lEO5x+random (-3, 3), lEO5y+random (-3, 3));
  //L 5-6
  stroke (0, 0, 0, random (-255, 75));
  line(lEO5x+random (-3, 3), lEO5y+random (-3, 3), lEO6x+random (-3, 3), lEO6y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO5x+random (-3, 3), lEO5y+random (-3, 3), lEO6x+random (-3, 3), lEO6y+random (-3, 3));
  //L 6-7
  stroke (0, 0, 0, random (-255, 75));
  line(lEO6x+random (-3, 3), lEO6y+random (-3, 3), lEO7x+random (-3, 3), lEO7y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO6x+random (-3, 3), lEO6y+random (-3, 3), lEO7x+random (-3, 3), lEO7y+random (-3, 3));


  //L 7-8
  stroke (0, 0, 0, random (-255, 75));
  line(lEO7x+random (-3, 3), lEO7y+random (-3, 3), lEO8x+random (-3, 3), lEO8y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO7x+random (-3, 3), lEO7y+random (-3, 3), lEO8x+random (-3, 3), lEO8y+random (-3, 3));

  //L 8-9
  stroke (0, 0, 0, random (-255, 75));
  line(lEO8x+random (-3, 3), lEO8y+random (-3, 3), lEO9x+random (-3, 3), lEO9y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO8x+random (-3, 3), lEO8y+random (-3, 3), lEO9x+random (-3, 3), lEO9y+random (-3, 3));
  //L 9-10
  stroke (0, 0, 0, random (-255, 75));
  line(lEO9x+random (-3, 3), lEO9y+random (-3, 3), lEO10x+random (-3, 3), lEO10y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO9x+random (-3, 3), lEO9y+random (-3, 3), lEO10x+random (-3, 3), lEO10y+random (-3, 3));
  //L 10-11
  stroke (0, 0, 0, random (-255, 75));
  line(lEO10x+random (-3, 3), lEO10y+random (-3, 3), lEO11x+random (-3, 3), lEO11y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO10x+random (-3, 3), lEO10y+random (-3, 3), lEO11x+random (-3, 3), lEO11y+random (-3, 3));

  //L 11-12
  stroke (0, 0, 0, random (-255, 75));
  line(lEO11x+random (-3, 3), lEO11y+random (-3, 3), lEO12x+random (-3, 3), lEO12y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO11x+random (-3, 3), lEO11y+random (-3, 3), lEO12x+random (-3, 3), lEO12y+random (-3, 3));

  //L 12-13
  stroke (0, 0, 0, random (-255, 75));
  line(lEO12x+random (-3, 3), lEO12y+random (-3, 3), lEO13x+random (-3, 3), lEO13y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO12x+random (-3, 3), lEO12y+random (-3, 3), lEO13x+random (-3, 3), lEO13y+random (-3, 3));

  //L 13-14
  stroke (0, 0, 0, random (-255, 75));
  line(lEO13x+random (-3, 3), lEO13y+random (-3, 3), lEO14x+random (-3, 3), lEO14y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO13x+random (-3, 3), lEO13y+random (-3, 3), lEO14x+random (-3, 3), lEO14y+random (-3, 3));
  //L 14-15
  stroke (0, 0, 0, random (-255, 75));
  line(lEO14x+random (-3, 3), lEO14y+random (-3, 3), lEO15x+random (-3, 3), lEO15y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO14x+random (-3, 3), lEO14y+random (-3, 3), lEO15x+random (-3, 3), lEO15y+random (-3, 3));
  //L 15-16
  stroke (0, 0, 0, random (-255, 75));
  line(lEO15x+random (-3, 3), lEO15y+random (-3, 3), lEO16x+random (-3, 3), lEO16y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO15x+random (-3, 3), lEO15y+random (-3, 3), lEO16x+random (-3, 3), lEO16y+random (-3, 3));

  //L 16-17
  stroke (0, 0, 0, random (-255, 75));
  line(lEO16x+random (-3, 3), lEO16y+random (-3, 3), lEO17x+random (-3, 3), lEO17y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO16x+random (-3, 3), lEO16y+random (-3, 3), lEO17x+random (-3, 3), lEO17y+random (-3, 3));
  //L 17-18
  stroke (0, 0, 0, random (-255, 75));
  line(lEO17x+random (-3, 3), lEO17y+random (-3, 3), lEO18x+random (-3, 3), lEO18y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO17x+random (-3, 3), lEO17y+random (-3, 3), lEO18x+random (-3, 3), lEO18y+random (-3, 3));
  //L 18-19
  stroke (0, 0, 0, random (-255, 75));
  line(lEO18x+random (-3, 3), lEO18y+random (-3, 3), lEO19x+random (-3, 3), lEO19y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO18x+random (-3, 3), lEO18y+random (-3, 3), lEO19x+random (-3, 3), lEO19y+random (-3, 3));
  //L 19-20
  stroke (0, 0, 0, random (-255, 75));
  line(lEO19x+random (-3, 3), lEO19y+random (-3, 3), lEO20x+random (-3, 3), lEO20y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO19x+random (-3, 3), lEO19y+random (-3, 3), lEO20x+random (-3, 3), lEO20y+random (-3, 3));
  //L 20-1
  stroke (0, 0, 0, random (-255, 75));
  line(lEO20x+random (-3, 3), lEO20y+random (-3, 3), lEO1x+random (-3, 3), lEO1y+random (-3, 3));
  stroke (0, 0, 0, random (-255, 75));
  line(lEO20x+random (-3, 3), lEO20y+random (-3, 3), lEO1x+random (-3, 3), lEO1y+random (-3, 3));




  stroke (0, 0, 0, 0);
}


