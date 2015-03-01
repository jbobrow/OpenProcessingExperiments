
/*@pjs preload="titleScreen2.png, bacgroundSpotOne(icon).png,backgroundSpotTwo(icon).png,backgroundSpotThree(icon).png,v.png,A.png,L1.png,L2.png,E.png,Y.png,mapScreen2.png,mapScreen2(spotOne).png,mapScreen2(spotTwo).png,mapScreen2(spotThree).png,backgroundSpotOne.png,A_spotOne.png,B_spotOne.png,C_spotOne.png,D_spotOne.png,E_spotOne.png,F_spotOne.png,G_spotOne.png,H_spotOne.png,I_spotOne.png,J_spotOne.png,K_spotOne.png,backgroundSpotTwo.png,oneSpotTwo.png,twoSpotTwo.png,threeSpotTwo.png,fourSpotTwo.png,fiveSpotTwo.png,sixSpotTwo.png,sevenSpotTwo.png,eightSpotTwo.png,nineSpotTwo.png,tenSpotTwo.png,elevenSpotTwo.png,twelveSpotTwo.png,thirteenSpotTwo.png,fourteenSpotTwo.png,fifteenSpotTwo.png,nineteenSpotTwo.png,backgroundSpotThree.png,OneSpotThree.png,TwoSpotThree.png, ThreeSpotThree.png,fourSpotThree.png,fiveSpotThree.png, sixSpotThree.png, sevenSpotThree.png,eightSpotThree.png,nineSpotThree.png,tenSpotThree.png,elevenSpotThree.png,twelveSpotThree.png,thirteenSpotThree.png,fourteenSpotThree.png,fifteenSpotThree.png,sixteenSpotThree.png,seventeenSpotThree.png,nineteenSpotThree.png,twentySpotThree.png,twentyoneSpotThree.png,twentytwoSpotThree.png"; */

 

PImage title;
color bColor = color(0);

public boolean showMap = false;
public boolean spotOne = false;
public boolean spotTwo = false;
public boolean spotThree = false;
public boolean showIntro = false;

PImage layer;
PImage mapScreen;
PImage mapScreen1;
PImage mapScreen2;
PImage mapScreen3;

PImage backgroundSpotOneicon;
boolean backgroundSpotOneicon1;

PImage backgroundSpotTwoicon;
boolean backgroundSpotTwoicon1;

PImage backgroundSpotThreeicon;
boolean backgroundSpotThreeicon1;

PImage V;
boolean V3;

PImage A;
boolean A3;

PImage L1;
boolean L3;

PImage L2;
boolean L4;

PImage E;
boolean E3;

PImage Y;
boolean Y3;


PImage bacgroundSpotOne;
PImage A_SpotOne;
boolean fOne;
PImage B_SpotOne;
boolean fTwo;
PImage C_SpotOne;
boolean fC;
PImage D_SpotOne;
boolean fD;
PImage E_SpotOne;
boolean fE;
PImage F_SpotOne;
boolean fF;
PImage G_SpotOne;
boolean fG;
PImage H_SpotOne;
boolean fH;
PImage I_SpotOne;
boolean fI;
PImage J_SpotOne;
boolean fJ;
PImage k_SpotOne;
boolean fK;


////////////////////////////////////////////
boolean A_spotTwo;
boolean B_spotTwo;
boolean C_spotTwo;
boolean D_spotTwo;
boolean E_spotTwo;
boolean F_spotTwo;
boolean G_spotTwo;
boolean H_spotTwo;
boolean I_spotTwo;
boolean J_spotTwo;
boolean K_spotTwo;
boolean L_spotTwo;
boolean M_spotTwo;
boolean N_spotTwo;
boolean O_spotTwo;
boolean S_spotTwo; 

PImage backgroundSpotTwo;
PImage A_spotTwoPic;
PImage B_spotTwoPic;
PImage C_spotTwoPic;
PImage D_spotTwoPic;
PImage E_spotTwoPic;
PImage F_spotTwoPic;
PImage G_spotTwoPic;
PImage H_spotTwoPic;
PImage I_spotTwoPic;
PImage J_spotTwoPic;
PImage K_spotTwoPic;
PImage L_spotTwoPic;
PImage M_spotTwoPic;
PImage N_spotTwoPic;
PImage O_spotTwoPic;
PImage S_spotTwoPic;

