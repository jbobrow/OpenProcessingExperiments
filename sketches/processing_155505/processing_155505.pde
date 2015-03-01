
int cellsW=3;
int cellsH=2;
int[][] sex = new int[cellsW][cellsH]; 
int[][] pheromone = new int[cellsW][cellsH];
int[][] pheromone_new = new int[cellsW][cellsH];
float[][] position_x = new float[cellsW][cellsH];
float[][] position_y = new float[cellsW][cellsH];
float[][] degree_updn = new float[cellsW][cellsH];
float[][] rotate_act = new float[cellsW][cellsH];


float[][] rotate = new float[cellsW][cellsH];
float[][] rotate_recent = new float[cellsW][cellsH];
//float rotate_act;
float dg;
float coordinate_r;

float block_sc=100; //basic element's scale
float core_radius=block_sc/2*cos(radians(60));
float core_rec=block_sc/2*sin(radians(60));
float tr_l=dist(core_rec, core_radius, 0, -block_sc/2);
float tri_h=core_radius+block_sc/2;
int kp_p=0;
int cal_direction_re=0;

void setup() {
  size(650, 600);
  background(255, 1);
  ellipseMode(CENTER);  // Set ellipseMode to CENTER
  noFill();
  smooth();
  for (int x=0; x<cellsW; x++) {
    for (int y=0; y<cellsH; y++) {
      sex[x][y]=0; 
      pheromone[x][y]=0;
      pheromone_new[x][y]=0;
      rotate[x][y]=0;
      rotate_recent[x][y]=0;
      position_x[x][y]=0; 
      position_y[x][y]=0;
      degree_updn[x][y]=0;
    }
  }

  for (int x=0; x<cellsW; x++) {
    for (int y=0; y<cellsH; y++) {
      if ((y+2)%2==0) {
        if ((x+2)%2==1) {
          position_x[x][y]=tr_l/2+tr_l/2+x*tr_l/2;
          position_y[x][y]=y*tri_h+50;
          degree_updn[x][y]=0;
          //block(x, y, position_x[x][y], position_y[x][y], 0);
          sex[x][y]=1;
        }
        else {
          position_x[x][y]=tr_l/2+tr_l/2+x*tr_l/2;
          position_y[x][y]=y*tri_h-(block_sc/2-core_radius)+50;
          degree_updn[x][y]=180;
          //block(x, y, position_x[x][y], position_y[x][y], 180);
          sex[x][y]=0;
        }
      }
      else
        if ((x+2)%2==0) {
          position_x[x][y]=tr_l/2+tr_l/2+x*tr_l/2;
          position_y[x][y]=y*tri_h+50;
          degree_updn[x][y]=0;
          //block(x, y, position_x[x][y], position_y[x][y], 0);
          sex[x][y]=1;
        }
      else {
        position_x[x][y]=tr_l/2+tr_l/2+x*tr_l/2;
        position_y[x][y]=y*tri_h-(block_sc/2-core_radius)+50;
        degree_updn[x][y]=180;
        //block(x, y, position_x[x][y], position_y[x][y], 180);
        sex[x][y]=0;
      }
    }
  }
}



void draw() {
      println(640/2*tan(radians(60)));

  background(255, 1);
  move();
  display();
    for (int x=0; x<cellsW; x++) 
    for (int y=0; y<cellsH; y++) {
        //rotate(TWO_PI*(degree_updn[x][y])/360); 
          /*if (kp_p==0)
            triangle(0, -block_sc/2, core_rec, core_radius, -core_rec, core_radius);*/      
    
          //rotate(TWO_PI*(-degree_updn[x][y])/360); 
          ellipse(0, 0, 5, 5);}
          
          /*if (kp_p==1) {
            ellipse(0, 0, block_sc, block_sc);//mass_circle
            fill(100, 0, 0, 7);
            ellipse(0, -block_sc/2, 2*tr_l, 2*tr_l);  // Draw gray ellipse using CENTER mode
            fill(0, 100, 0, 7);
            ellipse(core_rec, core_radius, 2*tr_l, 2*tr_l);  // Draw gray ellipse using CENTER mode
            fill(0, 0, 100, 7);
            ellipse(-core_rec, core_radius, 2*tr_l, 2*tr_l);  // Draw gray ellipse using CENTER mode      
            noFill();
            stroke(0, 0, 0, 50);}*/
      delay(10);
    }
  


void display() {
  for (int x=0; x<cellsW; x++) 
    for (int y=0; y<cellsH; y++) 
          block(x, y, position_x[x][y], position_y[x][y], degree_updn[x][y]);
        }


void move() {
  for (int x=0; x<cellsW; x++) {
    for (int y=0; y<cellsH; y++) {
      //task01: update the pheromone
      if (sex[x][y]==1) {
        int ph_02=0;
        int ph_06=0;
        int ph_11=0;

        if (x+1<cellsW)
          ph_02=pheromone[x+1][y];
        if (x-1>=0)
          ph_11=pheromone[x-1][y];
        if (y+1<cellsH)
          ph_06=pheromone[x][y+1];

        if (pheromone[x][y]<max(ph_02, ph_06, ph_11))
          pheromone_new[x][y]=max(ph_02, ph_06, ph_11)-1;
        else
          if (pheromone[x][y]>0)
            pheromone_new[x][y]=pheromone[x][y]-1;

        //task02: update the rotation state
        if (pheromone[x][y]<max(ph_02, ph_06, ph_11))
          rotate[x][y] = compare(sex[x][y], ph_02, ph_11, ph_06);
      }

      if (sex[x][y]==0) {
        int ph_04=0;
        int ph_08=0;
        int ph_12=0;

        if (x+1<cellsW)
          ph_04=pheromone[x+1][y];
        if (x-1>=0)
          ph_08=pheromone[x-1][y];
        if (y-1>=0)
          ph_12=pheromone[x][y-1];

        if (pheromone[x][y]<max(ph_04, ph_08, ph_12))
          pheromone_new[x][y]=max(ph_04, ph_08, ph_12)-1;
        else
          if (pheromone[x][y]>0)
            pheromone_new[x][y]--;
        //task02: update the rotation state
        if (pheromone[x][y]<max(ph_12, ph_04, ph_08))
          rotate[x][y] = compare(sex[x][y], ph_04, ph_08, ph_12);
      }
    }
  }
}


