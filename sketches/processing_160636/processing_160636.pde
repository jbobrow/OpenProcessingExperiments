
PImage tour;
Pimage flow;
float speed = 2.0;
float move;

void setup() {  //setup function called initially, only once
  size(450, 450);
 
 tour=loadImage("http://images.forbes.com/media/lists/companies/google_200x200.jpg");
 flow=loadImage("http://3.bp.blogspot.com/-hfdH-bbWovY/UYOlXpxn3vI/AAAAAAAAomU/TJ8ysU7dO_M/s200-c/getting-started-google-glass.jpg");
}

void draw(){

move=move+speed;
background(random(0,52),random(50,100),random(0,100));
image(tour,move,40);
image(flow,40,move);
if (move > 500) {
move = 5;


}
 

}
