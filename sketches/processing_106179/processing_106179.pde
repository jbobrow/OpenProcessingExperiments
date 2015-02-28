
int cx, cy;
float secondsRad;
float minutesRad;
float hoursRad;
float clockDiameter;
PImage img;

Pineapple[] piney = new Pineapple[4];

void setup(){
  size(900,675);
  stroke(255);
  
  int radius = min(width,height)/2;
  secondsRad = radius*.5;//second hand radius
  minutesRad = radius*.4;//minute hand radius
  hoursRad = radius*.3;//hour hand radius
  clockDiameter = radius*2;
  
  cx=width/2;//center clock
  cy=height/2;//center clock
  
  img = loadImage("cutting_board.jpg");//background image
  
  for(int i = 0;i<piney.length;i++){
    piney[i] = new Pineapple();
  }
  
  piney[0].prime(cx-25,cy+200);//6 oclock
  piney[1].prime(cx-25,cy-250);//12 oclock
  piney[2].prime(cx-220,cy-35);//9 oclock
  piney[3].prime(cx+160,cy-35);//3 oclock
}

void draw(){
  background(img);
  
  float s = map(second(),0,60,0,TWO_PI)-HALF_PI;
  float m = map(minute(),0,60,0,TWO_PI)-HALF_PI;
  float h = map(hour(), 0,24,0, TWO_PI*2)-HALF_PI;//
  
  float r=255;
  float g=184;
  float b=105;
  
//  float r= map(rvalue+second(),255,59,0,59);
//  float g= map (gvalue+second(),184,96,0,59);
//  float b= map(bvalue+second(),105,72,0,59);
  
  
  fill(r,g,b);
  noStroke();
  ellipse(cx,cy,clockDiameter, clockDiameter);//draws clock background


  
 
  stroke(82,77,76);
  strokeWeight(4);
  
  ellipse(cx,cy,cx+cos(s)*secondsRad, cy+sin(s)*secondsRad);//second hand draws
  
  strokeWeight(2);
 
  line(cx,cy,cx+cos(m)*minutesRad, cy+sin(m)*minutesRad);
  
  strokeWeight(5);
line(cx,cy,cx+cos(h)*hoursRad,cy+sin(h)*hoursRad);
  
  //minute ticks
  fill(255);
  strokeWeight(3);
  beginShape(POINTS);
  for(int a = 0; a<360; a+=6){//1 min = 6 degs
    float angle = radians(a);
    float x = cx + cos(angle)*secondsRad;
    float y = cy + sin(angle)*secondsRad;
    vertex(x,y);
  }
  endShape();

  noStroke();
  
  for(int i=0;i<piney.length;i++){
    
    piney[i].animate();
  }
  
  
}


class Pineapple {

  float x;
  float y;

  float xSpeed;
  float ySpeed;

  void prime(float a, float b) {//setup function
    x=a;
    y=b;


    xSpeed=1;
    ySpeed=1;
  } 

  void animate() {

    noStroke();
    fill(252, 198, 48);
    rect(x, y, 60, 100);//body

    fill(255);
    ellipse(x+20, y+20, 15, 15);//eyes
    ellipse(x+40, y+20, 15, 15);//eyes

    fill(0);
    ellipse(x+20, y+25, 5, 5);
    ellipse(x+40, y+25, 5, 5);//pupil



    fill(111, 247, 143);
    triangle(x+15, y, x+27.5, y-75, x+30, y);
    triangle(x+30, y, x+32.5, y-75, x+45, y);

    fill(10, 204, 55);//pineapple hair
    triangle(x, y, x+10, y-50, x+20, y);
    triangle(x+20, y, x+30, y-50, x+40, y);
    triangle(x+40, y, x+50, y-50, x+60, y);

    fill(102, 60, 5);//body grids
    stroke(255);
    line(x, y+34, x+59, y+100);
    line(x+30, y+34, x+59, y+66);
    line(x, y+50, x+20, y+35);
    line(x, y+90, x+59, y+35);
    line(x+30, y+99, x+59, y+66);

    noStroke();
    fill(0);
    ellipse(x+30, y+70, 20, 30); //mouth 

    fill(247, 89, 168);
    ellipse(x+30, y+77, 10, 15);//tongue
  }

  
}



