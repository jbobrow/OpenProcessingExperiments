
int girl1 = 20;                                                        //naming the function of girl's x
int girl2 = 20;                                                        //naming the function of girl's y

void setup(){  
  size (600,600);                                                      //setting the size of the canvas
  background(0);                                                       //setting the background color to black
  noStroke();                                                          //turning off the outline of shapes
}

void draw(){    
  background(0);                                                       //keeping background the same as the girl moves
  float girla = constrain(girl1,20,450);                               //making the girl's x position stop
  float girlb = constrain(girl2,20,450);                               //making the girl's y position stop
  
//girl's body
  girl1 = girl1+1;                                                     //making girl's x move
  girl2 = girl2+3;                                                     //making girl's y move 
  fill(46,186,227);                                                    //setting girl's color to blue
  triangle(30+girla,80+girlb,60+girla,40+girlb,86+girla,75+girlb);     //girl's dress
  ellipse(57+girla,20+girlb,30,30);                                    //girl's head
  rect(45+girla,75+girlb,3,20);                                        //girl's left leg
  rect(65+girla,75+girlb,3,20);                                        //girl's right leg

//boys on repeat
  fill(200);                                                           //setting the color of the guys to grey
  boy(0,0);                                                            //guy #1
  boy(50,50);                                                          //guy #2
  boy(100,100);                                                        //guy #3
  boy(150,150);                                                        //guy #4
  boy(200,200);                                                        //guy #5
  boy(250,250);                                                        //guy #6
  fill(46,186,227);                                                    //setting the color of the last guy to blue
  boy(300,300);                                                        //guy #7
  

//heart
  fill(227,11,11);                                                     //setting color of heart
  ellipse(475, 340, 55, 50);                                           //left circular part of heart
  ellipse(425, 340, 55, 50);                                           //right citcular part of heart
  triangle(500,350,400,350,450,420);                                   //bottom of heart
}

//boy
void boy(int x, int y){                                                //function to draw 1 boy
  rect(200+x,40+y,40,50);                                              //boy's body
  ellipse(220+x,20+y,30,30);                                           //boy's head
  rect(210+x,90+y,3,20);                                               //boy's left leg
  rect(230+x,90+y,3,20);                                               //boy's right leg
}

