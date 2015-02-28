

PImage love;
PImage slove;
PImage filllove;

int numClick; 
int i = 0; 


void setup(){
  size(400,400);
  slove=loadImage("slove.png");
  love=loadImage("love.png");
  filllove=loadImage("filllove.png");



  
}

void draw(){
 imageMode(CORNER);
 image(love,0,0);
    
  
  if(numClick == 1){  
      
      if(i <=20){
        image(slove, 80+i, 80+i);
        i++;
      
      }
      else if(i>20){
        image(slove,100,100);
      }
  }
  
  if(numClick== 2){
      image(slove,100,100); 
      
      
      if(i <= 80){
        image(slove, 80+i, 80+i);
        i++;
      }
        else if(i>80){
        image(slove,160,160);
      }
     
  }
  
  if(numClick== 3){
      image(slove,100,100); 
      image(slove,160,160);
      
      if(i <= 200){
        image(slove, 10+i, 20+i);
        i++;
      }
        else if(i>200){
        image(slove,210,220);
      }
     
  }


  if(numClick== 4){
      image(slove,100,100); 
      image(slove,160,160);
      image(slove,210,220);      
      
      
      if(i <=210){
        image(slove, -34+i, -34+i);
        i++;
      }
        else if(i>210){
        image(slove,176,176);
      }
     
  }
  
   if(numClick>= 5){
     int m=millis();
    fill(m%255);
    text("i love u",180,180);
}

     

   } 




void mouseClicked(){
    numClick++; 
    println(numClick); 


}

    

