
int left_x = 275;
int right_x = 325;
int left_y = 225;
int right_y = 225;
void setup(){
  size(600,600);
}

void draw(){
  
 ellipse(left_x,left_y,20,20);
 ellipse(right_x, right_y,20,20);
 
 if (keyPressed){
   right_x=right_x+1;
   left_x=left_x-1;
   right_y=mouseY;
   left_y=mouseY;
 } else if (mousePressed){
   right_x=right_x-1;
   left_x=left_x+1;
   right_y=mouseX;
   left_y=mouseX;
   
 
 }
 

 
 
  
}


