


// all of the statements below call the other classes and make then into a variable
Map maps;
Arena arena;
Arena2 arena2;
Arena3 arena3;
Arena4 arena4;        
Arena5 arena5;
Arena6 arena6;
Arena7 arena7;
Arena8 arena8;
Beginning beginning;
Badges badge;

// all of the Integers below are the different states or sections of the game 
int state;
final int stateB = 0;
final int stateM = 1;
final int stateA = 2;
final int stateA1 = 3;
final int stateA2 = 4;
final int stateA3 = 5;
final int stateA4 = 6;
final int stateA5 = 7;
final int stateA6 = 8;
final int stateA7 = 9;


void setup() {

  size(800, 600);

  // This section of code calls the variables above and adds the value from the class its assigned
  arena = new Arena();
  arena2 = new Arena2();
  arena3 = new Arena3();
  arena4 = new Arena4();
  arena5 = new Arena5();
  arena6 = new Arena6();
  arena7 = new Arena7();
  arena8 = new Arena8();

  maps = new Map(); // adds the Map class to the variable maps
  badge = new Badges(); // adds the Badges class to the variable badge
  beginning = new Beginning(); // adds the Beginning class to the variable Beginning

    state = stateB; // initializes the first state so it starts at the beginning screen
}


void draw() {


  // The code below makes the variable state turn into stateB which is the beginning state and if the enter button is pressed it changes into the Map state(stateM)
  if ( state == stateB) {
    beginning.display();
    if (keyCode == ENTER) {
      state = stateM;
    }
  }
  // The code below assigns the stateM int to the state variable and adds the mousepressed function that is defined at the bottom of the code
  if (state == stateM) {
    maps.display();

    mousePressed();
  }
  // this code and all the ones below all assign the state variable a different Arena or stateA - stateA7 which allowed us to create a bunch of different levels and fights
  if ( state == stateA) {
    arena.fight();

    // if one of the pokemons health goes down to 0 send the game back to the map
    if (arena.health1 <= 0 || arena.health2 <= 0) 
      state = stateM;
  }
  // this assigns the stateA1 variable or the second fight on the map to the state variable 
  if (state == stateA1) {
    arena2.fight();

    // if one of the pokemons health goes down to 0 send the game back to the map
    if (arena2.health1 <= 0 || arena2.health2 <= 0)
      state = stateM;
  }
  // this assigns the stateA2 variable or the third fight on the map to the state variable 
  if ( state == stateA2) {
    arena3.fight();

    // if one of the pokemons health goes down to 0 send the game back to the map
    if (arena3.health1 <= 0 || arena3.health2 <= 0)
      state = stateM;
  }
  // this assigns the stateA3 variable or the forth fight on the map to the state variable 
  if ( state == stateA3) {
    arena4.fight();

    // if one of the pokemons health goes down to 0 send the game back to the map
    if (arena4.health1 <= 0 || arena4.health2 <= 0) 
      state = stateM;
  }
  // this assigns the stateA4 variable or the fifth fight on the map to the state variable
  if (state == stateA4) {
    arena5.fight();

    // if one of the pokemons health goes down to 0 send the game back to the map
    if (arena5.health1 <= 0 || arena5.health2 <= 0)
      state = stateM;
  }
  // this assigns the stateA6 variable or the sixth fight on the map to the state variable
  if (state == stateA5) {
    arena6.fight();

    // if one of the pokemons health goes down to 0 send the game back to the map
    if (arena6.health1 <= 0 || arena6.health2 <= 0)
      state = stateM;
  }
  // this assigns the stateA6 variable or the seventh fight on the map to the state variable
  if (state == stateA6) {
    arena7.fight();

    // if one of the pokemons health goes down to 0 send the game back to the map
    if (arena7.health1 <= 0 || arena7.health2 <= 0)
      state = stateM;
  }
  // this assigns the stateA7 variable or the eighth fight on the map to the state variable
  if (state == stateA7) {
    arena8.fight();

    // if one of the pokemons health goes down to 0 send the game back to the map
    if (arena8.health1 <= 0 || arena8.health2 <= 0)
      state = stateM;
  }
}





