
int x;
int y=1;
float c;
int g;
int a;
int s;
float r;
float p;

void setup(){
 size(501, 500);
 background(0);
 smooth();
 frameRate(2500);
  
    
}
void draw(){
  fill(r, 0, g, a);
  noStroke();
  rect(x, y, s, s);
  s=25; 
  
  {c = random(0, 3);
  if (c<=2){
    g=150;
  }
  if (c<=1){
    g=75;
  }
  if (c>2){
    g=225;
  }
  
    p=random(0, 5); 
    
    //if(y>=250){
     if (p<=1){
       r=20;}
     else {r=0;}
     }
  //} 
  x=x+s;
  
  
    
 if (x>=500){
   y=y+s;
   x=x-520-s;
 }
 a=(80*x)/y;
}

