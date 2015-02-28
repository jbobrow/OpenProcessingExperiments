
int page = 1;
int starttime = 0;
float speed1 = 0.0;
float y;
PShape start;
PShape button1;
PShape button2;
PShape button3;
PShape button4;
PShape button5;
PShape button6;
PShape button7;
PShape buttoncry;
PShape speak;
PShape lady;
PShape tear;
PShape page2;
PShape page3;
PShape page4;
PShape page5;
PShape page6;
PShape page7;
PShape page8;
boolean cry = false;
boolean cry1 = false;

void setup() {
  size(640, 480);
  starttime = millis();
  start = loadShape("Game #1.svg");
  button1 = loadShape("button1.svg");
  button2 = loadShape("button2.svg");
  button3 = loadShape("button3.svg");
  button4 = loadShape("button4.svg");
  button5 = loadShape("button5.svg");
  button6 = loadShape("button6.svg");
  button7 = loadShape("button7.svg");
  buttoncry = loadShape("buttoncry.svg");
  speak = loadShape("speak.svg");
  lady = loadShape("Game #3.svg");
  tear = loadShape("Tear.svg");
  page2 = loadShape("page2.svg");
  page3 = loadShape("page3.svg");
  page4 = loadShape("page4.svg");
  page5 = loadShape("page5.svg");
  page6 = loadShape("page6.svg");
  page7 = loadShape("page7.svg");
  page8 = loadShape("page8.svg");
}

void draw(){
  background(255);
  smooth();
  if (page == 2){
    starttime = 0;
  }

  //page 1: 

  if (page == 1){
    cry = true;
    cry1 = false;
    shape(start, 0, 0);
     pushMatrix();
    if (millis() > starttime + 4000) {
      shape(button1, 0, 0);
    }
    if (millis() > starttime + 3000) {
      shape(lady, 0, 0);
    }
    float currentTime = second(); 

    if(cry) {
      speed1 = 8.7;
    }  
    else {
      speed1 = 2.5;
    } 
    y = y+speed1; 
    if (y>300) { 
      y = 0;  
    } 
    shape(tear, 48, y + 15); 
    popMatrix();
  }

  if ((keyPressed == true) && (key == 'h')){
    page = 2;
  }

  if ((keyPressed == true) && (key == 'c')){
    page = 3;
  }






  //Page 2
  if (page == 2){
    cry = false;
    shape(page2, 0, 0);
    shape(lady, 0, 0);
    shape(button2, 0, 0);
  }


if ((keyPressed == true) && (key == 'd')){
  page = 4;
}

if ((keyPressed == true) && (key == 'i')){
  page = 5;
  
}







  //Page 3

  if (page == 3){
    cry1 = true;
    shape(start, 0, 0); 
    shape(buttoncry, 0, 0);                                 //GAME OVER
  }
  if ((keyPressed == true) && (key == ' ')){
    page = 1;
  }
   if(cry1){
  float currentTime = second();    
    y = y+speed1; 
    if (y>300) { 
      y = 0;  
    } 
    shape(tear, 48, y + 15); 
    shape(tear, 120, y + 30); 
   }






  //Page 4

  if (page == 4){
    shape(page4, 0, 0);
    shape(page2, 0, 0);
    shape(button3, 0, 0);
  }
  if ((keyPressed == true) && (key == 'f')){
    page = 2;
  }

  if ((keyPressed == true) && (key == 'l')){
    page = 3;
  }




  //Page 5

  if (page == 5){
    shape(start, 0, 0);
    shape(lady, 0, 0);
    shape(button4, 0, 0);
    shape(speak, 0, 0);
  }
  if ((keyPressed == true) && (key == 'x')){
    page = 6;
  }

  if ((keyPressed == true) && (key == 's')){
    page = 3;
  }




  //Page 6

  if (page == 6){
    shape(page6, 0, 0);
    shape(button5, 0, 0);
  }
  if ((keyPressed == true) && (key == 'a')){
    page = 7;
  }

  if ((keyPressed == true) && (key == 'k')){
    page = 8;
  }



  //Page 7

  if (page == 7){
    shape(page7, 0, 0);
    shape(button7, 0, 0);
  }




  //Page 8

  if (page == 8){
    shape(page8, 0, 0);
    shape(button6, 0, 0);
  }
  if ((keyPressed == true) && (key == 't')){
    page = 6;
  }








  println (starttime);
}



