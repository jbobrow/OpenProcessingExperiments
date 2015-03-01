
float x0 = 0;
float y0 = 0;
float x1 = 0;
float y1 = 0;
boolean lclick = false;
String stry;
String strx;
void setup() {
  size(800, 600);
  background (0);
  frameRate(15);
}
void draw() {

  fill(255);
  textSize(10);

  if (mousePressed && (mouseButton == LEFT) && lclick==false ) {
    x0=mouseX;
    y0=mouseY;  
    text( "x0,y0 ("+mouseX+"," + mouseY + ")", mouseX, mouseY-10);
    ellipse(mouseX, mouseY, 3, 3);
    println("x0("+mouseX + "," + mouseY +")");
    lclick=true;
  } 
  else if (mousePressed && (mouseButton == RIGHT) && lclick==true) {
    fill(255, 0, 0);
    x1=mouseX-x0;
    y1=mouseY-y0;
    if (y1>0) {stry="y+" + y1;}else {stry="y" + y1;}
    if (x1>0) {strx="x+" + x1;}else{strx="x" + x1;}
    text("(" + strx + "," + stry + ")", mouseX, mouseY+10);
    ellipse(mouseX, mouseY, 3, 3);
    println("("+ strx + "," + stry + ")");
  }else if(mousePressed && (mouseButton == RIGHT) && lclick==false){
  alert("please choose a center point first");
  }
}
