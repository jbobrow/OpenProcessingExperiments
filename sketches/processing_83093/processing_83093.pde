
void setup() {
  size(1050, 650);
  background(255);
}
String AA = "French Christmas";
String AB = "French Santa";
String AC = "French families don't have this decoration comonly found in America";
String AD = "French Children leave these out by the fireplace instead of stockings";
String AE = str('E');
String BA = "Santons"/*1*/;
String BB = "This is left out for the virgin Mary"/*2*/;
String BC = "Have along with religious figures"/*3*/;
String BD = "Displayed along with Creche"/*4*/;
String BE = str('J');
String CA = "What is made to represent a Yule Log";
String CB = "The specific name of the object made to represent Yule Log";
String CC = "A Yule Log is sometimes used for this";
String CD = "In souther France the log is";
String CE = "An action is done to this log between which two holiday's";
String DA = "Something is hidden inside this cake";
String DB = "What is special about kings cake";
String DC = "What does the person who finds the special object get";
String DD = str('w');
String DE = "there is a famous song referencing this";
String EA = "The day of the month children get presents in some regions";
String EB = "The day of the month adults get presents";
String EC = "What is the name of the day children get presents";
String ED = str('X');
String EE = str('Y');
String FA = "what good children get";
String FB = "The antithesis of Santa";
String FC = "Letters to santa";
String FD = "when, Letters to Santa";
String FE = "AD";
String GA = "This is the only mammal that can't jump";
String GB = "The most comon name in the world";
String GC = "The longest full name of a state";
String GD = "Providence plantations is also known as";
String GE = "Moustashless card";
String[][] questions = {
  {
    AA, AB, AC, AD, AE
  }
  , {
    BA, BB, BC, BD, BE
  }
  , {
    CA, CB, CC, CD, CE
  }
  , {
    DA, DB, DC, DD, DE
  }
  , {
    EA, EB, EC, ED, EE
  }
  , {
    FA, FB, FC, FD, FE
  }
  , {
    GA, GB, GC, GD, GE
  }
};
int[][] used = {
  {
    1, 1, 1, 1, 0
  }
  , {
    1, 1, 1, 1, 0
  }
  , {
    1, 1, 1, 1, 1
  }
  , {
    1, 1, 1, 0, 1
  }
  , {
    1, 1, 1, 0, 0
  }
  , {
    1, 1, 1, 1, 0
  }
  , {
    1, 1, 1, 1, 1
  }
};
int[] score = {
  0, 0, 0
};
int state = 1;
int QX = 0;
int QY = 0;
int count = 1;
int winner = 0;
/*int[] teams = {
  0, 0, 0
};*/
void draw() {
  background(239, 239, 255);

  if (state == 1) {
    fill(0);
  text("Contrast", 35, 39, 80, 22);
  text("Decorations", 175, 39, 100, 22);
  text("Yule Log", 335, 39, 80, 22);
  text("Cake", 495, 39, 60, 22);
  text("gifts", 645, 39, 60, 22);
  text("Other", 795, 39, 60, 22);
  text("Random", 940, 39, 71, 22);
  text(str(score[0]), 45, 614, 60, 22);
  text(str(score[1]), 195, 614, 60, 22);
  text(str(score[2]), 345, 614, 60, 22);
  line(0, 600, 1050, 600);
    for (int X = 0; X < 7; X+=1) {
      line(150 + 150*X, 0, 150 + 150*X, 600);
      for (int Y = 0; Y < 5; Y+=1) {
        if ( X == 0) {
          line(0, 100 + Y*100, 1050, 100 + Y*100);
        }
        if (used[X][Y]==1){
        if (mouseX > 150*(X) && mouseX < 150+150*(X) && mouseY > 100 + 100*Y && mouseY < 200 + 100*Y && mousePressed == true) {
          QX = X;
          QY = Y;
          state = 2;
          count = 0;
        }
        fill(0);  
        textSize(18);
        text(str(100*(Y+1)), 60 + (150 * X), 140+ (100*Y), 100, 22);
        
        }
      }
    }
  }
  if (state == 2 && count == 15) {
    state =3;
  }
  if (state == 3) {
    text((questions[QX][QY]), 375, 250);
    fill(239, 239, 255);
    rect(100, 450, 150, 100);
    rect(450, 450, 150, 100);
    rect(800, 450, 150, 100);
    rect(100, 550, 850, 100);
    fill(0);
    if (mouseX>100 && mouseX<250 && mouseY>450 && mouseY<550 && mousePressed == true) {
      winner = 0;
      count = 0;
    }
    if (mouseX>450 && mouseX<600 && mouseY>450 && mouseY<550 && mousePressed == true) {
      winner = 1;
      count = 0;
    } 
    if (mouseX>800 && mouseX<950 && mouseY>450 && mouseY<550 && mousePressed == true) {
      winner = 2;
      count = 0;
    }
    if (mouseX>100 && mouseX<950 && mouseY>550 && mouseY<650 && mousePressed == true) {
      winner = 3;
      count = 0;
    }
    if (count == 4) {
      state = 1;
      if(winner<3){
      score[winner]+=(100*(QY+1));
      }
      used[QX][QY] = 0;
      QX = 0;
      QY = 0;
    }
  }

count+=1;
println(str(score[0]));
println(str(score[1]));
println(str(score[2]));
}