///////////////////////////////////////////
//Spot Three

boolean A_spotThree = false;
boolean B_spotThree = false;
boolean C_spotThree = false;
boolean D_spotThree = false;
boolean E_spotThree = false;
boolean F_spotThree = false;
boolean G_spotThree = false;
boolean H_spotThree = false;
boolean I_spotThree = false;
boolean J_spotThree = false;
boolean K_spotThree = false;
boolean L_spotThree = false;
boolean M_spotThree = false;
boolean N_spotThree = false;
boolean O_spotThree = false;
boolean P_spotThree = false;
boolean Q_spotThree = false;
boolean S_spotThree = false;
boolean T_spotThree = false;
boolean U_spotThree = false;
boolean V_spotThree = false;

PImage sceneSpotThree;
PImage A_spotThreePic;
PImage B_spotThreePic;
PImage C_spotThreePic;
PImage D_spotThreePic;
PImage E_spotThreePic;
PImage F_spotThreePic;
PImage G_spotThreePic;
PImage H_spotThreePic;
PImage I_spotThreePic;
PImage J_spotThreePic;
PImage K_spotThreePic;
PImage L_spotThreePic;
PImage M_spotThreePic;
PImage N_spotThreePic;
PImage O_spotThreePic;
PImage P_spotThreePic;
PImage Q_spotThreePic;
PImage S_spotThreePic;
PImage T_spotThreePic;
PImage U_spotThreePic;
PImage V_spotThreePic;



void setup() {
  size(750, 500);
  
  
backgroundSpotOneicon = loadImage("bacgroundSpotOne(icon).png");
backgroundSpotTwoicon = loadImage("backgroundSpotTwo(icon).png");
backgroundSpotThreeicon = loadImage("backgroundSpotThree(icon).png");

V = loadImage("v.png");
A = loadImage("A.png");
L1 = loadImage("L1.png");
L2 = loadImage("L2.png");
E = loadImage("E.png");
Y = loadImage("Y.png");


  //Spot One Image Files
  /////////////////////////
 // layer = loadImage("Layer.png");
  title = loadImage("titleScreen2.png");
  mapScreen = loadImage("mapScreen2.png");
  mapScreen1 = loadImage("mapScreen2(spotOne).png");
  mapScreen2 = loadImage("mapScreen2(spotTwo).png");
  mapScreen3 = loadImage("mapScreen2(spotThree).png");
  bacgroundSpotOne = loadImage("backgroundSpotOne.png");
  A_SpotOne = loadImage("A_spotOne.png");
  B_SpotOne = loadImage("B_spotOne.png");
  C_SpotOne = loadImage("C_spotOne.png");
  D_SpotOne = loadImage("D_spotOne.png");
  E_SpotOne = loadImage("E_spotOne.png");
  F_SpotOne = loadImage("F_spotOne.png");
  G_SpotOne = loadImage("G_spotOne.png");
  H_SpotOne = loadImage("H_spotOne.png");
  I_SpotOne = loadImage("I_spotOne.png");
  J_SpotOne = loadImage("J_spotOne.png");
  k_SpotOne = loadImage("k_spotOne.png");


  //Spot Two Image files
  //////////////////////////
  backgroundSpotTwo = loadImage("backgroundSpotTwo.png");
  A_spotTwoPic = loadImage("oneSpotTwo.png");
  B_spotTwoPic = loadImage("twoSpotTwo.png");
  C_spotTwoPic = loadImage("threeSpotTwo.png");
  D_spotTwoPic = loadImage("fourSpotTwo.png");
  E_spotTwoPic = loadImage("fiveSpotTwo.png");
  F_spotTwoPic = loadImage("sixSpotTwo.png");
  G_spotTwoPic = loadImage("sevenSpotTwo.png");
  H_spotTwoPic = loadImage("eightSpotTwo.png");
  I_spotTwoPic = loadImage("nineSpotTwo.png");
  J_spotTwoPic = loadImage("tenSpotTwo.png");
  K_spotTwoPic = loadImage("elevenSpotTwo.png");
  L_spotTwoPic = loadImage("twelveSpotTwo.png");
  M_spotTwoPic = loadImage("thirteenSpotTwo.png");
  N_spotTwoPic = loadImage("fourteenSpotTwo.png");
  O_spotTwoPic = loadImage("fifteenSpotTwo.png");
  S_spotTwoPic = loadImage("nineteenSpotTwo.png");

  ////////////////////////////////
  //Spot Three

    sceneSpotThree = loadImage("backgroundSpotThree.png");
  A_spotThreePic = loadImage("OneSpotThree.png");
  B_spotThreePic = loadImage("TwoSpotThree.png");
  C_spotThreePic = loadImage("ThreeSpotThree.png");
  D_spotThreePic = loadImage("fourSpotThree.png");
  E_spotThreePic = loadImage("fiveSpotThree.png");
  F_spotThreePic = loadImage("sixSpotThree.png");
  G_spotThreePic = loadImage("sevenSpotThree.png");
  H_spotThreePic = loadImage("eightSpotThree.png");
  I_spotThreePic = loadImage("nineSpotThree.png");
  J_spotThreePic = loadImage("tenSpotThree.png");
  K_spotThreePic = loadImage("elevenSpotThree.png");
  L_spotThreePic = loadImage("twelveSpotThree.png");
  M_spotThreePic = loadImage("thirteenSpotThree.png");
  N_spotThreePic = loadImage("fourteenSpotThree.png");
  O_spotThreePic = loadImage("fifteenSpotThree.png");
  P_spotThreePic = loadImage("sixteenSpotThree.png");
  Q_spotThreePic = loadImage("seventeenSpotThree.png");
  S_spotThreePic = loadImage("nineteenSpotThree.png");
  T_spotThreePic = loadImage("twentySpotThree.png");
  U_spotThreePic = loadImage("twentyoneSpotThree.png");
  V_spotThreePic = loadImage("twentytwoSpotThree.png");
}


