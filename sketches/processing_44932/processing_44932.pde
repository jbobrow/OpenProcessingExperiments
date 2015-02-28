
String playerone;
String playertwo;
int timer;
int speed,weight;
int onex,oney,twox,twoy;
boolean onedeath,twodeath;
int[][]location;
int onescore;
int twoscore;

void setup() {
  rectMode(CORNERS);  
  size(600,600);
  background(0);
  PFont font;
font = loadFont("fonter.vlw"); 
textFont(font); 
  onescore = 0;
  twoscore = 0;
  onex = 200;
  oney = 304;
  twox = 400;
  twoy = 304; 
  weight = 8;
  playerone = "d";
  playertwo = "j";
  speed = 50; //its actually a delay, so reduce it to speed up etc...
  onedeath = false;
  twodeath = false;
  makearray();
  strokeWeight(weight + 5);  
  stroke(8,108,108);
  fill(0);
  rect(0,0,height,width);
  strokeWeight(1);
  stroke(0);

  println(location.length);
  println(location[1].length);
  println( width/weight);
  println(height/weight);

}


void draw() {
  
  playeronemover();
  playertwomover();
  walldeath();
  deathcheck();
  delayer();
  shiftcheck();
  drawer();
 
  checkarray();
}


void playeronemover() {
  if(playerone == "w")
  {
    oney = oney - weight;
  }
  else if(playerone == "a")
  {
    onex = onex - weight;
  }
  else if(playerone == "s")
  {
    oney = oney + weight;
  }
  else if(playerone == "d")
  {
    onex = onex + weight;
  }
}

void playertwomover() {
  if(playertwo == "i")
  {
    twoy = twoy - weight;
  }
  else if(playertwo == "j")
  {
    twox = twox - weight;
  }
  else if(playertwo == "k")
  {
    twoy = twoy + weight;
  }
  else if(playertwo == "l")
  {
    twox = twox + weight;
  }
}

void delayer() {
  delay(speed);
}

void walldeath() {
  if(onedeath == false) {
    //println("x");
    if((onex <= 0) || (onex >= width) || (oney <= 0) || (oney >= height))
    {
      println("1death haha");
      onedeath = true;
      twoscore ++;
      // noLoop();
      //probably stop the game, add score, delay, start again
    }
  }
  if(twodeath == false) {
    //println("x");
    if((twox <= 0) || (twox >= width) || (twoy <= 0) || (twoy >= height))
    {
      println("2death haha");
      twodeath = true;
      onescore ++;
      //probably stop the game, add score, delay, start again
      // noLoop();
    }
  }
}

void makearray() {

  //array(height, width);
  int cols = width/weight;
  int rows = height/weight;

  location = new int[cols][rows];

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      location[i][j] = 0;
    }
  }
}


void checkarray() {

  //x pos and y pos divided by weight, to get array coord...
  if((location [onex/weight][oney/weight] == 1)||(location [onex/weight][oney/weight] == 2)) {
    println("wooo onedied");
    //noLoop();
    onedeath = true;
    twoscore ++;
  }
  else {
    location [onex/weight][oney/weight] = 1;
  }   

  if((location [twox/weight][twoy/weight] == 1)||(location [twox/weight][twoy/weight] == 2)) {
    println("wooo twodied");
    //noLoop();
    twodeath = true;
    onescore ++;
  }
  else {
    location [twox/weight][twoy/weight] = 2;
  }
    }


void deathcheck() {
  if((onedeath == true)||(twodeath == true)) {
    //noLoop();
    scorer();
    reset();
  }
}

void reset() {

  delay(1000);
  background(0);
  makearray();
  onex = 200;
  oney = 304;
  twox = 400;
  twoy = 304;
  onedeath = false;
  twodeath = false; 
  playerone = "d";
  playertwo = "j";

  strokeWeight(weight + 5);
  stroke(8,108,108);
  fill(0);
  rect(0,0,height,width);
  strokeWeight(1);
  stroke(0);
  println("reset");
  delay(1000);
}

