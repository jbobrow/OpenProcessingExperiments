
void setup() {
  size(500, 500);
  background(15);
  smooth();
}

//declare arrays for mouse position in x and y, length = 30
float mx[] = new float[30];
float my[] = new float[30];


void draw() {
  background(15);


  //reads entire array
  for (int i=1; i<30; i++) {
    //the first value is deleted, all values are moved one position down
    mx[i-1] = mx[i];
    my[i-1] = my[i];
  }
  //mouse x and y are the new last item of the arrays
  mx[30-1] = mouseX;
  my[30-1] = mouseY;

  //read again the array, with new values 
  for (int i=0;i< mx.length; i++) {
    //draw rect
    noStroke();
    fill(i+100, 0, 0, 100);
    ellipse(mx[i], my[i], i, i);

    strokeWeight(1);
    stroke(random(180, 255), 25);

    float mapa = map(i, 0, mx.length, 0, width);

    line (mapa, 0, mouseX, mouseY);
    //line (width, 0, mouseX, mouseY);
    //line (0, height, mouseX, mouseY);
    line (mapa, height, mouseX, mouseY);
  }
}






