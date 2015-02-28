
void setup() {
  size (400, 300);
  background(152, 216, 255);
  frameRate(10);//in this instance it slows down the progression of rectangles
}
float count=0;
float num= 200;
int x=0;

void draw() {

  if (count<num) {
    fill(0);
    if (count >200) {
    }
    else {
      strokeWeight(3);

      line(120, 300, 120, 0);//sets up 20 unit intervals
      line(140, 300, 140, 0);
      line(x, 20, 400, 20);
      line(370, 0, 370, height);
      strokeWeight(4);
      line(180, 2*count, 180, height);
      line(x, 250, 400, 250);
      line(count+200, 270, 400, 270);
      line(300, 2*count, 300, height/2);

      noStroke();

      rect(count, height/3, width, 20);//count employs motion across screen
      rect(width/2, x, count, height);

      fill(120);

      rect(20, 0, 20, height);
      fill(70);
      rect(count+200, height/2, count, 20);
      fill(30);
      rect(count, 160, width, 5);
      fill(50);
      rect(260, 165, width, 5);
      fill(100);
      rect(count, height/3, width/count, 10);
    }
  }
  fill(0);
  rect(x, x, count, count);// rectangle that covers the whole screen

  count++;
}


