
float diam = 200;
float a = 5;

void setup(){
  size(600,600);
  background(200);
}
  
void draw() {
  
  float x = noise(a, 10) * width;
  float y = noise(a, 50) * height;
  float d = dist(x, y, mouseX, mouseY);
  
  if(d > diam){
    strokeWeight(1);
  } else{
    strokeWeight(random(10));
  }

 stroke(66, 200, 255); //blue
  fill(mouseX,mouseY,mouseX/8); //yellow
  rect(x +18, y+25, diam, diam);
  ellipse(x +18, y+25, diam, diam);
  //box
  
  translate(mouseX-240,mouseY-200);
  rotate(random( TWO_PI/150));

strokeWeight(5);
rectMode(CENTER);
fill(#FFE9D6);
ellipse(250, 180, 300, 180);//Head


line(155,120,220,150);
line(330,255,300,100);
      
fill(#C40000);
arc(240, 240, 150, 20, -5, PI+TWO_PI, OPEN);//mouth

color c = color(255, 204, 0);
fill(0); 
ellipse(175, 180, 80, 80);// lefteye
ellipse(300, 180, 80, 80); // righteye

fill(255); 
ellipse(165, 170, 25, 25);// Left Pupil


}


