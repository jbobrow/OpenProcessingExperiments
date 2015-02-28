
int myState = 1 ;
int counter;

void setup(){
  size(500,500);
  frameRate(6);
  counter = 2*1;
  stroke(255);

}

void draw(){ 
  switch (myState){

    case 1: 
    fill(random(255),random(255), random(255));
    ellipse(0,5,100, 100);
    counter--;
    if (counter < 0){
      myState++;
      counter =5*3;
    }
    break;
    
    case 2:
    fill(random(50), random (50), random (50), random(50));
    ellipse(50, 0, 50, 50);
    counter--;
    if(counter < 0) {
      myState++;
      counter=5*3;
    }
    break;
    
     case 3:
     fill(random(250), random (250), random (250), random(250));
    ellipse(20,150,200,200);
     counter--;
    if(counter < 0) {
      myState++;
      counter=5*1;
    }
    break;
    
    case 4:
    fill(random(100), random (100), random (100), random(100));
    ellipse(150,30,150,150);
     counter--;
    if(counter < 0) {
      myState++;
      counter=5*3;
       }
       break;
       
       case 5:
        fill(random(200), random (200), random (200), random(200));
    ellipse(325,30,200,200);
     counter--;
    if(counter < 0) {
      myState++;
      counter=5*1;
    }
    break;
    
    case 6:
        fill(random(155), random (155), random (155), random(155));
    ellipse(205,180,180,180);
     counter--;
    if(counter < 0) {
      myState++;
      counter=5*1;
    }
    break;
    
    case 7:
    fill(random(255), random (255), random (255), random(255));
    ellipse(455,40,90,90);
     counter--;
    if(counter < 0) {
      myState++;
      counter=5*1;
    }
    break;
   
   case 8:
    fill(random(50), random (50), random (50), random(50));
    ellipse(360,200,200,200);
     counter--;
    if(counter < 0) {
      myState++;
      counter=5*1;
    }
    break;
    
    case 9:
    fill(random(200), random (200), random (200), random(200));
    ellipse(490,480,120,120);
     counter--;
    if(counter < 0) {
      myState++;
      counter=5*1;
    }
    break;
    
    case 10:
    fill(random(100), random (100), random (100), random(100));
    ellipse(400,380,200,200);
     counter--;
    if(counter < 0) {
      myState++;
      counter=5*1;
    }
    break;
    
    case 11:
    fill(random(50), random (50), random (50), random(50));
    ellipse(250,400,180,180);
     counter--;
    if(counter < 0) {
      myState++;
      counter=5*1;
    }
    break;
    
    case 12:
    fill(random(250), random (250), random (250), random(250));
    ellipse(100,360,240,240);
     counter--;
    if(counter < 0) {
      myState++;
      counter=5*1;
    }
    break;
    
    case 13:
    fill(random(100), random (100), random (100), random(100));
    ellipse(500,200,100,100);
     counter--;
    if(counter < 0) {
      myState++;
      counter=5*1;
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


