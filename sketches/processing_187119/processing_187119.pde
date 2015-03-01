
float option = 0;


void setup(){
  size(640, 480);
  strokeWeight(1);
}

void draw(){
   
  background (255);
  
  if (mouseX < 213){
  option = 0;
  }
  
  if (mouseX > 213 && mouseX < 426){
  option = 1;
  }
  
  if (mouseX > 426){
  option = 2;
  }
  
  if (option == 0){
  for (int i = 100; i < width - 100; i = i + 20){
  for (int j = 100; j < height - 100; j = j + 20){
  fill(i, j, 255, 20);
  ellipse (i, j, 40, 40);
  
 }
 }
 }
  
  if (option == 1){
  for (int i = 100; i < 540; i = i + 20){
  for (int j = 100; j < 380; j = j + 20){
  line(i, j, i + 10, j + 10);
  line (i, j + 10, i + 10, j);
  
 }
 }
 }
 
  if (option == 2){
  for (int i = 100; i < 540; i = i + 20){
  for (int j = 100; j < 380; j = j + 20){
  line (i, j, width/2, height/2);
 }
 }
 }
 
}

