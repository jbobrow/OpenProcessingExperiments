
int choice;
int x = 200;
int y = 200;
void setup(){
  background(255);
  size(400,400);
  
}

void draw(){
  choice = (int) random(0,4);
  //strokeWeight(10); 
  //background(255);
  if(choice == 0){
    x++;
  }
  if(choice == 1){
    y++;
  }
  if (choice ==2){
    x--;
  }
  if (choice == 3){
    y--;
  }
  
  point(x,y);
  
}


