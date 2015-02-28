
int value = #00BEFF;


void setup(){
size(600, 600);
smooth();
noStroke();
background(255);
rectMode(CENTER);
fill(150);
text("Click the mouse anywhere", 0, height-=5);
}

void draw(){
  fill(value);
       rect(width/2, height/2, 550, 550);
   if(mousePressed){
       for(int d = 2; d < 15; d ++){
       strokeWeight(2);
       stroke(255);
       ellipse(mouseX, mouseY, d, d);
       point(mouseX+=random(5), mouseY+=random(5));
       }
}
}
  
void mousePressed(){
    if(value==#00BEFF){
    value = #FF006E;
    } else {
    value = #00BEFF;
    }
}

