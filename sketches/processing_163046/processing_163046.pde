
PImage kick1, kick2;
 
void setup() {
size(600,350);
background(0,0,0);
kick1 = loadImage("http://media.t3.com/img/resized/ba/xl_bale%20web%203.jpg");
kick2= loadImage("https://lh3.googleusercontent.com/-PpL9cji_MyQ/Ufef3er50SI/AAAAAAAACRk/9dgswFYq3Xc/w620-h352-no/Gareth+Bale+FIFA+14.jpg");

  
}
  
void draw() {
  
rect(180,180,50,50);
fill(0,255,255);
 
if ((mouseX>180)&&(mouseY>180)&&(mouseX<230)&&(mouseY<230)){
fill(255,0,0);
}
if(mousePressed && (mouseButton == LEFT)){
image(kick1, 0, 0);

}
 
if (mousePressed && (mouseButton == RIGHT)) {    
image (kick2, 0,0);
}
 
}

