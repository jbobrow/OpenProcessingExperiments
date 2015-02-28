
float page = 0;

PFont font;

PImage welcome;
PImage page25;
PImage page1, page2, page3;
PImage page4, page5, page6, page7, page8, page9, page10;
PImage page11, page12, page13, page14, page15, page16, page17, page18;
PImage rabbit, tea3, tt;
PImage rabbit2, rabbit3, rabbit4, hookah, mushroom, end, end2, party, tea2;
PImage drink, neck, mouse1, crab, teacup, teacup2, window, king;

void setup(){
  size(640, 480);
  smooth();
  
  welcome = loadImage("welcome.png");
  page1 = loadImage("page1.png");
  page2 = loadImage("alice11a.png");
  page25 = loadImage("alice11a-2.png");
  page3 = loadImage("alice06a.png");
  page4 = loadImage("alice04a.png");
  page5 = loadImage("alice05a.png");
  page6 = loadImage("alice10a.png");
  page7 = loadImage("alice15a.png");
  page8 = loadImage("alice trip.png");
  page9 = loadImage("alice25a.png");
  page10 = loadImage("alice27a.png");
  page11 = loadImage("last page.png");
  page12 = loadImage("sadalice.png");
  page13 = loadImage("spilling tea.png");
  page14 = loadImage("mouse.png");
  page15 = loadImage("alice38a.png");
  page16 = loadImage("alice26a.png");
  page17 = loadImage("alice+smoke.png");
  page18 = loadImage("alice01a.png");
  end = loadImage("last page-1.png");
  end2 = loadImage("end2.png");
  party = loadImage("alice25a-2.png");
  tea2 = loadImage("alice26a-2.png");
  tea3 = loadImage("alice26a-3.png");
  
  rabbit = loadImage("rabbit.png");
  rabbit2 = loadImage("rabbit2.png");
  drink = loadImage("drink.png");
  neck = loadImage("neck.png");
  mouse1 = loadImage("mouse1.png");
  crab = loadImage("crab.png");
  teacup = loadImage("teacup.png");
  teacup2 = loadImage("teacup2.png");
  window = loadImage("window.png");
  king = loadImage("king.png");
  rabbit3 = loadImage("rabbit3.png");
  rabbit4 = loadImage("rabbit4.png");
  hookah = loadImage("hookah.png");
  mushroom = loadImage("mushroom.png");
  tt = loadImage("tt.png");
  
  font = loadFont("LucidaBlackletter-24.vlw");
  textFont(font);
}

void draw(){
  if (page == 0){
    background(welcome);
  }else if (page == 1){
    background(page1); 
    image(rabbit, 516, 239);
     if (overButton(516, 239, rabbit.width, rabbit.height)){
       //tint(255, 0, 0);
       image(rabbit, 516, 239, 1.25*rabbit.width, 1.25*rabbit.height);
       //noTint();
     }       
  }else if (page == 2){
    background(page2);
     if (overButton(131, 165, window.width, window.height)){
       image(window, 131, 157, 1.1*window.width, 1.1*window.height);
     }
  }else if (page == 3){
    background(page3);
    image(rabbit2, 1, 243);
     if(overButton(1, 243, rabbit2.width, rabbit2.height)){
       image(rabbit2, 1, 243, 1.15*rabbit2.width, 1.15*rabbit2.height);
     }
  }else if (page == 4){
    background(page4);
    image(drink, 34, 70);
     if(overButton(34, 70, drink.width, drink.height)){
       image(drink, 34, 70, 1.25*drink.width, 1.25*drink.height);
     }
  }else if (page == 5){
    background(page5);
    image(neck, 82, 70);
     if(overButton(82, 70, neck.width, neck.height)){
       image(neck, 78, 70, 1.2*neck.width, neck.height);
     }
  }else if (page == 6){
    background(page6);
    image(mouse1, 174, 226);
    image(crab, 349, 344);
     if(overButton(174, 226, mouse1.width, mouse1.height)){
       image(mouse1, 174, 226, 1.1*mouse1.width, 1.1*mouse1.height);
     }else if (overButton(349, 344, crab.width, crab.height)){
       image(crab, 349, 344, 1.1*crab.width, 1.1*crab.height);
     }
  }else if (page == 7){
    background(page7);
     if(overButton(191, 15, hookah.width, hookah.height)){
       image(hookah, 190, 12, 1.1*hookah.width, 1.1*hookah.height);
     }else if (overButton(11, 209, mushroom.width, mushroom.height)){
       image(mushroom, 10, 205, 1.1*mushroom.width, 1.1*mushroom.height);
     }
  }else if (page == 8){
    image(page8, 0, 0);
  }else if (page == 9){
    background(page9);
     if(overButton(243, 32, rabbit3.width, rabbit3.height)){
       image(rabbit3, 238, 27, 1.1*rabbit3.width, 1.1*rabbit3.height);
     }
  }else if (page == 10){
    background(page10);
     if(overButton(120, 1, rabbit4.width, rabbit4.height)){
       image(rabbit4, 120, 1, 1.05*rabbit4.width, 1.02*rabbit4.height);
     }
  }else if (page == 11){
    image(page11, 0, 0);
  }else if (page == 12){
    image(page12, 0, 0);
  }else if (page == 13){
    background(page13);
     if (overButton(61, 281, tt.width, tt.height)){
       image(tt, 61, 281, 1.1*tt.width, 1.1*tt.height);
     }
  }else if (page == 14){
    image (page14, 0, 0);
  }else if (page == 15){
    image(page15, 0, 0);
  }else if (page == 16){
    background(page16);
    image(teacup, 60, 336);
    image(teacup2, 307, 338);
     if(overButton(60, 336, teacup.width, teacup.height)){
       image(teacup, 60, 336, 1.1*teacup.width, 1.1*teacup.height);
     }else if(overButton(307, 338, teacup2.width, teacup2.height)){
       image(teacup2, 307, 338, 1.1*teacup2.width, 1.1*teacup2.height);
     }
  }else if (page == 17){
    image(page17, 0, 0);
  }else if (page == 18){
    background(page18);
    //image(king, 75, 44);
     if(overButton(60, 34, king.width, king.height)){
       image(king, 60, 34, 1.25*king.width, 1.25*king.height);
     }
  }else if (page == 2.5){
    image(page25, 0, 0);
  }else if (page == 19){
    image(end, 0, 0);
  }else if (page == 20){
    image(end2, 0, 0);
  }else if (page == 21){
    image(party, 0, 0);
  }else if (page == 22){
    image(tea2, 0, 0);
  }else if (page == 23){
    image(tea3, 0, 0);
  }
}


