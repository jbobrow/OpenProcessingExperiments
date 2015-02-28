
float red;
float green;
float blue;
float diam;
float state;

void setup(){
  size(500,500);
  background(102,51,0);
  state=0;
}

void draw() {
 state=state + 0.25;

//Left Eye
if(state==5){
  fill(0,0,0);
  ellipse(125,125,75,75); 
  fill(255);
  ellipse(115,115,25,25);
}

//Right Eye
if(state==10){
  fill(0,0,0);
  ellipse(375,125,75,75);
  fill(255);
  ellipse(365,115,25,25);
}

//Mouth
if(state==15){
  fill(204,0,0);
  strokeWeight(7);
  stroke(0);
  rect(150,225,200,175);
}

if(state==20){
  strokeWeight(5);
  stroke(0);
  //Top row of teeth
  line(150,225,175,270);
  line(175,270,200,225);
  line(200,225,225,270);
  line(225,270,250,225);
  line(250,225,275,270);
  line(275,270,300,225);
  line(300,225,325,270);
  line(325,270,350,225);
}

if(state==25){
  strokeWeight(5);
  stroke(0);
  //Bottom row of teeth
  line(150,400,175,355);
  line(175,355,200,400);
  line(200,400,225,355);
  line(225,355,250,400);
  line(250,400,275,355);
  line(275,355,300,400);
  line(300,400,325,355);
  line(325,355,350,400);
}

//Teeth whitening
if(state==30){
  fill(255);
  noStroke();
  triangle(155,228,175,265,195,228);
  triangle(205,228,225,265,245,228);
  triangle(255,228,275,265,295,228);
  triangle(305,228,325,265,345,228);
}
 
if(state==35){
  triangle(155,397,175,360,195,397);
  triangle(205,397,225,360,245,397);
  triangle(255,397,275,360,295,397);
  triangle(305,397,325,360,345,397);  
}

//Color spazz
if(state>=40){
noStroke();
  red = random(255);
  green = random(255);
  blue = random(255);
  fill(red,green,blue);
  ellipse(115,115,25,25);
  ellipse(365,115,25,25);
  triangle(155,228,175,265,195,228);
  triangle(205,228,225,265,245,228);
  triangle(255,228,275,265,295,228);
  triangle(305,228,325,265,345,228);
  triangle(155,397,175,360,195,397);
  triangle(205,397,225,360,245,397);
  triangle(255,397,275,360,295,397);
  triangle(305,397,325,360,345,397);
}

//Restart
if(state==70){
state=0;
}
}


