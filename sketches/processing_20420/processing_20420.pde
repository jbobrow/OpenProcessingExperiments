

//StringBuffer numberTyped = new StringBuffer(); 
PFont font;

void setup() {
  size(400,400);
  font = loadFont("MyriadPro-Regular-48.vlw");
  textSize(160);
  smooth();

  }


void draw() {
  background(255);
   color myColor1 = color(255,0,0);
  color myColor2 = color(0,255,0);
  color myColor3 = color(0,0,255);
  color mixed = lerpColor(myColor1,myColor2,.75);


  stroke(myColor1);
for (int i = 0; i <= 400; i+=10) {
  line(400, 400, i, 0);
}


  stroke(myColor2);
for (int i = 0; i < 400; i+=10) {
  line(0, 400, i, 0);
}

stroke(myColor3);
for(int i=0; i<height; i+=7) {
  rect(0, i, width, .14);
}
    
    noStroke();
  fill(mixed);
  ellipse(width/2,height/2,170,170);
  
 noStroke();
    fill(255);
    text("S", 160, 260);



}




  