void mousePressed() { // creates the mousePressed function that is used in the Map state (stateM)

  // makes it so if the left mouse button is clicked within the first red square it turns the state variable in to the first Arena or stateA
  if (mouseButton == LEFT && (mouseX < maps.rectY/1.6 && mouseY > maps.rectX ) && (mouseY > maps.rectY && mouseX > maps.rectX)) { 
    state = stateA;
  }
  // makes it so if the left mouse button is clicked within the second red square it turns the state variable in to the second Arena or stateA1
  if (mouseButton == LEFT && (mouseX > maps.rectY1 +80 && mouseY < maps.rectX1 - maps.rectS ) && (mouseY > maps.rectY1 && mouseX < maps.rectX1 + maps.rectS)) { // arena 2 
    state = stateA1;
  }
  // makes it so if the left mouse button is clicked within the third red square it turns the state variable in to the third Arena or stateA2
  if (mouseButton == LEFT && (mouseX > maps.rectY2 + 280 && mouseY < maps.rectX2 - 250 ) && (mouseY > maps.rectY2 && mouseX < maps.rectX2 + maps.rectS)) { // arena 3 
    state = stateA2;
  }
  // makes it so if the left mouse button is clicked within the forth red square it turns the state variable in to the forth Arena or stateA3
  if (mouseButton == LEFT && (mouseX > maps.rectY3 + 70 && mouseY < maps.rectX3 - 25 ) && (mouseY > maps.rectY3 && mouseX < maps.rectX3 + maps.rectS)) { // arena 4 
    state = stateA3;
  }
  // makes it so if the left mouse button is clicked within the fifth red square it turns the state variable in to the fifth Arena or stateA4
  if (mouseButton == LEFT && (mouseX > maps.rectY4 * 4.8&& mouseY < maps.rectX4 / 3.8 ) && (mouseY > maps.rectY4 && mouseX < maps.rectX4 + maps.rectS)) { // arena 5 
    state = stateA4;
  }
  // makes it so if the left mouse button is clicked within the sixth red square it turns the state variable in to the sixth Arena or stateA5
  if (mouseButton == LEFT && (mouseX > maps.rectY5 + 430 && mouseY < maps.rectX5 / 10  ) && (mouseY > maps.rectY5 && mouseX < maps.rectX5 + maps.rectS)) { // arena 6
    state = stateA5;
  }
  // makes it so if the left mouse button is clicked within the seventh red square it turns the state variable in to the seventh Arena or stateA6
  if (mouseButton == LEFT && (mouseX < maps.rectY6 - 20 && mouseY > maps.rectX6 + 290  ) && (mouseY < maps.rectY6 + 45  && mouseX < maps.rectX6 + 60)) { // arena 7 
    state = stateA6;
  }
  // makes it so if the left mouse button is clicked within the eighth red square it turns the state variable in to the eighth Arena or stateA7
  if (mouseButton == LEFT && (mouseX < maps.rectY7 && mouseY < maps.rectX / 3 ) && (mouseY > maps.rectY7 && mouseX < maps.rectX7 + 60)) { // arena 8
    state = stateA7;
  }
}










class Arena { // creates the Arena class 

  // creates the PImage variables for the actual arena and the pokemon
  PImage Arena;
  PImage Charm;
  PImage Squi;

  Map maps; // adds the Map class to the arena class and assigns it a variable name called maps

    float attack1, attack2; // creates the variable that will hold the attack values 

  int health1, health2; // creates the integers that will hold the pokemons health



  boolean turn; // creates the switch for the turns 

  int heal; // creates the int for the heal command



  Arena() {
    maps = new Map(); // adds the Map class values to the maps variable

    turn = true; //sets the turn switch to true 

      health1 = 100; // sets the first pokemons health to 100
    health2 = 100;// sets the second pokemons health to 100
    heal = 10; // sets the heal command to 10



      // assigns the pictures to the PImage variable by using load image and adding the pictures to games folder
    Arena = loadImage("arena.png");
    Charm = loadImage("charmander.jpg");
    Squi = loadImage("squirtle.jpg");
  }



  void fight() { // basically this is the draw or display function of the arena class

    image(Arena, 0, 0); // displays the image thats been assigned to the PImage variable 

    // all of the statements below are just inputs from the functions that are created thoughout the class
    attack(); 
    Pokemon1();
    Pokemon2();


    Command1();
    Command2();

    keyPressed();

    Turn();
  }

  // this function describes the attacks that the pokemon can do 
  void attack() {

    attack1 = random(3, 10); // basically attack1 can do damage from (3 all the way to 10) and it's random every time 
    attack2 = random(0, 20);// this is a little more complex of an attack it ranges from 0 - 20 but only does one or the other

    // basically this says that if attack2 is 10 or less the attack equals 0
    if (attack2 <= 10) 
      attack2 = 0;

    // if the attack is more than 10 the attack equals 20
    if (attack2 > 10)
      attack2= 20;
  }

  void Pokemon1() { // this function places the enemy pokemon 

    image(Charm, width/1.7, height/16);// places and displays the PImage variable charm

    textSize(50); // increases the text size
    fill(0); // colors it black
    text(health1, width/14, height/5.5); // this displays the enemy pokemons health
  }

  void Pokemon2() { // this function places your pokemon 

    image(Squi, width/6, height/3); // this places and displays the PImage variable squi

    textSize(50); // increases the text size
    fill(0); // colors it black
    text(health2, width/1.7, height/1.8); // places and shows your pokemons health
  }


  void Command1() { // shows the commands for what your pokemon can do


    textSize(20); //sets the text size for the following text

    // the following text tells you what key to press to make your pokemon attack or heal 
    text("Choose What Your Pokemon Will Do:", width/20, height/1.3); 
    text("Press 1 to Attack", width/15, height/1.21);
    text("Press 2 for Special Attack", width/15, height/1.12);
    text("Press 3 to Heal", width/15, height/1.05);
  }

  void Command2() { // shows the commands for the enemy pokemon

    // the following text shows what key to press to make the enemy pokemon attack or heal 
    text("Choose What Your Enemy Will Do:", width/1.8, height/1.3);
    text("Press 7 to Attack", width/1.8, height/1.21);
    text("Press 8 for Special Attack", width/1.8, height/1.12);
    text("Press 9 to Heal", width/1.8, height/1.05);
  }

  void Turn() { //this basically shows you whose turn it is by displaying text

    textSize(30); // sets a text size 

    // if ( the keys 1 2 or 3 are pressed display the text enemy turn
    if (key == '1' || key == '2' || key == '3') {
      text("Enemys Turn", width/15, height/10); // places and displays the text for enemys turn
    }
    else {// if those keys arent pressed display the text below
      text( "Your Turn", width/1.65, height/1.54); // places and displays the text for your turn
    }
  }




