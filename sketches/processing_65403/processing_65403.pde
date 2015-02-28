
//E7 Loops + Gegensatzpaare = behäbig


void setup(){
  size (500, 500);
  smooth();
}
  
void draw(){background(255);
    
  for(int i = 0; i<= height; i = i + 250){
  for(int j = 0; j<= width ; j = j + 70){
  triangle(i, j, 1500, 10, 150,1500);}
}}
