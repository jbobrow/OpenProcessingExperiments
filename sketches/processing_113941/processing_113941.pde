
float angle1,angle2;
int widthR,heightR;
int a;//layer2's color
int j;//layer3
float hue,s,b;//layer3
void setup(){
  angle1=0;
  angle2=0;
  size(1000,1000);
 smooth();
background(0);
// strokeCap(ROUND);
// strokeJoin(ROUND);
hue=360;
s=99;
b=255;
 
   
}
void draw(){
  println("x "+mouseX+" y "+mouseY);
   
  //background(0);
  fill(255);
  ellipse(width/2,height/2,650,650);
  fill(0);
  ellipse(width/2,height/2,620,620);
  fill(255);
  ellipse(width/2,height/2,600,600);
   
  //layer 3
  colorMode(HSB);
  
  pushMatrix();
  translate(width/2,height/2);
   
 for(int j=0;j<23;j+=1){
   for(int i=0;i<20;i+=1){
     rotate(PI/8+j*1);
   //  fill(random(255),random(255),random(255));
      fill(random(360),s,b);
     circle(0,400+j*10,10+j*2+mouseX/50,40);
   }
 }
  popMatrix(); 
//  if (mousePressed==true){
//    hue=random(360);
//    s=20;b=200;
//  }  
  //layer 2
  pushMatrix();
  translate(width/2,height/2);
  rotate(angle2);
  for(int j=0;j<6;j+=1){
  for(int i=0;i<28;i+=1){
 rotate(PI/12);
  noStroke();
   fill(a);
 quadA(0,90+j*50,10+j*5);
 //fill(255);
  //circle(0,-10-j*5,-(10+j*5)/2);
  }
  }
   popMatrix();
   angle2-=0.01;
    
   if(mouseX>width/2){
     a=255;
   }
   if(mouseX<=width/2){
     a=mouseX/2;
   }
    
  //layer 1
  pushMatrix();
  translate(width/2,height/2);//move (0,0) to the center of picture
 rotate(angle1);//rotate the whole shape
  stroke(0);
  for(int i=0;i<18;i+=1){
 rotate(PI/9);
   character(0,-mouseX/5,20,20);
  }
  popMatrix();
  angle1+=0.01;
 
  
 // noLoop();
}
 
 
//function1
//(x,y) is the center of the first box
void character(float x,float y,int widthR,int heightR){
  rectMode(CENTER);
  strokeWeight(5);
  noFill();
  //3 lines
  beginShape();
  vertex(0,0);
  vertex(x-widthR/2,y+dist(x,y,0,0)*2/3);
vertex(x+widthR/2,y+dist(x,y,0,0)/3);
vertex(x,y+heightR/2);
  endShape();
  //character
  rect(x,y,widthR,heightR);//the first box
  rect(x,y-heightR,widthR/8,heightR);//cross
  rect(x,y-heightR,widthR,heightR/8);
   noFill();
  rect(x,y-2*heightR,widthR,heightR);//the second box
 rect(x,y-heightR*20/7,widthR*5/6,heightR/8);//horizontal line
   rect(x,y-heightR*7/2,widthR,heightR/8);//cross
   rect(x,y-heightR*7/2,widthR/8,heightR);
   strokeWeight(20);
  rect(x,y-heightR*9/2,widthR*3,heightR/8);
   strokeWeight(10);
   line(x,y-heightR*7/2,x,-340);//vertical line
    }
    
  // function 2
   void quadA(int x,int y,int offset){
    
   
 quad(x,y,x+offset,y-offset,x,y-offset*2,x-offset, y-offset);
   
    
   //function 4
  // void circle(int x,int y,int widthC){
   //ellipise(x,y,widthC);
   }
 //function 3
 void circle(int x,int y,int r,int offset){
   
  ellipse( x,y,r,r);
  ellipse(x+offset,y+offset,r*2,r*3/2);
  ellipse(x-offset,y+offset,r*2,r*3/2);
   
 }