  void keyPressed() { // this function assigns keys to the attacks that the pokemon will do 

    if (turn == true) { // makes it so you can only heal or attack once per turn 

      // if key 1 is pressed subtract the value of the attack from the enemy pokemons health
      if (key == '1') {
        arena.health1 = int(arena.health1 - arena.attack1);

        // sets the health to end at 0
        if (arena.health1 <= 0) {
          arena.health1 = 0;
        }
      }
      // if key 2 is pressed subtract the value of the attack from the enemy pokemons health
      if (key == '2') {
        arena.health1 = int(arena.health1 - arena.attack2);
        // sets the health to stop at 0
        if (arena.health1 < 0) {
          arena.health1 = 0;
        }
      }
      // if key 3 is pressed add the value of heal to your pokemons health
      if (key == '3') {
        arena.health2 = arena.health2 + arena.heal;
        // sets the limit of heal to 100
        if ( arena.health2 > 100)
          arena.health2 = 100;
      }
    }

    // this says that if those keys are pressed turn the boolean turn false so you cant do anything until the enemy pokemon attacks
    if (key == '1' || key == '2' || key == '3') {
      turn = false;
    }


    if (turn == false) { // this states to do the following if the switch turn equals false
      // if key 7 is pressed subtract the value of the attack from your pokemons health
      if (key == '7') {
        arena.health2 = int(arena.health2 - arena.attack1);

        if (arena.health2 <= 0) { // limits the health to stop at 0
          arena.health2 = 0;
        }
      }
      // if key 8 is pressed subtract the value of the attack from your pokemons health
      if (key == '8') {
        arena.health2 = int(arena.health2 - arena.attack2);

        if (arena.health2 < 0) { //limits the health to stop at 0
          arena.health2 = 0;
        }
      }
      // if key 9 is pressed add the value of heal to the enemy pokemons health
      if (key == '9') {
        arena.health1 = arena.health1 + arena.heal;

        if ( arena.health1 > 100)
          arena.health1 = 100;
      }

      // if the any of these keys are pressed turn the boolean true so your pokemon can attack again
      if (key == '7' || key =='8' || key == '9')
        turn = true;
    }
  }
}


class Arena2 {
  PImage Arena;
  PImage Cynda;
  PImage Geng;
  Map maps;
  float attack1;
  float attack2;

  int health1, health2;

  boolean turn;
  int heal;



  Arena2() {
    maps = new Map();
    turn = true;


    health1 = 100;
    health2 = 100;
    heal = 10;




    Arena = loadImage("arena.png");
    Cynda = loadImage("cyndaquil.jpg");
    Geng = loadImage("gengar.jpg");
  }



  void fight() {

    image(Arena, 0, 0);


    attack();
    Pokemon1();
    Pokemon2();


    Command1();
    Command2();

    Turn();

    keyPressed();
  }


  void attack() {
    attack1 = random(3, 10);
    attack2 = random(0, 20);
    if (attack2 <= 10)
      attack2 = 0;
    if (attack2 > 10)
      attack2= 20;
  }

  void Pokemon1() {
    image(Geng, width/1.7, height/16);
    textSize(50);
    fill(0);
    text(health1, width/14, height/5.5);
  }

  void Pokemon2() {

    image(Cynda, width/6, height/3);
    textSize(50);
    fill(0);
    text(health2, width/1.7, height/1.8);
  }


  void Command1() {


    textSize(20);
    text("Choose What Your Pokemon Will Do:", width/20, height/1.3);
    text("Press 1 to Attack", width/15, height/1.21);
    text("Press 2 for Special Attack", width/15, height/1.12);
    text("Press 3 to Heal", width/15, height/1.05);
  }

  void Command2() {

    text("Choose What Your Enemy Will Do:", width/1.8, height/1.3);
    text("Press 7 to Attack", width/1.8, height/1.21);
    text("Press 8 for Special Attack", width/1.8, height/1.12);
    text("Press 9 to Heal", width/1.8, height/1.05);
  }

  void Turn() {

    textSize(30);
    if (key == '1' || key == '2' || key == '3') {
      text("Enemys Turn", width/15, height/10);
    }
    else {
      text( "Your Turn", width/1.65, height/1.54);
    }
  }


  void keyPressed() {
    if (turn == true) {
      if (key == '1') {
        arena2.health1 = int(arena2.health1 - arena2.attack1);



        if (arena2.health1 <= 0) {
          arena2.health1 = 0;
        }
      }
      if (key == '2') {
        arena2.health1 = int(arena2.health1 - arena2.attack2);

        if (arena2.health1 < 0) {
          arena2.health1 = 0;
        }
      }


      if (key == '3') {
        arena2.health2 = arena2.health2 + arena2.heal;
        if ( arena2.health2 > 100)
          arena2.health2 = 100;
      }
    }


    if (key == '1' || key == '2' || key == '3') {
      turn = false;
    }


    if (turn == false) {
      if (key == '7') {
        arena2.health2 = int(arena2.health2 - arena2.attack1);

        if (arena2.health2 <= 0) {
          arena2.health2 = 0;
        }
      }
      if (key == '8') {
        arena2.health2 = int(arena2.health2 - arena2.attack2);

        if (arena2.health2 < 0) {
          arena2.health2 = 0;
        }
      }

      if (key == '9') {
        arena2.health1 = arena2.health1 + arena2.heal;

        if ( arena2.health1 > 100)
          arena2.health1 = 100;
      }
      if (key == '7' || key =='8' || key == '9')
        turn = true;
    }
  }
}

