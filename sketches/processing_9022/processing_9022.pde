
  int x = 0;  

  int a1;
  int a2;
  int b1;
  int b2;
  int c1;
  int c2;


void setup(){
  size(200,400);

  //variables



}

void draw(){


  background(255);




  //lines

  line(20,30,160,30);
  line(20,90,160,90);
  line(20,150,160,150);
  line(20,210,160,210);
  line(20,270,160,270);
  line(20,330,160,330);


  //animate

  x = x+1;

  //conditions

  if(x == 360){
    x = 0;
  }

  //first pair
  if(x > 0 && x < 180){
    a1 = 0; 
    a2 = 255;
  }
  else if(x > 180 && x < 360){
    a1 = 255;
    a2 = 0;
  }
  //second pair
  if(x > 120 && x < 300){
    b1 = 0;
    b2 = 255;
  }
  else if(x > 300 && x< 360 || x > 0 && x < 120){
    b1 = 255;
    b2 = 0;
  }
  //third pair
  if(x > 240 && x < 360 || x > 0 && x < 60){
    c1 = 0;
    c2 = 255;
  }
  else if(x > 60 && x < 240){
    c1 = 255;
    c2 = 0;
  }

  //circles
  fill(a1);
  ellipse(20,30,30,30);
  fill(a2);
  ellipse(150,30,30,30);
  fill(b1);
  ellipse(20,90,30,30);
  fill(b2);
  ellipse(150,90,30,30);
  fill(c1);
  ellipse(20,150,30,30);
  fill(c2);
  ellipse(150,150,30,30);
  fill(a2);
  ellipse(20,210,30,30);
  fill(a1);
  ellipse(150,210,30,30);
  fill(b2);
  ellipse(20,270,30,30);
  fill(b1);
  ellipse(150,270,30,30);
  fill(c2);
  ellipse(20,330,30,30);
  fill(c1);
  ellipse(150,330,30,30);

}



