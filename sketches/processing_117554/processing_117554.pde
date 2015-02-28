
int myState = 1 ;
int myCounter = 5*60 ; //5 SECOND
color myColor = color(random(255),random(255),random(255));
 
void setup(){
  size(700,700);
  background(#FFFFFF);
  frameRate(200);
  myCounter = 2*3;
  stroke(255);
 
}
 
void draw(){
  switch (myState){
    case 1:
    fill(myColor);
    noStroke();
    rect(0,0,200, 200);
    myCounter--;
    if (myCounter < 0){
      myState++;
      myCounter =5*3;
      myColor =  color(random(255),random(255),random(255), random(5));
    }
    break;
     
    case 2:
    fill(myColor);
    noStroke();
    rect(500, 500, 200, 200);
    myCounter--;
    if(myCounter < 0) {
      myState++;
      myCounter=5*3;
      myColor =  color(random(255),random(255),random(255), random(5));
    }
    break;
    
    case 3:
    fill(myColor);
    noStroke();
    rect(320,500,200,200);
     myCounter--;
    if(myCounter < 0) {
      myState++;
      myCounter=20*1;
       myColor =  color(random(255),random(255),random(255), random(5));
    }
    break;
     
     case 4:
     fill(myColor);
    noStroke();
    rect(0,200,200,200);
     myCounter--;
    if(myCounter < 0) {
      myState++;
      myCounter=5*1;
      myColor =  color(random(255),random(255),random(255), random(5));
    }
    break;
     
    case 5:
    fill(myColor);
    noStroke();
    rect(120,500,200,200);
     myCounter--;
    if(myCounter < 0) {
      myState++;
      myCounter=5*3;
      myColor =  color(random(255),random(255),random(255), random(5));
   }
       break;
        
       case 6:
        fill(myColor);
        noStroke();
    rect(25,500,200,600);
     myCounter--;
    if(myCounter < 0) {
      myState++;
      myCounter=5*1;
      myColor =  color(random(255),random(255),random(255), random(5));
    }
    break;
     
    case 7:
        fill(myColor);
        noStroke();
    rect(0,500,25,680);
     myCounter--;
    if(myCounter < 0) {
      myState++;
      myCounter=5*1;
      myColor =  color(random(255),random(255),random(255), random(5));
    }
    break;
     
    case 8:
     fill(myColor);
    noStroke();
    rect(200,0,500,500);
     myCounter--;
    if(myCounter < 0) {
      myState++;
      myCounter=5*1;
      myColor =  color(random(255),random(255),random(255), random(5));
    }
    break;
    
   case 9:
    fill(myColor);
    noStroke();
    rect(460,0,262,262);
     myCounter--;
    if(myCounter < 0) {
      myState++;
      myCounter=5*1;
      myColor =  color(random(255),random(255),random(255), random(5));
    }
    break;
     
    case 10:
    fill(myColor);
    noStroke();
    rect(200,0,262,262);
     myCounter--;
    if(myCounter < 0) {
      myState++;
      myCounter=5*1;
      myColor =  color(random(255),random(255),random(255), random(5));
    }
    break;
     
    case 11:
    fill(myColor);
    noStroke();
    rect(200,262,258,240);
     myCounter--;
    if(myCounter < 0) {
      myState=1;
      myCounter=5*1;
      myColor =  color(random(255),random(255),random(255), random(5));
    }
    break;
     
    
  }
}
void mousePressed(){
  myState++;
  if (myState > 13){
    myState = 0;
  }
}