class Arena3 {
  PImage Arena;
  PImage Blast;
  PImage Venus;
  Map maps;
  float attack1;
  float attack2;

  int health1, health2;



  boolean turn;
  int heal;



  Arena3() {
    maps = new Map();
    turn = true;


    health1 = 100;
    health2 = 100;
    heal = 10;




    Arena = loadImage("arena.png");
    Venus = loadImage("venusaur.jpg");
    Blast = loadImage("blastoise.jpg");
  }



  void fight() {

    image(Arena, 0, 0);


    attack();
    Pokemon1();
    Pokemon2();


    Command1();
    Command2();

    Turn();

    keyPressed();
  }


  void attack() {
    attack1 = random(3, 10);
    attack2 = random(0, 20);
    if (attack2 <= 10)
      attack2 = 0;
    if (attack2 > 10)
      attack2= 20;
  }

  void Pokemon1() {
    image(Venus, width/1.7, height/16);
    textSize(50);
    fill(0);
    text(health1, width/14, height/5.5);
  }

  void Pokemon2() {

    image(Blast, width/6, height/3);
    textSize(50);
    fill(0);
    text(health2, width/1.7, height/1.8);
  }


  void Command1() {


    textSize(20);
    text("Choose What Your Pokemon Will Do:", width/20, height/1.3);
    text("Press 1 to Attack", width/15, height/1.21);
    text("Press 2 for Special Attack", width/15, height/1.12);
    text("Press 3 to Heal", width/15, height/1.05);
  }

  void Command2() {

    text("Choose What Your Enemy Will Do:", width/1.8, height/1.3);
    text("Press 7 to Attack", width/1.8, height/1.21);
    text("Press 8 for Special Attack", width/1.8, height/1.12);
    text("Press 9 to Heal", width/1.8, height/1.05);
  }

  void Turn() {

    textSize(30);
    if (key == '1' || key == '2' || key == '3') {
      text("Enemys Turn", width/15, height/10);
    }
    else {
      text( "Your Turn", width/1.65, height/1.54);
    }
  }

  void keyPressed() {
    if (turn == true) {
      if (key == '1') {
        arena3.health1 = int(arena3.health1 - arena3.attack1);



        if (arena3.health1 <= 0) {
          arena3.health1 = 0;
        }
      }
      if (key == '2') {
        arena3.health1 = int(arena3.health1 - arena3.attack2);

        if (arena3.health1 < 0) {
          arena3.health1 = 0;
        }
      }


      if (key == '3') {
        arena3.health2 = arena3.health2 + arena3.heal;
        if ( arena3.health2 > 100)
          arena3.health2 = 100;
      }
    }


    if (key == '1' || key == '2' || key == '3') {
      turn = false;
    }


    if (turn == false) {
      if (key == '7') {
        arena3.health2 = int(arena3.health2 - arena3.attack1);

        if (arena3.health2 <= 0) {
          arena3.health2 = 0;
        }
      }
      if (key == '8') {
        arena3.health2 = int(arena3.health2 - arena3.attack2);

        if (arena3.health2 < 0) {
          arena3.health2 = 0;
        }
      }

      if (key == '9') {
        arena3.health1 = arena3.health1 + arena3.heal;

        if ( arena3.health1 > 100)
          arena3.health1 = 100;
      }
      if (key == '7' || key =='8' || key == '9')
        turn = true;
    }
  }
}

class Arena4 {

  PImage Arena;
  PImage Pika;
  PImage Poli;

  Map maps;

  float attack1;
  float attack2;

  int health1, health2;

  boolean turn;
  int heal;



  Arena4() {
    maps = new Map();
    turn = true;


    health1 = 100;
    health2 = 100;
    heal = 10;



    Arena = loadImage("arena.png");
    Poli= loadImage("poliwag.jpg");
    Pika = loadImage("pikachu.jpg");
  }



  void fight() {

    image(Arena, 0, 0);


    attack();
    Pokemon1();
    Pokemon2();


    Command1();
    Command2();

    Turn();

    keyPressed();
  }


  void attack() {
    attack1 = random(3, 10);
    attack2 = random(0, 20);
    if (attack2 <= 10)
      attack2 = 0;
    if (attack2 > 10)
      attack2= 20;
  }

  void Pokemon1() {
    image(Poli, width/1.7, height/16);
    textSize(50);
    fill(0);
    text(health1, width/14, height/5.5);
  }

  void Pokemon2() {

    image(Pika, width/6, height/3);
    textSize(50);
    fill(0);
    text(health2, width/1.7, height/1.8);
  }


  void Command1() {


    textSize(20);
    text("Choose What Your Pokemon Will Do:", width/20, height/1.3);
    text("Press 1 to Attack", width/15, height/1.21);
    text("Press 2 for Special Attack", width/15, height/1.12);
    text("Press 3 to Heal", width/15, height/1.05);
  }

  void Command2() {

    text("Choose What Your Enemy Will Do:", width/1.8, height/1.3);
    text("Press 7 to Attack", width/1.8, height/1.21);
    text("Press 8 for Special Attack", width/1.8, height/1.12);
    text("Press 9 to Heal", width/1.8, height/1.05);
  }

