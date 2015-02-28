
class Apple {
  float Ax;
  float Ay;
  float Awidth;
  float Aheight;
  boolean collect = false;
  int timer = 0; // THE TIMER VARIABLE WILL KEEP TRACK OF HOW LONG AN APPLE IS A COIN
  PImage apple;
  
  Apple(PImage image, float Ax_in, float Ay_in, float Awidth_in, float Aheight_in) {
    apple = image;
    Ax = Ax_in;
    Ay = Ay_in;
    Awidth = Awidth_in;
    Aheight = Aheight_in;
  }
  
    void show() {
      if (collect == false) {
        image(apple, Ax, Ay, Awidth, Aheight);
      }
      if (collect == true) {                    //IF THE APPLE IS A COIN
        image(coin, Ax, Ay, Awidth, Aheight);   //DISPLAY THE COIN
        timer++;                                //INCREASE THE TIMER VARIABLE
        if(timer == 170) {                      //WHEN THE TIMER HITS 100 (SHOULD PROBABLY CHANGE)
          reset();                              //RESET THE COIN TO BE AN APPLE
        }
      }
      
    }
    
    /*
    ---I ADJUSTED THE FUNTCTION TO TAKE IN TWO FLOAT VARIABLES
    ---NOW YOU CAN PASS IN THE XPOS AND YPOS OF THE PLAYER IN THE DRAW LOOP
    */
    void collect(float xPos_in, float yPos_in) {
      if (collect == false) {
        if (dist ((xPos_in), (yPos_in), Ax, Ay) < Awidth) {
          collect = true;
          gainapple = true;
          apples += 1;
        }
      }
    }
    
    /*
    ---I ADDED THIS FUNCTION TO RESET ALL THE VALUES
    */
    void reset() {
      Ax = random(20, width-20);
      Ay = random(20, height-20);
      collect = false;
      timer = 0;  
    }
}

