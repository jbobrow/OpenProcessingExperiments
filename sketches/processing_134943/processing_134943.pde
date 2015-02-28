
PImage img;

//Here are the colors:
//yellow:
color yellowlight = color(239,203,48);
color yellowmedium = color(247,164,40);
color yellowdark = color(239,117,34);

//blue:
color bluelight = color(24,182,206);
color bluemedium = color(22,161,208);
color bluedark = color(16, 115,178);

//green:
color greenlight = color(192,216,56);
color greenmedium = color(136,196,63);
color greendark = color(83,149,78);


//red:
color reddark = color(140,24,27);
color redmedium = color(238,70,35);
color redlight = color(239,117,34);

//blue grey:
color greylight =  color(34,50,64);
color greymedium = color(14,23,36);
color greydark = color(12,10,15);

//Dividing the faces;
color left;
color top;
color right;

//Sides of triangle that build the hexagon shape;
float c = 150; //Side of hexagon;
float a = cos(radians(30)) * c;
float b = sin(radians(30)) * c;

PVector v1, v2, v3, v4, v5, v6;

//Central point;
float x, y;


float randomX;
float randomY;
float randomX2, randomY2,randomX3,randomY3,randomX4,randomY4,randomX5,randomY5,randomX6,randomY6;

//Array of colors;
int[] colors = {0,1,2,3,4,5,6};

void setup() {
  size(400, 400);
  cursor(CROSS);
  noStroke();
  x = 0 + width/2;
  y = 0 + height/2;
  
  
// Randomizing the color picking;
  int index = int(random(colors.length));
//    println(colors[index]);
    if (colors[index] == 0){
    left = #C40000;
    top = #E50000;
    right = #7F0000;
} else if (colors[index] ==1){
    right = bluedark;
    left = bluemedium;
    top = bluelight;
} else if (colors[index] == 2){
    right = #60157F;
    left = #B400FF;
    top = #CB4CFF;
}  else if (colors[index] == 3){
    top = redlight;
    left = redmedium;
    right = reddark;
} else if (colors[index] == 4){
    top = yellowlight;
    left = yellowmedium;
    right = yellowdark;
} else if (colors[index] == 5){
    top = greenlight;
    left = greenmedium;
    right = greendark;
} else if (colors[index] == 6){
    top = greylight;
    left = greymedium;
    right = greydark;
}
  

  v1 = new PVector(x, y-c);
  v2 = new PVector(x+a, y-b);
  v3 = new PVector(x+a, y+b);
  v4 = new PVector(x, y+c);
  v5 = new PVector(x-a, y+b);
  v6 = new PVector(x-a, y-b);
  
  randomX = random(100,310);
  randomY = random(10,130); 
  randomX2 = random(280,390);
  randomY2 = random(55,200);
  randomX3 = random(280,390);
  randomY3 = random(205,355);
  randomX4 = random(100,310);
  randomY4 = random(285,390);
  randomX5 = random(10,130);
  randomY5 = random(205,355);
  randomX6 = random(10,130);
  randomY6 = random(55,200);
  

  img = loadImage("gvg.png");

}

void draw() {
  background(50);


  fill(top);
  beginShape();
  vertex(v1.x, v1.y);
  vertex(v2.x, v2.y);
  vertex(v3.x, v3.y);
  vertex(v4.x, v4.y);
  vertex(v5.x, v5.y);
  vertex(v6.x, v6.y);
  endShape(CLOSE);
  

  fill(right);
  beginShape();
  vertex(v2.x, v2.y);
  vertex(v3.x, v3.y);
  vertex(v4.x, v4.y);
  vertex(x, y);
  endShape();

  fill(left);
  beginShape();
  vertex(v4.x, v4.y);
  vertex(v5.x, v5.y);
  vertex(v6.x, v6.y);
  vertex(x, y);
  endShape();
    
  v1.lerp(randomX,randomY,0,0.09);
  v2.lerp(randomX2,randomY2,0,0.09);
  v3.lerp(randomX3, randomY3,0,0.09);
  v4.lerp(randomX4,randomY4,0,0.09);
  v5.lerp(randomX5,randomY5,0,0.09);
  v6.lerp(randomX6,randomY6,0,0.09);

  image(img, 0, 0);
  
//    saveFrame("######.tga"); 

}

void mouseReleased() {
  setup();

}


void keyPressed() {
  if (key == '1') {
    left = #C40000;
    top = #E50000;
    right = #7F0000;
  }
  if (key == '2') {
    right = bluedark;
    left = bluemedium;
    top = bluelight;
  }
  if (key == '3') {
    right = #60157F;
    left = #B400FF;
    top = #CB4CFF;
  }
  if (key == '4'){
    top = redlight;
    left = redmedium;
    right = reddark;
  }
  if (key == '5'){
    top = yellowlight;
    left = yellowmedium;
    right = yellowdark;
  }
  if (key == '6'){
    top = greenlight;
    left = greenmedium;
    right = greendark;
  }
  if (key == '7'){
    top = greylight;
    left = greymedium;
    right = greydark;
  }
  if (key == 's'){
   saveFrame("gvglogo/###.tif");
  }
}