  void Turn() {

    textSize(30);
    if (key == '1' || key == '2' || key == '3') {
      text("Enemys Turn", width/15, height/10);
    }
    else {
      text( "Your Turn", width/1.65, height/1.54);
    }
  }

  void keyPressed() {
    if (turn == true) {
      if (key == '1') {
        arena4.health1 = int(arena4.health1 - arena4.attack1);



        if (arena4.health1 <= 0) {
          arena4.health1 = 0;
        }
      }
      if (key == '2') {
        arena4.health1 = int(arena4.health1 - arena4.attack2);

        if (arena4.health1 < 0) {
          arena4.health1 = 0;
        }
      }


      if (key == '3') {
        arena4.health2 = arena4.health2 + arena4.heal;
        if ( arena4.health2 > 100)
          arena4.health2 = 100;
      }
    }


    if (key == '1' || key == '2' || key == '3') {
      turn = false;
    }


    if (turn == false) {
      if (key == '7') {
        arena4.health2 = int(arena4.health2 - arena4.attack1);

        if (arena4.health2 <= 0) {
          arena4.health2 = 0;
        }
      }
      if (key == '8') {
        arena4.health2 = int(arena4.health2 - arena4.attack2);

        if (arena4.health2 < 0) {
          arena4.health2 = 0;
        }
      }

      if (key == '9') {
        arena4.health1 = arena4.health1 + arena4.heal;

        if ( arena4.health1 > 100)
          arena4.health1 = 100;
      }
      if (key == '7' || key =='8' || key == '9')
        turn = true;
    }
  }
}

class Arena5 {
  PImage Arena;
  PImage Mew;
  PImage MewTwo;

  Map maps;

  float attack1;
  float attack2;
  int health1, health2;

  boolean turn;
  int heal;



  Arena5() {
    maps = new Map();



    health1 = 100;
    health2 = 100;
    heal = 10;

    turn = true;

    Arena = loadImage("arena.png");
    Mew = loadImage("mew.jpg");
    MewTwo = loadImage("mewtwo.jpg");
  }



  void fight() {

    image(Arena, 0, 0);


    attack();
    Pokemon1();
    Pokemon2();


    Command1();
    Command2();

    Turn();

    keyPressed();
  }


  void attack() {
    attack1 = random(3, 10);
    attack2 = random(0, 20);
    if (attack2 <= 10)
      attack2 = 0;
    if (attack2 > 10)
      attack2= 20;
  }

  void Pokemon1() {
    image(MewTwo, width/1.7, height/16);
    textSize(50);
    fill(0);
    text(health1, width/14, height/5.5);
  }

  void Pokemon2() {

    image(Mew, width/6, height/3);
    textSize(50);
    fill(0);
    text(health2, width/1.7, height/1.8);
  }


  void Command1() {


    textSize(20);
    text("Choose What Your Pokemon Will Do:", width/20, height/1.3);
    text("Press 1 to Attack", width/15, height/1.21);
    text("Press 2 for Special Attack", width/15, height/1.12);
    text("Press 3 to Heal", width/15, height/1.05);
  }

  void Command2() {

    text("Choose What Your Enemy Will Do:", width/1.8, height/1.3);
    text("Press 7 to Attack", width/1.8, height/1.21);
    text("Press 8 for Special Attack", width/1.8, height/1.12);
    text("Press 9 to Heal", width/1.8, height/1.05);
  }

  void Turn() {

    textSize(30);
    if (key == '1' || key == '2' || key == '3') {
      text("Enemys Turn", width/15, height/10);
    }
    else {
      text( "Your Turn", width/1.65, height/1.54);
    }
  }

  void keyPressed() {
    if (turn == true) {
      if (key == '1') {
        arena5.health1 = int(arena5.health1 - arena5.attack1);



        if (arena5.health1 <= 0) {
          arena5.health1 = 0;
        }
      }
      if (key == '2') {
        arena5.health1 = int(arena5.health1 - arena5.attack2);

        if (arena5.health1 < 0) {
          arena5.health1 = 0;
        }
      }


      if (key == '3') {
        arena5.health2 = arena5.health2 + arena5.heal;

        if ( arena5.health2 > 100)
          arena5.health2 = 100;
      }
    }


    if (key == '1' || key == '2' || key == '3') {
      turn = false;
    }


    if (turn == false) {
      if (key == '7') {
        arena5.health2 = int(arena5.health2 - arena5.attack1);

        if (arena5.health2 <= 0) {
          arena5.health2 = 0;
        }
      }
      if (key == '8') {
        arena5.health2 = int(arena5.health2 - arena5.attack2);

        if (arena5.health2 < 0) {
          arena5.health2 = 0;
        }
      }

      if (key == '9') {
        arena5.health1 = arena5.health1 + arena5.heal;

        if ( arena5.health1 > 100)
          arena5.health1 = 100;
      }
      if (key == '7' || key =='8' || key == '9')
        turn = true;
    }
  }
}

class Arena6 {

  PImage Arena;
  PImage Mach;
  PImage Hit;

  Map maps;

  float attack1;
  float attack2;

  int health1, health2;


  boolean turn;

  int heal;



  Arena6() {
    maps = new Map();

    health1 = 100;
    health2 = 100;
    heal = 10;

    turn = true;

    Arena = loadImage("arena.png");
    Hit = loadImage("hitmonchan.jpg");
    Mach = loadImage("machoke.jpg");
  }



