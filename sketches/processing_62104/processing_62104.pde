

void setup(){
  size(400,400);
  smooth();
}

void draw(){
  background(110, 150, 140);

int abstand = 10;
  int offset = 25;
   for(int x = 0; x < 10; x++){
     for(int y = 0; y < 10; y++){
       if(x % 2 == 0){
         abstand = 20;
       } else {
         abstand = 10;
       }
       noStroke();
       ellipse(x * 35 + offset + abstand, y * 35 + offset + 15, 15, 15);
     }
   }
}

void mousePressed (){
  saveFrame("modulo.png");
}

