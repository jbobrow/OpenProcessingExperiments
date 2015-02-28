
//底圖顏色//線顏色
void setup() {
  size(400, 400);
  stroke(50,250,50);
  background(0,0,0);
} 
//if...如果...
void draw() {
  if (mousePressed == true){
    stroke(250,60,30);
    line(180, 20, mouseX, mouseY);
    line(375, 80, mouseX, mouseY);
    line(350, 380, mouseX, mouseY);
    line(110, 390, mouseX, mouseY);
    line(10, 130, mouseX, mouseY);
    //遮蓋
    noStroke();
    //變暗
    fill(0,2); 
    ellipse( mouseX, mouseY,1000,1000);
  }
  //else...不然...
  else {
    stroke(50,60,230);
    line(10, 250, mouseX, mouseY);
    line(350, 25, mouseX, mouseY);
    line(280, 400, mouseX, mouseY);
    //遮蓋
    noStroke();
    //變暗
    fill(0,2);
    //變白
    //fill(255,2);
    ellipse( mouseX, mouseY,1500,1500);
  }
}






