
int counter;


PImage TimesSquare;
float speed= 2.0;
float move;


void setup() {  //setup function called initially, only once
  size(600, 400);
  background(90,70,205);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  
  //size(200,400);
  TimesSquare=loadImage("http://images.fineartamerica.com/images-medium-large/times-square-menucha-citron.jpg"); 
}

void draw() {  //draw function loops 
  
  move=move+speed;
  image(TimesSquare, move, 10);
  if (move > 400) {
  move=5;
  }
  
  {
 
 //textSize(72);
//text("Times Square", 50, 200); 
//fill(25, 0, 0);

//(600,600);
//background(255);

johnFont = loadFont("PalatinoLinotype-Italic-48.vlw");
textFont(johnFont);

textSize(72);
fill(205,55,20);
text("Times Square", 100, 100, 50);
}
  
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
 ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
 ellipse(width/2, height/1, 80*sin(counter), 80*sin(counter));
 ellipse(width/2, height/3, 80*sin(counter), 80*sin(counter));
 ellipse(width/2, height/5, 80*sin(counter), 80*sin(counter));
 ellipse(width/2, height/9.5, 80*sin(counter), 80*sin(counter));
 ellipse(width/2, height/1.5, 80*sin(counter), 80*sin(counter));
 ellipse(width/2, height/1.3, 80*sin(counter), 80*sin(counter));
 ellipse(width/2, height/1.1, 80*sin(counter), 80*sin(counter));
 


 
 
  }
}
