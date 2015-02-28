
//53078019 Lau Yik Kiu

void setup(){
  size (500,500); //indicate the width and height of the window
  frameRate(10); //set the speed of the programme in 10fps
}

void draw(){
float c;
c = random(10, 50);
  if (mousePressed == true){ //state the condition of pressing the mouse for loop
    noStroke(); //no outline for the filled circles
    fill(random(255),random(50),random(200),random(10,150)); //colours of the filled circles
    ellipse(mouseX, mouseY, c, c); //the coordinates of the filled circles
    noFill(); //no filling colour for the lined circles
    stroke(random(100),random(200),random(220),random(150));//the colours of the outlines for the lined circles 
    ellipse(250, 250, mouseX++, mouseY++); //the coordinates of the lined circles
  }else{//for NOT fulfilling the above condition
    background(0);//background colour of the window
    fill(255);//text colour
    textSize(25);//indicate the text size in 25pt
    text("make your life colourful :)", 95, 200);//the string which will be shown
    textSize(12);//text size for my name and sid
    text("53078019 Lau Yik Kiu", 300, 450);//my sid and my name
    }
}
