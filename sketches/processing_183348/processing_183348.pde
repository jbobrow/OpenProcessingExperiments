

void setup() {

  frameRate(4);
  size(400,400);
    background (#daf6e9);

}

void draw() {

    
  fill(random(250),random(250),random(250));
  rect(200,300,100,50);
  
  fill(random(250), random(250), random(250));
  rect(50,200,30,300);

  fill(random(250), random(250), random(250));
  rect(200,300,100,127);
  
   fill(random(250), random(250), random(250));
  rect(random(300),30,50,75);
  
  stroke(random(250), random(250), random(250));
  line(20,20,380,20);
  
  stroke(random(250), random(250), random(250));
  line(20,20,20,380);
  
  stroke(random(250), random(250), random(250));
  line(20,20,380,380);
  
  stroke(random(250), random(250), random(250));
  line(380,380,20,380);
  
  stroke(random(250), random(250), random(250));
  line(380,380,380,20);
  
  
}