  void fight() {

    image(Arena, 0, 0);


    attack();
    Pokemon1();
    Pokemon2();


    Command1();
    Command2();

    Turn();

    keyPressed();
  }


  void attack() {
    attack1 = random(3, 10);
    attack2 = random(0, 20);
    if (attack2 <= 10)
      attack2 = 0;
    if (attack2 > 10)
      attack2= 20;
  }

  void Pokemon1() {
    image(Hit, width/1.7, height/16);
    textSize(50);
    fill(0);
    text(health1, width/14, height/5.5);
  }

  void Pokemon2() {

    image(Mach, width/6, height/3);
    textSize(50);
    fill(0);
    text(health2, width/1.7, height/1.8);
  }


  void Command1() {


    textSize(20);
    text("Choose What Your Pokemon Will Do:", width/20, height/1.3);
    text("Press 1 to Attack", width/15, height/1.21);
    text("Press 2 for Special Attack", width/15, height/1.12);
    text("Press 3 to Heal", width/15, height/1.05);
  }

  void Command2() {

    text("Choose What Your Enemy Will Do:", width/1.8, height/1.3);
    text("Press 7 to Attack", width/1.8, height/1.21);
    text("Press 8 for Special Attack", width/1.8, height/1.12);
    text("Press 9 to Heal", width/1.8, height/1.05);
  }

  void Turn() {

    textSize(30);
    if (key == '1' || key == '2' || key == '3') {
      text("Enemys Turn", width/15, height/10);
    }
    else {
      text( "Your Turn", width/1.65, height/1.54);
    }
  }

  void keyPressed() {
    if (turn == true) {
      if (key == '1') {
        arena6.health1 = int(arena6.health1 - arena6.attack1);



        if (arena6.health1 <= 0) {
          arena6.health1 = 0;
        }
      }
      if (key == '2') {
        arena6.health1 = int(arena6.health1 - arena6.attack2);

        if (arena6.health1 < 0) {
          arena6.health1 = 0;
        }
      }


      if (key == '3') {
        arena6.health2 = arena6.health2 + arena6.heal;
        if ( arena6.health2 > 100)
          arena6.health2 = 100;
      }
    }


    if (key == '1' || key == '2' || key == '3') {
      turn = false;
    }


    if (turn == false) {
      if (key == '7') {
        arena6.health2 = int(arena6.health2 - arena6.attack1);

        if (arena6.health2 <= 0) {
          arena6.health2 = 0;
        }
      }
      if (key == '8') {
        arena6.health2 = int(arena6.health2 - arena6.attack2);

        if (arena6.health2 < 0) {
          arena6.health2 = 0;
        }
      }

      if (key == '9') {
        arena6.health1 = arena6.health1 + arena6.heal;

        if ( arena6.health1 > 100)
          arena6.health1 = 100;
      }
      if (key == '7' || key =='8' || key == '9')
        turn = true;
    }
  }
}

class Arena7 {

  PImage Arena;
  PImage Lap;
  PImage Poli;

  Map maps;
  float attack1;
  float attack2;

  int health1, health2;

  boolean turn;
  int heal;



  Arena7() {
    maps = new Map();

    health1 = 100;
    health2 = 100;
    heal = 10;

    turn = true;

    Arena = loadImage("arena.png");
    Poli = loadImage("poliwrath.jpg");
    Lap = loadImage("lapras.jpg");
  }



  void fight() {

    image(Arena, 0, 0);


    attack();
    Pokemon1();
    Pokemon2();


    Command1();
    Command2();

    Turn();

    keyPressed();
  }



  void attack() {
    attack1 = random(3, 10);
    attack2 = random(0, 20);
    if (attack2 <= 10)
      attack2 = 0;
    if (attack2 > 10)
      attack2= 20;
  }

  void Pokemon1() {
    image(Poli, width/1.7, height/16);
    textSize(50);
    fill(0);
    text(health1, width/14, height/5.5);
  }

  void Pokemon2() {

    image(Lap, width/6, height/3);
    textSize(50);
    fill(0);
    text(health2, width/1.7, height/1.8);
  }


  void Command1() {


    textSize(20);
    text("Choose What Your Pokemon Will Do:", width/20, height/1.3);
    text("Press 1 to Attack", width/15, height/1.21);
    text("Press 2 for Special Attack", width/15, height/1.12);
    text("Press 3 to Heal", width/15, height/1.05);
  }

  void Command2() {

    text("Choose What Your Enemy Will Do:", width/1.8, height/1.3);
    text("Press 7 to Attack", width/1.8, height/1.21);
    text("Press 8 for Special Attack", width/1.8, height/1.12);
    text("Press 9 to Heal", width/1.8, height/1.05);
  }

  void Turn() {

    textSize(30);
    if (key == '1' || key == '2' || key == '3') {
      text("Enemys Turn", width/15, height/10);
    }
    else {
      text( "Your Turn", width/1.65, height/1.54);
    }
  }

