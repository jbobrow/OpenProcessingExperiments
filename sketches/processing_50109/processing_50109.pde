
int index = 0;
float pos[][] = new float[20][2];
float horizontalShift[]={-15,-10,-7,-5,-3,0,0,0,3,5,7,10,15};
//float horizontalShift[] = {-5, -3, -2, -1, -1, 0, 0, 0, 1, 1, 2, 3, 5};
float verticalShift[]={0,3,5,7,10,10,15,20};
//float verticalShift[] = {0, 1, 2, 2, 3, 3, 4, 5};
  

void setup() {
 size(600, 600);
 smooth();
 frameRate(30);

 for (int i = 0; i < 20; i++) {
   pos[i][0] = 0;
   pos[i][1] = 0;
 }
}

void draw() {
 background(0);
 stroke(255);
 pos[index][0] = mouseX;
 pos[index++][1] = mouseY;
 // PImage snowFlake=loadImage("snowflake.png");
   // snowFlake.resize(30,0); 
 if (index >= pos.length) {
   index = 0;
 }
 for (int i = 0; i < pos.length; i++) {
   fill(random(255),random(255),random(255),128);
    ellipse(pos[i][0], pos[i][1],20,20);    
    //image(snowFlake,pos[i][0], pos[i][1]);
   //point(pos[i][0], pos[i][1]);
   int index =int(random(horizontalShift.length));
   pos[i][0] += horizontalShift[index];
   if (pos[i][0] > width)
     pos[i][0] = 0;
   if (pos[i][0] < 0)
     pos[i][0] = width;
   index = int(random(verticalShift.length));
   pos[i][1] += verticalShift[index];
   if (pos[i][1] > height) {
     pos[i][0] = random(width);
     pos[i][1] = 0;
   }
 }
}



