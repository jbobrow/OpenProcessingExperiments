
float x = 0;
float dir = 2;
float y = 0;
float ydir = 1;


// CHALLENGES:
//use random() to change direction amounts
//use += and an if statement to change some otheer variable (i.e. color, size)
  

void setup(){
  size(400,400);
  background(255);
  smooth();
}

void draw(){
  noStroke();
 
  if (x>0){
    fill(0);
  
  if (key=='r'||key=='R'){
    fill(0,25,255);
  }
  if (key=='b'||key=='B'){
    fill(0,255,0);
  }
  if (key=='g'||key=='G'){
    fill(255,0,0);
  }
  
  }

  x = x + dir;

if(x >= width){
  dir = random(-2);
}
  
if(x <= 1){
  dir = random(2);
}


y= y + ydir;
  
if(y >= height){
  ydir =random(-1);
}
  
if(y <= 0){
  ydir = random(1);
}

rect(x, y, 25,25);
  
print("direction = ");
print(dir);
print("   position = ");
println(x);
  

}



