
int j;
void setup() {
    size(800,600);
    j=0;
}

void draw() {
  background(map(cos(radians(j)),-1,1,0,255),180,map(cos(radians(180-j)),-1,1,0,255));
  println(map(cos(radians(j)),1,-1,0,255)+ " " + map(cos(radians(180-j)),1,-1,0,255));
  j++;
}