void draw() {
  background(bColor);
  


  if (showMap == false && spotOne == false && spotTwo == false && spotThree == false) {
    howIntro();
  } else if (showMap == true && spotOne == false && spotTwo == false && spotThree == false) {
    howMap();
  } else if (showMap == false && spotOne == true && spotTwo == false && spotThree == false) {
    potOne();
  } else if (showMap == false && spotOne == false && spotTwo == true && spotThree == false) {
    potTwo();
  } else if (showMap == false && spotOne == false && spotTwo == false && spotThree == true) {
    potThree();
  } else if (showMap == true && spotOne == false && spotTwo == false && spotThree == false) {
    howMap();
  } 




  //Spot One Figure Images
  if (mouseX <= 725 && mouseX > 650 ) {
    fOne = !fOne;
  }

  if (mouseX <= 650 && mouseX > 625 ) {
    fTwo = !fTwo;
  }

  if (mouseX <= 625 && mouseX > 570) {
    fC = !fC;
  }

  if (mouseX <= 570 && mouseX > 490) {
    fD = !fD;
  }
  if (mouseX <= 490  && mouseX > 470) {
    fE = !fE;
  }

  if (mouseX <= 470   && mouseX > 450) {
    fF = !fF;
  }
  if (mouseX <= 450  && mouseX > 430) {
    fG = !fG;
  }
  if (mouseX <= 430 && mouseX > 410) {
    fH = !fH;
  }

  if (mouseX <= 410  && mouseX > 380) {
    fI = !fI;
  }

  if (mouseX <= 380  && mouseX > 255) {
    fJ = !fJ;
  }

  if (mouseX <= 255  && mouseX > 130) {
    fK = !fK;
  }

  ///////////////////////////////////////////////////
  //////////////////////////////////////////////////

  //Spot two figure images

  if (mouseX > 10  && mouseX < 50 ) {
    A_spotTwo = !A_spotTwo;
  }
   
  
  if (mouseX >= 50 && mouseX < 120) {
    B_spotTwo = !B_spotTwo;
  }

  if (mouseX >= 120 && mouseX < 175) {
    C_spotTwo = !C_spotTwo;
  }

  if (mouseX >= 175 && mouseX < 220) {
    D_spotTwo = !D_spotTwo;
  }

  if (mouseX >= 220 && mouseX < 270 ) {
    E_spotTwo = !E_spotTwo;
  }

  if (mouseX >= 270 && mouseX <290) {
    F_spotTwo = !F_spotTwo;
  }

  if (mouseX >= 290 && mouseX <310) {
    G_spotTwo = !G_spotTwo;
  }

  if (mouseX >= 310 && mouseX <320) {
    H_spotTwo = !H_spotTwo;
  }

  if (mouseX >= 320 && mouseX <350) {
    I_spotTwo = !I_spotTwo;
  }

  if (mouseX >= 350 && mouseX <390) {
    J_spotTwo = !J_spotTwo;
  }

  if (mouseX >= 390 && mouseX < 420) {
    K_spotTwo = !K_spotTwo;
  }

  if (mouseX >= 420 && mouseX <450 ) {
    L_spotTwo = !L_spotTwo;
  }

  if (mouseX >= 450 && mouseX <470) {
    M_spotTwo = !M_spotTwo;
  }

  if (mouseX >= 470 && mouseX <500) {
    N_spotTwo = !N_spotTwo;
  }

  if (mouseX >= 500 && mouseX <530) {
    O_spotTwo = !O_spotTwo;
  }


  if (mouseX >= 530 && mouseX <750) {
    S_spotTwo = !S_spotTwo;
  }


  /////////////////////////////////////////////////////////

  //Spot Three


  if (mouseX >10 && mouseX < 30) {
    A_spotThree = !A_spotThree;
  }

  if (mouseX >= 30 && mouseX < 50 ) {
    B_spotThree = !B_spotThree;
  }

  if (mouseX >= 50 ) {
    C_spotThree = !C_spotThree;
  }

  if (mouseX >= 70 ) {
    D_spotThree = !D_spotThree;
  }

  if (mouseX >= 90 ) {
    E_spotThree = !E_spotThree;
  }

  if (mouseX >= 110) {
    F_spotThree = !F_spotThree;
  }

  if (mouseX >= 130 ) {
    G_spotThree = !G_spotThree;
  }

  if (mouseX >= 150 ) {
    H_spotThree = !H_spotThree;
  }

  if (mouseX >= 170 ) {
    I_spotThree = !I_spotThree;
  }

  if (mouseX >= 190 ) {
    J_spotThree = !J_spotThree;
  }

  if (mouseX >= 210) {
    K_spotThree = !K_spotThree;
  }

  if (mouseX >= 230 ) {
    L_spotThree = !L_spotThree;
  }

  if (mouseX >= 250 ) {
    M_spotThree = !M_spotThree;
  }

  if (mouseX >= 270 ) {
    N_spotThree = !N_spotThree;
  }

  if (mouseX >= 290 ) {
    O_spotThree = !O_spotThree;
  }

  if (mouseX >= 310 ) {
    P_spotThree = !P_spotThree;
  }

  if (mouseX >= 330 ) {
    Q_spotThree = !Q_spotThree;
  }


  if (mouseX >= 370) {
    S_spotThree = !S_spotThree;
  }

  if (mouseX >= 390 ) {
    T_spotThree = !T_spotThree;
  }

  if (mouseX >= 410 ) {
    U_spotThree = !U_spotThree;
  }

  if (mouseX >= 430 ) {
    V_spotThree = !V_spotThree;
  }
}//draw

