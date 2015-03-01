
//Sam Shlomo Spaeth - Lesson 2  NYU Intro to Interactive Datavis Spring 2015 //


int column1;
int column2;
int column3;
int amount;
int increment = 10;

void setup(){

  size(200,200);
  background(80,215,215);
  
    
 column1 = 2;
 column2 = 6;
 column3 = 10;
 
// average of columns 
println((column1 + column2 + column3)/3);

amount = ((column1 + column2 + column3)/3); 

}


void draw(){
  
drawLines(20+increment*8,20+increment*8,mouseX,mouseY);
drawDots1(180,20,10,10);
drawDots2(20,20,10,10);
drawDots3(100,100,10,10);

}
  

//diagnal left dots 
void drawDots1( int x , int y , int eH , int eW){
  strokeWeight(4);
  stroke(64,13,18);
  fill(255,0,0);
//   ellipse(x,y,eH,eW);
  for ( int i = 0 ; i <=80 ; i = i + 10 ){
   ellipse(x-i,y+i,eH,eW);
  }
}


//diagnal right dots 
void drawDots2( int x , int y , int eH , int eW){
  strokeWeight(4);
  stroke(64,13,18);
  fill(255,0,0);
  
  for ( int i = 0 ;  i <=80 ; i = i + 10){
   ellipse(x+i,y+i,eH,eW);
 
  }      
}

//bottom bar of dots
void drawDots3( int x , int y , int eH , int eW){
  strokeWeight(4);
  stroke(64,13,18);
  fill(255,0,0);
  
  for ( int i = 0 ; i <=90 ; i = i + 12){
   ellipse(x,y+i,eH,eW); 
  }
}




void drawLines( int x, int y, int xEnd, int yEnd){
  strokeWeight(2);
  frameRate(15);
  stroke(205,255,255);
  line(x,y, xEnd, yEnd);
   ellipse(xEnd,yEnd,10,10);
}
