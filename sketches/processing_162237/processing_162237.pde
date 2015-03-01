
void setup() {
  size(200, 200);
}

void draw() {
  background(255);
  stroke(0);              //描边为黑色
  line(100, 0, 100, 200); //绘制垂直线
  line(0, 100, 200, 100); //绘制水平线
  
  noStroke(); //不描边
  fill(0);    //填充黑色
  
  if (mouseX < 100 && mouseY < 100) {        //鼠标移动到左上角时
    rect(0, 0, 100, 100);
  } else if (mouseX > 100 && mouseY < 100) { //鼠标移动到右上角时
    rect(100, 0, 100, 100);
  } else if (mouseX < 100 && mouseY > 100) { //鼠标移动到左下角时
    rect(0, 100, 100, 100);
  } else if (mouseX > 100 && mouseY > 100) { //鼠标移动到右下角时
    rect(100, 100, 100, 100);
  }
}
