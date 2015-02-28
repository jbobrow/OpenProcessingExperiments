
float [] x = new float [1000];
float y;
float Y;
float angle;
float j;

void setup(){
  size(600,600);
  smooth();
  for (int i = 0; i < x.length; i++) {
    x[i] = random(-1000, 2000);
    y = 100;
    Y = 25;
    angle = 5;
    j = 3;
  }
}

void draw(){
  background(0);
  y += Y*sin(radians(angle));
  for(int i = 0; i < x.length; i++){
   x[i] += 10*cos(sin(y)); 
   
  
   ellipse(x[i],random(600),25,25);
   text("tah-dah",width/2,height/2);

  }
}


