
Guy bomberman = new Guy();

int xPos;// x position array
int yPos;// y position array



int bmans;

float gravity;

boolean fall = false;

void setup() {
  size(600, 600);

  gravity = .5;
  bmans = 3;

 

  
  



  
    
    xPos = 240;
    yPos = 240;

    //ySpeed = 10;
    
    bomberman = new Guy();
    bomberman.prime(xPos, yPos);
    //println(yPos[1]);
  


}


void draw() {
  background(200, 200, 200);
  //for (int i=0; i<bomberman.length;i++) {
    bomberman.animate(xPos, yPos);

    //if (fall==true) {
      //Whatever happens here happens to the entire
      //array IF fall is true.
      //yPos[i]+=ySpeed[i];
      //ySpeed[i]+=gravity;
    //}
  //}
}

void keyPressed(){
  if (key == CODED) {
    if (keyCode == UP) {
      bomberman.pleasemoveup();
    }else if (keyCode == DOWN) {
      bomberman.pleasemovedown();
    }else if (keyCode == LEFT) {
      bomberman.pleasemoveleft();
    }else if (keyCode == RIGHT) {
      bomberman.pleasemoveright();
    }
    
    
  }
  
}


class Guy {

  int x;
  int y;
  
  




  void prime(int a, int b) {
    x = a;
    y = b;
    

    
    
    
  }


  void animate(int a, int b) {
    
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
  
  
  void pleasemoveup(){

      
        y-=10;
        
}

 void pleasemovedown(){

      
        y+=10;
       
}

 void pleasemoveleft(){

      
        x-=10;
       
}

 void pleasemoveright(){

      
        x+=10;
       
}

  
}
