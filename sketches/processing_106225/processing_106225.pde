
fluid[] fluidobjects = new fluid[42];
solid[] solidobjects = new solid[42];
heavy[] heavyobjects = new heavy[42];
light[] lightobjects = new light[42];

void setup(){
  size(500,500);
  int space = height;
  int space2 = height;
  int space3 = height;
  int space4 = height;
  for(int i = 0; i < fluidobjects.length; i++){
  fluidobjects[i] = new fluid();
  if (space <= width){
    fluidobjects[i].yp = space - 8;
    space = space - 12;
    } 
  }
  for(int i = 0; i < solidobjects.length; i++){
  solidobjects[i] = new solid();
  if (space2 <= width){
    solidobjects[i].yp = space2 - 8;
    space2 = space2 - 12;
    } 
  }
  for(int i = 0; i < lightobjects.length; i++){
  lightobjects[i] = new light();
  if (space3 <= width){
    lightobjects[i].xp = space3 - 8;
    space3 = space3 - 12;
    } 
  }
  for(int i = 0; i < heavyobjects.length; i++){
  heavyobjects[i] = new heavy();
  if (space4 <= width){
    heavyobjects[i].xp = space4 - 8;
    space4 = space4 - 12;
    } 
  }
  
}

void draw(){
background(0);
  for (int i = 0; i < fluidobjects.length; i++){
  fluidobjects[i].display();
  fluidobjects[i].move();
  }
  for (int i = 0; i < solidobjects.length; i++){
  solidobjects[i].display();
  solidobjects[i].move();
  }
  for (int i = 0; i < lightobjects.length; i++){
  lightobjects[i].display();
  lightobjects[i].move();
  }
  for (int i = 0; i < heavyobjects.length; i++){
  heavyobjects[i].display();
  heavyobjects[i].move();
  }
}
class fluid{
float xp;
float yp;
float speed;
float withinyscreen;
float a = random(0,255);
float b = random(0,255);
float c = random(0,255);
//properties
fluid (){
 xp = width + 10;
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
    xp = random(height + 20, height +500);
    }
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
 xp = - width + 400;
 speed = + 3;
 
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
  if (xp >  600){
    xp = random(- height + 10, - height +300);
    }
  }

}


