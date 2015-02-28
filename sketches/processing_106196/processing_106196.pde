
//arrays:



//inside setup





//////////////////////////////////////////////////////////////////////////////////////
circle[] group = new circle[20];

void setup(){
  size(500,500);
  for(int i = 0; i<group.length; i++){
  float h = random(30,40);
  float s = random(30,40);
  group[i] = new circle(h,s);
}
}


void draw(){
background(255);
for(int i = 0; i<group.length; i++){
  group[i].move();
  group[i].display();
}
}


//they appear at different times: DONE
//a random number of pojectiles fall: 


class circle {
  float xp;
  float yp;
  float he;
  float si;
  float y;
  float a = random(0,255);;
  float b = random(0,120);
  float c = random(0,255);
  
  circle(float h, float s){
  yp = y;
  he = h;
  si = s;
  }
  
  void move(){
  if (yp >= 500){
    randomiser();
    float randomnumberup = random(-500,0);
    yp = randomnumberup;
    }
  else{
    float randomspeed = random(1,6);
    yp = yp + randomspeed;
    }
  }
  
  void display(){
    noStroke();
    fill(a,b,c);
    rect(xp,yp,he,si);
  }
  
  void randomiser(){
    xp = random(5,480);
  }

}



