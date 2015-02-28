
void setup (){

size (300, 300);
smooth();
}


void draw(){
  
  background(0);

  noStroke();

for(int i= 0; i < width; i = i + 20){
  for(int j = 0; j < height; j = j + 20){
   
    fill (255);
    
    triangle(i, j, 15, 15, 30, 30);
 
 }}
 for(int i= 0; i < width; i = i + 20){
  for(int j = 0; j < height; j = j + 20){
   
    fill (255);
    
    strokeWeight(4);
    
    rect(i, j, 15, 15, 30, 30);
 
  }

 }}
