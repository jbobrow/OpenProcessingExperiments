
//variable boucing squares
float s = 100; // s location of the square
float y = 0; // y location of the square
float speed1 = 0;// speed of square
float gravity= 0.1;

//bouncing circles
float x= 0;
float speed = 5;


void setup(){
size(600,600);
smooth();

}

void draw() {
  background (255);
  
  
  //display circle
  noStroke();
  fill(1,255);
  ellipse(x,100,50,50);
  
  noStroke();
  fill(1,255);
  ellipse(x,460,32,32);
  
  noStroke();
  ellipse(x,200,67,67);
    x = x + speed; 
  if ((x > width || x< 0)) 
    speed = speed * -1;
  
  //display the square
  fill(175,233,67);
  noStroke();
  rectMode(CENTER);
  rect(s,y,70,70);
  
  fill(12,45,69);
  noStroke();
  rectMode(CENTER);
  rect(200,y,50,50);
  
  fill(145,126,155);
  noStroke();
  rect(430,y,120,120);

  y = y + speed1;
  
  speed1 = speed1 + gravity;
  
  //if square reaches the bottom
  //reverse speed
  if (y> height) {
    speed1 = speed1 * -0.95;
  }
}



