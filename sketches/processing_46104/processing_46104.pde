
int counter = 0;
String[] question = new String[7]; 
String[] answer = new String[2];
String[] artist = new String[9];
String[] filler = new String [2];
PFont Blackout;
int numberChange = 5; 


void setup() {
  size(600, 600);
  question[0] = "Can You Draw?";
  question[1] = "Can You Write?";
  question[2] = "Are You Funny?"; 
  question[3] = "Do You Like Eating?"; 
  question[4] = "Do You Own InDesign?"; 
  question[5] = "Do You Own Photoshop?"; 
  question[6] = "Do You Own Illustrator?";

  answer[0] = "YES";
  answer[1] = "NO";

  artist[0] = "Cartoonist!";
  artist[1] = "Journal Cartoonist";
  artist[2] = "Painter!"; 
  artist[3] = "Microsoft Painter!"; 
  artist[4] = "Photo Manipulator"; 
  artist[5] = "Typographer!"; 
  artist[6] = "Graphic Designer!";
  artist[7] = "Congrats! You are a";
  artist[8] = "Typographer!";
  
  filler [0] = "Are you sure?";

  fill (255);
  text("START", 100, 350);
  

  background (120);
  Blackout = loadFont("Blackout-2AM-48.vlw");
  smooth ();
   textSize (20);
    text ("RESTART", 500, 550);
}


void draw () {
  background (120);
  textFont(Blackout, 165);  
  if (counter == 0) {
    fill (255);
    text("START", 100, 350);
   
  } 
  
  if (counter == 5 || counter == -5) {
    fill (255);
    textSize(50);
    text (question[0], 120, 250); //can you draw?
    fill (0);
    textSize(80);
    text (answer[0], 130, 400);
    text (answer[1], 380, 400);
    numberChange = 100;
  }

  if (counter == -80 || counter == -20 || counter == -95 || counter ==-352) {
    fill (255);
    textSize(50);
    text (question[4], 60, 250); //indesign?
    fill (0);
    textSize(80);
    text (answer[0], 130, 400);
    text (answer[1], 380, 400);
      numberChange = 240;
  } 
  
  if (counter == 1 || counter == 95) {
    fill (255);
    textSize(50);
    text (question[1], 120, 250); //write?
    fill (0);
    textSize(80);
    text (answer[0], 130, 400);
    text (answer[1], 380, 400);
    numberChange = 200;
  }

 if (counter == 105) {
    fill (255);
    textSize(50);
    text (question[1], 120, 250); //write?
    fill (0);
    textSize(80);
    text (answer[0], 130, 400);
    text (answer[1], 380, 400);
    numberChange = 150;
  } 

  
   if (counter == -45 ||counter == -105) {
    fill (255);
    textSize(50);
    text (question[3], 75, 250); //food?
    fill (0);
    textSize(80);
    text (answer[0], 130, 400);
    text (answer[1], 380, 400);
      numberChange = 25;
  }
  
     if (counter == -130) {
    fill (255);
    textSize(70);
    text (filler[0], 75, 250); //are you sure?
    fill (0);
    textSize(80);
    text (answer[0], 130, 400);
    text (answer[1], 380, 400);
      numberChange = 222;
  }
  
  if (counter == 255 || counter == 295) {
    fill (255);
    textSize(50);
    text (question[2], 130, 250); //funny?
    fill (0);
    textSize(80);
    text (answer[0], 130, 400);
    text (answer[1], 380, 400);
     numberChange = 70;
  }
  
    if (counter == 145 || counter == 160 || counter== 220) { 
    fill (255);
    textSize(50);
    text (question[6], 10, 250); //illustrator?
    fill (0);
    textSize(80);
    text (answer[0], 130, 400);
    text (answer[1], 380, 400);
    numberChange = 63;
  } 
 
    if (counter == -335 || counter == -320||counter == -260 || counter == -592) { 
    fill (255);
    textSize(50);
    text (question[5], 25, 250); //photoshop?
    fill (0);
    textSize(80);
    text (answer[0], 130, 400);
    text (answer[1], 380, 400);
    numberChange = 31;
  } 
  
  
 
 if (counter ==157 || counter ==97 || counter ==82 || counter == 300) { //this is the result
    fill (255);
    textSize(55);
    text (artist[7], 40, 250); 
    textSize(93);
    text (artist[8], 40, 350); //typographer
  }

  
   if (counter == 325 || counter == 365) { //this is the result
   fill (255);
   textSize(55);
    text (artist[7], 40, 250);
    textSize(105);
    text (artist[0], 40, 350); //cartoonist
  }
  
     if (counter == 185 || counter == 225) { //this is the result
   fill (255);
   textSize(55);
    text (artist[7], 40, 250);
    textSize(60);
    text (artist[1], 40, 320); //journal cartoonist
  }
  
    if (counter == -70 || counter == 100) { //this is the result || counter == -130
   fill (255);
   textSize(55);
    text (artist[7], 40, 250);
    textSize(155);
    text (artist[2], 40, 400); //painter
    }
    
      if (counter == -304 || counter == -561 || counter ==-289 || counter == -112 || counter == -229 || counter ==-351) { //this is the result
   fill (255);
   textSize(55);
    text (artist[7], 40, 250);
    textSize(62);
    text (artist[4], 40, 330); //photo-manipulator
    }

    if (counter == 223 || counter == 400 || counter== 283 || counter== 208 ) { //this is the result
   fill (255);
   textSize(55);
    text (artist[7], 40, 250);
    textSize(70);
    text (artist[6], 40, 330); //graphic designer
    }
  
    if (counter == -366 || counter == -291 || counter == 92 || counter == -623 ) { //this is the result
   fill (255);
   textSize(55);
    text (artist[7], 40, 250);
    textSize(65);
    text (artist[3], 40, 330); //microsoft painter
    }
  
  textFont(Blackout, 40);
  fill (0);
  text("What Kind of Artist are You?", 20, 50); 
  //String header = "What Kind of Artist are You?";
  //text(header, 20, 30, 200, 500);
   textSize (20);
    text ("RESTART", 500, 550);
}

void mousePressed() {
//  if(counter >= -1) {
  
       if (mouseX>450) {
    if (mouseY>500) {
      counter= 5;
    }
  }
  else{
  if (mouseX<300) {
   if (mouseY<450) { //counter++;
    counter=counter+numberChange;
  } }
  else {
       if (mouseY<450) { 
    counter=counter - numberChange;
       }
        }
        
  } 

  println(counter);
}


