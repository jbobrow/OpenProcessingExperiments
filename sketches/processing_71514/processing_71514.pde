
//Irene Hwang
//Creative Computing A: Distance to Circle
//Sep 21, 2012

int circle_x = 20;//float(more specific number)(ex: 3.6/3 = int3 = float1.2) 
int circle_y = 25;
int circle_radius =20;
int circle_x_speed=2;
int circle_y_speed=6;
Boolean move_circle = false; //dont wanna move a ball (V) not moving before u click the mouse

void setup() {
  size(500, 1000);
};
void draw() {
  //background(200); 
 if((mousePressed ==true) && (mouseX<100)) {//When we click the screen lower than 100, we could see the ball's moving
  //if(mouseX<100){ //When mouse goes lower than 100
  
  //if(mousePressed == true) {
   // move_circle = true;}; //when i press mouse, the circle will START to move (V)
  //if(move_circle == false){
    
    
    
   //if(mousePressed == true){ //if i press the mouse
   //change the value of move_circle
     //if (move_circle == true){//if the circle is moving
      // move_circle = false;//stop the circle from moving
   //  } else {//else the circle isn't moving
     //  move_circle = true;//so move it
       
     };
   };
   
  if(move_circle == true){ //move the circle
     circle_x=circle_x+circle_x_speed;
     circle_y=circle_y+circle_y_speed;
  noStroke();
  fill( random(200), random(200), random(200), 90);
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);
  };
  //ellipse(circle_x, random(200), circle_radius*2, circle_radius*3);

  //circle_y += circle_y_speed;
  if (circle_y> height - circle_radius) { 
    circle_y_speed= -circle_y_speed;
   // circle_y_speed= circle_y_speed-10;
   
    //change direction
  };
  if (circle_y< 0 + circle_radius) {
    circle_y_speed = -circle_y_speed;
    //circle_y_speed= circle_y_speed+10;
};
//same as the top two conditions
    //if (circle_y - circle_radius <0) { //move to top edge of screen
     // circle_y=circle_raidus;
   // };
   // if (circle+circle_radius >height) { //move to bottom edge of screen
     // circle_y=height-circle_radius
    //};

 
    //if it reaches an edge change direction

    //if circle_x reaches width
    if (circle_x> width - circle_radius) { 
      circle_x_speed= -circle_x_speed;
      //circle_x_speed=circle_x_speed-2;
      //change direction
    };
    if (circle_x< 0 + circle_radius) {
      circle_x_speed = -circle_x_speed;
     // circle_x_speed=circle_x_speed+2;
      //if ((circle_x>width + circle_radius )||(circle_x<0 - circle_radius)) {circle_speed=-circle_speed;          };
      // use -,+ circle_radius not to cover a half of the circle
};
};
