
float move, control, fall, xcoord, the_point_x, the_point_y;
int[] shifter_x = new int [200];
int[] shifter_y = new int [200];

void setup(){
  size(928,522);
  
  control=150;
  xcoord=0;
}

void draw(){
  background(255);
  
  if(move>=200)
    xcoord--;
  
  the_point_x = move+xcoord;
  the_point_y = control+fall;
  
  shifter_x[200]=the_point_x;
  shifter_y[200]=the_point_y;
  
  
  for (float i=1; i<=200; i++){
    shifter_x[i-1]=shifter_x[i];
    shifter_y[i-1]=shifter_y[i];
  }
  for (float i=1; i<=200; i++){
    ellipse(i,shifter_y[i],5,5);
  }
  
  
  move++;
  fall+=1;

  println(the_point_x);
  println(the_point_y);
}

void keyPressed() {
  if (key == CODED){
    if (keyCode == DOWN){
      control++;
    } else if (keyCode == UP) {
      control-=25;
    }
  }
}