void mousePressed(){
  if(page == 0){
    page = 1;
  }else if((page == 1)&&(mouseX > 527)&&(mouseX < 570)&&(mouseY > 251)
        &&(mouseY < 338)){
    page = 3;
  }else if ((page == 3)&&(mouseX > 3)&&(mouseX < 77)&&(mouseY > 224)
        &&(mouseY < 382)){
    page = 4;
  }else if ((page == 4)&&(mouseX > 39)&&(mouseX < 102)&&(mouseY > 75)
        &&(mouseY < 137)){
    page = 5;
  }else if ((page == 5)&&(mouseX > 82)&&(mouseX < 124)&&(mouseY > 79)
        &&(mouseY < 151)){
          if(random(0, 1) < 0.5){
            page = 6;
          }else if (random(0, 1) > 0.5){
            page = 2;
          }
  }else if ((page == 6)&&(mouseX > 216)&&(mouseX < 332)&&(mouseY > 230)
        &&(mouseY < 387)){
    page =  14;
  }else if ((page == 6)&&(mouseX > 361)&&(mouseX < 525)&&(mouseY > 376)
        &&(mouseY < 472)){
    page = 7;
  }else if ((page == 7)&&(mouseX > 190)&&(mouseX < 233)&&(mouseY > 23)
        &&(mouseY < 221)){
    page = 17;
  }else if ((page == 7)&&(mouseX > 8)&&(mouseX < 340)&&(mouseY > 231)
        &&(mouseY < 308)){
    page = 8;
  }else if (page == 8){
    page = 21;
  }else if (page == 17){
    page = 18;
  }else if (page == 9){
    page = 10;
  }else if ((page == 10)&&(mouseX > 120)&&(mouseX < 275)&&(mouseY > 0)
        &&(mouseY < 321)){
    page = 11;
  }else if ((page == 18)&&(mouseX > 75)&&(mouseX < 223)&&(mouseY > 48)
        &&(mouseY < 302)){
    page = 19;
  }else if ((page == 2)&&(mouseX > 163)&&(mouseX < 316)&&(mouseY > 96)
        &&(mouseY < 251)){
    page = 13;
  }else if ((page == 13)&&(mouseX > 61)&&(mouseX < 112)&&(mouseY > 281)
        &&(mouseY < 336)){
    page = 16;
  }else if((page == 16)&&(mouseX > 52)&&(mouseX < 143)&&(mouseY > 338)
        &&(mouseY < 386)){ //coords for text
    page = 20;
  }else if ((page == 16)&&(mouseX > 298)&&(mouseX < 387)&&(mouseY > 338)
        &&(mouseY < 386)){ //coords for text
    page = 9;
  }else if (page == 16){
    page = 9;
  }else if (page == 14){
    page = 23;
  }else if (page == 22){
    page = 9;
  }else if (page == 23){
    page = 21;
  }else if (page == 21){
    page = 10;
  }
}

void keyPressed(){
  if (key == ' ' ){
    if ((page == 1)||(page == 3)){
      page = 2.5;
    }else if (page == 4){
      page = 12;
    }else if (page == 2){
      page = 1;
    }else if (page == 11){
      page = 1;
    }else if ((page == 2.5)||(page == 12)){
      page = 1;
    }else if (page == 20){
      page = 1;
    }else if (page == 19){
      page = 1;
    }
  }
}

boolean overButton(int x, int y, int w, int h){
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true; 
  } 
  else {
    return false; 
  }
}

