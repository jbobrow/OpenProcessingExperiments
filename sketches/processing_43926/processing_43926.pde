
int cols = 2;
int rows = 4;
int gap = 5;
int[] gridX = {5, 5, 5, 5, 5, 74, 74, 74, 74, 74, 143, 143, 143, 143, 143};
int[] gridY = {5, 74, 143, 212, 281, 5, 74, 143, 212, 281, 5, 74, 143, 212, 281};
int[] numR = {8, 11, 3, 12, 5, 2, 7, 13, 0, 4, 10, 6, 14, 1, 9};

PImage[] icoDef = new PImage[33];
PImage[] icoCol = new PImage[33];
int numList = 0;
int frame = 0;
int change = 60;

int per = 0;
int time = 5;
int sw = 0;

int index = 0;
int index1 = 5;
int index2 = 10;

void setup() {
  //size (600, 600);
  size (212, 350) ;
  frameRate(25);
  background(0);
  

  icoDef[0]  = loadImage("Mini_map_d.png");
  icoDef[1]  = loadImage("Move_odject_1_d.png");
  icoDef[2]  = loadImage("Night_d_.png");
  icoDef[3]  = loadImage("Obit_view_d.png");
  icoDef[4]  = loadImage("Place_object_d.png");
  icoDef[5]  = loadImage("Play_Guide_d.png");
  icoDef[6]  = loadImage("Rec_d.png");
  icoDef[7]  = loadImage("Resource_Guide_d.png");
  icoDef[8]  = loadImage("Screenshot_d.png");
  icoDef[9]  = loadImage("Select_d.png");
  icoDef[10]  = loadImage("Serch_d.png");
  icoDef[11]  = loadImage("Show_objects_d.png");
  icoDef[12]  = loadImage("Summer_d.png");
  icoDef[13]  = loadImage("walk_d.png");
  icoDef[14]  = loadImage("Winter_d.png");


  icoCol[0]  = loadImage("Mini_map_c.png");
  icoCol[1]  = loadImage("Move_odject_1_C.png");
  icoCol[2]  = loadImage("Night_c_.png");
  icoCol[3]  = loadImage("Obit_view_c.png");
  icoCol[4]  = loadImage("Place_object_c.png");
  icoCol[5]  = loadImage("Play_Guide_c.png");
  icoCol[6]  = loadImage("Rec_c.png");
  icoCol[7]  = loadImage("Resource_Guide_c.png");
  icoCol[8]  = loadImage("Screenshot_c.png");
  icoCol[9]  = loadImage("Select_c.png");
  icoCol[10]  = loadImage("Serch_c.png");
  icoCol[11]  = loadImage("Show_objects_c.png");
  icoCol[12]  = loadImage("Summer_c.png");
  icoCol[13]  = loadImage("walk_c.png");
  icoCol[14]  = loadImage("Winter_c.png");
    
/*  Считалка координат
  for (int i=0; i<=cols; i++){
      for (int j=0; j<=rows; j++) {
        
        int x = 69 * i + gap;
        int y = 69 * j + gap;
        //rect(gridX[i], gridY[j], 64, 64);
        println(x + " , " + y + " , " + index);
      }  
    }
*/  
}

void draw () {
      
    if (index == 15) {
    index = 0;
    }
     if (index1 == 15) {
    index1 = 0;
    }
    if (index2 == 15) {
    index2 = 0;
    }


  if (frame % 5 == 0) {  
  
      iconCh(numR[index], 1);
      //println("index: " + index );
  
      iconCh(numR[index1], 2);
  
      iconCh(numR[index2], 3);
  
      index = index +1;
      index1 = index1+1;
      index2 = index2+1;    
    
  }  

frame = frame +1;

/*
//Save File
if (frameCount <= 250) {
  saveFrame("ver-####.tif");
  }
*/

}

void life (int frame, int ind) {
  
    if (sw == 3) {
      sw = 0;
    }
    sw++;
    iconCh(ind, sw);
    //println(sw);
  
}

void iconCh (int ind, int num) {
  
  switch(num) {
    case 1:
      image(icoCol[ind], gridX[numR[ind]], gridY[numR[ind]]);
      break;
    
    case 2:
      image(icoDef[ind], gridX[numR[ind]], gridY[numR[ind]]);
      break;
    
    case 3:
      fill (0);
      noStroke();
      rect (gridX[numR[ind]], gridY[numR[ind]], 64, 64);
      break;
      
    case 4:
      fill (255);
      noStroke();
      rect (gridX[numR[ind]], gridY[numR[ind]], 64, 64);
      break;
  }
  
  
}

