
Flower[] Flowers = new Flower[10];

void setup(){
  background(0);
  size(500,500);
  Flowers[0] = new Flower(random(500),random(500));
  Flowers[1] = new Flower(random(500),random(500));
  Flowers[2] = new Flower(random(500),random(500));
  Flowers[3] = new Flower(random(500),random(500));
  Flowers[4] = new Flower(random(500),random(500));
  Flowers[5] = new Flower(random(500),random(500));
  Flowers[6] = new Flower(random(500),random(500));
  Flowers[7] = new Flower(random(500),random(500));
  Flowers[8] = new Flower(random(500),random(500));
  Flowers[9] = new Flower(random(500),random(500));
}

void draw(){
 for(int i =0; i<10; i++){
   Flowers[i].display();
 }
 }

