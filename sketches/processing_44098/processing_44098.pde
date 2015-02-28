
/*Code adopted from Chanel Brown
http://www.openprocessing.org/visuals/?visualID=39762
*/

int num = 10; // number of rectangles per rotation
int[] x = new int[num];//x value of rotation center
int[] y = new int[num];//y value of rotation center 

void setup(){
size(400, 400);
background(0);
smooth();
}

void draw(){
   for (int i = 0; i < num; i++) {
   translate(mouseX,mouseY); //make mouse position center of rotation
   rotate(frameCount * radians(1) * 0.05);//rotation speed around center
   rotate(radians(i));//rotation of arc around itself

//arc and circle
noFill();
strokeWeight(1);
int a = 2*width/6 + (2*width/6/2);
int b = 2*height/2 - (height/3/2);
for (int h = 10; h>=h*h/200; h=h+9) { 
  if (h % 2 == 0) {//if height mod 2 is equal to 0
    stroke(83, 190, 255); // then stroke is blue
    strokeWeight(0.5); //stroke weight is 0.5
  }
  else {
    stroke(255); // white
    strokeWeight(1);
  }
  arc(a, b, h*h/13, h*h/13, 5, 25);
  ellipse(a, h*h, 250, 250);

}
   }
}

void mousePressed() {//resets drawing when mouse pressed
  background(0);
}


