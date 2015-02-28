
void setup (){
  size(400, 400);
  background(255);

int abstand = 10;
  int offset = 20;
   for(int x = 0; x < 10; x++){
     for(int y = 0; y < 10; y++){
       abstand = ((int)random(1, 4) ) * 10;
       noStroke();
       fill(0);
       ellipse(x * 35 + offset + abstand, y * 35 + offset + 20, 10, 10);
     }
   } 
}

void draw(){}

void mousePressed (){
  saveFrame("modulo-nur-random.png");
}

