
int x,y;

void setup() {
size(350,350);
background(255);
x = width/2;
y = height/2;
}

void draw(){

if (mousePressed){
color c = color(random(90,200),random(210,250),random(23,123));
strokeWeight(int(random(1,10)));
stroke(c);
for(int i=0; i < 50; i+=10){
  for(int j=0; j < 50; j+=10){
  line(x,y,mouseX+i,mouseY+j);
  }
}

}
}
