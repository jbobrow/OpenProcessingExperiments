
Design[] bomberman = new Design[3];

int[] xPos;// x position array
int[] yPos;// y position array

int ySpeed;// speed for y

int bmans;

float gravity;

boolean fall = false;

void setup() {
  size(600, 600);

  gravity = .5;
  bmans = 3;

  xPos = new int[bmans];
  yPos = new int[bmans];

  ySpeed = 0;
  



  for (int i=0; i<bomberman.length; i++) {
    
    xPos[i] = i*180 +60;
    yPos[i] = i+80;

    ySpeed = 10;
    
    bomberman[i] = new Design();
    bomberman[i].prime(xPos[i], yPos[i]);
    //println(yPos[1]);
  }


}


void draw() {
  background(200, 200, 200);
  for (int i=0; i<bomberman.length;i++) {
    bomberman[i].animate(xPos[i], yPos[i]);

    //if (fall==true) {
      //Whatever happens here happens to the entire
      //array IF fall is true.
      //yPos[i]+=ySpeed[i];
      //ySpeed[i]+=gravity;
    //}
  }
}

void mousePressed(){
  for (int i=0; i<bomberman.length;i++) {
  bomberman[i].pleasemove();
  }
}


class Design {

  float x;
  float y;




  void prime(float a, float b) {
    x = a;
    y = b;
    
    
    
    
  }


  void animate(float a, float b) {
    noStroke();
    fill(0);
    rect(x+10, y-10, 80, 50);
    rect(x+30, y-20, 40, 50);
    rect(x+40, y-30, 20, 50);



    fill(255, 0, 0);
    rect(x+40, y-20, 20, 10);

    fill(255);
    rect(x, y, 100, 100);
    rect(x-10, y+10, 120, 80);
    rect(x-20, y+20, 140, 60);
    // rect(x+20,y-10,60,50);



    fill(240, 80, 80);
    rect(x, y+40, 100, 50);
    rect(x-10, y+50, 120, 30);

    fill(233, 184, 86);
    rect(x, y+50, 100, 30);


    fill(0);
    rect(x+20, y+50, 10, 30);
    rect(x+70, y+50, 10, 30);

    fill(71, 139, 198);//bluesquares
    rect(x-10, y+10, 10, 10);
    rect(x-20, y+20, 10, 10);

    rect(x+100, y+10, 10, 10);
    rect(x+110, y+20, 10, 10);

    fill(240);//gray squares
    rect(x+10, y, 10, 10);
    rect(x+80, y, 10, 10);

    rect(x-20, y+30, 10, 50);
    rect(x+110, y+30, 10, 50);

    fill(0);
    rect(x-10, y, 20, 10);
    rect(x-20, y+10, 10, 10);
    rect(x-30, y+20, 10, 60);
    rect(x-20, y+80, 10, 10);
    rect(x-10, y+90, 10, 10);
    rect(x, y+100, 100, 10);


    rect(x+90, y, 20, 10);
    rect(x+110, y+10, 10, 10);
    rect(x+120, y+20, 10, 60);
    rect(x+110, y+80, 10, 10);
    rect(x+100, y+90, 10, 10);
    rect(x, y+100, 100, 10);

    
    
  }
  
  
  void pleasemove(){

      
        y+=ySpeed;
        ySpeed+=gravity;
        
      
     

}
  
}
