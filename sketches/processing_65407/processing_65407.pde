
//E7 Loops + Gegensatzpaare = flink


void setup(){
  size (500, 500); 
  smooth();
  strokeWeight(1);


    
}

void draw() {background(255);

  for(int i =0; i<= height; i = i + 50){
  for(int j =0; j<= width ; j = j + 50){
  
  fill (255);
  line(j, i, 50, j);} 
}}
