
int rains_num=150;
Rain[] rains;

void setup()
{
  size(640, 640, P3D);
  rains=new Rain[rains_num];
  for(int i=0;i<rains_num;i++){
    rains[i]=new Rain();
  }
}

void draw()
{
  background(255);
  noFill();
  ortho();
  translate(width/2, height/2, 0);
  rotateX(radians(45));
  for(int i=0;i<rains_num;i++){
    rains[i].display();
  }
}

void mousePressed()
{
  noLoop();
}

void mouseReleased()
{
  loop();
}

class Rain {
  float rand_w=0;
  float old_rand_w=0;
  float center_x=0; //round(random(640));
  float center_y=0; //round(random(640));
  float bw_color=0;
  float old_bw_color=0;
  float color_r=0; //random(255);
  float old_color_r=color_r;
  float color_g=0; //random(255);
  float old_color_g=color_g;
  float color_b=0; //random(255);
  float old_color_b=color_b;
  int i=0;
  int state=0;
  int y_coord=0;
  int y_coord2=0;

  Rain(){
    center_x=round(random(width));
    center_y=round(random(height*2));
    bw_color=0;
    old_bw_color=0;
    color_r=random(255);
    old_color_r=color_r;
    color_g=random(255);
    old_color_g=color_g;
    color_b=random(255);
    old_color_b=color_b;
  }
  
  void display(){  
    if(state!=2){
      strokeWeight(4);
    }
    stroke(color_r, color_g, color_b);
    if(state==0 || state==1){
      frameRate(200);
    } else if (state==2){
      frameRate(50);
      if(rand_w>=60){
        state=0;
        center_x=round(random(width));
        center_y=round(random(height*2));
        rand_w=0;
        color_r=random(255);
        color_g=random(255);
        color_b=random(255);
        old_color_r=color_r;
        old_color_g=color_g;
        old_color_b=color_b;
      }
      if(i>=30){
        color_r=old_color_r;
        color_g=old_color_g;
        color_b=old_color_b;
        i=0;
      }
    } // state==0

    if(state==0){
      line(center_x, y_coord, 0, center_x, 0, 0);
      y_coord++;
      if(y_coord==center_y){
        state=1;
      }
    } else if(state==1){
      stroke(255);
      line(center_x, y_coord2, 0, center_x, 0, 0);
      y_coord2++;
      if(y_coord2==center_y){
        state=2;
        y_coord=0;
        y_coord2=0;
      }
    } else if(state==2){
      arc(center_x, center_y, rand_w, rand_w, 0, TWO_PI);
      if(rand_w<60){
        rand_w++;
        if(i<=10){
          color_r-=5;
          color_g-=5;
          color_b-=5;
        } else if(i>=15){
          color_r+=5;
          color_g+=5;
          color_b+=5;
        }
        i++;
      }
    }
  }
}

