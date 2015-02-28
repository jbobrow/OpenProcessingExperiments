
heavy[] heavyobjects = new heavy[42];
light[] lightobjects = new light[42];

void setup(){
  size(500,500);
  int space = width;
  int space2 = width;
  for(int i = 0; i < lightobjects.length; i++){
  lightobjects[i] = new light();
  if (space <= width){
    lightobjects[i].xp = space - 8;
    space = space - 12;
    } 
  }
   for(int i = 0; i < heavyobjects.length; i++){
  heavyobjects[i] = new heavy();
  if (space2 <= width){
    heavyobjects[i].xp = space2 - 8;
    space2 = space2 - 12;
    } 
  }
}

void draw(){
background(0);
  for (int i = 0; i < lightobjects.length; i++){
  lightobjects[i].display();
  lightobjects[i].move();
  }
  for (int i = 0; i < heavyobjects.length; i++){
  heavyobjects[i].display();
  heavyobjects[i].move();
  }
}
class heavy{
float xp;
float yp;
float speed;
float withinxscreen;
float a = random(0,255);
float b = random(0,255);
float c = random(0,255);
//properties
heavy (){
 yp = - height + 10;
 speed = + 3;
 
}

//////////////actions
void display(){
  strokeWeight(5);
  stroke(a,b,c);
  fill(a,b,c);
  rect(xp,yp,5,200);
}

void move(){
  yp = yp + speed;
  if (yp >  550){
    yp = random(- height + 100, - height  +300);
    }
  }

}
class light{
float xp;
float yp;
float speed;
float withinxscreen;
float a = random(0,255);
float b = random(0,255);
float c = random(0,255);
//properties
light (){
 yp = height + 10;
 speed = - 3;
 
}

//////////////actions
void display(){
  strokeWeight(5);
  stroke(a,b,c);
  fill(a,b,c);
  rect(xp,yp,5,200);
}

void move(){
  yp = yp + speed;
  if (yp <  - 400){
    yp = random(height + 20, height +500);
    }
  }

}


