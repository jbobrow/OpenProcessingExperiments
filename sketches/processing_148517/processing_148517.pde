
int p1Lives=1;
int p2Lives=1;
int d=350;  //platform 2 location
int x = 450;  //starting ball location
int y = 400;  //starting ball location
boolean w = false;
boolean s = false;
boolean n = false;

void setup() {
  size(900,800);
  background(100);
  text(""+ p1Lives, 200 , 20);
  text(""+ p2Lives, 700 , 20);
  strokeWeight(4);
  line(450,0,450,900);
  //platform1();
 // platform2();
  //ball();
}
void draw(){
  background(100);
  text(""+ p1Lives, 200 , 20);
  text(""+ p2Lives, 700 , 20);
  strokeWeight(4);
  line(450,0,450,900);
  ball();
  platform1();
  platform2();
  GameCheck();
}
void GameCheck(){
  if(p1Lives == 0){
    text("player 2 wins", 415 , 450);
    x=450;
    y=400;
   
  }
  if(p2Lives == 0) {
    text("player 1 wins", 415 , 450);
    x=450;
    y=400;
    
  } 
}
 

void ball(){
  
  ellipse(x , y , 30,30);
  if(n==true){
    x = x + 5;
    y = y - 3;
  }
  if(x==0){
    p1Lives--;
    
    
  }
  if(x==900){
    p2Lives--;
   
  }
    
  
}  

void platform1(){
  rect(850,mouseY,20,130);
}

void platform2(){
  //int d = 350;
 rect(50,d,20,130);
 if(d <= 0){
   d=0;
 }
 if(d>= 670){
   d=670;
 }
  if( w==true){
    d=d-10;
  }
  if( s==true){
    d=d+10;
  }
}
void keyPressed() {
 if (key == 'W' || key == 'w'){
    w=true;
     //d=d+50;
  }
  if(key == 'S' || key == 's'){
    s=true;
    // d=d+50;
  }
  if(key == 'N' || key == 'n'){
    n=true;
  }
}
void keyReleased(){
  if(key == 'w' || key == 'W'){
    w=false;
  }
  if(key == 's' || key == 'S'){
   s=false;
  }
  if(key == 'N' || key == 'n'){
    //n=false;
  }
}
  

  
  

  
  
