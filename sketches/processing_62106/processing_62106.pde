
void setup (){
  size(400, 400);
  background(165, 105, 150);
  smooth();

int abstand = 10;
  int offset = 30;
   for(int x = 0; x < 10; x++){
     for(int y = 0 ; y < 10 ; y++){
       if(x % 2 == 0){
           abstand = ((int)random(1,4) ) * 10;
       }else{
           abstand = 10;
       }
       noStroke();
       ellipse(x * 35 + offset + abstand, y * 35 + offset, 10, 10);
     }
   } 
}

void draw(){}

void mousePressed (){
  saveFrame("modulo+random.png");
}

