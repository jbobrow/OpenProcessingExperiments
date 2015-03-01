
void setup() {   
  size(450, 450);
  background(255);   
}

void draw() {  
pushMatrix();
translate(10, 10);
noStroke();
rect(pmouseX,pmouseY,mouseX,width+2);
float gray=random(255);
fill(gray,50,180,gray);
}



