
int x=0;
int y=0;
int z=50;
int a=100;

void setup(){
  size (500,500);
  background (255);
  
  }
  void draw(){
   
  for (int i=0; i<10; i++){
    fill(255,237,36);
    stroke(66,116,13);
    strokeWeight (5);
    rect(x,y,50,50);
    fill(245,178,7);
    rect(x,y,40,40);
    fill(255,237,36);
    rect(x,y,30,30);
    fill(245,178,7);
    rect(x,y,20,20);
     fill(255,237,36);
    rect(x,y,10,10);
    line(x,y,x+500,y+500);
    x=x+50;
    y=y;
   
   if (x>499){
   
   y=y+1;
   x=0;}
       
}


  }


  
