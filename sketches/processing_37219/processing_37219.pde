

class Enemy1{
 
  int HP;
  float x;
  float y;
  float addx;
  float addy;
  int count;
  
  Enemy1(int _HP){
    
    HP = _HP;

  }
  
  void disp(){

    fill(255);
    rect(x,y,x+30,y+30);
    rect(x,y-10,x+HP/(20/3)-3,y-15);   //HP bar
    
  }
  
  void update(){
    
    
    
    count++;
    
    if(count == 30){ 
    if(CrR(x,y) != 0 || CrB(x,y) != 0){

    if(CrR(x,y) == 1){
      addx = 0;
      addy = 1;
    }
    if(CrB(x,y) == 1){
      addx = 1;
      addy = 0;
    }
    if(CrB(x,y) == 1 && CrR(x,y) == 1){
      addx = 0;
      addy = 0;
    }
    
    }else{
          if(homex > x){        //home no ichi ni tikaduku
    addx = 1;
    }else if(homex < x){
      addx = -1;
    }else if(homex == x){
      addx = 0;
    }
  
    if(homey > y && CrR(x,y) == 0 ){      //home no ichi ni tikaduku
      addy = 1;
    }else if(homey < y){
      addy = -1;
    }else if(homey == y){
      addy = 0;
    }
    
    
  }
  
  count = 0;
 
    }
  
    x = x + addx;
    y = y + addy;
    
  }
  
  boolean die(){
    
    if(HP <= 0){
      return true;
    }else{
      return false;
    }
     
  }
  
  boolean finish(){
   if(homex == x && homey == y){
           return true;
    }else{
      return false;
    }
  }
}