void mousePressed() {

  if (showMap == false && spotOne == false && spotTwo == false && spotThree == false) {
    showMap = true;
  } else if (showMap == true && 
             mouseX < width && mouseX > 2 * width/3) {
    spotOne = !spotOne;
    potOne();
  } else if (spotOne == true &&  
    mouseX > 665 && mouseX < 735 &&
    mouseY > 395 && mouseY < 485) {
    spotOne = false;
    showMap = !showMap;
  } else if (showMap == true && 
             mouseX > width/3 && mouseX < 2 * width/3 ) {
    spotTwo = !spotTwo;
    potTwo();
  } else if (spotTwo == true &&  
    mouseX > 670 && mouseX < 735 &&
    mouseY > 380 && mouseY < 480) {
    spotTwo = false;
    showMap = !showMap;
  } else if (showMap == true && 
             mouseX < width && mouseX > 0 ) {
    spotThree = !spotThree;
    potThree();
  } else if (spotThree == true &&  
    mouseX > 680   && mouseX < 735 &&
   mouseY > 395 && mouseY < 480 ) {
    spotThree = false;
    showMap = !showMap;

  }
}

void howIntro() {

  title = title;
  imageMode(CENTER); 
  noTint();
  image(title, width/2, height/2, 755, 500);
  noTint();
  
  if(mouseX > 0 && mouseX < 135){
noTint();
    image(V, width/2, height/2, 755, 500);
  
  }else{
    tint(255,126);
    image(V, width/2, height/2, 755, 500);
  
   
  }
   if(mouseX > 135 && mouseX < 280) {
       noTint();
     image(A, width/2, height/2, 755, 500);
          

   }else{
     tint(255,126);  
     image(A, width/2, height/2, 755, 500);

   }
  
  if(mouseX > 280 && mouseX < 355 ) {
     noTint();  
    image(L1, width/2, height/2, 755, 500);
     
  }else{
          tint(255,126);
      image(L1, width/2, height/2, 755, 500);

  }
  
    if(mouseX > 355 && mouseX < 440 ) {
       noTint();
      image(L2, width/2, height/2, 755, 500);
     
  }else{
         tint(255,126);
      image(L2, width/2, height/2, 755, 500);
     
  }
  
  if(mouseX > 440 && mouseX < 605 ) {
    noTint();  
    image(E, width/2, height/2, 755, 500);
      
  }else{
    tint(255,126);
      image(E, width/2, height/2, 755, 500);

  }
  
  if(mouseX > 650 && mouseX < width ) {
    noTint();  
    image(Y, width/2, height/2, 755, 500);
      
  }else{
       tint(255,126);
      image(Y, width/2, height/2, 755, 500);
      tint(255,126);
  }

  
}



