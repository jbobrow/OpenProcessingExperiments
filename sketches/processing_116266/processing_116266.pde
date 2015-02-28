
float frames = 0;
float x = 70*cos(frames);
float y = 70*sin(frames);


void setup() {
 size(700, 700); 
 noStroke();
 
}

void draw() {
  background(10, 0, 36);
  for(int i = 0; i < 4; i++) {
    float starSize = random(3, 10);
    fill(255, random(180, 255));
    ellipse(random(0, 700), random(0,700), starSize, starSize);
  }
  float sunSize = random(52, 58);
  noStroke();
//stars
  
//sun
  fill(255, 255, 115);
  ellipse(width/2, height/2, sunSize, sunSize);
  fill(250, 215, 0);
  ellipse(width/2, height/2, 50, 50);
//earth
  fill(20, 200, 230);
 ellipse(200*cos(frames)+350, 200*sin(frames)+350, 20, 20);
 //mars
 fill(200, 20, 50);
 ellipse(300*cos(frames*2+PI)+350, 300*sin(frames*2+PI)+350, 30, 30);
 //moon
 fill(130);
 ellipse(50*cos(5*frames)+(200*cos(frames)+350), 50*sin(5*frames)+(200*sin(frames)+350), 10, 10);
frames+=.001*PI; 

if(mousePressed) {
  frames *=1.01;
  }
}




