
//Declaring Variables
PImage gamebase;
PImage homepage;
PImage about;
PImage End;
boolean aabout;
boolean homeimage;
boolean gameimage;
boolean play;
int k;
int lineslength;
boolean homeScreen;
boolean aboutScreen;
boolean gameScreen;
boolean endScreen;
int score = 0;

int num;
float a_x, a_y;
String a_name, a_bintype;
Recycleitem[] items = new Recycleitem[33];

String temp_bin;

void setup(){
  //Screen Size
  size (650,450);
  
  //load images
  about = loadImage("about.png");
  gamebase = loadImage("base.png");
  homepage = loadImage("home.png");
  End = loadImage("End.png");
  
  //Sets image truth values
  homeScreen = true;
  aboutScreen = false;
  gameScreen = false;
  endScreen = false;
  
  num = 0;
  
  //set objects in the array
  String b_name[] = loadStrings("Item.txt");
  String b_bintype[] = loadStrings("bin.txt");
  println(b_bintype[0]);
  //creates array of bins
  for (int i = 0; i < items.length; i++){
    a_name = b_name[i];
    a_x= 250;
    a_y= 250;
    a_bintype= b_bintype[i];
   items[i] = new Recycleitem(a_name, a_x,a_y, a_bintype);   
  }
  
  //
}



void draw(){
  //which page to display
  if(homeScreen == true)
  {
     home();
  }
  else if(aboutScreen == true){
    aboutme();
  }
  else if(gameScreen == true){
    playgame();
  }
  else if (endScreen == true){
   endgame();
  }


}

void aboutme(){
  image(about,0,0);
 // rect(533,356,80,40);// <--- shows clickable area

}

void endgame(){
  image(End,0,0);
  //to display the score at the end of the game
  textSize(35);
  text(score, 290,200);
}

void home(){  
   image(homepage,0,0);
   //resets score so can play another game from scratch
   score = 0;

}
  
void playgame(){
  //where the game part is ran

  //loads base graphic
  image(gamebase,0,0);
  if(num<33){
    items[num].display();
  }
  
  //loads end game page when array is finished
  if (num>32){
    endScreen = true;
    endgame();
  }  
}


void mousePressed(){
  //sets clickable areas so that you can navigate to the main page and so on
  if(homeScreen == true)
  {
     if (mouseX > 253 && mouseX < 363 && mouseY > 226 && mouseY < 296){ 
       homeScreen = false;
       aboutScreen = true;
      }
      if (mouseX > 253 && mouseX < 363 && mouseY > 136 && mouseY < 206){
      // Calls play function
        homeScreen = false;
        gameScreen = true;
      } 
  }
  
  if(aboutScreen == true){
    if (mouseX > 533 && mouseX < 643 && mouseY > 356 && mouseY < 416){
      aboutScreen = false;
     homeScreen = true; 
    
      //home();
    }
  }
  
  if(gameScreen == true){
    
    //to go back to main menu
    if (mouseX > 495 && mouseX < 650 && mouseY > 390 && mouseY < 440){
      gameScreen = false;
      homeScreen = true;
      endScreen = false;
      score = 0;
       num = 0;
     }
  }
      
    // click green bin
    if(mouseX > 20 && mouseX < 150 && mouseY > 270 && mouseY < 450 && endScreen == false){
      temp_bin = items[num].getBinType();
      if(temp_bin.equals("Green")){
        println("green bin correct");
        num++;
       score++;
        println(score);
      }
      else{
        num++;
        score--;
        println(score);
      }
      
    }
    
    // blue
   
     if(mouseX > 290 && mouseX < 415 && mouseY > 270 && mouseY < 450 && endScreen == false){
      temp_bin = items[num].getBinType();
      if(temp_bin.equals("Blue")){
        println("blue bin correct");
        num++;
       score++;
        println(score);
      }
      else{
        num++;
        score--;
        println(score);
      }
   }
      
    // brown
    if(mouseX > 160 && mouseX < 280 && mouseY > 270 && mouseY < 450 && endScreen == false){
      temp_bin = items[num].getBinType();
      if(temp_bin.equals("Brown")){
       println("brown bin correct");
        num++;
       score++;
       println(score);
      }
      else{
        num++;
        score--;
        println(score);
      }
    }
   
  
    // center
    if(mouseX > 375 && mouseX < 475 && mouseY > 185 && mouseY < 260 && endScreen == false){
      temp_bin = items[num].getBinType();
      if(temp_bin.equals("Centre")){
       println("centre bin correct");
        num++;
        score++;
        println(score);
      }
      else{
        num++;
        score--;
        println(score);
      }
   }
  
   //ables you to return to the main menu once the game has finished
   if(endScreen == true){
    gameScreen = false;
    num = 0;
    if (mouseX > 533 && mouseX < 643 && mouseY > 356 && mouseY < 416){
     endScreen = false;
     gameScreen = false;
     homeScreen = true; 

    }
  }
}




class Recycleitem{

  String name;
  float x;
  float y;
  String bintype;
  
  Recycleitem(String t_name, float t_x, float t_y, String t_bintype){
    name = t_name;
    x = t_x;
    y = t_y;
    bintype = t_bintype;
    
    println(bintype);
  }

  
  //displays the item and your score
void display(){
  if(gameScreen == true){
    textSize (30);
    text (name, 170, 170);
  
    text ("Score: ", 500, 380);
    text (score, 590,380);
  }
  
  //test on end screen
  if (endScreen == true){
    text ("Score: ", 500, 380);
  }
}

//returns the bin type so that each item can have a correct answer
String getBinType(){
 return bintype; 
}
}




