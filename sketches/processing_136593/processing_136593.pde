
int x = 0;
int xdir;

float t1 = 0;
float t2 = 0;
float t3 = 0;
float t4 = 0;

void setup(){
  size(500,500);
  background(13,68,139);
}

void draw(){
  
  x += xdir;
  if (x >= 200){
    xdir = -5;
  }
  if (x <=0){
    xdir = 5;
  }
  
  t1 = map(x,0,100,25,50);
  t2 = map(x,0,100,50,150);
  t3 = map(x,0,150,390,411);
  t4 = map(x,0,150,440,484);
  
    if (mouseButton == LEFT){
    background(111,0,56);
  }
  if (mouseButton == RIGHT){
    background(13,68,139);
  }
  
  if (key == 'b' || key == 'B'){
    fill(31,98,183);
    triangle(t1,419,61,311,mouseX,mouseY);
  }
  if (key == 'g' || key == 'G'){
    fill(0,142,100);
    triangle(mouseX,mouseY,t2,202,314,239);
  }
  if (key == 'p' || key == 'P'){
    fill(122,90,165);
     triangle(mouseX,mouseY,t3,146,364,49);
  }
  if (key == 'v' || key == 'V'){
    fill(57,66,118);
    triangle(mouseX,mouseY,t4,39,435,16);
  }
    

}



