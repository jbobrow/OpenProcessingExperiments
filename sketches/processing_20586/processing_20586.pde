
int [] cp = { 50,100, 200, 270,400,130,220,280,300,330,340,500, 500,530, 570, 590};

int [] dp = {200,70,300, 350,218,50,230,490,540,135,590,595,50,70,80,150};

int x,y,a,b,c,d;

void setup(){
size(600,600);

}

void draw(){

 background(0);
  

  
  for( int i = 0; i < 16; i++)
  {

  ball(cp[i],dp[i]);
     dp[i]= (dp[i]-1)% height;
if (dp[i] < 0) dp[i]= height;

}



 y = (y+1) % height;
  if(y>620)  y=-20;
  
ometto( x, y);

b= (b+1)% width;
if(b>620)  b=width;

ometto2(a,b);


}



void ometto (int x, int y){ if(mousePressed) {
    stroke(255);
  } else {
    stroke(0);}


  strokeWeight (1);
smooth();
  y = (y+1) % height;
  if(y>620)  y=-20;
//  
//   y = (y+1) % height;
//  if(y<-40)  y=height;
  
line( x+width*.25, y+height*.23, x+width*.3, y+height*.26);
line( x+width*.1, y+height*.27, x+width*.2, y+height*.22);
fill(#23E8D9);
ellipse (x+width*.2,y+height*.2,50,70);
line(x+width*.2,y+height*.15,x+width*.2+20,y+height*.15);
strokeWeight(5);
point(x+width*.18,y+height*.2);
point(x+width*.22,y+height*.2);
strokeWeight(2);
fill(255);
ellipse(x+width*.17,y+height*.33,20,10);
ellipse(x+width*.23,y+height*.33,20,10);

noFill();

strokeWeight(1.5);
 arc(x+width*.2, y+height*.19, 40, 30, TWO_PI-PI/2, TWO_PI);
 
 
}

void ometto2 (int a, int b){

 if(mousePressed) {
    stroke(255);
  } else {
    stroke(0);}
  strokeWeight (1);
smooth();
  a = (a-1) % height;
  if(a<-120)  a=height;
//  
//   y = (y+1) % height;
//  if(y<-40)  y=height;
  
line( a+(300+width*.25), b+height*.23, a+(300+width*.3), b+height*.26);
line( a+(300+width*.1), b+height*.27, a+(300+width*.2), b+height*.22);
fill(#23E8D9);
ellipse (a+(300+width*.2),b+height*.2,50,70);
line(a+(300+width*.2),b+height*.15,a+(300+width*.2+20),b+height*.15);
strokeWeight(5);
point(a+(300+width*.18),b+height*.2);
point(a+(300+width*.22),b+height*.2);
strokeWeight(2);
fill(255);
ellipse(a+(300+width*.17),b+height*.33,20,10);
ellipse(a+(300+width*.23),b+height*.33,20,10);

noFill();

strokeWeight(1.5);
 arc(a+(300+width*.2), b+height*.19, 40, 30, TWO_PI-PI/2, TWO_PI);
 
 
}

void ball(int c, int d){
  noStroke();
c= (c+1)% height;
if (c > 600 ){c= height;}
  fill(255);
  ellipse (c,d, 10,10);
}

