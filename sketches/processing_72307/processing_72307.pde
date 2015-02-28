
// The Changing Square and Giant Eye
// Move and Click to activate 
void setup(){
size(700,700);
smooth();
}
void draw(){
  background(mouseY,mouseX,255);
for(int x = 0; x < 700; x +=10){
  for(int y = 0; y < 700; y +=10){
    if(mouseX > x && mouseX< x + 100 && mouseY > y && mouseY <y+100){
      fill(mouseX,mouseY,0);
    }else {
      noFill();
    }
    ellipse(x,y,11,11);
    //Used a bit of code from class as layout to get me started for the stuff above
  }
  }
}

void mousePressed(){
    stroke(0);
    fill(255,mouseY,mouseX);
    triangle(0,700,350,0,700,700);
    noFill();
    fill(mouseX,mouseY,100);
    ellipse(350,350,200,100);
    noFill();
    fill(mouseY,mouseX,0);
    ellipse(350,350,100,90);
    //The EYE!
}

//Had trouble with this HomeWork! 
//couldnt figure out how to do certain things so had to go fairly simple


