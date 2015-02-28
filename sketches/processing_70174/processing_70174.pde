
/* Art Through Evolution v0.1
* Tonje Stolpestad tstolpestad@gmail.com
* Sept '12

*Load a picture, create new blank canvas based on size
*Start creating squares in random places on the canvas
*

*/

PImage goal;
color[][] parent;
int fitParent;


void setup(){
 goal = loadImage("gold_star_black_background1.jpeg");
 size(goal.width * 3 +10, goal.height);
 goal.loadPixels();
 parent = new color[goal.width][goal.height];
 
 for (int j = 0; j < goal.height;j++){
  for (int i = 0; i< goal.width; i++){
   parent[i][j] = color(0,0,0);
  } 
 }
 
 
 //size(goal.width * 3 +10, goal.height);
 image(goal, goal.width*2+10, 0);
 frameRate(20);
 fitParent = 300000000;

  

}

void draw(){
  
 color[][] child = new color[goal.width][goal.height];
 
 for (int j = 0; j < goal.height;j++){
  for (int i = 0; i< goal.width; i++){
   child[i][j] = parent[i][j];
  } 
 }

 //create random Square
 int xcoor = int(random(goal.width));
 int ycoor = int(random(goal.height));
 int slen = int(random(300));
 int r = int(random(256));
 int g = int(random(256));
 int b = int(random(256));
 
 
 // Add to child
 for (int j =ycoor; j<ycoor+slen;j++){
    for (int i =xcoor; i<xcoor+slen;i++){
      if (i< goal.width && j <goal.height){
        child[i][j] = color(r,g,b);
      }
    } 
 }

 
  drawArray(parent, 0,0);
  drawArray(child, goal.width +5,0);
 
  int childOffset =0;
  //println("Testing fitness");
  for (int i =0; i< goal.height; i++){
    for(int j = 0; j<goal.width; j++){
     color goalC = goal.get(j,i);
     color childC = child[j][i];
     int diff = abs(int((red(goalC) - red(childC)) + (blue(goalC)-blue(childC)) + (green(goalC)-green(childC))));
     childOffset += diff;
    }
  }
  if (childOffset < fitParent){
    //println("updating parent ");
     for (int j =0; j<goal.height;j++){
    for (int i =0; i<goal.width;i++){
      parent[i][j] = child[i][j];
    } 
 }
    fitParent = childOffset;
  }
  //println(childOffset);
  if(childOffset < 100){
    println("Exit");
    exit();
  }
  
}

void drawArray(color[][] pixArray,int xstart,int ystart){
  for (int j = 0; j< goal.height; j++){
   for(int i = 0; i< goal.width; i++){
     set(xstart+i, ystart+j, pixArray[i][j]);
   } 
  }
  
}

