
solid[] solidobjects = new solid[42];

void setup(){
  size(500,500);
  int space = height;
  for(int i = 0; i < solidobjects.length; i++){
  solidobjects[i] = new solid();
  if (space <= width){
    solidobjects[i].yp = space - 8;
    space = space - 12;
    } 
  }
}

void draw(){
background(0);
  for (int i = 0; i < solidobjects.length; i++){
  solidobjects[i].display();
  solidobjects[i].move();
  }
}
class solid{
float xp;
float yp;
float speed;
float withinyscreen;
float a = random(0,255);
float b = random(0,255);
float c = random(0,255);
//properties
solid (){
 xp = - width + 10;
 speed = - 3;
 
}

//////////////actions
void display(){
  strokeWeight(5);
  stroke(a,b,c);
  fill(a,b,c);
  rect(xp,yp,200,5);
}

void move(){
  xp = xp + speed;
  if (xp <  - 400){
    xp = random(- height + 20, - height +500);
    }
  }

}