void drawer() {

  //array(height, width);
  int cols = width/weight;
  int rows = height/weight;

  // location = new int[cols][rows];

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      //location[i][j] = 0;
      // println(location);
      if(location[i][j] == 1) {
        rectMode(CORNERS);
        fill(0,255,0);
        rect(i*weight,j*weight,i*weight + weight, j*weight + weight);
      }
      else if(location[i][j] == 2) {
        rectMode(CORNERS);
        fill(255,0,0);
        rect(i*weight,j*weight,i*weight + weight, j*weight + weight);
      }
      else if(location[i][j] == 0) {
        rectMode(CORNERS);
        fill(0,0,0);
        rect(i*weight,j*weight,i*weight + weight, j*weight + weight);
      }
            else if(location[i][j] == 3) {
        rectMode(CORNERS);
        fill(128,128,128);
        rect(i*weight,j*weight,i*weight + weight, j*weight + weight);
      }
      //if((i == 0)||(j == 0)||(i == cols-1)||(j == rows-1)){
      //fill(128,128,128);
      //rect(i*weight,j*weight,i*weight + weight, j*weight + weight);
      }
    }
  }



void shiftcheck()
{
  //basically if both players are above the middle of the game it moves the board up, if they are to the left it mores it left, 
  //right to right etc.
  //array(height, width);
  int cols = width/weight;
  int rows = height/weight;
  int t;
  int[]locator, locator2, sider, sider2;
 
  locator = new int[rows+1];
  locator2 = new int[rows+1];
  sider = new int[cols+1];
  sider2 = new int[cols+1];
  
  // println(oney + "  " + twoy);
  if((oney <= height / 2) && (twoy <= height / 2) && (playerone == "w") &&(playertwo == "i")) {
   
    for (int k = 0; k < cols; k++) {     
      for (int l = 0; l < rows; l++) {
        // println(i);
        locator[l] = location[k][l];
      }
    arrayCopy(locator,0,locator2,1,cols);    
     for (int l = 1; l < rows-1; l++) {
        // println(i);
         location[k][l] = locator2[l];
      }   
  
}
}

if((oney >= height / 2) && (twoy >= height / 2) && (playerone == "s") &&(playertwo == "k")) {
   
    for (int k = 0; k < cols; k++) {     
      for (int l = 0; l < rows; l++) {
        // println(i);
        locator[l] = location[k][l];
      }
    arrayCopy(locator,1,locator2,0,cols);    
     for (int l = 1; l < rows-1; l++) {
        // println(i);
         location[k][l] = locator2[l];
      }   
  
}
}

if((onex >= width / 2) && (twox >= width / 2) && (playerone == "d") &&(playertwo == "l")) {
   
    for (int l = 0; l < rows; l++) {     
      for (int k = 0; k < cols; k++) {
        // println(i);
        sider[k] = location[k][l];
      }
    arrayCopy(sider,1,sider2,0,rows);    
     for (int k = 0; k < cols; k++) {
        // println(i);
         location[k][l] = sider2[k];
      }   
  
}
}
if((onex <= width / 2) && (twox <= width / 2) && (playerone == "a") &&(playertwo == "j")) {
   
    for (int l = 0; l < rows; l++) {     
      for (int k = 0; k < cols; k++) {
        // println(i);
        sider[k] = location[k][l];
      }
    arrayCopy(sider,0,sider2,1,rows);    
     for (int k = 0; k < cols; k++) {
        // println(i);
         location[k][l] = sider2[k];
      }   
  
}
}


}

void keyPressed (){
  loop();
  //player 1
  
if ((key == 'w' || key == 'W') && (playerone != "s")) {
    playerone = "w";
  }
else if ((key == 'a' || key == 'A') && (playerone != "d")) {
    playerone = "a";
  }
else if ((key == 's' || key == 'S')  && (playerone != "w")){
    playerone = "s";
  }
else if ((key == 'd' || key == 'D')  && (playerone != "a")){
    playerone = "d";
  }  
  
  //player 2
  
  
else if ((key == 'i' || key == 'I')  && (playertwo != "k")){
    playertwo = "i";
}
else if ((key == 'j' || key == 'J')  && (playertwo != "l")){
    playertwo = "j";
}    

else if ((key == 'k' || key == 'K')  && (playertwo != "i")){
    playertwo = "k";
}
else if ((key == 'l' || key == 'L') && (playertwo != "j")) {
    playertwo = "l";
}

}
//println ("!!!!!!!!!" + keyin);


void scorer(){
 println("the fucking scoreboard doesnt work.");
background(20); 
 fill(128);
 rect(0,0,width,height);
 text("!!!!!!!!!", 50,400,400,200);
}

