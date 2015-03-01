

void setup() {   
size(500,500);
frameRate(15); //refresh rate is 15 fps
}

void draw() {  
stroke(random(255),random(255),random(255)); //outline randomly changes color
 
mouseCon();
drawImage1(mouseX, mouseY);
keyCon();
rectMode(CENTER);
//loops until a rectangle the size of 180 width and height becomes 40 width and height
for (int wh = 180; wh >40; wh--){  
  rect(random(100,250),random(100,255),wh,wh); //rectangles is draw at random coordinates within 100 and  250
  
}
}

//circle is drawn and follows the mouse
void drawImage1(float x, float y){
 
ellipse(x +2, y+5, 40,40);

fill(second() * 10,second()* 5,second()+5); //fill changes with the seconds on pc

}

//rectangle is drawn and follow mouse
void drawImage2(float x, float y){
rect(mouseX,mouseY,pmouseX,pmouseY);
}

//only runs when mouse is clicked
void mouseCon(){
  if(mousePressed) {
drawImage1(mouseX,mouseY);
    background(random(255),random(255),random(255)); //random color background
  }
}

//only runs when any key is pressed
void keyCon(){
if(keyPressed){
background(random(255), random(255), random(255));//for (v = 0; v < 255; v += .5){
fill(random(200));
drawImage2(mouseX,mouseY);

}

}



