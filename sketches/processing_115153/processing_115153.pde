
float theta = 1.57;
float phi = 1.88;
float radius = 200;
float speed = 5;
float rspeed = .02;
float offY = 0;
int layers = 4;
boolean filled = false;
boolean hidnEn = false;
boolean hidnOd = false;
ArrayList<Integer[][]> tetrahedron= new ArrayList<Integer[][]>();

void setup(){
  size(800,800, P3D);
  recalculateTetrahedron();
  sphereDetail(1,1); 
}

void draw(){
 cameraControl();
 background(200);
 drawTetrahedron();
}


void drawTetrahedron(){
 for(int i = 0; i < layers; i++){
  for(int j = 0; j <= i; j++){
   for(int k = 0; k <= j; k++){
     pushMatrix();
      translate(j*25-50*k,i*40.825-layers*20.4125, i*28.85-j*43.3);
      int value = tetrahedron.get(i)[j][k];
      if(value%2==0){//even - red
        fill(255,0,0);
      } else  {//odd - blue
        fill(0,0,255);
      }
      rotateY(1.88-theta);
      if((value%2==0&&!hidnEn)||(value%2==1&&!hidnOd)){
          if(filled){
           sphere(20);
          } else {
            fill(25);
            text(value,0,0);
          }
      }
     popMatrix();   
   } 
  }
 } 
}

void recalculateTetrahedron(){
  tetrahedron = new ArrayList<Integer[][]>();
  tetrahedron.add(new Integer[1][1]);
  tetrahedron.get(0)[0][0] = 1;
  for(int i = 1; i < layers; i++){
   tetrahedron.add(new Integer[i+2][i+2]); 
  }
  for(int i = 1; i < layers; i++){//each layer
    for(int j = 0; j <= i; j++){//rows in the layer
      for(int k = 0; k <=j; k++){//columns in each row
        if((k==j)&&(j==0||j==i)||(k==0&&j==i)){
          tetrahedron.get(i)[j][k] = 1; 
        } else if(k==0){
          tetrahedron.get(i)[j][k] = tetrahedron.get(i-1)[j][k]+tetrahedron.get(i-1)[j-1][k];  
        } else if(j==i){
           tetrahedron.get(i)[j][k] = tetrahedron.get(i-1)[j-1][k]+tetrahedron.get(i-1)[j-1][k-1]; 
        } else if(k==j){
          tetrahedron.get(i)[j][k] = tetrahedron.get(i-1)[j][k]+tetrahedron.get(i-1)[j-1][k-1];   
        } else {
          tetrahedron.get(i)[j][k] = tetrahedron.get(i-1)[j][k]+tetrahedron.get(i-1)[j-1][k]+tetrahedron.get(i-1)[j-1][k-1];  
        }
      }
    }
  }
}

void cameraControl(){
  if(keyPressed){
    if(key==CODED){
      if(keyCode == LEFT){
        theta -= rspeed; 
      } else if (keyCode==RIGHT){
        theta += rspeed; 
      } else if(keyCode == UP){
        phi += rspeed; 
      } else if (keyCode==DOWN){
        phi -= rspeed; 
      }
    }  
    if(key=='w'||key=='W'){
      offY -= 1; 
    }
    if(key=='S'||key=='s'){
      offY += 1; 
    }
    if(key == '='||key=='+'){
      radius-=speed;
     } 
     if(key=='-'){
       radius+=speed;
     }
  }

 camera(radius*cos(theta)*sin(phi), radius*cos(phi)+offY, radius*sin(theta)*sin(phi), 0, offY, 0, 0, 1, 0);
}

void keyReleased(){
  if(key=='F'||key=='f'){
    if(filled == true){
     filled = false; 
    } else {
     filled = true; 
    }
  }
  if(key=='E'||key=='e'){
    if(hidnEn== true){
     hidnEn= false; 
    } else {
     hidnEn= true; 
    }
  }
   if(key=='O'||key=='o'){
    if(hidnOd == true){
     hidnOd= false; 
    } else {
     hidnOd= true; 
    }
  }
  if(key=='M'||key=='m'){
    layers++;
    recalculateTetrahedron();
  }
  if(key=='N'||key=='n'){
    layers--;
    recalculateTetrahedron();
  }
}
