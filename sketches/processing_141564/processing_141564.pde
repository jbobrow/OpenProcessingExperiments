
final int TITLES = 0;
final int PLAYGAME = 1;
final int WINGAME = 2;
final int LOSEGAME = 3;
final int INSTRUCTIONS = 4;
final int ATTACK = 5;
final int BADDIEATTACK = 6;
int gamestate;
int[] textline = new int[6];
int[] misterbaddieman = new int[20];
int hp;
int mp;
int baddienumber;
int hebedead = 0; // 0 if he's alive, 1 if he's dead, 2 if they're all dead

void setup() {
  size(84, 48);
  PFont font;
  font = loadFont("ABeeZee-Regular-8.vlw");
  textFont(font, 8);

  initgame();
}

void initgame() {
  gamestate = TITLES;
  clearscreen();
  fill(0, 0, 0);

  // Set up line rows 0-5
  for (int i=0; i < 6; i++) {
    textline[i] = (i*8) + 7;
  }

  // Set up misterbaddiemans 0-19
  misterbaddieman[0] = int(random(8)+5);
  for (int i=1; i < 20; i++) {
    misterbaddieman[i] = misterbaddieman[i-1] + int(random(4)+1);
  }

  // Set up hp and mp
  hp = int(random(35))+55;
  mp = int(random(10)+5);

  baddienumber = 0;

}


void clearscreen() {
  background(230, 230, 230);
}

void draw() {
//  println("Gamestate = " + gamestate);
  switch(gamestate) {
  case TITLES:
    titlescreen();
    break;
  case PLAYGAME:
    playrsg();
    break;
  case INSTRUCTIONS:
    instructions();
    break;
  case ATTACK:
    attacking();
    break;
  case BADDIEATTACK:
    baddieattacking();
    break;
  case WINGAME:
    winning();
    break;
  case LOSEGAME:
    losing();
    break;
  }
}

void keyPressed() {
  switch(gamestate) {
  case TITLES:
    if (keyCode == 83) { 
      gamestate = PLAYGAME;
    }; // 83 = S key
    if (keyCode == 73) { 
      gamestate = INSTRUCTIONS;
    }; // 73 = I key
    break;
  case INSTRUCTIONS:
    if (keyPressed == true) { 
      initgame();
    };
    break;
  case PLAYGAME:
    if (keyCode == 65) { 
      attack("a");
    }; // 65 = A key
    if (keyCode == 77) { 
      attack("m");
    }; // 77 = M key
    break;
  case ATTACK:
    if (keyCode == 32) { 
      baddieattack();
    }; // 32 = SPACE
    break;
  case BADDIEATTACK:
    if (keyCode == 32) { 
      if (hp == 0) { 
        gamestate = LOSEGAME; 
        break;
      }
      if (hebedead ==2) { 
        gamestate = WINGAME;
      } 
      else { 
        gamestate = PLAYGAME;
      };
    } // 32 = SPACE
    break;
  case WINGAME:
    if (keyCode == 32) { 
      initgame();
    }; // 32 = SPACE
    break;
  case LOSEGAME:
    if (keyCode == 32) { 
      initgame();
    }; // 32 = SPACE
    break;
  }
}

void winning(){
    clearscreen();
    textAlign(CENTER);
    text("YOU WIN!", width/2, textline[1]);
    text("Yay!", width/2, textline[3]);
    text("(press space)", width/2, textline[5]);
}

void losing(){
    clearscreen();
    textAlign(CENTER);
    text("YOU'RE DEAD!", width/2, textline[1]);
    text("Rubbish!", width/2, textline[3]);
    text("(press space)", width/2, textline[5]);
}
void playrsg() {
  clearscreen();
  if (misterbaddieman[baddienumber] == 0) { 
    baddienumber++;
  };
  displayHUD();
}

void attacking() {
}

void attack(String attacktype) {
  gamestate = ATTACK;
  hebedead = 0;
  int baddiedamage = 0;
  int edam = 0; // Obligatory cheese reference
  String damagetext = "";

  // Normal Attack - damage 0 to 5, with 8/12/25 Super Attack chance
  if (attacktype == "a") {
    baddiedamage = int(random(6));
    damagetext = "ATTACK!";
    // Super Attack?
    if (baddiedamage == 0) {
      edam = int(random(5));
      if (edam == 0) { 
        baddiedamage = 25; 
        damagetext = "SUPERBESTATTACK!";
      };
      if (edam == 1) { 
        baddiedamage = 12; 
        damagetext = "SUPERATTACK!";
      };
      if (edam == 2) { 
        baddiedamage = 8; 
        damagetext = "SUPERATTACK!";
      };
      if (edam > 2) { 
        baddiedamage = 0;
      };
    }
  }

  // Magic Attack - damage 5 to 15  
  if (attacktype == "m") {
    damagetext = "MAGIC!";
    baddiedamage = int(random(11)+5);
    if (mp == 0) {
      damagetext = "NO MP!"; 
      baddiedamage = 0;
    }
    mp-- ;
    if (mp < 0) { 
      mp = 0;
    };
  }

  misterbaddieman[baddienumber] = misterbaddieman[baddienumber] - baddiedamage;
  if (misterbaddieman[baddienumber] < 0) {
    misterbaddieman[baddienumber] = 0;
  };

  clearscreen();

  textAlign(CENTER);
  text(damagetext, width/2, textline[1]);
  text("Damage: " + baddiedamage, width/2, textline[3]);
  text("(press space)", width/2, textline[5]);

  if (misterbaddieman[baddienumber] == 0) { 
    text("HE'S DEAD!!", width/2, textline[4]);
    baddienumber++;
    hebedead = 1;
    if (baddienumber == 20) {
      hebedead = 2;
    };
  }
}

void baddieattacking() {
}

void baddieattack() {
  gamestate = BADDIEATTACK;

  if (hebedead == 0) {  
    int damage = 0;
    damage=int(random(3+random(baddienumber/5)));   
    clearscreen();
    textAlign(CENTER);
    text("He attacks...", width/2, textline[1]);
    text("Damage: " + damage, width/2, textline[3]);
    text("(press space)", width/2, textline[5]);
    hp = hp - damage;
    if (hp < 0) { hp = 0 ;};
  }

  if (hebedead == 1) {
    clearscreen();
    textAlign(CENTER);
    text("Another assailant!", width/2, textline[1]);
    text("Misterbaddieman " + (baddienumber+1), width/2, textline[3]);
    text("(press space)", width/2, textline[5]);
  }
}


void displayHUD() {
  textAlign(LEFT);
  text("Misterbaddieman " + (baddienumber+1), 0, textline[0]);
  text("HIM: HP " + misterbaddieman[baddienumber], 0, textline[1]);
  text("YOU: HP " + hp + " MP " + mp, 0, textline[3]);
  text("(A)ttack or (M)agic?", 0, textline[5]);
}

void titlescreen() {
  clearscreen();
  textAlign(CENTER);
  text("R.S.G.", width/2, textline[1]);
  text("(c)2014 deKay", width/2, textline[2]);
  text("(S)tart or (I)nst", width/2, textline[4]);
}

void instructions(){
  clearscreen();
  textAlign(CENTER);
  text("R.S.G.", width/2, textline[0]);
  textAlign(LEFT);
  text("20 Misterbaddiemen", 0, textline[2]);
  text("must be fought with", 0, textline[3]);
  text("attacks or magic", 0, textline[4]);
  text("for no real reason!", 0, textline[5]);
}


