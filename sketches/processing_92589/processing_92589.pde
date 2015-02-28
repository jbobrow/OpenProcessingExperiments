
void setup() {

  size (500, 600);
  smooth();
  background(75, 0, 0);
}
void draw() {


  stroke(255, 0, 0); //bright red weft
  strokeWeight(5);
  for (int i=0;i<10;i++) {
    line(0, 50+i*10, 500, 50+i*10);
  }

  stroke(255, 0, 0); //bright red warp
  strokeWeight(5);
  for (int i=0;i<10;i++) {
    line(100+i*10, 0, 100+i*10, 600);
  }
  stroke(255, 0, 0); //bright red weft
  strokeWeight(5);
  for (int i=0;i<10;i++){
  line(0, 250+i*10, 500, 250+i*10);
  }
  stroke(255, 0, 0); //bright red warp
  strokeWeight(5);
  for (int i=0;i<10;i++) {
  line(300+i*10, 0, 300+i*10, 600);
  }
  stroke(255, 175, 0); //yellow weft
  strokeWeight(5);
  for (int i=0;i<10;i++) {
  line(0, 150+i*10, 500, 150+i*10);
  }
  stroke(255, 175, 0); //yellow weft
  strokeWeight(5);
  for (int i=0;i<10;i++) {
  line(0, 350+i*10, 500, 350+i*10);
  }
  stroke(255, 0, 0); //bright red weft
  strokeWeight(5);
  for (int i=0;i<10;i++) {
  line(0, 450+i*10, 500, 450+i*10);
  }
  stroke(0, 0, 75); //dark blue warp 
  strokeWeight(5);
  for (int i=0;i<10;i++) {
  line(0+i*10, 0, 0+i*10, 600);
  }
  stroke(0, 0, 75); //dark blue warp
  strokeWeight(5);
  for (int i=0;i<10;i++) {
  line(200+i*10, 0, 200+i*10, 600);
  }
  stroke(0, 0, 75); //dark blue warp
  strokeWeight(5);
  for (int i=0;i<10;i++) {
  line(400+i*10, 0, 400+i*10, 600);
}
}