void potOne() {

  if (spotOne == true ) {
    noTint();

    bacgroundSpotOne = bacgroundSpotOne;
    imageMode(CENTER);
    image(bacgroundSpotOne, width/2, height/2, 755, 500);


    if (fOne) {
      fOne = false;
      image(A_SpotOne, width/2 + 100, height/2, 755, 500);
    }

    if (fTwo) {
      fTwo = false;
      image(B_SpotOne, width/2 + 100, height/2, 755, 500);
    } 

    if (fC) {
      fC = false;
      image(C_SpotOne, width/2 + 100, height/2, 755, 500);
    } 


    if (fD) {
      fD = false;
      image(D_SpotOne, width/2 + 100, height/2, 755, 500);
    } 


    if (fE) {
      fE = false;
      image(E_SpotOne, width/2 + 100, height/2, 755, 500);
    } 


    if (fF) {
      fF = false;
      image(F_SpotOne, width/2 + 100, height/2, 755, 500);
    } else 


      if (fG) {
      fG = false;
      image(G_SpotOne, width/2 + 100, height/2, 755, 500);
    } 


    if (fH) {
      fH = false;
      image(H_SpotOne, width/2 + 100, height/2, 755, 500);
    } 


    if (fI) {  
      fI = false;

      image(I_SpotOne, width/2 + 100, height/2, 755, 500);
    }


    if (fJ) {
      fJ = false;

      image(J_SpotOne, width/2 + 100, height/2, 755, 500);
    } 


    if (fK) {
      fK = false;

      image(k_SpotOne, width/2 + 100, height/2, 755, 500);
    } 


if(mouseX > 665 && mouseX < 735 &&
  mouseY > 395 && mouseY < 485) {
    tint(255,126);
     image(backgroundSpotOneicon, width/2, height/2, 755,500);
    
  } else {
     image(backgroundSpotOneicon, width/2, height/2, 755,500);
    noTint();
  }




    showMap = false;

  }
}///showspot


