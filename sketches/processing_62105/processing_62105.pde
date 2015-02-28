
void setup (){
  size(400, 400);
  background(235, 230, 200);

int abstand = 10;
  int offset = 20;
   for(int x = 0; x < 10; x++){
     for(int y = 0; y < 10; y++){
       abstand = ((int)random(1, 4) ) * 10;
       noStroke();
       ellipse(x * 35 + offset + abstand, y * 35 + offset + 20, 10, 10);
     }
   } 
}

void draw(){}

void mousePressed (){
  saveFrame("modulo-nur-random.png");
}

