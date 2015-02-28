
void setup () {
  size (567,283); //width and height
  background (0); //background colour
  stroke(255);//colour of line
  strokeWeight(1);//thickness of line
fill(255,150);
//noFill();

float pt1 = radians(0);
float pt2 = radians(90);
float pt3 = radians (180);
float pt4 = radians (270);
float pt5 = radians (360);
float pt6 = radians (450);

int startX = 0;
  int startY = 0;
  int arcWidth = 50;
  int arcHeight = 50;

  for(int i = 0; i <width; i++){  
      for(int j = 0; j < height; j++){  
       pushMatrix();  
        translate(i*25, j*25);  
       float d = random(4);
        if (d <=1){
        arc(startX,startY,arcWidth, arcHeight,pt1,pt3);
        }
else if (d>1&&d<=2){
arc(startX,startY,arcWidth, arcHeight,pt2,pt4);
}
else if (d>2&&d<=3){
arc(startX,startY,arcWidth, arcHeight,pt3,pt5);
}
else if(d>3&&d<=4){
arc(startX,startY,arcWidth, arcHeight,pt4,pt6);
}

        smooth();
        popMatrix();  
     }  
 }  
  }

void draw() {
}


void keyPressed() {
  if (key == 's' || key == 'S') {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if (filePath != null) {
      save(filePath + ".png");
    }
  }
}


