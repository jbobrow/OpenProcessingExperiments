
//(c) Robb Godshaw 2012 www.robb.cc
//rsgodsha
//HW4
//Arrow keys move the sun/moon. 
//the BG gets darker as it decends.
float nH; //Noisy Hue
float x1, y1, xD, yD, n1, n2,nE,kbXa,kbYa,elC,yScaled;
float coloroff=0,yoff1=0, yoff2  = 0;
float kbX= 200;
float kbY= 200;
float inc = 10;

void setup() {
  size(400,400);//This seems like a good size.
  smooth();//Aliasing is ugly.
  noStroke();//Strokes are ugly.
  colorMode(HSB); //RGB os overrated.
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      kbY = kbY - inc;
    } else if (keyCode == DOWN) {
      kbY = kbY + inc;
    } 
    else if (keyCode == RIGHT) {
      kbX = kbX + inc;
    } 
    else if (keyCode == LEFT) {
      kbX =kbX - inc;
    } 
  } else {
   
  }
}
void draw() {
 
  // ~~~~COLOR~~~~~
coloroff = coloroff - .008;//.008 is arbitary. Played until pretty.
nH = noise(coloroff) * 255;//these values are scaled from (0-1) to (0-255) 'cuz they're colors.
println("KBY:");  
println(yScaled); //Print the Noisy Hue 
background((nH/4)+140, 255,yScaled);//set fill to noise map value
yScaled=(height-kbYa);
text("Arrow Keys Move Sun.");
kbXa=kbX%height;
kbYa=kbY%width;
//if(kbY >= 2*height/3){ background(0);  }
//else {elC = (nH/4)+40, 100, 255)} 
fill(200);
ellipse(kbXa,kbYa,nE+15,nE+15);
//HW 3 PORT
yoff1 = yoff1 + .01; //this increments the offset with which the noisey line is read
yoff2 = yoff2 + .016; //this does the same, but a little more aggressively.
n1 = noise(yoff1) * height;//this scales the noise value to match its application.
n2 = noise(yoff2) * height; //in this case, the logical denominator for the noisey value is the height
nE= noise(yoff2)* 30;
y1=kbYa+(n2/8);
xD=50;  
yD=0;  
fill((nH/2)+60, 255 ,255);//noisy green
  beginShape();

vertex(
        -50, height //X,Y first point of blob
        ); 
bezierVertex(
        50,50,  //X,Y control point for first point
        kbXa-xD,y1-yD,  //X,Y control point for second point
       kbXa,y1);  //X,Y second point
bezierVertex(
        kbXa+xD,y1+yD,//X,Y control point for second point, ineverted to keep colinear with it's doppelganger. Colinearity btwn a point and it's control points is key to illustrator smoothness.
        350,n1,//arbitrary control point with noisy component.
        2*width,2*height);//last anchor bottom corner
    
    
    endShape();
}
