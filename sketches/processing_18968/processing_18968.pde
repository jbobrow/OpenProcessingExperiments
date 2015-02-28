
void setup(){
  size(300,300);
}

int x=0;
int y=100;

void draw(){
  if(x<=100){
      fill(0,225,0);
      ellipse(width/2,height/2,x,x);
    }
     if(x>100){
        fill(225,0,0);
        ellipse(width/2,height/2,width*100/x,height*100/x);
    }
      if(x==150){
        x--;
    }
     fill(193,135,179);
     if(y<200){
        ellipse(y+100,200-y,50,75);
      }else{
        ellipse(300-y,y-15,50,75);
    } 
     if(y==300){
        y--;
     } 
    
  x++;
  y++;  
}





  

