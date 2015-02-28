
void setup(){
  size(200,200);
  background(0);
}

int x;
int y;
  void draw(){
    for(int y=20;y<200;y=y+30){
       fill(y,0,60);
     rect(0,y,20,10);
     rect(40,y,20,10);
     rect(80,y,20,10);
     rect(120,y,20,10);
     rect(160,y,20,10);
     rect(200,y,20,10);
     
     
    }
 }
