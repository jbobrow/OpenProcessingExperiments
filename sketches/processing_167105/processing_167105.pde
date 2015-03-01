
//lines' repetition using for loop, change of stroke color and weight
// basic shape using triangle, color using fill where I added a fourth value (transparency)

void setup(){
  size (500, 500);
  background (0);
    fill(38, 147, 165, 200);
  triangle(height/2, height/2, height, width, 0, width);
}


void draw(){
  stroke(242, 89, 209, 10);
  strokeWeight(2);
  for (int a= 10; a<height; a+=30){
  line(height, 0, 0,-a+height);
  line(0, 0, height, a);
  }

}


