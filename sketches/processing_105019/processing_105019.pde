
void setup() {
 size(500,500);
 background(255);
}
 
//Lighbulb 
void draw() {
  smooth();
  stroke(20);
  fill(255);
  ellipse(250,200,250,250); //large one
  fill(90); 
  ellipse(250,350,60,60); //small one
  fill(130);
  stroke(128);
  rectMode(CENTER);
  rect(250,325,150,25);
  fill(120);


if(dist(250,200,mouseX,mouseY)<125){
  
fill(random(250),random(250),random(250));
ellipse(250,200,250,250);


}

fill(130);
rect(250,325,150,25);

}