float compare(int sex, int d_2_4, int d_11_8, int d_6_12) {//2 6 11 12 4 8
  int max_d=max(d_2_4, d_11_8, d_6_12);  
  d_2_4=cal_direction(d_2_4, max_d);
  d_11_8=cal_direction(d_11_8, max_d);
  d_6_12=cal_direction(d_6_12, max_d);

  
  
  float d_2_4_x=d_2_4*cos(radians(30));
  float d_2_4_y=d_2_4*sin(radians(30));
  float d_11_8_x=d_11_8*cos(radians(30));
  float d_11_8_y=d_11_8*sin(radians(30));
  float d_6_12_y=d_6_12;
  float d_x, d_y;
  if (sex==1) {
    d_x=d_2_4_x-d_11_8_x;
    d_y=d_2_4_y+d_11_8_y-d_6_12_y;
    dg=degrees(atan(d_y/d_x))+coordinate_xy(d_x, d_y);
  }
  else if (sex==0) {
    d_x=d_2_4_x-d_11_8_x;
    d_y=d_6_12_y-(d_2_4_y+d_11_8_y);
    dg=degrees(atan(d_y/d_x))+coordinate_xy(d_x, d_y);
  }
  return dg;
}

int cal_direction(int d, int max_d){
  if (d<max_d)
    cal_direction_re=0;
  else 
    cal_direction_re=1;
  return cal_direction_re;
}

float coordinate_xy(float x, float y) {
  if (x>=0 && y>=0)
    coordinate_r=0;
  else if (x<0 && y>=0)
    coordinate_r=180;
  else if (x<0 && y<0)
    coordinate_r=180;
  else if (x>=0 && y<0)
    coordinate_r=360;
  return coordinate_r;
}

void block(int cell_x, int cell_y, float position_x, float position_y, float degree) {
  if (((((mouseX-position_x)*(mouseX-position_x))/(core_radius*2/2*core_radius*2/2)) +(((mouseY-position_y)*(mouseY-position_y))/(core_radius*2/2*core_radius*2/2)))<1) {
    pheromone_new[cell_x][cell_y]=255;
    //fill(255, 255, 255);
    //ellipse(position_x, position_y, core_radius*2, core_radius*2);
    //noFill();
  }//detect cursor for fill of 255

  //ellipse(position_x, position_y, core_radius*2, core_radius*2);//draw01

  //pushMatrix();
  //translate(position_x, position_y); 
  //rotate(TWO_PI*(degree)/360); 
  //draw
  //stroke(30, 50);
  //if (kp_p==0)
    //triangle(0, -block_sc/2, core_rec, core_radius, -core_rec, core_radius);

  ////////////////////////////////////////////////////////////////////////////////

  
  
  float situation_ab;
  situation_ab = ((360-rotate[cell_x][cell_y]%360)-rotate_recent[cell_x][cell_y]%360)%360;

  if (abs(situation_ab)>180){
    if(situation_ab%360>0)
      rotate_act[cell_x][cell_y] = rotate_recent[cell_x][cell_y]%360 - (360-abs(situation_ab%360))/10;
    else if(situation_ab%360<0)
      rotate_act[cell_x][cell_y] = rotate_recent[cell_x][cell_y]%360 + (360-abs(situation_ab%360))/10;}
  else
    rotate_act[cell_x][cell_y]=rotate_recent[cell_x][cell_y]%360 + situation_ab/10;

    

  //rotate(TWO_PI*(-degree)/360);//for reduce once matrix()   
  
  //fill(0,255);
  //text(pheromone[cell_x][cell_y],0,0);
  //text(rotate[cell_x][cell_y]%360,0,10);
  //noFill();

  /*rotate(radians(rotate_act-90));    
  ellipse(0, 0, 5, 5);
  line(0, 0, 0, tr_l/3);


  if (kp_p==1) {
    ellipse(0, 0, block_sc, block_sc);//mass_circle
    fill(100, 0, 0, 7);
    ellipse(0, -block_sc/2, 2*tr_l, 2*tr_l);  // Draw gray ellipse using CENTER mode
    fill(0, 100, 0, 7);
    ellipse(core_rec, core_radius, 2*tr_l, 2*tr_l);  // Draw gray ellipse using CENTER mode
    fill(0, 0, 100, 7);
    ellipse(-core_rec, core_radius, 2*tr_l, 2*tr_l);  // Draw gray ellipse using CENTER mode      
    noFill();
    stroke(0, 0, 0, 50);
  }*/

  //popMatrix();
  pheromone[cell_x][cell_y]=pheromone_new[cell_x][cell_y];
  rotate_recent[cell_x][cell_y]=rotate_act[cell_x][cell_y];
}

void keyPressed() { 
  int p = int(key) - int('p');
  if (kp_p==0)
    kp_p=1;
  else
    kp_p=0;
  println(kp_p);
} 

