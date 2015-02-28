
boolean levelonedrawn = false;//boolean variable
boolean leveltwodrawn = false;//boolean variable
boolean levelthreedrawn = false;//boolean variable
int counter1 = 0;//int variable
int counter2 = 0;//int variable
int counter3 = 0;//int variable
int time; // the timer
int wait = 30000; // the time limit
PImage baseIm; //the picture of the strat page
PImage third; //picture of the yellow square
PImage Thor; //picture of the grey square
PImage Start; //the srta page level 2 
PImage Info; //info
PImage Yellow; // the yellow dash picture
PImage neon; //the green dash picture
PImage Man; // the blue man
PImage circle; //the orange dot
PImage oj; //the yellow dot
PImage Leveltwo;//level two
PImage picture2; // picture 2
PImage Micky; //cloud image
PImage Sky; //sky image
PImage Grass;// grass image
PImage Cloud;//cloud image
PImage Cloud2;//cloud image 2
PImage Bonus;// last level
PImage Last; // The End



int currentPage = 0; // 0 means the start page
void setup(){ 
  time = millis();//store the current time
  size(800,600); // screen size
  baseIm=loadImage("App.jpg"); // load image
  third=loadImage("Third.png");// load image
  Thor=loadImage("Thor.png");// load image
  Start=loadImage("Start 1.png");// load image
  Info=loadImage("INFO.png");// load image
  Yellow=loadImage("yellow.png");// load image
  neon=loadImage("Green.png");// load image
  Man=loadImage("Man.png");// load image
  circle=loadImage("DOT.png");// load image
  oj=loadImage("Yellow dot.png");// load image
  Leveltwo=loadImage("Start.png"); //load image
  picture2=loadImage("AppPicture2.png"); //load image
  Micky=loadImage("Micky Mouse.png"); //load image
  Sky=loadImage("Sky.png"); //load image
  Grass=loadImage("Grass.png"); //load image
  Cloud=loadImage("Blue cloud.png"); //load image
  Cloud2=loadImage("Cloudtwo.png"); //load image
  Bonus=loadImage("Bonus Round.png"); //load image
  Last=loadImage("The End.png"); //load image
}
void draw(){
    if(millis() - time >= wait){ //time wait
      println("GAMEOVER");//if it is, do something
      time = millis();//also update the stored time
  }
  if(currentPage == 0){ //start page
    startbutton(); //start button
  }
  else if(currentPage == 1 && levelonedrawn==false){ //level 1
  Levelone(); //level 1 start page
  levelonedrawn = true;//to make it true
  }
  else if(currentPage == 8 && leveltwodrawn==false){ //start page for level 2
  Leveltwo(); //to load image
  leveltwodrawn = true;//to make it true
  }
 else if(currentPage == 15 && levelthreedrawn==false){
  Bonus();//bonus level
  levelthreedrawn = true;//to make it true
  }
 else if(currentPage == 23){//start page level 3
  Last();//last level
  }
}
void startbutton(){ 
  image(Start,10,1); //start page for level 1
}
void Levelone(){
  image(baseIm,0,0); //app picture
  image(third,163,325);// to show the yellow square
  image(Thor,17,383); //picture of the grey square
  image(Yellow,346,430); //the yellow dash picture 
  image(neon,381,429);//the green dash
  image(Man,640,410);//the blue man
  image(circle,35,554);//the orange dot
}
void Leveltwo(){
  image(Leveltwo,0,0); //to load image level 2
  image(picture2,0,0); //picture 2
  } 
 void Bonus(){
   image(Bonus,0,0);// to load an image
 }
 void Last(){
   image(Last,0,0);// to load a image
 }
  
