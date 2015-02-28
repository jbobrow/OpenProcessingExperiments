
/*  
 celluar automata practice
 author:hsiu wen,ou
 reference:http://www.shiffman.net/teaching/nature/week7/
           http://www.openprocessing.org/visuals/?visualID=9816
 */
int cww=200 ; //mycell world width 
int cwh =200;  //mycell world height 
int mycell[][]; 
//int[][] mycell = new int[cww][cwh];
int cellsize=4;

void setup(){  
  size(300,300);
  mycell= new int[cww][cwh];//mycell is a reference to int[][] ;用new 來產生新物件 
  for(int i = 0; i< cww; i++){  //先找出mycell[i]，再找mycell[i]所指陣列物第[j]個元素
    for(int j = 0; j< cwh; j++){  
      mycell[i][j] = int(random(320))%4; //取餘數放入i和j  
    }   
  }
  frameRate(15);
}
void draw(){

  //loop the 2Darray of mycell
  for (int i = 0; i < cww;i++) {
    for (int j = 0; j < cwh;j++) {
      if ( mycell[i][j] == 1) {
        fill(255,150,random(50));
      } 
      else {
        fill(0);
      }
      rect(i*cellsize, j*cellsize, cellsize, cellsize);
    }
  }
  celllive();
}
void celllive(){
  //細胞遊戲的規則 for loop
  int[][] rule = new int[cww][cwh]; //利用new指令產生物件 
  for(int i = 0; i < cww; i++){   
    for(int j = 0; j < cwh; j++){  
      if(mycell[i][j] == 1 && neighbors(i,j) < 2){ //鄰居少於兩個,細胞就死 
        rule[i][j] = 0;  
      }  
      else if(mycell[i][j] == 1 && neighbors(i,j) > 3){  //鄰居大於三個,細胞死
        rule[i][j] = 0;  
      }  
      else if(mycell[i][j] == 0 && neighbors(i,j) == 3){  //細胞死後,鄰居超過三個細胞會復活
        rule[i][j] = 1;  
      }  
      else{  
        rule[i][j] = mycell[i][j];  
      }  
    }  
  }  

  for(int i = 0; i < cww; i++){  
    for(int j = 0; j < cwh; j++){  
      mycell[i][j] = rule[i][j];  
    }  
  }   
}  
int neighbors(int i,int j){
  int result=0;
  if(i>0&&j>0&& mycell[i-1][j-1]==1){//細胞八方關連的鄰居,左上1
    result=result+1;
  }
  if(j>0&& mycell[i][j-1]==1){//中上2
    result=result+1;
  }
  if(i< cww-1 &&j>0 && mycell[i+1][j-1]==1){// 右上3,cww寬邊緣-1,是由於數數是由0,1,2,3,4....邊緣是i-1;
    result=result+1;
  }
  if (i<cww-1 && mycell[i+1][j] == 1) {//右中4
    result = result + 1;
  }
  if (i< cww -1 && j< cwh-1 && mycell[i+1][j+1] == 1) {//右下5
    result = result + 1;
  }

  if(j< cwh-1 && mycell[i][j+1]==1){ //中下6
    result=result+1;
  }
  if(i>0 && j<cwh-1 && mycell[i-1][j+1] == 1){//左下7
    result=result+1;
  }
  if (i>0 && mycell[i-1][j] == 1) {//左中8
    result = result + 1;
  }
  return result;//遞迴
 
}