void potTwo() {

  if (spotTwo == true ) {
noTint();

    image(backgroundSpotTwo, width/2, height/2, 755, 500);

   
    ///Buttons Buttons Buttons Buttons





    if (A_spotTwo) {
      A_spotTwo = false;
      
      image(A_spotTwoPic, width/2, height/2, 755, 500);
      noTint();
    } else if(mouseX > 10){
      tint(255,126);
      image(A_spotTwoPic, width/2, height/2, 755, 500);
    }

    if (B_spotTwo) {
      B_spotTwo = false;
      noTint();
      image(B_spotTwoPic, width/2, height/2, 755, 500);
    } else if(mouseX >50) {
      tint(255,126);
  image(B_spotTwoPic, width/2, height/2, 755, 500);
      }
      
      
    if (C_spotTwo) {
      C_spotTwo = false;
      noTint();
      image(C_spotTwoPic, width/2, height/2, 755, 500);
    } else if(mouseX > 120) {
      tint(255,126);
       image(C_spotTwoPic, width/2, height/2, 755, 500);
    }

    if (D_spotTwo) {
      D_spotTwo = false;
      noTint();
      image(D_spotTwoPic, width/2, height/2, 755, 500);
    } else if(mouseX >175) {
      tint(255,126);
      image(D_spotTwoPic, width/2, height/2, 755, 500);
    }

    if (E_spotTwo) {
      E_spotTwo = false;
      noTint();
      image(E_spotTwoPic, width/2, height/2, 755, 500);
    } else if(mouseX > 220){
      tint(255,126);
      image(E_spotTwoPic, width/2, height/2, 755, 500);
    }



    if (F_spotTwo) {
      F_spotTwo = false;
      noTint();
      image(F_spotTwoPic, width/2, height/2, 755, 500);
    } else if(mouseX > 270){
      tint(255,126);
      image(F_spotTwoPic, width/2, height/2, 755, 500);
    }

    if (G_spotTwo) {
      G_spotTwo = false;
      noTint();
      image(G_spotTwoPic, width/2, height/2, 755, 500);
    } else if(mouseX > 290){
      tint(255,126);
 image(G_spotTwoPic, width/2, height/2, 755, 500);
    }

    if (H_spotTwo) {
      H_spotTwo = false;
      noTint();
      image(H_spotTwoPic, width/2, height/2, 755, 500);
    } else if(mouseX > 310){
      tint(255,126);
      image(H_spotTwoPic, width/2, height/2, 755, 500);
    }



    if (I_spotTwo) {
      I_spotTwo = false;
      noTint();
      image(I_spotTwoPic, width/2, height/2, 755, 500);
    } else if(mouseX > 320){
      tint(255,126);
        image(I_spotTwoPic, width/2, height/2, 755, 500);
    }

    if (J_spotTwo) {
      J_spotTwo = false;
      noTint();
      image(J_spotTwoPic, width/2, height/2, 755, 500);
    } else if(mouseX > 350){
      tint(255,126);
          image(J_spotTwoPic, width/2, height/2, 755, 500);
    }

    if (K_spotTwo) {
      K_spotTwo = false;
      noTint();
      image(K_spotTwoPic, width/2, height/2, 755, 500);
    } else if(mouseX > 390){
      tint(255,126);
       image(K_spotTwoPic, width/2, height/2, 755, 500);
    }

    if (L_spotTwo) {
      L_spotTwo = false;
      noTint();
      image(L_spotTwoPic, width/2, height/2, 755, 500);
    } else if(mouseX > 420){
      tint(255,126);
       image(L_spotTwoPic, width/2, height/2, 755, 500);
    }

    if (M_spotTwo) {
      M_spotTwo = false;
      noTint();
      image(M_spotTwoPic, width/2, height/2, 755, 500);
    } else if(mouseX > 450) {
      tint(255,126);
  image(M_spotTwoPic, width/2, height/2, 755, 500);
    }

    if (N_spotTwo) {
      N_spotTwo = false;
      noTint();
      image(N_spotTwoPic, width/2, height/2, 755, 500);
    } else if(mouseX > 470){
      tint(255,126);
 image(N_spotTwoPic, width/2, height/2, 755, 500);
    }

    if (O_spotTwo) {
      O_spotTwo = false;
      noTint();
      image(O_spotTwoPic, width/2, height/2, 755, 500);
    } else if(mouseX > 500){
      tint(255,126);
     image(O_spotTwoPic, width/2, height/2, 755, 500);
    }


    if (S_spotTwo) {
      S_spotTwo = false;
      noTint();
      image(S_spotTwoPic, width/2, height/2, 755, 500);
    } else if(mouseX > 750){
      tint(255,126);
    image(S_spotTwoPic, width/2, height/2, 755, 500);
    }



if (mouseX > 670 && mouseX < 735 &&
    mouseY > 380 && mouseY < 480) {
tint(255, 126);
  image(backgroundSpotTwoicon, width/2, height/2, 755,500);

} else {
  noTint();
  image(backgroundSpotTwoicon, width/2, height/2, 755,500);
 
}



    showMap = false;


  }//spot2
}//showspot2



