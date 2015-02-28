
void setup() {
  size(300,300);
  smooth();

  frameRate(60);
}

float a=0.0;
void draw() {
 
  background(random(255),random(255),random(255));
 fill(random(255),random(255),random(255));
  ellipse(150,150,180,180);
 fill(random(255),random(255),random(255));
  ellipse((sin(a)*5+150),(cos(a)*5+150),sin(a)+10,cos(a)+10);
  fill(random(255),random(255),random(255));
  ellipse((cos(a)*10+150),(sin(a)*10+150),sin(a)+10,cos(a)+10);
   fill(random(255),random(255),random(255));
  ellipse((sin(a)*15+150),(cos(a)*15+150),sin(a)+10,cos(a)+10);
 fill(random(255),random(255),random(255));
  ellipse((cos(a)*20+150),(sin(a)*20+150),sin(a)+10,cos(a)+10);
 fill(random(255),random(255),random(255));
  ellipse((sin(a)*25+150),(cos(a)*25+150),sin(a)+10,cos(a)+10);
 fill(random(255),random(255),random(255));
  ellipse((cos(a)*30+150),(sin(a)*30+150),sin(a)+10,cos(a)+10);
 fill(random(255),random(255),random(255));
  ellipse((sin(a)*35+150),(cos(a)*35+150),sin(a)+10,cos(a)+10);
  fill(random(255),random(255),random(255));
  ellipse((cos(a)*40+150),(sin(a)*40+150),sin(a)+10,cos(a)+10);
  fill(random(255),random(255),random(255));
  ellipse((sin(a)*45+150),(cos(a)*45+150),sin(a)+10,cos(a)+10);
 fill(random(255),random(255),random(255));
  ellipse((cos(a)*50+150),(sin(a)*50+150),sin(a)+10,cos(a)+10);
   fill(random(255),random(255),random(255));
  ellipse((sin(a)*55+150),(cos(a)*55+150),sin(a)+10,cos(a)+10);
 fill(random(255),random(255),random(255));
  ellipse((cos(a)*60+150),(sin(a)*60+150),sin(a)+10,cos(a)+10);
 fill(random(255),random(255),random(255));
  ellipse((sin(a)*65+150),(cos(a)*65+150),sin(a)+10,cos(a)+10);
fill(random(255),random(255),random(255));
  ellipse((cos(a)*70+150),(sin(a)*70+150),sin(a)+10,cos(a)+10);
  fill(random(255),random(255),random(255));
  ellipse((sin(a)*75+150),(cos(a)*75+150),sin(a)+10,cos(a)+10);
 fill(random(255),random(255),random(255));
  ellipse((cos(a)*80+150),(sin(a)*80+150),sin(a)+10,cos(a)+10);
 fill(random(255),random(255),random(255));
  ellipse((sin(a)*85+150),(cos(a)*85+150),sin(a)+10,cos(a)+10);
 fill(random(255),random(255),random(255));

  

  a=a+(0.05);
}


