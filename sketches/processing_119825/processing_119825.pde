
Star[] stararray = new Star[100];


void setup(){
 // smooth();

size (400,300);

for (int i =0; i<stararray.length; i++){
  stararray[i] = new Star(random(width),random(height),2);
}



}

void draw(){
background(0);



for(int i =0; i<stararray.length; i++){
stararray[i].display();
}

for(int i =0; i<stararray.length; i++){
stararray[i].move();
}
  
}

class Star {

  //declare variables
  float s;
  float x;
  float y;

  //constructor
  Star(float x_,float y_,float s_) {

    s = s_;
    x = x_;
    y = y_;
  }

  //functions
  void display() {
    //noStroke();
    fill(255);
    ellipse(x, y, s, s);
  }
  // move
  void move(){
  x+=1;
  y+=1;
  
  // if x goes out of screen bring back on the oposite side
  if(x<0){
  x = width;
}  
    if(x>width){
  x = 0;
  }
  // if y goes out of screen bring back on the oposite side
   if(y<0){
  y = height;
  }  
    if(y>height){
  y = 0;
  }
  
  
  }
  
}

