
//Gravity Ball Experiment
//Tracy Carlin
//Feb. 16, 2012

color g = #526F35;
float x =400;
float y = 100;
float speed = 0; //designates speed of the ball and the direction it is going in
float gravity = 0.1; // the acceleration of the ball
float elongation = 0; // amount by which x and y are transformed
float fat = 40; //width of the ball
float tall = 40; //height of the ball
float direction = .001; //direction the ball is going

void setup(){
size(800,600); 
  background(255);
  smooth();
}

void draw(){
  background(255);
  makeball();
   y = y+speed; // adding to the y value, making it move down
   speed = speed + gravity; // increasing the value added to y incrementally
   elongation = elongation + speed*direction; // adding incrementally to the elongation of the ball
   fat = fat - elongation; //makes thinner as it goes down
   tall = tall + elongation; // makes taller as it goes down
   if (y >=height - tall/2) { // changes everything when the ellipse hits the bottom; part 2 should change when the ellipse is a perfect circle. 
   //.95 instead of 1 "dampens" the bounce, making it more realistic/eventually come to a stop
  speed = speed * -.95 ; //reversing direction and slightly lowering speed
  elongation = elongation* -1; //makes values reverse - now it'll get fatter and shorter
 direction = direction * -1; // makes elongation reduce as it rises or increase as it goes down //PROBLEM PART BELOW
  } else if (y == 100) {// events occur if the ball returns back up to the max height of the current iteration
   //direction = direction * -1; // makes elongation go back to increasing when it hits the apex
   println("Hey! Listen!");
   elongation = elongation * -1; // makes values of elongation reverse again - width decreases, height increases
}
}

void makeball(){
 ellipse(x,y,fat,tall);
  fill(g);
  smooth();
    
}