void mousePressed(){
  if(currentPage == 0 && mouseX > 100 && mouseX < 600 && mouseY> 100 && mouseY < 400){// to click the play button
    currentPage = 1;//page 1
  }
  if(counter1==6){//the amount of different click
    currentPage=8;// to click each level
  }
  else if(currentPage == 1 && mouseX > 163 && mouseX < 219 && mouseY> 325 && mouseY < 351 ){//click difference
    //currentPage = currentPage + 1; //to add another page
    smooth();//smooth edges
    strokeWeight(8.0);//thickness of the rect
    strokeCap(ROUND);//Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();// it doesnt fill the rect
    rect(165,325,50,30);//rectangle
    counter1= counter1+1;//the player to click differnces
  }
  else if(currentPage == 1  && mouseX > 17 && mouseX < 70 && mouseY> 383 && mouseY < 406 ){//click difference
    //currentPage = currentPage + 1;//to add another page
    smooth();//smooth edges
    strokeWeight(8.0);//thickness of the rect
    strokeCap(ROUND);//Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();// it doesnt fill the rect
    rect(17,383,50,30);//rectangle
    counter1= counter1+1;// the player to click differnces
  }

  else if(currentPage == 1 && mouseX > 346 && mouseX < 383 && mouseY> 430 && mouseY < 470 ){//click difference
    //currentPage = currentPage + 1;//to add another page
    smooth();//smooth edges
    strokeWeight(8.0);//thickness of the rect
    strokeCap(ROUND);//Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();// it doesnt fill the rect
    rect(355,437,20,20);//rectangle
    counter1= counter1+1;//the player to click differnces
  }
  else if(currentPage == 1  && mouseX > 391 && mouseX < 448 && mouseY> 408 && mouseY < 451 ){//click difference
  //currentPage = currentPage + 1;//to add another page
    smooth();//smooth edges
    strokeWeight(8.0);//thickness of the rect
    strokeCap(ROUND);//Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();// it doesnt fill the rect
    rect(391,438,20,20);//rectangle
    counter1= counter1+1;//the player to click differnces
  }
  else if(currentPage == 1 && mouseX > 640 && mouseX < 749 && mouseY> 410 && mouseY < 526 ){//click difference
  //currentPage = currentPage + 1;//to add another page
    smooth();//smooth edges
    strokeWeight(8.0);//thickness of the rect
    strokeCap(ROUND);//Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();// it doesnt fill the rect
    rect(640,423,100,100);//rectangle
    counter1= counter1+1;//the player to click differnces
  }
  else if(currentPage == 1 && mouseX > 35 && mouseX < 107 && mouseY> 554 && mouseY < 600 ){//click difference
  //currentPage = currentPage + 1;//to add another page
    smooth();//smooth edges
    strokeWeight(8.0);//thickness of the rect
    strokeCap(ROUND);//Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();// it doesnt fill the rect
    rect(40,565,50,30);//rectangle
    counter1= counter1+1;//the player to click differnces
  }
     
  else if(currentPage == 1  && mouseX > 685 && mouseX < 759 && mouseY> 320 && mouseY < 366 ){//click difference
  //currentPage = currentPage + 1;//to add another page
    smooth();//smooth edges
    strokeWeight(8.0);//thickness of the rect
    strokeCap(ROUND);//Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();// it doesnt fill the rect
    rect(700,320,50,40);//rectangle
    counter1= counter1+1;//the player to click differnces
  }
  

  if(counter2==6){//the amount of different click
    currentPage=15;// to click each level
  }
  else if(currentPage == 8 && mouseX > 37 && mouseX < 148 && mouseY> 346 && mouseY < 396 ){//click difference
  //currentPage = currentPage + 1; //to add another page
    smooth();//smooth edges
    strokeWeight(8.0);//thickness of the rect
    strokeCap(ROUND);//Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();// it doesnt fill the rect
    rect(49,343,90,50);//rectangle
    counter2= counter2+1;////the player to click differnces
  }

    else if(currentPage == 8 && mouseX > 80 && mouseX < 136 && mouseY> 458 && mouseY < 482 ){//click difference
    //currentPage = currentPage + 1; //to add another page
    smooth();//smooth edges
    strokeWeight(8.0);//thickness of the rect
    strokeCap(ROUND);//Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();// it doesnt fill the rect
    rect(80,458,50,30);//rectangle
    counter2= counter2+1;//the player to click differnces
  }    
 
  else if(currentPage == 8 && mouseX > 19 && mouseX < 179 && mouseY> 565 && mouseY < 583 ){//click difference
    //currentPage = currentPage + 1; //to add another page
    smooth();//smooth edges
    strokeWeight(8.0);//thickness of the rect
    strokeCap(ROUND);//Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();// it doesnt fill the rect
    rect(19,565,150,20);//rectangle
    counter2= counter2+1;//the player to click differnces
  }
  else if(currentPage == 8 && mouseX > 382 && mouseX < 450 && mouseY> 380 && mouseY < 419 ){//click difference
    //currentPage = currentPage + 1; //to add another page
    smooth();//smooth edges
    strokeWeight(8.0);//thickness of the rect
    strokeCap(ROUND);//Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();// it doesnt fill the rect
    rect(382,380,70,40);                                                                                                                      //rectangle
    counter2= counter2+1;                                                                                                                    //the player to click differnces
  }  
  else if(currentPage == 8 && mouseX > 342 && mouseX < 361 && mouseY> 460 && mouseY < 472 ){                                                //click difference
    //currentPage = currentPage + 1;                                                                                                       //to add another page
    smooth();                                                                                                                                    //smooth edges
    strokeWeight(8.0);                                                                                                                        //thickness of the rect
    strokeCap(ROUND);                                                              //Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();                                                                                                                                    // it doesnt fill the rect
    rect(325,444,60,40);                                                                                                                      //rectangle
    counter2= counter2+1;                                                                                                                    //the player to click differnces
  }  
  
  else if(currentPage == 8 && mouseX > 553 && mouseX < 609 && mouseY> 348 && mouseY < 379 ){                                                      //click difference
    //currentPage = currentPage + 1;                                                                                                             //to add another page
    smooth();                                                                                                                                    //smooth edges
    strokeWeight(8.0);                                                                                                                          //thickness of the rect
    strokeCap(ROUND);                                                              //Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();                                                                                                                                    // it doesnt fill the rect
    rect(553,348,50,20);                                                                                                                            //rectangle
    counter2= counter2+1;                                                                                                                        //the player to click differnces
  } 
  
  else if(currentPage == 8 && mouseX > 642 && mouseX < 677 && mouseY> 467 && mouseY < 486 ){                                                    //click difference
    //currentPage = currentPage + 1;                                                                                                           //to add another page
    smooth();                                                                                                                                  //smooth edges
    strokeWeight(8.0);                                                                                                                        //thickness of the rect
    strokeCap(ROUND);                                                              //Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();                                                                                                                                  // it doesnt fill the rect
    rect(642,472,30,20);                                                                                                                          //rectangle
    counter2= counter2+1;                                                                                                                     //the player to click differnces
  } 
  
   //else if(currentPage == 15 || currentPage == 15 && mouseX > 642 && mouseX < 677 && mouseY> 467 && mouseY < 486 ){                          //click difference
    //currentPage = currentPage + 1;                                                                                                           //to add another page
  //}
  
  if(counter3==7){                                                                                                                          //the amount of different click
    currentPage=23;                                                                                                                            // to click each level
  } 
   else if(currentPage == 15 && mouseX > 414 && mouseX < 571 && mouseY> 75 && mouseY < 141 ){                                              //click difference
   //currentPage = currentPage + 1;                                                                                                       //to add another page 
    smooth();                                                                                                                              //smooth edges
    strokeWeight(8.0);                                                                                                                      //thickness of the rect
    strokeCap(ROUND);                                                              //Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();                                                                                                                            // it doesnt fill the rect
    rect(414,70,150,50);                                                                                                                    //rectangle
    counter3 = counter3+1;                                                                                                              //the player to click differnces
  }
  
   else if(currentPage == 15  && mouseX > 414 && mouseX < 564 && mouseY> 75 && mouseY < 133 ){                                            //click difference
   //currentPage = currentPage + 1;                                                                                                         //to add another page 
    smooth();                                                                                                                            //smooth edges
    strokeWeight(8.0);                                                                                                                    //thickness of the rect
    strokeCap(ROUND);                                                            //Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();                                                                                                                        // it doesnt fill the rect
    rect(414,70,150,50);                                                                                                              //rectangle
    counter3 = counter3+1;                                                                                                          //the player to click differnces
  }
   
   else if(currentPage == 15  && mouseX > 409 && mouseX < 484 && mouseY> 235 && mouseY < 378 ){                                        //click difference
   //currentPage = currentPage + 1;                                                                                                   //to add another page    
    smooth();                                                                                                                          //smooth edges
    strokeWeight(8.0);                                                                                                                  //thickness of the rect
    strokeCap(ROUND);                                                              //Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();                                                                                                                         // it doesnt fill the rect
    rect(409,235,80,100);                                                                                                            //rectangle
   counter3 = counter3+1;                                                                                                            //the player to click differnces
  }
  
   else if(currentPage == 15  && mouseX > 485 && mouseX < 560 && mouseY> 235 && mouseY < 378 ){                                        //click difference
   //currentPage = currentPage + 1;                                                                                                     //to add another page    
    smooth();                                                                                                                           //smooth edges
    strokeWeight(8.0);                                                                                                                  //thickness of the rect
    strokeCap(ROUND);                                                            //Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();                                                                                                                          // it doesnt fill the rect
    rect(475,235,80,100);                                                                                                              //rectangle
   counter3 = counter3+1;                                                                                                             //the player to click differnces
  }
  
   else if(currentPage == 15  && mouseX > 555 && mouseX < 630 && mouseY> 235 && mouseY < 378 ){                                        //click difference
   ///currentPage = currentPage + 1;                                                                                                   //to add another page    
    smooth();                                                                                                                            //smooth edges
    strokeWeight(8.0);                                                                                                                 //thickness of the rect
    strokeCap(ROUND);                                                             //Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();                                                                                                                           // it doesnt fill the rect
    rect(555,235,80,100);                                                                                                               //rectangle
   counter3 = counter3+1;                                                                                                               //the player to click differnces
  }
  
   else if(currentPage == 15  && mouseX > 615 && mouseX < 690 && mouseY> 235 && mouseY < 378 ){                                        //click difference
   //currentPage = currentPage + 1;                                                                                                   //to add another page    
    smooth();                                                                                                                         //smooth edges
    strokeWeight(8.0);                                                                                                               //thickness of the rect
    strokeCap(ROUND);                                                             //Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();                                                                                                                       // it doesnt fill the rect
    rect(615,235,80,100);                                                                                                          //rectangle
   counter3 = counter3+1;                                                                                                         //the player to click differnces
  } 
  
   else if(currentPage == 15  && mouseX > 418 && mouseX < 551 && mouseY> 463 && mouseY < 522 ){                                  //click difference
   //currentPage = currentPage + 1;                                                                                             //to add another page    
    smooth();                                                                                                                  //smooth edges
    strokeWeight(8.0);                                                                                                         //thickness of the rect
    strokeCap(ROUND);                                                             //Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();                                                                                                                 // it doesnt fill the rect
    rect(418,463,150,50);                                                                                                    //rectangle
   counter3 = counter3+1;                                                                                                   //the player to click differnces
  }
  
   else if(currentPage == 15  && mouseX > 735 && mouseX < 781 && mouseY> 27 && mouseY < 65 ){                               //click difference
   //currentPage = currentPage + 1;                                                                                         //to add another page    
    smooth();                                                                                                               //smooth edges
    strokeWeight(8.0);                                                                                                      //thickness of the rect
    strokeCap(ROUND);                                                              //Sets the style for rendering line endings. These ends are either squared, extended, or rounded 
    noFill();                                                                                                              // it doesnt fill the rect
    rect(735,27,50,50);                                                                                                    //rectangle
   counter3 = counter3+1;                                                                                                  //the player to click differnces
  } 
 
  else if(currentPage == 23  && mouseX > 735 && mouseX < 781 && mouseY> 27 && mouseY < 65 ){                              //click difference
   currentPage = currentPage + 1;                                                                                         //to add another page 
  }
}

