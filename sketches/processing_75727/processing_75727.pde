
/*
  Free Fall 
  by Dongzhi Xia
*/
PFont f;
int currentTime;
float[][] circles;
int i = 0;
float newY;

void setup(){
  size(480,480);
  //background(255,255,0);
  circles = new float[100][5];
}

void draw(){
     background(255,255,0);
     
     //Add texts
     f = createFont("Arial",16,true); // STEP 3 Create Font
     textFont(f,16);                 // STEP 4 Specify font to be used
     fill(50);                        // STEP 5 Specify font color 
     text("FREE FALL",20,30);  // STEP 6 Display Text
     textFont(f,12);
     fill(100);
     text("by Dongzhi Xia",20,45);
  
     //Display created circles
     for(int x = 0; x < i; x ++){
       currentTime = millis();
       
       newY = circles[x][1]+0.5*98*0.001*0.001*(currentTime-circles[x][2])*(currentTime-circles[x][2]);
       if(newY<= (height - circles[x][3]/2)){
         fill(circles[x][4]);
         ellipse(circles[x][0], newY, circles[x][3], circles[x][3]); 
       } else {
         fill(circles[x][4]);
         ellipse(circles[x][0], (height - circles[x][3]/2), circles[x][3], circles[x][3]);
       }
       
     }
}

void mousePressed(){
    //Create new circle by mousePress
    //Add data to array 
    circles[i][0] = mouseX;
    circles[i][1] = mouseY;
    circles[i][2] = millis();
    circles[i][3] = random(10,100);
    circles[i][4] = random(255);
    i = i + 1;
}


