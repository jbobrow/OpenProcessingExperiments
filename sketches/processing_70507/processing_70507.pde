
//Jan-Luca Berger
//Creative Computing
//September 14th
//Mouse Button Assignment
int circle_diameter = 400;
float my_float=2.3;
boolean isOverCircle = false;

//x circles
int circx = 75;
int circy = 0;

int circx2 = 175;
int circy2 = 0;

int circx3 = 275;
int circy3 = 0;

int circx4 = 375;
int circy4 = 0;

int circx5 = 475;
int circy5 = 0;


//y circles

//x circles
int circYx = 0;
int circYy = 75;

int circYx2 = 0;
int circYy2 = 175;

int circYx3 = 0;
int circYy3 = 275;

int circYx4 = 0;
int circYy4 = 375;



int circspeed = 2;




void setup() {
  size(550, 450);
};
void draw() {
  background(200);
  fill(200, 101, 200);
  //if my mouse is over the cirlce, change the fill color
  //if mousex and mousey are inse the circle change to fill color

  if (dist(width/2, height/2, mouseX, mouseY)< circle_diameter/2) {
    fill(178, 4, 88); 
    isOverCircle = true;
  } 
  else {
    isOverCircle = true;
  };
  if ((mousePressed==true) && (isOverCircle==true)) {
    fill(112, 78, 227);
  };
  println( dist(width/2, height/2, mouseX, mouseY));
  ellipse(width/2, height/2, circle_diameter, circle_diameter);
  //only draw line if mouse isnt over cirlce
  if (isOverCircle == false ) {
    line(width/2, height/2, mouseX, mouseY);
  }

  if ((mousePressed==true) && (isOverCircle==true)) {
    fill(245, 214, 156);
    rect(0, 0, 50, 50);
    rect(100, 0, 50, 50);
    rect(200, 0, 50, 50);
    rect(300, 0, 50, 50);
    rect(400, 0, 50, 50);
    rect(500, 0, 50, 50);

    fill(227, 180, 92);
    rect(0, 100, 50, 50);
    rect(100, 100, 50, 50);
    rect(200, 100, 50, 50);
    rect(300, 100, 50, 50);
    rect(400, 100, 50, 50);
    rect(500, 100, 50, 50);

    fill(206, 155, 60);
    rect(0, 200, 50, 50);
    rect(100, 200, 50, 50);
    rect(200, 200, 50, 50);
    rect(300, 200, 50, 50);
    rect(400, 200, 50, 50);
    rect(500, 200, 50, 50);

    fill(193, 138, 35);
    rect(0, 300, 50, 50);
    rect(100, 300, 50, 50);
    rect(200, 300, 50, 50);
    rect(300, 300, 50, 50);
    rect(400, 300, 50, 50);
    rect(500, 300, 50, 50);

    fill(178, 117, 4);
    rect(0, 400, 50, 50);
    rect(100, 400, 50, 50);
    rect(200, 400, 50, 50);
    rect(300, 400, 50, 50);
    rect(400, 400, 50, 50);
    rect(500, 400, 50, 50);
  };
  if ((isOverCircle = true) && (mousePressed==true)) {

    fill(192, 227, 142);
    //circle 1x
    ellipse(circx, circy, 20, 20);
    circy=circy+circspeed;
    if (circy > height) {
      circspeed= circspeed*-1;
    };
    if (circy < 0) {
      circspeed=circspeed*-1;
    };

    fill(154, 191, 100);
    //circle 2x
    ellipse(circx2, circy2, 20, 20);
    circy2=circy2+circspeed;
    if (circy2 > height) {
      circspeed= circspeed*-1;
    };
    if (circy2 < 0) {
      circspeed=circspeed*-1;
    };

    fill(120, 155, 70);
    //circle 3x
    ellipse(circx3, circy3, 20, 20);
    circy3=circy3+circspeed;
    if (circy3 > height) {
      circspeed= circspeed*-1;
    };
    if (circy3 < 0) {
      circspeed=circspeed*-1;
    };

    fill(97, 129, 49);
    //circle 4x
    ellipse(circx4, circy4, 20, 20);
    circy4=circy4+circspeed;
    if (circy4 > height) {
      circspeed= circspeed*-1;
    };
    if (circy4 < 0) {
      circspeed=circspeed*-1;
    };

    fill(67, 95, 26);
    //circle 5x
    ellipse(circx5, circy5, 20, 20);
    circy5=circy5+circspeed;
    if (circy5 > height) {
      circspeed= circspeed*-1;
    };
    if (circy5 < 0) {
      circspeed=circspeed*-1;
    };






    fill(157, 174, 222);
    //circle 1y
    ellipse(circYx, circYy, 20, 20);
    circYx=circYx+circspeed;
    if (circYy > width) {
      circspeed= circspeed*-1;
    };
    if (circYy < 0) {
      circspeed=circspeed*-1;
    };

    fill(108, 130, 188);
    ////      //circle 2y
    ellipse(circYx2, circYy2, 20, 20);
    circYx2=circYx2+circspeed;
    if (circYy2 > width) {
      circspeed= circspeed*-1;
    };
    if (circYy2 < 0) {
      circspeed=circspeed*-1;
    };

    fill(72, 93, 149);
    //circle 3y
    ellipse(circYx3, circYy3, 20, 20);
    circYx3=circYx3+circspeed;
    if (circYy3 > width) {
      circspeed= circspeed*-1;
    };
    if (circYy3 < 0) {
      circspeed=circspeed*-1;
    };

    fill(37, 54, 100);
    //circle 4y
    ellipse(circYx4, circYy4, 20, 20);
    circYx4=circYx4+circspeed;
    if (circYy4 > width) {
      circspeed= circspeed*-1;
    };
    if (circYy4 < 0) {
      circspeed=circspeed*-1;
    };
  };
};




