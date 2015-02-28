
//Firefly lover

int num=15; //number of firefly couples
Fly [] myFly = new Fly [num]; //array for firefly
 
void setup(){
  size(200,200);
  background(200);
for (int i=0;i<myFly.length;i++){
  myFly [i]= new Fly(); //call the object fireflies from class Fly
}
}

void draw(){
  background(0);
  noStroke();
  fill(200,80,20);
  ellipse(150,50,75,75);//draw a moon
  for(int i=0;i<myFly.length;i++){
myFly[i].update(); //update and show the object fireflies from class Fly
myFly[i].display();

noStroke();
smooth();
  fill(mouseX,255,mouseY);
  triangle(0,200,20,200,10,25);
  triangle(20,200,30,200,25,100);
  triangle(30,200,50,200,40,75);//draw plant leaves
    
  stroke(255,255,0);
  strokeWeight(random(3));
  fill(255,255,255);
  ellipse(mouseX,mouseY,10,5);//draw a lonely firefly follow the mouse position
}
}

class Fly{ //draw a class for Firefly
  float x=random(150,50);
  float y=random(150,50);
  float x1=random(50,150);
  float y1=random(50,150);
  Fly(){
  }
  void update (){
    x=x+random(-2,2);
    y=y+random(-2,2);
   x1=x1+random(-1,1);
    y1=y1+random(-1,1);
  }
  void display(){
    strokeWeight(random(3));
    stroke(255,255,0);
    fill(255,255,255);
   ellipse(x,y,10,5);
   ellipse(x1,y1,10,5);
}
}

