
int counter = 200;
float rot = 0;
boolean raise = true;

void setup() {  
  size(400, 400);
  background(0);  
  colorMode(RGB);  
  rectMode(CENTER);
}

void draw() {  
    noStroke();
    fill(0,30);
    rect(width/2, height/2,width,height);
    if(raise){
        counter++;
        rot+=PI/20;
    } else {
        counter--;
        rot+=PI/80;
    }
    if(counter>width-150 || counter < 50) raise = !raise;
    stroke(random(160),random(160),random(160),255);
    fill(0,0);
    strokeWeight(2);
    pushMatrix();
    translate(width/2, height/2);  
    rotate(rot); 
    rect(0, 0, counter, counter);
    rect(0, 0, counter/2, counter/2);
    strokeWeight(4);
    point(0,0);
    popMatrix();
    
}


