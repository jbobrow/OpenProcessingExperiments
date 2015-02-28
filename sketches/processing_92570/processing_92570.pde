
//Wenda Lewis Teh
//Class Assignment Week 6
//200 items

int num = 20;
float [] x = new float [num];
float [] y = new float [num];
int currentClick=0;

void setup () {
  size (600, 600);
    background(255);

}

void draw() {
  for (int i=0;i<num;i++) {
    for (int a=num/2;a<width;a=a+num) {
      for (int b=num/2;b<height;b=b+num) {
        x[i]=random(0, num);
        y[i]=random(0, num);
        stroke(255);
        fill(255,140,map(width/2,0,b,0,180));
        ellipse(a, b, x[i], x[i]);
      }
    }
  }
}