  void keyPressed() {
    if (turn == true) {
      if (key == '1') {
        arena7.health1 = int(arena7.health1 - arena7.attack1);



        if (arena7.health1 <= 0) {
          arena7.health1 = 0;
        }
      }
      if (key == '2') {
        arena7.health1 = int(arena7.health1 - arena7.attack2);

        if (arena7.health1 < 0) {
          arena7.health1 = 0;
        }
      }


      if (key == '3') {
        arena7.health2 = arena7.health2 + arena7.heal;
        if ( arena7.health2 > 100)
          arena7.health2 = 100;
      }
    }


    if (key == '1' || key == '2' || key == '3') {
      turn = false;
    }


    if (turn == false) {
      if (key == '7') {
        arena7.health2 = int(arena7.health2 - arena7.attack1);

        if (arena7.health2 <= 0) {
          arena7.health2 = 0;
        }
      }
      if (key == '8') {
        arena7.health2 = int(arena7.health2 - arena7.attack2);

        if (arena7.health2 < 0) {
          arena7.health2 = 0;
        }
      }

      if (key == '9') {
        arena7.health1 = arena7.health1 + arena7.heal;

        if ( arena7.health1 > 100)
          arena7.health1 = 100;
      }
      if (key == '7' || key =='8' || key == '9')
        turn = true;
    }
  }
}

class Arena8 {

  PImage Arena;
  PImage Toto;
  PImage Bulb;

  Map maps;
  float attack1;
  float attack2;
  int health1, health2;

  boolean turn;
  int heal;



  Arena8() {
    maps = new Map();
    turn = true;


    health1 = 100;
    health2 = 100;
    heal = 10;


    Arena = loadImage("arena.png");
    Bulb = loadImage("bulbasaur.jpg");
    Toto = loadImage("totodile.jpg");
  }



  void fight() {

    image(Arena, 0, 0);


    attack();
    Pokemon1();
    Pokemon2();


    Command1();
    Command2();

    Turn();

    keyPressed();
  }


  void attack() {
    attack1 = random(3, 10);
    attack2 = random(0, 20);
    if (attack2 <= 10)
      attack2 = 0;
    if (attack2 > 10)
      attack2= 20;
  }

  void Pokemon1() {
    image(Bulb, width/1.7, height/16);
    textSize(50);
    fill(0);
    text(health1, width/14, height/5.5);
  }

  void Pokemon2() {

    image(Toto, width/6, height/3);
    textSize(50);
    fill(0);
    text(health2, width/1.7, height/1.8);
  }


  void Command1() {


    textSize(20);
    text("Choose What Your Pokemon Will Do:", width/20, height/1.3);
    text("Press 1 to Attack", width/15, height/1.21);
    text("Press 2 for Special Attack", width/15, height/1.12);
    text("Press 3 to Heal", width/15, height/1.05);
  }

  void Command2() {

    text("Choose What Your Enemy Will Do:", width/1.8, height/1.3);
    text("Press 7 to Attack", width/1.8, height/1.21);
    text("Press 8 for Special Attack", width/1.8, height/1.12);
    text("Press 9 to Heal", width/1.8, height/1.05);
  }

  void Turn() {

    textSize(30);
    if (key == '1' || key == '2' || key == '3') {
      text("Enemys Turn", width/15, height/10);
    }
    else {
      text( "Your Turn", width/1.65, height/1.54);
    }
  }

  void keyPressed() {
    if (turn == true) {
      if (key == '1') {
        arena8.health1 = int(arena8.health1 - arena8.attack1);



        if (arena8.health1 <= 0) {
          arena8.health1 = 0;
        }
      }
      if (key == '2') {
        arena8.health1 = int(arena8.health1 - arena8.attack2);

        if (arena8.health1 < 0) {
          arena8.health1 = 0;
        }
      }


      if (key == '3') {
        arena8.health2 = arena8.health2 + arena8.heal;
        if ( arena8.health2 > 100)
          arena8.health2 = 100;
      }
    }


    if (key == '1' || key == '2' || key == '3') {
      turn = false;
    }


    if (turn == false) {
      if (key == '7') {
        arena8.health2 = int(arena8.health2 - arena8.attack1);

        if (arena8.health2 <= 0) {
          arena8.health2 = 0;
        }
      }
      if (key == '8') {
        arena8.health2 = int(arena8.health2 - arena8.attack2);

        if (arena8.health2 < 0) {
          arena8.health2 = 0;
        }
      }

      if (key == '9') {
        arena8.health1 = arena8.health1 + arena8.heal;

        if ( arena8.health1 > 100)
          arena8.health1 = 100;
      }
      if (key == '7' || key =='8' || key == '9')
        turn = true;
    }
  }
}



PImage badge1, badge2, badge3, badge4, badge5, badge6, badge7, badge8; // creates the PImage variables for all the badges 

float x, y, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7; // creates all the x and y positions for all the badges 


class Badges { // creates the class called Badges 

    Badges() {  // creates the constructor which will define the variables 


      // all of the statements below load pictures from the folder of the program and assign them to the badge variables 
    badge1 = loadImage("Badge 1.png");
    badge2 = loadImage("badge2.png");
    badge3 = loadImage("badge 3.png");
    badge4 = loadImage("badge4.png");
    badge5 = loadImage("badge 5.png");
    badge6 = loadImage("badge6.png");
    badge7 = loadImage("Badge7.png");
    badge8 = loadImage("Badge8.png");

    // all of the x, y statements below place the badges around the map
    x = width/2.65;
    y = height/1.10;
    x1 = width/1.8;
    y1 = height/1.71;
    x2 = width/1.8;
    y2 = height/4;
    x3 = width/3.56;
    y3 = height/4;
    x4 = width/1.085;
    y4 = height/4;
    x5 = width/1.8;
    y5 = height - 600;
    x6 = width - 795;
    y6 = height/2;
    x7 = 0;
    y7 = height - 550;
  }

