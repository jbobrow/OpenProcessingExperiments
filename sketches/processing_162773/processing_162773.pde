
void setup(){
  size(500,500);
  background(255);
}

void draw(){
  stroke(0);
   rect(100,100,300,500);
   int x = 150;
   int y = 150;
   
   while(y < height){
     drawWindow(x,y);
     drawWindow(x+100,y);
     drawWindow(x+200,y);
     y = y + 130;
   }
     
   
 
}
void drawWindow( int x, int y ){
  fill(random(255),random(255));
  rect(x,y,40,40);
  rect(x-40,y-40,40,40);
  rect(x-40,y,40,40);
  rect(x, y-40,40,40);
}
 
