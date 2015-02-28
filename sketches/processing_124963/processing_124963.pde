
ArrayList<PVector> list = new ArrayList<PVector>();
ArrayList colors = new ArrayList();
ArrayList sizes = new ArrayList();
ArrayList directions = new ArrayList();
ArrayList rotDirections = new ArrayList();

int[] bg;
final int elements = 10;
float inc = PI;
//int rotDir = 1;
int dir = 1;

void setup() {
  colorMode(HSB);
  size(800,600);
  background(100);
  
  for(int i = 0; i < elements; i++) {
    list.add(new PVector(((float)Math.random() * 80), (i * height / elements) + ((height/elements) / 2)));
    //list.add(new PVector(i * 20, (i * height / elements) + ((height/elements) / 2)));
    colors.add(new int[]{Math.round(random(50,255)),Math.round(random(50,255)),Math.round(random(50,255))});
    sizes.add((((float)Math.random() * 2.5f) +2));
    directions.add(1);
    rotDirections.add(1);
  }
  bg = new int[]{Math.round(random(50,250)),Math.round(random(100,255)),Math.round(random(50,255))};
  noStroke();
}

void draw() {
  //frame.setTitle("FC: " + Integer.toString(frameCount) + " FR: " + frameRate);
  
  bg[0] += 1;
  if(bg[0] > 255){
    bg[0] = 0;
  }
  fill(bg[0],bg[1],80, 7);
  rect(0, 0, width, height);
  
  for(int i = 0; i < elements; i++){
    if(list.get(i).x > width || list.get(i).x < 0) {
      // Switch each rotDirections?
      directions.set(i, directions.get(i) * -1);
    }
  }
  if(inc > TWO_PI) {
    inc = PI;
   // rotDir *= -1;
    
    for(int i = 0; i < elements; i++){
      list.get(i).x += (40 * directions.get(i));
      rotDirections.set(i, rotDirections.get(i) * -1);
    }
  }
  
  // Move speed
  inc += 0.09;
  
  for(int i = 0; i < elements; i++){
    PVector item = new PVector(list.get(i).x, list.get(i).y);
    if(inc == PI) {
      inc = TWO_PI;
    }
    fill(colors.get(i)[0],colors.get(i)[1],colors.get(i)[2]);
    ellipse(item.x + (cos(inc) * 20) * directions.get(i), (item.y + sin(inc * rotDirections.get(i)) * 35), sizes.get(i), sizes.get(i));
  }
}