  void display() { // creates the display function for the first badge


    image(badge1, x, y); // displays and places the badge
  }

  void display1() { // creates the diplay function for the second badge

    image(badge2, x1, y1); // displays and places the badge
  }

  void display2() { // creates the display function for the third badge

    image(badge3, x2, y2); // displays and places the badge
  }

  void display3() { // creates the display function for the fourth badge

    image(badge4, x3, y3); // displays and places the badge
  }

  void display4() { // creates the display function for the fifth badge

    image(badge5, x4, y4); // displays and places the badge
  }

  void display5() { // creates the display function for the sixth badge

    image(badge6, x5, y5); // displays and places the badge
  }

  void display6() { // creates the display function for the seventh badge

    image(badge7, x6, y6); // displays and places the badge
  }

  void display7() { // creates the display function for the eighth badge

    image(badge8, x7, y7); // displays and places the badge
  }
}



class Beginning { // creates a class called Beginning





    void display() { //creates the display function

    background(0); // colors the background black
    textSize(40); //  increases text size

    // all the statements below just give instructions and information about the game to start the player off with some knowledge
    text("Welcome to the World of Pokemon!", width/12, height/6);

    textSize(20);
    text("There are many different Pokemon but you will only use a couple in this game", width/24, height/4);

    text("To choose a battle, click on the red squares", width/24, height/3.1);

    text("There will be 8 matches with different pokemon each time", width/24, height/2.5);

    text("Your goal is to win every battle working your way around the map", width/24, height/2.1);

    text("To make your Pokemon attack press 1 or 2. To heal, press 3", width/24, height/1.8);

    text("To make the Enemy Pokemon attack press 7 or 8. To heal, press 9", width/24, height/1.6);

    text("Special Attack will do either 0 or 20 damage! Use at your own risk!", width/24, height/1.45);

    textSize(30);
    text("Enjoy Your Time Here!", width/3.5, height/1.3);

    textSize(40);
    text("Press Enter To Start The Game", width/8, height/1.15);
  }
}


class Map { // creates the class Map

    // calls the class Badges and creates the variable badge
  Badges badge;

  float rectSize; // creates the variable for the rectangles size

    PImage Map; // uses the PImage function and creates the variable Map

    color redColor; // creates a color variable

  // the floats below are all creating x,y points for the rectangles or stages on the map
  float rectX, rectY, rectS;
  float rectX1, rectY1;
  float rectX2, rectY2;
  float rectX3, rectY3;
  float rectX4, rectY4;
  float rectX5, rectY5;
  float rectX6, rectY6;
  float rectX7, rectY7;


  Map() { // creates the constructor for the class


    badge = new Badges(); // adds the values of the class Badges to the variable badge

    redColor = color(200, 50, 50); // creates a red color variable


    // the following statements all give positions to the x and y variables.
    rectX = width/2.7;
    rectY = height/1.08;
    rectX1 = width/1.8;
    rectY1 = height/1.71;
    rectX2 = width/1.8;
    rectY2 = height/4;
    rectX3 = width/3.56;
    rectY3 = height/4;
    rectX4 = width/1.085;
    rectY4 = height/4;
    rectX5 = width/1.8;
    rectY5 = height - 600;
    rectX6 = width - 795;
    rectY6 = height/2;
    rectX7 = 0;
    rectY7 = height - 550;
    rectS = 60;

    // initializes the the Map variable and assigns it a value using loadImage
    Map = loadImage("map.gif");
  }

  void display() { // creates a basic draw function

    image(Map, 0, 0); // displays the Map variable

    fill(redColor); // fills the following rectangles with the redColor variable

    // the following statements creates the rectangles that act as stages on the map
    rect(rectX, rectY, rectS, rectS);
    rect(rectX1, rectY1, rectS, rectS/1.3);
    rect(rectX2, rectY2, rectS, rectS/1.3);
    rect(rectX3, rectY3, rectS, rectS/1.3);
    rect(rectX4, rectY4, rectS, rectS/1.3);
    rect(rectX5, rectY5, rectS, rectS/1.3);
    rect(rectX6, rectY6, rectS, rectS/1.3);
    rect(rectX7, rectY7, rectS, rectS/1.3);

    // this says that if your pokemon won the battle display the first badge that was created in the Badges class
    if ( arena.health1 <= 0) {
      badge.display();
    }
    // this says that if your pokemon won the battle display the second badge that was created in the Badges class
    if ( arena2.health1 <= 0) {
      badge.display1();
    }
    // this says that if your pokemon won the battle display the third badge that was created in the Badges class
    if ( arena3.health1 <= 0) {
      badge.display2();
    }
    // this says that if your pokemon won the battle display the fourth badge that was created in the Badges class
    if ( arena4.health1 <= 0) {
      badge.display3();
    }
    // this says that if your pokemon won the battle display the fifth badge that was created in the Badges class
    if ( arena5.health1 <= 0) {
      badge.display4();
    }
    // this says that if your pokemon won the battle display the sixth badge that was created in the Badges class
    if ( arena6.health1 <= 0) {
      badge.display5();
    }
    // this says that if your pokemon won the battle display the seventh badge that was created in the Badges class
    if ( arena7.health1 <= 0) {
      badge.display6();
    }
    // this says that if your pokemon won the battle display the eighth badge that was created in the Badges class
    if ( arena8.health1 <= 0) {
      badge.display7();
    }
  }
}



