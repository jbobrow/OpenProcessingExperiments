
float car1_speed = random(5);
float car2_speed = random(5);
float   car3_speed = random(5);
float timer=5;
float speed2;
float speed1;
float speed3;
float norm_x = 0;

void setup()
{
  size(600, 400);

  ellipseMode(CENTER);
  background(#FCFAC2);
  //Finish Line Stopper
  strokeWeight(3);
  stroke(255, 40, 0);
  line(500, 0, 500, 500);
  strokeWeight(1);
}
void draw()
{
  if (timer>=0) {
     noStroke();
    fill(#FCFAC2);
    rect(50,0,150,50);
     fill(0);
    textSize(25);
    text(timer, 50, 30);
    timer-=0.1;
  
  }
  else {

    float rand1=random(100, 110);
    float rand2=random(200, 210);
    float rand3=random(300, 310);
    //ERASING CARS

    draw_car(speed1, 100, #FCFAC2);  
    draw_car(speed2, 200, #FCFAC2);  
    draw_car(speed3, 300, #FCFAC2);  

    //Speeds
    speed1=norm_x * car1_speed;
    speed2=norm_x * car2_speed;
    speed3=norm_x * car3_speed;


    //Flames
    draw_flames(rand1, speed1, #FF0000);
    draw_flames(rand2, speed2, #00FF00);
    draw_flames(rand3, speed3, #0000FF);
    //Cars
    draw_car(speed1, 100, #FF0000);    // red car

    draw_car(speed2, 200, #00FF00);    // blue car

    draw_car(speed3, 300, #0000FF);    // green car



    if (speed1>=500||speed2>=500||speed3>=500) {
      norm_x=norm_x+0;
    }
    else {
      norm_x = norm_x + 1;
    }
    if (speed1>=500) {
      textSize(25);
      text("Red Wins!", width/2-40, 30);
    }
    if (speed2>=500) {
      textSize(25);
      text("Green Wins!", width/2-40, 30);
    }
    if (speed3>=500) {
      textSize(25);
      text("Blue Wins!", width/2-40, 30);
    }
  }
}

void draw_car(float x, float y, color carcolor)
{
  stroke(carcolor);
  fill(carcolor);
  rect(x, y, 20, 10);
  fill(0);

  noStroke();

  ellipse(x, y+15, 5, 5);
  ellipse(x+20, y+15, 5, 5);


  // Draw a car at location(x,y)
}
void erase_tires(float x, float y) {
}
void draw_flames(float y1, float car, color col) {

  strokeWeight(8);
  stroke(col); //trail stuff for car 1 vvv
  point(car-15, y1);
  strokeWeight(12);
  stroke(#FCFAC2);
  point(car-30, y1);
}


