


boolean one;
void setup(){
  size(500,500);
  one=false;
  
}


void draw(){
  textSize(20);
  fill(0);
  if(one==false){
    
    text("Press 'P' to generate a new pattern",50,height/2);
  }
  
}

void keyPressed(){
  
  if(key == 'p'){
    one=true;
  background(255);
  
  fill(0);
  noStroke();
  
  
  for(int j = 0,k=0; j<50;j++){
    for(int i = 0,o=0;i<50;i++){
      float select = random(1,6);
      select = int(select);
      //println(select);
      
      if(select==1){
      triangle(0+o,0+k,10+o,0+k,0+o,10+k);
      } else if(select==2){
        
        triangle(10+o,10+k,10+o,0+k,0+o,10+k);
        
      } else if(select==3){
        
        triangle(10+o,0+k,0+o,0+k,10+o,10+k);
        
      } else if(select==4){
        
        triangle(0+o,10+k,0+o,0+k,10+o,10+k);
        
      } else if(select==5){
        
        rect(0+o,0+k,10,10);
        
      }
      
      
      o+=10;
    }
    k+=10;
  }
  }
}


