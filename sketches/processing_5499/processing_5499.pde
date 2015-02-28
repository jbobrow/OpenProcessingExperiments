

boolean[][] boxFill = new boolean[10][10];
int sqSz = 30;


void setup(){
  size(301,301);
  
}

void draw(){
 grid();
 }


void grid(){
  for(int i = 0; i < boxFill.length; i++){
    for(int j = 0; j < boxFill[i].length; j++){
    if(boxFill[i][j] == false){
      fill(255,200,0);
      rect(i*sqSz,j*sqSz,sqSz,sqSz);
    }else if(boxFill[i][j] == true){
      fill(100,10,255);
    rect(i*sqSz,j*sqSz,sqSz,sqSz);
    }
    }
  }
}
void mousePressed(){
  for(int i = 0; i < boxFill.length; i++){
    for(int j = 0; j < boxFill[i].length; j++){
    if((mouseX < i*sqSz+sqSz && mouseX > i*sqSz) && (mouseY < j*sqSz+sqSz && mouseY > j*sqSz)){
       boxFill[i][j] = !boxFill[i][j];
     }
   }
  }
 }





