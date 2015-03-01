

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
 
println((column1 + column2 + column3)/3);

amount = ((column1 + column2 + column3)/3); 

}


void draw(){
  
drawLines(20+increment*8,20+increment*8,mouseX,mouseY);
drawDots1(20,20,10,10);
drawDots2(180,20,10,10);
drawDots3(180,20,10,10);

}
  

//diagnal left dots 
void drawDots1( int x , int y , int eH , int eW){
  strokeWeight(4);
  stroke(64,13,18);
  fill(255,0,0);
  ellipse(x,y,eH,eW);
  ellipse(x+increment,y+increment,eH,eW);
  ellipse(x+increment*2,y+increment*2,eH,eW);
  ellipse(x+increment*3,y+increment*3,eH,eW);
   ellipse(x+increment*4,y+increment*4,eH,eW);
    ellipse(x+increment*5,y+increment*5,eH,eW);
     ellipse(x+increment*6,y+increment*6,eH,eW);
      ellipse(x+increment*7,y+increment*7,eH,eW);
       ellipse(x+increment*8,y+increment*8,eH,eW);
       
}


//diagnal right dots 
void drawDots2( int x , int y , int eH , int eW){
  strokeWeight(4);
  stroke(64,13,18);
  fill(255,0,0);
  ellipse(x,y,eH,eW);
  ellipse(x-increment,y+increment,eH,eW);
  ellipse(x-increment*2,y+increment*2,eH,eW);
  ellipse(x-increment*3,y+increment*3,eH,eW);
   ellipse(x-increment*4,y+increment*4,eH,eW);
    ellipse(x-increment*5,y+increment*5,eH,eW);
     ellipse(x-increment*6,y+increment*6,eH,eW);
      ellipse(x-increment*7,y+increment*7,eH,eW);
       ellipse(x-increment*8,y+increment*8,eH,eW);
       
}

//bottom bar of dots
void drawDots3( int x , int y , int eH , int eW){
  strokeWeight(4);
  stroke(64,13,18);
  fill(255,0,0);
  ellipse(x-increment*8,y+increment*8,eH,eW);
  ellipse(x-increment*8,y+increment*8+15,eH,eW);
  ellipse(x-increment*8,y+increment*8+2*15,eH,eW);   
  ellipse(x-increment*8,y+increment*8+3*15,eH,eW); 
  ellipse(x-increment*8,y+increment*8+4*15,eH,eW);  
  ellipse(x-increment*8,y+increment*8+5*15,eH,eW); 
}




void drawLines( int x, int y, int xEnd, int yEnd){
  strokeWeight(2);
  stroke(205,255,255);
  line(x,y, xEnd, yEnd);
   ellipse(xEnd,yEnd,10,10);
}
