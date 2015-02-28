
float ang = 0;

String letter = "A";

void setup(){
 size(400,400);
 font = createFont("Arial",12);
 textFont(font);
 textAlign(CENTER,CENTER);
  
}

void draw(){
 background(255);
 fill(0,100);
 pushMatrix();
  translate(width/2,height/2);
  rotate(ang);
  textSize(300);
  text(letter,0,0);
 popMatrix();
 ang+=0.005;
}
