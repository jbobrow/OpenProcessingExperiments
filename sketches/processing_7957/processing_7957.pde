
PImage food, food2;
int columns, rows, columns2, rows2;
int cellsize = 3;

int[][] values;

void setup(){
  size(640, 480, P3D);
  food = loadImage("rat.png");
  //food2 = loadImage("pig.png");
  food.loadPixels();
  //food2.loadPixels();
  values = new int[food.width][food.height];
  
  columns = food.width / cellsize;
  rows = food.height / cellsize;
  
  //columns2 = food2.width / cellsize;
  //rows2 = food2.height / cellsize;
  
  for (int y = 0; y < food.height; y++){
    for (int x = 0; x < food.width; x++){
      color pixel = food.get(x, y);
      values[x][y] = int (brightness(pixel));
    }
  }
}

void draw(){
  background(0);

   float sx = map(width-mouseX, 0, width/2, 0, width);
        
   for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      
      
      int x = i * cellsize + cellsize/2;
      int y = j * cellsize + cellsize/2;
      
      int loc = x + y * food.width;
      
      color c = food.pixels[loc];  

      float z = (sx / float(width)) * brightness(food.pixels[loc]) + 20;

      pushMatrix();
      //scale(0.5);
      translate(0, height/4);
      translate(x, y, z);
      fill(c);
      noStroke();
      //point(x, y, -values[x][y]);
      //stroke(values[x][y]);
      rectMode(CENTER);
      int y2 = constrain(y, height/2, height);
      //rect(i, j, cellsize, cellsize); //play with coords
      box(10);
      popMatrix();
    }
   }
   
//   for (int a = 0; a < columns2; a++){
//     for (int b = 0; b < rows2; b++){
//       
//      int x = a * cellsize + cellsize/2;
//      int y = b * cellsize + cellsize/2;
//      
//      int loc = x + y * food2.width;
//      
//      color d = food2.pixels[loc];
//      
//      float z = (sx / float(width)) * brightness(food2.pixels[loc]) + 20;
//      
//      pushMatrix();
//      //scale(0.5);
//      translate(50, height/4);
//      translate(x, y, z);
//      fill(d);
//      noStroke();
//      //point(x, y, -values[x][y]);
//      //stroke(values[x][y]);
//      rectMode(CENTER);
//      //int y2 = constrain(y, height/2, height);
//      //rect(a, b, cellsize, cellsize); //play with coords
//      box(10);
//      popMatrix();
//     }
//   }
   
}

