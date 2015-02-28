
//Ethan Cranston Per:4

//press space bar to stop the moveing rectangle

//the goal of the game is to stack the blocks as high as you can

int time;

 

//level 1

int move= 0;

int speed = 3;

int span = 300;

int stop;

int difference;

int dif;

int x;

 

//Level 2

int move2= 0;

int speed2 = 4;

int span2 = 300;

int stop2;

int difference2;

int dif2;

int high=0;

int y=0;

int x2;

 

//Level 3

int move3= 0;

int speed3 = 4;

int span3 = 300;

int stop3;

int difference3;

int dif3;

int high3=0;

int y3=0;

int x3;

 

//level 4

int move4= 0;

int speed4 = 5;

int span4 = 300;

int stop4;

int difference4;

int dif4;

int high4=0;

int y4=0;

int x4;

 

//level 5

int move5= 0;

int speed5 = 5;

int span5 = 300;

int stop5;

int difference5;

int dif5;

int high5=0;

int y5=0;

int x5;

 

//level 6

int move6= 0;

int speed6 = 6;

int span6 = 300;

int stop6;

int difference6;

int dif6;

int high6=0;

int y6=0;

int x6;

 

void setup()

{

  size(500, 480);

 

}

 

void draw()

{

 

  background (random(100,200), random(0,0), random(0,0));

  textSize(20);

  text(time, 475, 30, 50);

  fill(0, 102, 153, 51);

  fill (random(0,0), random(0,0), random(100,200));

rect (50,620,400,700);

 

//level 1

  rect(move, 540, span, 80);

 

  if( move >200){ speed = -3; }

    if( move< 0){speed = 3;}

  if(keyCode==' '){speed = 0;}

  move = move + speed;

difference=50-move;

dif=400-(move+250);

 

if(keyCode==' '){if(move<50) {span=span-difference;}}

if(keyCode==' '){if(move<50) {move=50;}}

 

if(keyCode==' '){if(move>150){span=span+dif;}}

if(keyCode==' '){if(move>150){move=150;}}

x=move+span;

 

//level 2\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

 

  span2=span-50;

  rect(move2, y, span2, high);

  if(time==1){y=460; high=80;}

 

  if(x2>499){ speed2 = -4; }

    if( move2< 0){speed2 = 4;}

  if(time==2){speed2 = 0;}

  move2 = move2 + speed2;

difference2=move-move2;

dif=x2-x;

 

if(time==2 && move2<move){span2=span2-difference2;}

if(time==2 && move2<move){move2=move;}

 

if(time==2 && x2>x){span2=span2-dif2;}

x2=move2+span2;

 

//level 3\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

 

  span3=span2-20;

  rect(move3, y3, span3, high3);

  if(time==2){y3=380; high3=80;}

 

  if(x3>499){ speed3 = -4; }

    if( move3< 0){speed3 = 4;}

  if(time==3){speed3 = 0;}

  move3 = move3 + speed3;

difference3=move2-move3;

dif=x3-x2;

 

if(time==3 && move3<move2){span3=span3-difference3;}

if(time==3 && move3<move2){move3=move2;}

 

if(time==3 && x3>x2){span3=span3-dif3;}

x3=move3+span3;

 

//level 4\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

 

  span4=span3-20;

  rect(move4, y4, span4, high4);

  if(time==3){y4=300; high4=80;}

 

  if(x4>499){ speed4 = -5; }

    if( move4< 0){speed4 = 5;}

  if(time==4){speed4 = 0;}

  move4 = move4 + speed4;

difference4=move3-move4;

dif=x4-x3;

 

if(time==4 && move4<move3){span4=span4-difference4;}

if(time==4 && move4<move3){move4move3;}

 

if(time==4 && x4>x3){span4=span4-dif4;}

x4=move4+span4;

 

 

//level 5\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

 

  span5=span4-20;

  rect(move5, y5, span5, high5);

  if(time==5){y5=220; high5=80;}

 

  if(x5>499){ speed5 = -5; }

    if( move5< 0){speed3 = 5;}

  if(time==5){speed5 = 0;}

  move5 = move5 + speed5;

difference5=move4-move5;

dif=x5-x4;

 

if(time==5 && move5<move4){span5=span5-difference5;}

if(time==5 && move5<move4){move5=move4;}

 

if(time==5 && x5>x4){span5=span5-dif5;}

x5=move5+span5;

 

 

//level 6\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

 

  span6=span5-20;

  rect(move6, y6, span6, high6);

  if(time==6){y6=380; high6=80;}

 

  if(x6>499){ speed6 = -6; }

    if( move6< 0){speed6 = 6;}

  if(time==6){speed6 = 0;}

  move6= move6 + speed6;

difference6=move5-move6;

dif=x6-x5;

 

if(time==6 && move6<move){span6=span6-difference6;}

if(time==6 && move6<move){move6=move5;}

 

if(time==6 && x6>x5){span6=span6-dif6;}

x6=move6+span6;

 

 

}

 

void keyPressed() {

  if (keyCode == ' ') { time++; } else { time = 0; }

}
