
int a=0;
int b=0;
void setup(){
  size(500,500);
}
void draw(){
 background(255);
 drawbox1(0,-300);
 drawbox1(-275,150);
 drawbox1(275,150);
 ball1(a,b);
 if(b<375){
 b=b+1;
 }
 else if(mouseX>250){
   a=a+1;
 }
   else if(mouseX<250){
     a=a-1;
   }
}
  
  void drawbox1(float x, float y){
        fill(0);
    rect(x+0,y+0,500,400);

  }
 void ball1( int a, int b){
    fill(255,0,0);
     ellipse(a+250,500-b,50,50);
     
    
 }



