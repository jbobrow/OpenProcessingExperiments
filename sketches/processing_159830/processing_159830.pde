
int move;
int move2;
int coler;
int coler2;
int coler3;

void setup(){
  size(500, 500);
}

void draw(){

  
  
stroke(3);
coler = coler + 30;
coler2 = coler2 + 40;
coler3 = coler3 + 50;
move = move + 15;
move2 = move2 + 15;
fill(coler, coler2, coler3);
rect(move, move2, move2, move);

if(move >= 225){
  move = 0;
}
  
if(move2 >= 225){
  move2 = 0;
}  

if(coler >= 255){
  coler = 0;
}
if(coler2 >= 255){
  coler2 = 0;
}
if(coler3 >= 255){
  coler3 = 0;
}


}
