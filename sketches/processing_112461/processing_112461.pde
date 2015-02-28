
int time=0;
int timePS;                      //variable used as time passed
int timeT=1000;                  //1000 =1sec
int i=0;                         //used as variable for background
boolean j=false;
void setup(){
size(600, 600);
background(0);
time=millis(); 
}
void draw() {
  int timePS = millis() - time;   // Timer starts when setup is called and here update its current time(time passed)
  if (timePS > timeT) {           //Condition for the timer and Background
    if( j==false && i<=255){      // boolean condition for the count up
    while(i<=255){                //count up and grey scale increases
    background(i);
    i=i+5;
    if (i>=255) {                 // switch of the boolean condition once the countUp gets to the final color
      j=true;}
       break;
    }
    }else if(j==true && i>=0){   // Condition for the count down
     while(j=true && i>0){       //Background count down
    background(i);
    i=i-5;
    break;
    }
    } else if(j==true && i==0) {  // Once the color gets to 0, we have to start counting up again
     j=false;
   } 
     time = millis();              // Timer update
  }
                                   //Call of all the functions
face();
eye1();
eye2();
edge1();
edge2();
smile();
fill(255,230,0, 100);
textSize(30);
text("Smile", 150, 600); 
}
                                      //These are all the functions to draw the smile
void face(){
  fill(255,200,0); 
  ellipse(300,300,450,450);
} 
void eye1(){
  fill(0);
  //rotate (radians (10));
  ellipse(200,200,15,100);
  //rotate (radians (80));
}
void eye2(){
  fill(0);
//  rotate (radians (10));
  ellipse(400,200,15,100);
}

void edge1(){
  fill(0);
  ellipse(150,395,10,50);
}
void edge2(){
  fill(0);
  ellipse(450,395, 10,50);
}
void blood(){
 fill(100,3,3);
 strokeWeight(0);
 arc(117, 200, 45, 30, 0, PI);
 strokeWeight(0);
}
void smile(){
  noFill();
  stroke(0);
  strokeWeight(10);
 arc(300, 400, 300, 150, 0, PI);
 strokeWeight(1);
}


