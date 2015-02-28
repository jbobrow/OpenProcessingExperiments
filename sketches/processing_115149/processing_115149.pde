
void setup() {
  size(500, 600);
  noStroke();
  background(20,30 ,50);
}

void draw() {
  int [] ballXValues= {10, 30, 50, 70, 90,110,130,150,170,190,210,230,250,270,290,310,330,350,370,390,410,430,450,470,490,510,530,550,570,590};
  for (int i=0;i<=29;i++){
    fill(195, mouseX, mouseY);
    rect(ballXValues [i], 0, 7, mouseY);

     }
}


