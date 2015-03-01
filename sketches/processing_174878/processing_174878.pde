
float x = 200; //Just setting things up!
float y = 150;

void setup() {
  size(300,400);
}

void draw() {
  background(255);
  
  stroke(51,102,204);
  fill(210);
  strokeWeight(20);
  
  line(width+2,height/2,x,y); 
  fill(204,0,0);
noStroke();
  ellipse(x,y,40,40);
  
  if (y > height-75) {
    y=0; 
  }
  
  fill(255,236,83);
noStroke();
rect(39,height-50,220,100);
 
fill(153,0,51);
rect(39,350,10,50);

fill(153,0,51);
rect(65,350,10,50);

fill(153,0,51);
rect(95,350,10,50);

fill(153,0,51);
rect(125,350,10,50);

fill(153,0,51);
rect(160,350,10,50);

fill(153,0,51);
rect(190,350,10,50);

fill(153,0,51);
rect(220,350,10,50);

fill(153,0,51);
rect(250,350,10,50);

fill(186,237,237);
noStroke();
ellipse(150,height-50,225,20);





}
void mouseDragged(){
y++;
}



