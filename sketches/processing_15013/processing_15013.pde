
// animated Firefly by Cecile
//animations: the firefly follows your mouse
//the body of the animal changes color when you click
//the wings are constantly moving

int wing_x_position;
int wing_y_position;

void setup() {
  size(200,200);
  noStroke();
  wing_x_position = 0;
  wing_y_position = 10;
  // myFirefly = new Firefly
}

void draw() {
  draw_firefly (mouseX*2, mouseY*2, color(255,0,255), 0, 0.5);
}


void draw_firefly(int x_position, int y_position, color c, int angle, float s)
{
  rotate(-0.3);
  background(30,62,30);  
  wing_x_position = (wing_x_position+x_position) % 5;
  wing_y_position = (y_position+wing_y_position) % 7;


  scale(s);
  // wings
  fill(244,232,28);
  stroke(244,232,28);

  ellipse(x_position+wing_x_position+230,y_position+80,35,160);
  ellipse(x_position+wing_y_position+190,y_position+80,25,160);

  //body   
  fill(154,234,154);
  stroke(154,234,154);
  triangle(x_position+150, y_position+215, x_position+120, y_position+120, x_position+170,y_position+150);

  //change body color    
  if (mousePressed == true) {
    fill(252,255,130);
    stroke(252,255,130);
  } 
  else {
    fill(c);
    stroke(c);
  }
  ellipse(x_position+270,y_position+190,250,180);

  // head
  stroke(0);
  fill(154,234,154);
  ellipse(x_position+100,y_position+100,95,80);

  // eye1
  fill(255);
  ellipse(x_position+85,y_position+80,35,40);

  //iris1
  fill(0);
  ellipse(x_position+90,y_position+91,10,10);
  //eye2
  fill(255);
  ellipse(x_position+120,y_position+80,35,40);

  //iris2 
  fill(0);
  ellipse(x_position+125,y_position+90,10,10);
  //mouth 
  ellipse(x_position+105,y_position+120,30,16);

  // eyelashes
  line(x_position+40,y_position+25,x_position+75,y_position+65);
  line(x_position+60,y_position+20,x_position+80,y_position+61);
  line(x_position+85,y_position+20,x_position+85,y_position+61);

  line(x_position+100,y_position+20,x_position+115,y_position+60);
  line(x_position+120,y_position+20,x_position+120,y_position+60);
  line(x_position+140,y_position+20,x_position+125,y_position+60);

  //arms
  line(x_position+63,y_position+124,x_position+40,y_position+160);
  line(x_position+40,y_position+160,x_position+35,y_position+200);

  line(x_position+90,y_position+140,x_position+95,y_position+175);
  line(x_position+95,y_position+175,x_position+75,y_position+210);

  // legs
  line(x_position+120,y_position+200,x_position+140,y_position+180);
  line(x_position+120,y_position+200,x_position+130,y_position+250);
  line(x_position+130,y_position+250,x_position+100,y_position+300);

  line(x_position+150,y_position+218,x_position+140,y_position+225);
  line(x_position+140,y_position+225,x_position+145,y_position+270);
  line(x_position+145,y_position+270,x_position+130,y_position+300);
}


