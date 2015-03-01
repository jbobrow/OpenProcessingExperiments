
int option;

void setup(){
  size(500,500);
  strokeWeight(.5);
}

void draw(){
  background(255);
if (option == 0){
 for(int j = 20; j < height - 20; j = j + 20) {
   for(int i = 20; i <width - 20; i = i + 20) {
     stroke(195,255,173);
     line(i,j/2,i+20,j+20);
     stroke(255,255,154);
     line(i,j+20,i+20,j/2);
  }
 }
}

if (option == 1){
  for(int i = 10; i <width - 10; i = i + 5) {
    for(int j = 10; j <width - 10; j = j + 5){
      stroke(205,255,248);
      line(i,j,width/2,height/2);
    }
  }
 }

if (option == 2){
 for(int i = 20; i <width - 20; i = i + 20) {
  for(int j = 20; j <width - 20; j = j + 20){
    fill(i/2,j,20,10);
    ellipse (i,j,200,80);
    }
  }
}

}
 void mousePressed() {
   option = option + 1;
   option = option%3;
   println(option);
 }
