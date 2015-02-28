
bead bead1=new bead();
bead bead2=new bead();
bead bead3=new bead();
bead bead4=new bead();
bead bead5=new bead();
bead bead6=new bead();

//
int bead_width=50; 
int bead_height=30;
int bead_x=47; 
int bead_y=110;
int beadcolor_int=#ffffff;
int beadcolor_act=#ecae18;
int beadcolor_act2=#f26d49;
int beadcolor_on=#e96845;
int beadcolor_on2=#e49a42;
int move_speed=15;
int bead_move=30;
int delay_speed=7;
int gap=90;

PImage background_pic;





void setup(){
  PFont metaBold;
  metaBold = loadFont("EuphemiaUCAS-Bold-48.vlw");
  background_pic = loadImage("background.png");
  textFont(metaBold, 20);
  size(600, 500);


}
void draw(){
  smooth();
  background(233);
  image(background_pic, 0, 0);
  fill(#9f694c,50);
  text("CHINESE ABACUS by Fu", 321, 441);
  fill(1);
  stroke(1,80);
  line(50, 174, 539, 174);
  text("CHINESE ABACUS by Fu", 320, 440);
  
  fill(#ffffff);
  noStroke();
  bead1.bead(0); 
  bead2.bead(gap*1);
  bead3.bead(gap*2);  
  bead4.bead(gap*3);
  bead5.bead(gap*4);
  bead6.bead(gap*5);
}
class bead{
  int bead5_i;
  int bead5_j;
  int bead5_y=110;
  int bead5_color=beadcolor_int;
  int bead5_ymove=0;
  Boolean bead5_cover=false;

  int bead1_i;
  int bead1_j;
  int bead1_y=bead5_y+100;
  int bead1_color=beadcolor_int;
  int bead1_ymove=0;
  Boolean bead1_cover=false;

  int bead2_i;
  int bead2_j;
  int bead2_y=bead5_y+100+40;
  int bead2_color=beadcolor_int;
  int bead2_ymove=0;
  Boolean bead2_cover=false;

  int bead3_i;
  int bead3_j;
  int bead3_y=bead5_y+100+40*2;
  int bead3_color=beadcolor_int;
  int bead3_ymove=0;
  Boolean bead3_cover=false;

  int bead4_i;
  int bead4_j;
  int bead4_y=bead5_y+100+40*3;
  int bead4_color=beadcolor_int;
  int bead4_ymove=0;
  Boolean bead4_cover=false;

  void bead(int x){
    bead5(x);
    bead1(x);
    bead2(x);
    bead3(x);
    bead4(x);
  }

// bead 5 (heaven bead)
  void bead5(int x){

    if(mouseX>bead_x+x &&mouseX <bead_x+bead_width+x && mouseY >bead5_y+bead5_ymove && mouseY<bead5_y+bead_height+bead5_ymove)
    {  
      bead5_j=0;
      bead5_i++;
      if (bead5_i>delay_speed){
        bead5_color=beadcolor_act2;
        bead5_cover=true;
      }
    }
    else{
      bead5_i=0;
      bead5_j++;
      if (bead5_j>delay_speed){
        if (bead5_ymove!=0){
        bead5_color=beadcolor_on;
        }else{
          bead5_color=beadcolor_int;
        }
        bead5_cover=false;
      }
    } 
    if(mouseY >bead5_y+bead_height*2-10&& mouseY<bead1_y-10)
    {
      if(abs(mouseX-pmouseX)>60){
        bead5_ymove=0;
        bead1_ymove=0;
        bead2_ymove=0;
        bead3_ymove=0;
        bead4_ymove=0;  
      }
    }
    if(mouseX>bead_x+x &&mouseX <bead_x+bead_width+x && mouseY-pmouseY>move_speed && bead5_cover && bead5_ymove==0)
    {
      bead5_ymove=bead_move;
      bead5_cover=false;
    }
    else if (mouseX>bead_x+x &&mouseX <bead_x+bead_width+x && mouseY-pmouseY<-move_speed && bead5_cover && bead5_ymove==bead_move){
      bead5_ymove=0;
      bead5_cover=false;
    }
    fill(0,80);
    rect(bead_x+x+5, bead5_y+bead5_ymove+5, bead_width, bead_height);
    fill(bead5_color);
    rect(bead_x+x, bead5_y+bead5_ymove, bead_width, bead_height);
  }

// bead 1 (earth bead)
  void bead1(int x){
    if(mouseX>bead_x+x &&mouseX <bead_x+bead_width+x && mouseY >bead1_y+bead1_ymove && mouseY<bead1_y+bead_height+bead1_ymove)
    {  
      bead1_j=0;
      bead1_i++;
      if (bead1_i>delay_speed){
        bead1_color=beadcolor_act;
        bead1_cover=true;
      }
    }
    else{
      bead1_i=0;
      bead1_j++;
       if (bead1_j>delay_speed){
        if (bead1_ymove!=0){
        bead1_color=beadcolor_on2;
        }else{
          bead1_color=beadcolor_int;
        }
        bead1_cover=false;
      }
    }
    if(mouseX>bead_x+x &&mouseX <bead_x+bead_width+x && mouseY >bead1_y+x && mouseY<bead1_y+bead_height+bead1_ymove)
    {  
    }
    if(mouseX>bead_x+x &&mouseX <bead_x+bead_width+x && mouseY-pmouseY<-move_speed && bead1_cover && bead1_ymove==0)
    {
      bead1_ymove=-bead_move;

      bead1_cover=false;
    }
    else if (mouseX>bead_x+x &&mouseX <bead_x+bead_width+x && mouseY-pmouseY>move_speed && bead1_cover && bead1_ymove==-bead_move){
      bead1_ymove=0;
      bead2_ymove=0;
      bead3_ymove=0;
      bead4_ymove=0;
      bead1_cover=false;
    }
    fill(0,80);
    rect(bead_x+x+5, bead1_y+bead1_ymove+5, bead_width, bead_height);
    fill(bead1_color);
    rect(bead_x+x, bead1_y+bead1_ymove, bead_width, bead_height);
  }

// bead 2 (earth bead)
  void bead2(int x){
    if(mouseX>bead_x+x &&mouseX <bead_x+bead_width+x &&mouseY >bead2_y+bead2_ymove && mouseY<bead2_y+bead_height+bead2_ymove)
    {  
      bead2_j=0;
      bead2_i++;
      if (bead2_i>delay_speed){
        bead2_color=beadcolor_act;
        bead2_cover=true;
      }
    }
    else{
      bead2_i=0;
      bead2_j++;
       if (bead2_j>delay_speed){
        if (bead2_ymove!=0){
        bead2_color=beadcolor_on2;
        }else{
          bead2_color=beadcolor_int;
        }
        bead2_cover=false;
      }
    }
    if(mouseX>bead_x+x &&mouseX <bead_x+bead_width+x && mouseY-pmouseY<-move_speed && bead2_cover && bead2_ymove==0)
    {
      bead2_ymove=-bead_move;
      bead1_ymove=-bead_move;
      bead2_cover=false;
    }
    else if (mouseX>bead_x+x &&mouseX <bead_x+bead_width+x && mouseY-pmouseY>move_speed && bead2_cover && bead2_ymove==-bead_move){
      bead2_ymove=0;
      bead3_ymove=0;
      bead4_ymove=0;
      bead2_cover=false;
    }
    fill(0,80);
    rect(bead_x+x+5, bead2_y+bead2_ymove+5, bead_width, bead_height);
    fill(bead2_color);
    rect(bead_x+x, bead2_y+bead2_ymove, bead_width, bead_height);
  }

// bead 3 (earth bead)
  void bead3(int x){
    if(mouseX>bead_x+x &&mouseX <bead_x+bead_width+x &&mouseY >bead3_y+bead3_ymove && mouseY<bead3_y+bead_height+bead3_ymove)
    {  
      bead3_j=0;
      bead3_i++;
      if (bead3_i>delay_speed){
        bead3_color=beadcolor_act;
        bead3_cover=true;
      }
    }
    else{
      bead3_i=0;
      bead3_j++;
             if (bead3_j>delay_speed){
        if (bead3_ymove!=0){
        bead3_color=beadcolor_on2;
        }else{
          bead3_color=beadcolor_int;
        }
        bead3_cover=false;
      }
    }
    if(mouseX>bead_x+x &&mouseX <bead_x+bead_width+x && mouseY-pmouseY<-move_speed && bead3_cover && bead3_ymove==0)
    {
      bead3_ymove=-bead_move;
      bead2_ymove=-bead_move;
      bead1_ymove=-bead_move;
      bead3_cover=false;
    }
    else if (mouseX>bead_x+x &&mouseX <bead_x+bead_width+x && mouseY-pmouseY>move_speed && bead3_cover && bead3_ymove==-bead_move){
      bead3_ymove=0;
      bead4_ymove=0;
      bead3_cover=false;
    }
    fill(0,80);
    rect(bead_x+x+5, bead3_y+bead3_ymove+5, bead_width, bead_height);
    fill(bead3_color);
    rect(bead_x+x, bead3_y+bead3_ymove, bead_width, bead_height);
  }   

// bead 4 (earth bead)
  void bead4(int x){
    if(mouseX>bead_x+x &&mouseX <bead_x+bead_width+x &&mouseY >bead4_y+bead4_ymove && mouseY<bead4_y+bead_height+bead4_ymove)
    {  
      bead4_j=0;
      bead4_i++;
      if (bead4_i>delay_speed){
        bead4_color=beadcolor_act;
        bead4_cover=true;
      }
    }
    else{
      bead4_i=0;
      bead4_j++;
             if (bead4_j>delay_speed){
        if (bead4_ymove!=0){
        bead4_color=beadcolor_on2;
        }else{
          bead4_color=beadcolor_int;
        }
        bead4_cover=false;
      }
    }
    if(mouseX>bead_x+x &&mouseX <bead_x+bead_width+x && mouseY-pmouseY<-move_speed && bead4_cover && bead4_ymove==0)
    {
      bead4_ymove=-bead_move;
      bead3_ymove=-bead_move;
      bead2_ymove=-bead_move;
      bead1_ymove=-bead_move;
      bead4_cover=false;
    }
    else if (mouseX>bead_x+x &&mouseX <bead_x+bead_width+x && mouseY-pmouseY>move_speed && bead4_cover && bead4_ymove==-bead_move){
      bead4_ymove=0;
      bead4_cover=false;
    }
    fill(0,80);
    rect(bead_x+x+5, bead4_y+bead4_ymove+5, bead_width, bead_height);
    fill(bead4_color);
    rect(bead_x+x, bead4_y+bead4_ymove, bead_width, bead_height);
    
  }   

}



