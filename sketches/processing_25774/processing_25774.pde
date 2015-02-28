

//Information is taken from Math Processing book
//Brian Pittman
//PImage alphaImg;



float x, y, angle;
float radius;



void setup () {
  background(58, 99, 99);
  size(900, 900); 
  //alphaImg = loadImage ("rooster.png");

   x = 0;
   y = 0;
   angle = 0;
   radius = 0;
   smooth();
}

void draw(){

    x = cos(radians (angle)) * 500 + width/2;

    y = sin(radians (angle)) * 600 + height/2;
    
 beginShape();
   for (int i = 0; i <=300; i++){  


}

  angle ++;
  radius +=.1;
  float sleeplight = cos(radians(angle));
  sleeplight = map(sleeplight, -1, 1, 100, 200);

  fill(250, 94, 74);
  
   for (int i = 0; i <=8; i++){
 // 360 degress divided by the Number of sides
 float yHex = sin(radians(i*60)) * radius + y;
 float xHex = cos(radians(i*60)) * radius + x;
 vertex(xHex, yHex);
 
}
  endShape();
}


