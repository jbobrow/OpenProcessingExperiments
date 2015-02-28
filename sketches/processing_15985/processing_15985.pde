
void setup(){
size (600, 600);
smooth();
}

void draw(){
  noStroke();
  background(40);
  frog(190, 300,int(random(58, 88)), 1);
  noStroke();
 frog(300, 0, int(random(58, 88)),0.6);
}


void frog(int x, int y,int a, float s){
  translate(x, y);
  scale(s);
 
fill(164, 255, 46);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(164, 255, 46);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(164, 255, 46);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);

fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);

stroke(255, 107, 70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

fill(164, 255, 46);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, a);//right foot
fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

 