void potThree() {

  if (spotThree == true ) {
    noTint();

    image(sceneSpotThree, width/2, height/2, 755, 500);
       


    ///Buttons Buttons Buttons Buttons


    if (A_spotThree) {
      A_spotThree = false;
      image(A_spotThreePic, width/2, height/2, 755, 500);
    } 

    if (B_spotThree) {
      B_spotThree = false;
      image(B_spotThreePic, width/2, height/2, 755, 500);
    } 

    if (C_spotThree) {
      C_spotThree = false;
      image(C_spotThreePic, width/2, height/2, 755, 500);
    } 

    if (D_spotThree) {
      D_spotThree = false;
      image(D_spotThreePic, width/2, height/2, 755, 500);
    } 

    if (E_spotThree) {
      E_spotThree = false;
      image(E_spotThreePic, width/2, height/2, 755, 500);
    } 



    if (F_spotThree) {
      F_spotThree = false;
      image(F_spotThreePic, width/2, height/2, 755, 500);
    } 

    if (G_spotThree) {
      G_spotThree = false;
      image(G_spotThreePic, width/2, height/2, 755, 500);
    } 

    if (H_spotThree) {
      H_spotThree = false;
      image(H_spotThreePic, width/2, height/2, 755, 500);
    } 



    if (I_spotThree) {
      I_spotThree = false;
      image(I_spotThreePic, width/2, height/2, 755, 500);
    } 

    if (J_spotThree) {
      J_spotThree = false;
      image(J_spotThreePic, width/2, height/2, 755, 500);
    } 

    if (K_spotThree) {
      K_spotThree = false;
      image(K_spotThreePic, width/2, height/2, 755, 500);
    } 

    if (L_spotThree) {
      L_spotThree = false;
      image(L_spotThreePic, width/2, height/2, 755, 500);
    } 

    if (M_spotThree) {
      M_spotThree = false;
      image(M_spotThreePic, width/2, height/2, 755, 500);
    } 

    if (N_spotThree) {
      N_spotThree = false;
      image(N_spotThreePic, width/2, height/2, 755, 500);
    } 

    if (O_spotThree) {
      O_spotThree = false;
      image(O_spotThreePic, width/2, height/2, 755, 500);
    } 



    if (P_spotThree) {
      P_spotThree = false;
      image(P_spotThreePic, width/2, height/2, 755, 500);
    } 

    if (Q_spotThree) {
      Q_spotThree = false;
      image(Q_spotThreePic, width/2, height/2, 755, 500);
    } 


    if (S_spotThree) {
      S_spotThree = false;
      image(S_spotThreePic, width/2, height/2, 755, 500);
    } 

    if (T_spotThree) {
      T_spotThree = false;
      image(T_spotThreePic, width/2, height/2, 755, 500);
    } 

    if (U_spotThree) {
      U_spotThree = false;
      image(U_spotThreePic, width/2, height/2, 755, 500);
    } 

    if (V_spotThree) {
      V_spotThree = false;
      image(V_spotThreePic, width/2, height/2, 755, 500);
    } 


if(mouseX > 680   && mouseX < 735 &&
   mouseY > 395 && mouseY < 480 ) {
     tint(255,126);
 image(backgroundSpotThreeicon, width/2, height/2, 755,500);
   } else {
     image(backgroundSpotThreeicon, width/2, height/2, 755,500);
     noTint();
   }

    showMap = false;


  }//spot3
}///spot three




void howMap() {

  noTint();
  image(mapScreen, width/2, height/2, 755, 500);
 // noTint();


  if ( mouseX > 2 * width/3 && mouseX < width) {
  noTint();
    image(mapScreen1, width/2, height/2, 755, 500);
  } else {
    tint(255, 126); 
    image(mapScreen1, width/2, height/2, 755, 500);
  } 
  
  if (mouseX > width/3 && 
      mouseX < 2 * width/3) {
      noTint();
    image(mapScreen2, width/2, height/2, 755, 500);
  } else{
    tint(255, 126); 
    image(mapScreen2, width/2, height/2, 755, 500);
  }

  if ( mouseX > 0 && 
       mouseX < width/3 ) {
      noTint();
    image(mapScreen3, width/2, height/2, 755, 500);
  } else {
    tint(255, 126);  
    image(mapScreen3, width/2, height/2, 755, 500);
     
  }
  
}///map





