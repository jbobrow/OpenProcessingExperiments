
void setup(){

size(250,250);
background(10,30,90);
}

//center line
void draw (){
  stroke(200,200,10,200);
  fill(200,200,10,1);
  rect(90,180,100,50);
strokeWeight(10);
stroke(300,40,20);
line(1,200,200,200);

//bottom line
strokeWeight(2);
point(random(50),50);

//top line
strokeWeight (10);
point (random(400),70);

//rectangle of dots
stroke(200,200,10);
strokeWeight(3);
point(random(100),random(120));

strokeWeight(7);
if(mousePressed){
point(mouseX,mouseY);
}

if(keyPressed){
  background(10,30,90);
  
  
}
}

