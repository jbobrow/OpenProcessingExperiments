
var csslink = document.getElementsByTagName("link")[0];
csslink.parentNode.removeChild(csslink);
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px;outline: none;");

final int amount = 30;
final int sz = 500;

void setup() {
  size(600,600,P2D);
  smooth(8);
  noStroke();
  noLoop();
  colorMode(HSB);
  rectMode(CENTER);
}

void draw() {  
  externals.context.globalCompositeOperation = "source-over";
  externals.context.clearRect(0,0,width,height);
  
  fill(240);
  float trh = 83+(sz*sqrt(3))/2;
  triangle(width/2,83,50,trh,550,trh);
  
  externals.context.globalCompositeOperation = "source-atop";
  float h = random(0,360);
  
  for(int i = 0; i < amount; i++) {
    fill(h,random(128,255),random(20,255),random(20,200));
    rotate(random(0,TWO_PI));
    rect(width/2,height/2,10*width,random(10,50));
    resetMatrix();
    triangle(random(0,width),random(0,height),random(0,width),random(0,height),random(0,width),random(0,height));
  }
  
  paper(50);
}

void paper(int in_val) {
  noStroke();
  for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(85-10, 85+10), in_val);
      rect(i, j, 2, 2);
    }
  }
 
  for (int i = 0; i<30; i++) {
    fill(random(40, 60), random(in_val*2.5, in_val*3));
    rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}

void mousePressed() {
  redraw();
}
