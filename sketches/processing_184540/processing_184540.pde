
// Tyler Ocwieja
// Week2_Character
// 2-5-14

// wathch hello.processing.org
// Upload sketch or character

int x = 0; // x_positon
int y = 0;// y_position
PImage mouth; //http://www.clipartpanda.com/categories/mouth-clip-art-black-and-white
PImage hair; //http://www.clker.com/cliparts/d/e/8/1/1313701356967311533Hair%20Style.svg.thumb.png
PImage body; //http://www.playbuzz.com/rachaelg/which-greek-god-are-you

void setup(){
 // executed only once
 // things you want to stay the same throughout
  background (50, 0, 100);// (r,g,b)
  size(600,600);
  frameRate(30);//60 is the max, dont go higher than 60
  println("setup done!");
  mouth = loadImage("mouth.png");
  hair = loadImage("hair.png");
  body = loadImage("greek_god.jpg");
}

void draw(){ 
  //executed every frame
  x = mouseX;
  y = mouseY;
  background(mouseX/3, mouseY/3, 0);
  rectMode(CENTER);
  println(" start to draw");
  image(body,x-45,y+127,490,490); //Body
  stroke(10,10,200); // colored boarder
  fill(100, 0,140); //Fill first so that we have color on the first frame
  ellipse(x,y,100,120); // head
  imageMode(CENTER);
  image(mouth,x,y+30,55,40); // Draw image usin center mode
  image(hair,x-7,y+20,210,210);
  fill(255, 0, 0);
  ellipse(x-20, y-15, 20, 15); //Eye Left
  ellipse(x+20, y-15, 20, 15);//Eye right
  ellipseMode(CENTER);  // Set ellipseMode to CENTER of other ellipse
  fill(0);  // Set fill to gray
  ellipse(x-20, y-15, 5, 5);  // Draw gray ellipse using CENTER mode // pupil
  ellipse(x+20, y-15, 5, 5);
  triangle(x-5, y, x+5, y, x, y+5);//nose
  println(x); // give horizontal position of mouse
  println(y); 
}


