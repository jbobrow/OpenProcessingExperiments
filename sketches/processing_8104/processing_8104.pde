
float theta_hour;
float theta_min;

PFont font;


void setup(){
  size(300,300);
  noStroke();
  smooth();
  font = loadFont("AgencyFB-Bold-58.vlw");
  textFont(font);
  textAlign(CENTER);  
}

void draw(){

  background(200); 

  theta_hour=PI*(hour()%12)/6 + PI*minute()/360 - PI/2;
  theta_min=PI*minute()/30 + PI*second()/1800 - PI/2;

  eye(75,80,70,50,theta_hour);
  eye(225,80,70,50,theta_min);
  
  String s =  str(hour()%12);
  if (s.length()==1) s= "0" + s;
  String m = str(minute());
  if (m.length()==1) m= "0" + m;
  s= s + ":" + m;
  
  text(s,150,250);
}

void eye(int x, int y, int rad_b, int rad_s, float theta){

  int rad_pos = rad_b-rad_s;
  fill(255);
  ellipse(x,y,2*rad_b,2*rad_b);

  fill(0);
  ellipse(x + rad_pos*cos(theta),y+rad_pos*sin(theta),2*rad_s,2*rad_s);
}


