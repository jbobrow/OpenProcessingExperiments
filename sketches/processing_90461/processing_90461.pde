
void setup(){
    size(400, 400);
    smooth();
    background(255);
    fill(0);
    text("Click \'w\' for a surprise!", 0, 395);
}

void draw(){
    noStroke();
    fill(#FFFF00);
    ellipse(width/2, height/2, 400, 400);
    fill(0);
    arc(130, 130, 80, 130, 0, PI*2);
    arc(270, 130, 80, 130, 0, PI*2);
    noFill();
    strokeWeight(7);
    stroke(0);
    arc(210, 240, 240, 220, 0, PI);
    if(keyPressed) {
    if(key == 'w'){
        noStroke();
        fill(#FFFF00);
        arc(132, 130, 86, 134, 0, PI*2);
        noFill();
        strokeWeight(5);
        stroke(0);
        arc(130, 130, 80, 130, 0, PI);
        } else {
        }
        }
  }
