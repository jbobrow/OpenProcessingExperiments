
String ingredient[];
String technique[];
String adjective[];
String linker[];
String product[];
boolean[][] T;
int[] recipeRoute;
boolean keep_going = true;
int count = 1;

void setup() {
  PFont fontA;
// The font must be located in the sketch's 
// "data" directory to load successfully
fontA = loadFont("Ziggurat-HTF-Black-32.vlw");
textFont(fontA, 17);
  size(1000,200);
  fill(0);
  ingredient = loadStrings("ingredient.txt");
  technique = loadStrings("technique.txt");
  adjective = loadStrings("adjective.txt");
  linker = loadStrings("linker.txt");
  product = loadStrings("product.txt");
  T = new boolean[6][6];


  // initialise transition matrix
  for (int i = 0;i<T.length; i++) {
    for (int j = 1;j<T.length; j++) {
      T[i][j] = false;
    }
  }
  //set appropriate values to 1


  T[2][0] = true;
  T[3][0] = true;
  T[4][0] = true;
  T[5][0] = true;

//  T[0][1] = true;
  T[4][1] = true;
  T[5][1] = true;

  T[0][2] = true;
  T[1][2] = true;

  T[2][3] = true;
  T[3][3] = true;
  T[5][3] = true;

  T[2][4] = true;
  T[4][4] = true;
  T[5][4] = true;

  T[0][5] = true;
  T[1][5] = true;
}

void draw() {
  background(255);
  keep_going = true;
  recipeRoute = new int[20];
  recipeRoute[0] = 5;
  int count = 1;
  while (keep_going) {
    int state = recipeRoute[count-1];
    boolean[] next = T[state];
    int ranNum=0;
//    println(state);
//    println(next);
    boolean ok = true;
    while(ok){
      ranNum = int(random(-0.5,4.5));
      if (next[ranNum]) {
        ok = false;
      }
    }
    recipeRoute[count] = ranNum;
    if (next[5] & count>3){
      if (random(0,1)<0.1*(count+1)){
        keep_going = false;
      }
    }
    count++;
  }
  
  // use the recipeRoute to print a random recipe
  String[] Recipe = new String[count];
  for (int i=1;i<=count;i++){
    
    int choice;
    switch (recipeRoute[i]){
      case 0:
        choice = round(random(-0.5,ingredient.length-0.5));
        Recipe[i-1] = ingredient[choice];
        break;
      case 1:
        choice = round(random(-0.5,product.length-0.5));
        Recipe[i-1] = product[choice];
        break;
      case 2:
        choice = round(random(-0.5,linker.length-0.5));
        Recipe[i-1] = linker[choice];
        break;
      case 3:
        choice = round(random(-0.5,adjective.length-0.5));
        Recipe[i-1] = adjective[choice];
        break;
      case 4:
        choice = round(random(-0.5,technique.length-0.5));
        Recipe[i-1] = technique[choice];
        break;
    }
    
  }

//  println(join(Recipe," "));
  text(join(Recipe," "),50,50);
//  println(textWidth(join(Recipe," ")));
  noLoop();
}

void keyPressed(){
  loop();
}

