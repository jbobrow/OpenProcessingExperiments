
void setup() {
  size(700,400 );//set the size first

  background(0);//and also the background color
 }

void draw() {//you can move your mouse to draw a vertical line on the screen
  int a;//the key factor determine the color of the stroke
  a=100;
if(mousePressed){
    a=a*-1;
}else{
}

  if(a<0){
    stroke(225);
  }else{
    stroke(#FF0307);//when pressed the mouse,a will be smaller than 0,so the stroke will be white,else it will be red
  }
  
  line(mouseX, mouseY-45, mouseX, mouseY+45); 
}


void mouseClicked(){
  background(0);//click the mouse the paint will be cleaned
}
