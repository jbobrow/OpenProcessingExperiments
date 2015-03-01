
int x= 0;   
int look=1;                 //look=1 is nothing
                            //look=0 is left
                            //look=2 is right
int A=color (255,0,0);      //red
int B=color (255, 184, 71); //orange 




void setup(){
size(800, 200); //create the screen
noStroke();     //no outlines
smooth();       //make smooth geometry lines
}

void draw(){

  if(mouseX > 120 + x) { // if mouseX is greater than 120
look =2 ;                //move right
}
if(mouseX <120+ x) {     //if mouse is less than 120
look = 0;                //move left
} 
if(mouseX == 120 + x) {  //if mouseX is equal to 120
look = 1;                //stay put
}

//BODY
background (0);
fill(A);                   //red
rect(50+x, 70, 10, 90);    //Bar 1
rect(60+x, 40, 10, 130);   //bar 2
rect(70+x, 30, 10, 140);   //bar 3
rect(80+x, 20, 10, 140);   //bar 4
rect(90+x, 20, 10, 130);   //bar 5
rect(100+x, 10, 10, 150);  //bar 6
rect(110+x, 10,10, 160);   //bar 7
rect(120+x, 10,10, 160);   //bar 8
rect(130+x, 10, 10, 150);  //bar 9
rect(140+x, 20, 10, 130);  //bar 10
rect(150+x, 20, 10, 140);  //bar 11
rect(160+x, 30, 10, 140);  //bar 12
rect(170+x, 40, 10, 130);  //bar 13
rect(180+x, 70, 10, 90);   //bar 14


//EYES
fill(255);                          //white
rect(60+(look*10)+x, 50, 10, 30);   //bar 2+look*10
rect(70+(look*10)+x, 40,10, 50);    //bar 3+look*10
rect (80+(look*10)+x,40, 10, 50);   //bar 4+look*10
rect (90+(look*10)+x, 50, 10, 30);  //bar 5+look*10
rect(120+(look*10)+x,50,10,30);     //bar 8+look*10
rect(130+(look*10)+x, 40,10, 50);   //bar 9+look*10
rect (140+(look*10)+x,40, 10, 50);  //bar 10+look*10
rect (150+(look*10)+x, 50, 10, 30); //bar 11+look*10

//PUPILS
fill(10, 10, 100);                     //dark blue
rect (60+(look*20)+x,60, 10, 20);      //bar 2+look*20
rect (70+(look*20)+x,60,10,20);        //bar 3+look*20
rect (120+(look*20)+x,60,10,20);       //bar 8+look*20
rect (130+(look*20)+x,60,10,20);       //bar 9+look*20
x = x + look-1;                        
}


void mousePressed () {
if (A==color (255,0,0)) { //if red is the starting color
  A=color (255, 184,71);  //change to orange 
}else { 
  A=color(255,0,0);       //if it is orange, change to red
}
rect(50+x, 70, 10, 90);    //bar 1
rect(60+x, 40, 10, 130);   //bar 2
rect(70+x, 30, 10, 140);   //bar 3
rect(80+x, 20, 10, 140);   //bar 4
rect(90+x, 20, 10, 130);   //bar 5
rect(100+x, 10, 10, 150);  //bar 6
rect(110+x, 10,10, 160);   //bar 7
rect(120+x, 10,10, 160);   //bar 8
rect(130+x, 10, 10, 150);  //bar 9
rect(140+x, 20, 10, 130);  //bar 10
rect(150+x, 20, 10, 140);  //bar 11
rect(160+x, 30, 10, 140);  //bar 12
rect(170+x, 40, 10, 130);  //bar 13
rect(180+x, 70, 10, 90);   //bar 14

//EYES
fill(255);                          //white
rect(60+(look*10)+x, 50, 10, 30);   //bar 2+look*10
rect(70+(look*10)+x, 40,10, 50);    //bar 3+look*10
rect (80+(look*10)+x,40, 10, 50);   //bar 4+look*10
rect (90+(look*10)+x, 50, 10, 30);  //bar 5+look*10
rect(120+(look*10)+x,50,10,30);     //bar 8+look*10
rect(130+(look*10)+x, 40,10, 50);   //bar 9+look*10
rect (140+(look*10)+x,40, 10, 50);  //bar 10+look*10
rect (150+(look*10)+x, 50, 10, 30); //bar 11+look*10

//PUPILS
fill(10, 10, 100);                     //dark blue
rect (60+(look*20)+x,60, 10, 20);      //bar 2+look*20
rect (70+(look*20)+x,60,10,20);        //bar 3+look*20
rect (120+(look*20)+x,60,10,20);       //bar 8+look*20
rect (130+(look*20)+x,60,10,20);       //bar 9+look*20
}
