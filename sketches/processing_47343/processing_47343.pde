
int counter = 0;
String[] question = new String[7];
String[] answer = new String[2];
String[] artist = new String[9];
String[] filler = new String [2];
int numberChange = 5;
PImage shokore;

  
 
void setup() {
  size(600, 395);
  question[0] = "Is he a Hiria?";
  question[1] = "Is he a Doutei?";
  question[2] = "Is he a Gagget OTAKU?";
  question[3] = "Does he Koreju?";
  question[4] = "Can he make a PV?";
  question[5] = "Will he repeat a year?";
  question[6] = "Is he loved?";
 
  answer[0] = "YES";
  answer[1] = "NO";
 
  artist[0] = "OK!He is ";
  artist[1] = "shokore!";
  artist[2] = "shokore?";
   
  //filler [0] = "Are you sure?";
 
  fill (0);
  text("START", 100, 350);

}
 
 
void draw () {
  //background (120);
  shokore = loadImage("shokore.jpeg");
  image(shokore, 0, 0); 
  textSize(20);
  fill (0);
  text("Think about shokore.", 380, 120);
  text("I will try to guess.", 380, 155);
  
  textSize(140); 
  if (counter == 0) {
    fill (0);
    text("START", 100, 360);
  }
   
  if (counter == 5 || counter == -5) {
    fill (200,0,0);
    textSize(50);
    text (question[0], 120, 280); //can you draw?
    answers();
    numberChange = 100;
  }
 
  if (counter == -80 || counter == -20 || counter == -95 || counter ==-352) {
     fill (200,0,0);
    textSize(50);
    text (question[4], 60, 280); //indesign?
    answers();
      numberChange = 240;
  }
   
  if (counter == 1 || counter == 95) {
     fill (200,0,0);
    textSize(50);
    text (question[1], 120, 280); //write?
    answers();
    numberChange = 200;
  }


 
 if (counter == 105) {
     fill (200,0,0);
    textSize(50);
    text (question[1], 120, 280); //write?
    answers();
    numberChange = 150;
  }
 
   
   if (counter == -45 ||counter == -105) {
    fill (200,0,0);
    textSize(50);
    text (question[3], 75, 280); //food?
    answers();
      numberChange = 25;
  }
   
     if (counter == -130) {
     fill (200,0,0);
    textSize(70);
    text (filler[0], 75, 280); //are you sure?
    answers();
      numberChange = 222;
  }
   
  if (counter == 255 || counter == 295) {
     fill (200,0,0);
    textSize(50);
    text (question[2], 20, 280); //funny?
    answers();
     numberChange = 70;
  }
   
    if (counter == 145 || counter == 160 || counter== 220) {
     fill (200,0,0);
    textSize(50);
    text (question[6], 200, 280); //illustrator?
    answers();
    numberChange = 63;
  }
  
    if (counter == -335 || counter == -320||counter == -260 || counter == -592) {
     fill (200,0,0);
    textSize(50);
    text (question[5], 25, 280); //photoshop?
   answers();
    numberChange = 31;
  }
   
   
  
 if (counter ==157 || counter ==97 || counter ==82 || counter == 300) { //this is the result
   results();
  }
 
   
   if (counter == 325 || counter == 365) { //this is the result
   results();
  }
   
     if (counter == 185 || counter == 225) { //this is the result
   results();
  }
   
    if (counter == -70 || counter == 100) { //this is the result || counter == -130
   results();
    }
     
      if (counter == -304 || counter == -561 || counter ==-289 || counter == -112 || counter == -229 || counter ==-351) { //this is the result
   results();
    }
 
    if (counter == 223 || counter == 400 || counter== 283 || counter== 208 ) { //this is the result
   results();
    }
   
    if (counter == -366 || counter == -291 || counter == 92 || counter == -623 ) { //this is the result
  results();
    }
  
  
  //String header = "What Kind of Artist are You?";
  //text(header, 20, 30, 200, 500);
  
}
 
void mousePressed() {
//  if(counter >= -1) {
   
       if (mouseX<100) {
    if (mouseY<100) {
      counter= 5;
    }
  }
  else{
  if (mouseX<300) {
   if (mouseY>300) { //counter++;
    counter=counter+numberChange;
  } }
  else {
       if (mouseY>300) {
    counter=counter - numberChange;
       }
        }
         
  }
 
  println(counter);
}

void answers(){
 fill (0);
    textSize(80);
    text (answer[0], 130, 370);
    text (answer[1], 380, 370);
    noStroke();
    fill(255);
    rect(380,100,205,67);
}

void results(){
    noStroke();
    fill(255);
    rect(380,100,205,67);
    textSize(20);
    fill (0);
    text("Ore Kayo....", 380, 120);
    fill (200,0,0);
    textSize(70);
    text (artist[0], 70, 290);
    textSize(105);
    text (artist[1], 70, 380);
      textSize (20);
    text ("RESTART", 0, 50);
}

