
int op1 = 0;
int op2 = 0;
PFont ft;
void setup() {
  size(600,600);
  ft = loadFont("AppleGothic-48.vlw");
}

void draw() {

  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23

  if(mousePressed == true )
  {
    fill(123,123,123,op1);
    rect(0,0,600,600);
    noStroke();
    fill(100,0,0);
    rect(0, 600, 200, h*25-600);
    rect(200, 600, 200, m*10-600);
    rect(400, 600, 200, s*10-600);
    
fill(0);
//Evolution type
textFont (ft);
fill(200,0,0,op1);
String t =nf(24-h,2) + "          :          " + nf(60-m,2) + "          :          "+nf(60-s,2);
text(t,20,570);



    if (op1<=255) // After drawing it, compare op1 and add it
    {
      op1++;
    }
    op2 = 0;

    // op2 =0;
  }
  else //Same with Button Released
  {

    /*  fill(255,255,255,op1);
     rect(0,0,600,600);
     if(op1 >0)
     op1--;
     */
    fill(100,0,0,op2);
    rect(0,0,600,600);
    textFont(ft);
    fill(0,102,153,op2);
    text("time    remaining   :   click",20,300);
    if(op2 <255)
    {
      op2++;
    }
    op1 = 0; //Set op as default value
  }
  //digital clock

}
/*
void mouseReleased() 
 {
 op2=0;
 for (int index =0; index<255; index++)
 draw(); 
 }
 */

