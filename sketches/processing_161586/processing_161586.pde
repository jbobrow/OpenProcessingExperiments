
String B1="Button1"; 
String B2="Button2"; 
PFont f;
color b = color(0,0,255); 
color w = color(255);
PImage photo1;

void setup() { //setup function called initially, only once 
size(800, 400); 
background(0,255);
f = createFont("Arial",16,true); // STEP 3 Create Font 
noStroke();
}
 
void draw() { //draw function loops 
//cursor(HAND);
//image(photo1,800, 400,0,0);
//photo = loadImage("http://www.123twitterheaders.com/wp-content/uploads/2012/10/Bokeh-Background.jpg");
rect(170,45,100,30,10,10,10,10); 
rect(500,45,100,30,10,10,10,10); 
fill(w);
/*if ((mouseX>170)&&(mouseY>45)&&(mouseX<270)&&(mouseY<75)){

}
*/
text(B1, 200, 65);
text(B2, 530, 65);
fill(b);
textFont(f,16);
fill(b);
}

void mousePressed() {
  if ((mouseX>170)&&(mouseY>45)&&(mouseX<270)&&(mouseY<75)) {
  }
  if ((mouseX>500)&&(mouseY>45)&&(mouseX<600)&&(mouseY<75)) {
    background(0,255,0);
   
  }
}
