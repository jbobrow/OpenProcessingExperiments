
PImage a, c, p, b ;
PFont f;


void setup() {
  size(360,600);
  background(0);
  stroke (255);

  //image

  a = loadImage("airplane.jpg");
  c = loadImage("car.jpg");
  p = loadImage("person.jpg");
  b = loadImage("as.jpg");


  f = loadFont("PNHHoliday-48.vlw");
  textFont(f);
  smooth();
}

void draw() {
  //image
  // background(255);

  smooth();
 
  int s2 = second();
  int m2 = minute();
  int h2 = hour();

  String time = nf( h2, 2)+ " : " + nf( m2, 2) +" : " + nf( s2, 2); 
  
  textAlign(CENTER);  

  text(time,180,430);

  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;  
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;  
  float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;  

  strokeWeight(1);  

  line(175, 200, cos (s) * 100 + 175, sin(s) * 100 + 200);  



  PImage img = loadImage("a.jpg");  


  




  imageMode(CENTER);


  image(a,cos(s)*140+180,sin(s)*140+180,80,50);  

  image(c,cos(m)*100+180,sin(m)*100+180,50,30);  

  image(p,cos(h)*70+180,sin(h)*70+180,30,50);
 
}


