


int colors[];

void setup(){
  colors = new int[10];
   for (int i = 0; i < 10; i++){
     colors[i] = (int)random(20,200);
   }
  
  size (300,200);
}

void draw(){
 background(200);
 noStroke();
 for (int i = 0; i < 10; i++){
    fill(colors[i]);
    rect(i*25+20,50,20,20); 
 }
}

void mousePressed(){
   for (int i = 0; i < 10; i++){
     colors[i] = (int)random(0,255);
   }
}

