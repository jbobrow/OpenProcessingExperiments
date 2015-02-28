
float i= 0;
void setup(){
  size(500,500);
  smooth();
}

void draw(){
  noCursor();
  fill(0,i);
  rect(0,0,width, height);
  stroke(random(255),random(255),random(255));
  line(random(0,200), random(0,200), 500,500);
  line(random(0,200), random(0,200), 0,0);
  line(random(0,200), random(0,200),0,500);
  line(random(0,200), random(0,200),500,0);
  line(random(0,200), random(0,200),250,0);
  line(random(0,200), random(0,200),250,500);
  line(random(0,200), random(0,200),0,250);
  line(random(0,200), random(0,200),500,250);
  line(random(0,200), random(0,200), 500,500);
  line(random(0,200), random(0,200), 0,0);
  line(random(0,200), random(0,200),0,500);
  line(random(0,200), random(0,200),500,0);
  line(random(0,200), random(0,200),250,0);
  line(random(0,200), random(0,200),250,500);
  line(random(0,200), random(0,200),0,250);
  line(random(0,200), random(0,200),500,250);
  if(i<30){
  i=i+0.1;
  }
  else i=0;
println(i);
}


