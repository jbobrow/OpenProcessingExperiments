
// the idea here is that when you drag the mouse, the car changes speed. When you move the mouse, the sun "rises" and "sets".

float x=0;
float speed=5;  //this is the speed the car moves
float rise=0; //I want this to be the degree angle at which the sun is rising(rotating around the biggest ellipse)

void setup(){
size(400,400);
smooth();
}

void draw(){
  frameRate(30);
  colorMode(HSB,360,100,100);
  float rad=rise*0.0174532925;
    println(rise + " degrees is " + rad + " radians");
//  sky(85);  //I want the sun to be above the sky, but below the road, so the sun dissapears when it "sets". when i enable the sky function[and remove the sky drawing from road()], everything draws instead of animating, because there is no background.
  road();
  rotate(rad); //I want this to rotate just the sun function around the 200,200 point, which is the center of the invisible ellipse. Instead, it is rotating around 0,0. Argh.
 // translate(200,200);  //I wanted to move the origin point of the sun to 200,200 using translate, but I'm not sure I fully understand how translate works.
  sun();
  rotate(-rad);  //I added this rotation to reset it the remaining functions. That worked!
  //translate(0,0);  //this should reset translate(), but the car rotates now too. Hmm.
  car(x,150);
  noStroke();
  fill(60,100,100);
//  ellipse(350,50,40,40);
  //speed=speed*1.5;
  x=x+speed;
  if ((x>=height)||(x<0)){
    speed=speed*-1; //if the car gets going too fast, it will break this barrier and escape the canvas. I don't know why.
}
}

void mouseDragged(){  //This changes the speed of the car when the mouse is dragged.
  speed=speed+1;
  if (speed>300){
    speed=3;
  }
//  if (mousePressed==false){  //I want this to reset the speed to 5 when the mouse button is released
//    speed=5;
//  }
}

void mouseReleased(){ //this resets the speed to 5 when the mouse is released. 
  speed=5;
}

void mouseMoved(){ //I want this to make the sun function rotate around the origin of the biggest ellipse, making the sun "rise".
  rise=rise+2;
  if (rise>360){
    rise=0;
  }

}
void sky(float sat){  //I want the sky to change color as the sun "rises" and "sets", but I don't want it to just cycle through the color spectrum, I want it to move thru realistic sky colors. So I'm not using the sat variable as anything except a placeholder for when I figure that out.
  fill(200,sat,73);
  rect(0,0,400,200);
}

  
void sun(){
//  background(240);
  noStroke();
  fill(60,100,100);
  ellipse(350,50,40,40);
  //fill(100,100,100,0); //the transparency value makes it invisible.
  //ellipse(200,200,460,460);  //this ellipse is big and invisible; I wanted the yellow sun to rotate around the center of this ellipse. I think it would work better if I translated the origin of the sun, but I don't remember how.
}

void road() {
  background(120,60,60);
  noStroke();
  fill(200,85,73);
  rect(0,0,400,200);
  fill(0);
  rect(0,220, 400,130);
  strokeWeight(5);
  stroke(50,100,100);
  line(0,275,400,275);
  line(0,290,400,290);
}

void car(float a, float b) {
noStroke();
fill(350,100,100);
rect(a,b+50,100,40);
rect(a+30,b+30,40,20);
triangle(a+70,b+30, a+100, b+50, a+70,b+50);
stroke(0);
strokeWeight(5);
fill(30,100,100);
ellipse(a+20,b+90, 25,25);
ellipse(a+70,b+90, 25,25);

}

