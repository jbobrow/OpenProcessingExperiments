
void setup(){
size(500, 500);
}

void draw(){
  background(204);
fill(11, 249, 255);
//if(keyPressed){
rect(100+mouseX, 150+mouseY, 300, 150);

stroke(255);
bezier(160+mouseX, 200+mouseY, 195+mouseX, 180+mouseY, 210+mouseX, 220+mouseY, 220+mouseX, 200+mouseY);
bezier(310+mouseX, 200+mouseY, 345+mouseX, 180+mouseY, 365+mouseX, 220+mouseY, 375+mouseX, 200+mouseY);
bezier(140+mouseX, 250+mouseY, 175+mouseX, 230+mouseY, 190+mouseX, 270+mouseY, 200+mouseX, 250+mouseY);
bezier(220+mouseX, 250+mouseY, 255+mouseX, 230+mouseY, 270+mouseX, 270+mouseY, 280+mouseX, 250+mouseY);
bezier(300+mouseX, 250+mouseY, 335+mouseX, 230+mouseY, 350+mouseX, 270+mouseY, 360+mouseX, 250+mouseY);
//}
fill(255, 255, 255);
rect(225, 310, 50, 50);
stroke(255, 0, 0);
strokeWeight(4);
line(250, 320, 250, 350);
line(235, 335, 265, 335);

//save("pool2.jpg");
}

