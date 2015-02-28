
void setup(){
size(500,500);
background(15,240,96);
textSize(50);
textAlign(CENTER);
text("Colorful Blocks", height/2,45);
}
void draw(){
fill(255);
noStroke();
rect(50,200,90,90);  //left square
rect(190,200,90,90);  //middle square
rect(330,200,90,90);   //right square
// mouse is around this range of values, the left square turns black
if (mouseX > 50 && (mouseX < 120)){
  if (mouseY > 200 && (mouseY < 290)){
    if (mousePressed == true){
      fill(190,80,12);
      rect(50,200,90,90);
      }
    else {
      fill(0);
      rect(50,200,90,90);
      }
    }
  }
// mouse is around this range of values, the middle square turns black
if (mouseX > 190 && (mouseX < 260)){
  if (mouseY > 200 && (mouseY < 290)){
    if(mousePressed){
      fill(245,222,7);
      rect(190,200,90,90);
      }
    else{
      fill(250,18,45);
      rect(190,200,90,90);
      }
    }
}
// mouse is around this range of values, the right square turns black
if (mouseX > 330 && (mouseX < 400)){
  if (mouseY > 200 && (mouseY < 290)){
    if(mousePressed){
      fill(24,245,5);
      rect(330,200,90,90);
    }
    else{
      fill(250,18,250);
      rect(330,200,90,90);
      }
   }
}
}


