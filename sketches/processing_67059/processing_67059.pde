
// EXERCICE WITH BARS, PART I
PFont tit, labelsTit; // variable for text tits
int[] alto = {
  150, 280, 380, 350, 390, 280, 320, 390, 250, 240, 220
};
int[] labels = {
  150, 280, 380, 350, 390, 280, 320, 390, 250, 240, 220
};
int w = width; // width elements
int h = height; // height elements
int dis = 40; // distance from borders 
int disB = dis*2; // disB distance from border 
color col=255; // color value

void setup() {
  size(700, 600);
  title();
  fill(50, 50, 50);
}

void draw() {
  background(100, 110, 100);

  int w2 = width-disB;
  int h2 = height-disB;

  pushMatrix();  
  translate(dis, dis); 
  for (int i=0; i < alto.length; i++) {
    int resto = w2/alto.length; // Widht total x data

//COLORS
    float colNew = map(alto[i], min(alto), max(alto), 10, 255); // mapeo for bar colors
    rectMode(CENTER);    //    
    noStroke();
if(mouseX > (resto*i+40) ){
    fill(colNew, 200, 0); // color bars
  }else{
    fill(colNew, 100, 0); // color bars 
}
 
 if(keyPressed == true){
    ellipse(resto*i+30, h2/2, resto-3, resto-3 ); // draw the blocks 
}else{
  rect(resto*i+30, h2/2, resto-3, alto[i] ); // draw the blocks 
} 

 


// Lines axis x y
    stroke(colNew, 0, 0);
    line(0, h2, w2, h2); //abcisa X
    line(60*i, h2, 60*i, h2+10); //lineas X
    line(0, 0, 0, h2); //ordenada Y
    line(0, 50*i, -10, 50*i); //lineas X

// TITS BARRAS
    fill(255); // text color  
    textMode(CENTER);
    textSize(10);
    text(labels[i], resto*i+11, h2/2, 10);
  }
  popMatrix();
}

// Function for text
void title() {  
  pushMatrix();
    tit = loadFont("BellGothic-Black-48.vlw");
  labelsTit = loadFont("BellGothic-Black-48.vlw");
  smooth();
  translate(dis, dis/1.9); // move titles on top
  textSize(18); // title top text size 
  text("This is the Title", 0, 0);
  textSize(12);
  fill(255);
  rectMode(CORNER);
  popMatrix();
}




