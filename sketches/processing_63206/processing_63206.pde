
//import processing.dxf.*;
// exporting all the points isn't necessary, but it does give us the number of nodes used.

float[] rightNode = new float[3];
float[] upNode = new float[3];
float[] leftNode = new float[3];
float[] downNode = new float[3];
float[] trNode = new float[3];
float[] blNode = new float[3];
PFont font;

boolean record;
//RawDXF dxf;
boolean seedCountBool, vibrate;
float damping=1;
float itCount=1;
float snapCounter=1;
float g = 9.81;
int HOR = 2;
int VER = 2;
int frequency = 100;

float k = 0.1;

//keto:ijitteru
float[][][] particle;


//keto
PImage b; 
PImage bi; 
int arrayI[][];


void setup(){
 // bi=loadImage("hane2.jpg");
  //keto:gazou_torikomi
  //b = loadImage("hane_no_hone.gif"); 
  b = loadImage("hone.gif"); 
  //image(b, 0, 0,width/3,height/3); 
  importBone(b);
  HOR=b.width;
  VER=b.height;
  particle = new float[HOR][VER][20]; //note 8,9, 10,11, 12,13, 14,15  are vertices of neighbours
  //font = loadFont("ISOCPEUR-24.vlw");
  colorMode(RGB, 1);
  background(100);
  size(1100, 700,P3D);
  int counter=0;

  for (int i=0; i<HOR; i++){
    for (int j=0; j<VER; j++){

      particle[i][j][0] = i*19+25+random(-5,5);
      particle[i][j][1] = j*19+25+random(-5,5);
      particle[i][j][2] = 0;
      particle[i][j][7] = 1; // 1 is alive. 0 is dead
      counter=counter+3;
    }
  }
  
//kono shita honraiha i=1 to i<HOR-1 nanndesuga, kokokaemasu hone wo kakutameni
  for (int i=1; i<HOR; i++){
    for (int j=1; j<VER; j++){
      
      if(arrayI[i][j]==1){}
      else{

        particle[i][j][3] =0;
        particle[i][j][4] = 0;
        particle[i][j][5] =0;

        particle[i][j][6] = 1; //the mass

        particle[i][j][8] = i+1;
        particle[i][j][9] = j;

        particle[i][j][10] = i;
        particle[i][j][11] = j+1;

        particle[i][j][12] = i-1;
        particle[i][j][13] = j;

        particle[i][j][14] = i;
        particle[i][j][15] = j-1;

        particle[i][j][16] = i+1;
        particle[i][j][17] = j+1;

        particle[i][j][18] = i-1;
        particle[i][j][19] = j-1;
      }

    }
  }
}


int x = 0;
void draw(){
  if (frequency%10 == 0){
    frequency --;
  }
  snapCounter++;
  if (snapCounter%frequency==0){
    //keto:when stopping "go" it would be stable 
    //go();
  }

  if (record) {
    beginRaw(DXF, "output.dxf");
  }
  if (seedCountBool){
    itCount++;
  }

  
  fill(0,0,0,1);
  rect(0,0,width*2,height*2);
 // image(bi, 20,70,bi.width*1.13,bi.height*1.13); 


//keto maru no color : if point has more than one line , circle would be white.
  // draw the boxes
  for (int i=0; i<HOR; i++){
    for (int j=0; j<VER; j++){
      noStroke();
      if ( particle[i][j][7] == 1){

        fill(0,0,1,1);
      }
      else{
        fill(0,0,1,0.02);
      }
      ellipse(particle[i][j][0],particle[i][j][1],5,5);
    }
  }


//keto: line 
  fill(0.5,0.1,0.1);
  float Tension;
  int seedCount=0;
  
  
   particle[0][0][7] = 0; // 1 is alive. 0 is dead
  
//keto ijitterububunn
  // find the forces for all the nodes except the boundary ones
  for (int i=0; i<HOR;i++){
    for (int j=0; j<VER; j++){
      
      if(arrayI[i][j]==1){}
      else{
        if ( particle[i][j][7] == 1){
        try{
          seedCount=0;
          //***vectorsum**+=*spring_force***+***damping*****

          Tension = 0;

          if(particle[int(particle[i][j][8])][int(particle[i][j][9])][7]==1){

            rightNode[0] = particle[int(particle[i][j][8])][int(particle[i][j][9])][0];
            rightNode[1] = particle[int(particle[i][j][8])][int(particle[i][j][9])][1];
            rightNode[2] = particle[int(particle[i][j][8])][int(particle[i][j][9])][2];
            seedCount++;
          }

          else{
            rightNode[0]=rightNode[1]=rightNode[2]=0;
          }


          if(particle[int(particle[i][j][10])][int(particle[i][j][11])][7]==1){

            upNode[0] = particle[int(particle[i][j][10])][int(particle[i][j][11])][0];
            upNode[1] = particle[int(particle[i][j][10])][int(particle[i][j][11])][1];
            upNode[2] = particle[int(particle[i][j][10])][int(particle[i][j][11])][2];
            seedCount++;
          }

          else{
            upNode[0]=upNode[1]=upNode[2]=0;
          }


          if(particle[int(particle[i][j][12])][int(particle[i][j][13])][7]==1){
            leftNode[0] = particle[int(particle[i][j][12])][int(particle[i][j][13])][0];
            leftNode[1] = particle[int(particle[i][j][12])][int(particle[i][j][13])][1];
            leftNode[2] = particle[int(particle[i][j][12])][int(particle[i][j][13])][2];
            seedCount++;
          }

          else{

            leftNode[0]=leftNode[1]=leftNode[2]=0;
          }


          if(particle[int(particle[i][j][14])][int(particle[i][j][15])][7]==1){

            downNode[0] = particle[int(particle[i][j][14])][int(particle[i][j][15])][0];
            downNode[1] = particle[int(particle[i][j][14])][int(particle[i][j][15])][1];
            downNode[2] = particle[int(particle[i][j][14])][int(particle[i][j][15])][2];
            seedCount++;
          }

          else{
            downNode[0]=downNode[1]=downNode[2] = 0;
          }
/*
//このnewのノード2つをコメントアウトすると四角になる
          //NEW
          if(particle[int(particle[i][j][16])][int(particle[i][j][17])][7]==1){

            trNode[0] = particle[int(particle[i][j][16])][int(particle[i][j][17])][0];
            trNode[1] = particle[int(particle[i][j][16])][int(particle[i][j][17])][1];
            trNode[2] = particle[int(particle[i][j][16])][int(particle[i][j][17])][2];
            seedCount++;
          }

          else{
            trNode[0]=trNode[1]=trNode[2] = 0;
          }

          //NEW
          if(particle[int(particle[i][j][18])][int(particle[i][j][19])][7]==1){

            blNode[0] = particle[int(particle[i][j][18])][int(particle[i][j][19])][0];
            blNode[1] = particle[int(particle[i][j][18])][int(particle[i][j][19])][1];
            blNode[2] = particle[int(particle[i][j][18])][int(particle[i][j][19])][2];
            seedCount++;
          }

          else{
            blNode[0]=blNode[1]=blNode[2] = 0;
          }
//ko////////////////////////////////////////////////////////////////////////////////////////////////
*/

          stroke(1,1,1,0.4); 


            //keto
            //textFont(font,4); 
            fill(1);


            if(rightNode[0] !=0){
              line(particle[i][j][0],particle[i][j][1],particle[i][j][2],rightNode[0],rightNode[1],rightNode[2]); 
              Tension = 10*dist(particle[i][j][0],particle[i][j][1],particle[i][j][2],rightNode[0],rightNode[1],rightNode[2]);
              pushMatrix();
              translate((particle[i][j][0]+rightNode[0])/2,(particle[i][j][1]+rightNode[1])/2,(particle[i][j][2]+rightNode[2])/2);
              stroke(255,0,0);
              //keto
              //text(int(Tension), 0,0,0);
              popMatrix();
            }
          if(upNode[0] !=0){
            line(particle[i][j][0],particle[i][j][1],particle[i][j][2],upNode[0],upNode[1],upNode[2]); 
            Tension = 10*dist(particle[i][j][0],particle[i][j][1],particle[i][j][2],upNode[0],upNode[1],upNode[2]);
            pushMatrix();
            translate((particle[i][j][0]+upNode[0])/2,(particle[i][j][1]+upNode[1])/2,(particle[i][j][2]+upNode[2])/2);
          
            //keto
            //text(int(Tension), 0,0,0);
            popMatrix();

          }


          if(trNode[0] !=0){
            line(particle[i][j][0],particle[i][j][1],particle[i][j][2],trNode[0],trNode[1],trNode[2]); 
            Tension = 10*dist(particle[i][j][0],particle[i][j][1],particle[i][j][2],upNode[0],upNode[1],upNode[2]);
            pushMatrix();
            translate((particle[i][j][0]+upNode[0])/2,(particle[i][j][1]+upNode[1])/2,(particle[i][j][2]+upNode[2])/2);
  
            //keto
            //text(int(Tension), 0,0,0);
            popMatrix();

          }





          if(i==1){
            if(particle[0][j][7] !=0){
              line(particle[0][j][0],particle[0][j][1],particle[0][j][2],particle[i][j][0],particle[i][j][1],particle[i][j][2]); 
              Tension = 10*dist(particle[0][j][0],particle[0][j][1],particle[0][j][2],particle[i][j][0],particle[i][j][1],particle[i][j][2]);
              pushMatrix();
              translate((particle[0][j][0]+particle[i][j][0])/2,(particle[0][j][1]+particle[i][j][1])/2,(particle[0][j][2]+particle[i][j][2])/2);

              // text(int(Tension), 0,0,0);
              popMatrix();
            }
          }

          if(j==1){
            if(particle[i][0][7] !=0){
              line(particle[i][0][0],particle[i][0][1],particle[i][0][2],particle[i][j][0],particle[i][j][1],particle[i][j][2]); 
              Tension = 10*dist(particle[i][0][0],particle[i][0][1],particle[i][0][2],particle[i][j][0],particle[i][j][1],particle[i][j][2]);
              pushMatrix();
              translate((particle[i][0][0]+particle[i][j][0])/2,(particle[i][0][1]+particle[i][j][1])/2,(particle[i][0][2]+particle[i][j][2])/2);

              //   text(int(Tension), 0,0,0);
              popMatrix();
            }
          }





          particle[i][j][3] += k*((leftNode[0]+rightNode[0]+upNode[0]+downNode[0]+trNode[0]+blNode[0]-(seedCount*particle[i][j][0])-damping*particle[i][j][3]));
          particle[i][j][4] += k*((leftNode[1]+rightNode[1]+upNode[1]+downNode[1]+trNode[1]+blNode[1]-(seedCount*particle[i][j][1])-damping*particle[i][j][4]));
          particle[i][j][5] += k*((leftNode[2]+rightNode[2]+upNode[2]+downNode[2]+trNode[2]+blNode[2]-(seedCount*particle[i][j][2])-damping*particle[i][j][5]));
  





          //add gravity force
          //particle[i][j][5] += -particle[i][j][6]*g*0.002;
          }catch (ArrayIndexOutOfBoundsException e){
          }
        }


        if (seedCount<2){
          particle[i][j][7]=0;
        } //kill off any nodes with only 1 neighbour (trees)
      }
    }
  }




  // update the positions of the particles
  for (int i=0; i<HOR;i++){
    for (int j=0; j<VER; j++){
      if ( particle[i][j][7] == 1){
        particle[i][j][0] += particle[i][j][3];
        particle[i][j][1] += particle[i][j][4];
        particle[i][j][2] += particle[i][j][5];
      }
    }
  }




  // oscillate a single node
  //particle[10][10][5] = 4*sin(millis()*PI/1200);

  if(vibrate){
    particle[int(HOR/2)-1][int(VER/2)-1][3] += 10*cos(millis()*PI/600);
  }
  //particle[5][5][5] = mouseX;




  // Saves each frame as line-0000.tif, line-0001.tif, etc.
  //saveFrame("line-####.jpg"); 
  if(itCount%10==0){
    int randI = int(random(1,HOR-1));
    int randJ = int(random(1,VER-1));

    if(particle[randI][randJ][7]==1){
      particle[randI][randJ][7] = 0;
    }
    // else{particle[randI][randJ][7] = 1;}
  }



  if (record) {
    endRaw();
    record = false;

  }


}

void keyPressed(){

  if (key=='r'){
    record = true;
  }

  else{

    if(!vibrate){
      vibrate = true;
    }
    else{
      vibrate = false;
    }
  }

}


void go(){
  //translate(-15,-15);
  //if(seedCountBool){seedCountBool = false;}
  //else{seedCountBool = true;}

  float minDis=0;
  float distance = 0;
  int xID=0, yID=0, xIE=0, yIE=0;

  for (int i=1; i<HOR-1; i++){
    for (int j=1; j<VER-1; j++){
      if(particle[i][j][7]==1){
        distance = 0;

        if (particle[i+1][j][7]==1) distance += dist(particle[i][j][0], particle[i][j][1], particle[i+1][j][0], particle[i+1][j][1]);
        if (particle[i][j+1][7]==1) distance += dist(particle[i][j][0], particle[i][j][1], particle[i][j+1][0], particle[i][j+1][1]);
        if (particle[i-1][j][7]==1) distance += dist(particle[i][j][0], particle[i][j][1], particle[i-1][j][0], particle[i-1][j][1]);
        if (particle[i][j-1][7]==1) distance += dist(particle[i][j][0], particle[i][j][1], particle[i][j-1][0], particle[i][j-1][1]);
        if (particle[i+1][j+1][7]==1) distance += dist(particle[i][j][0], particle[i][j][1], particle[i+1][j+1][0], particle[i+1][j+1][1]);
        if (particle[i-1][j-1][7]==1) distance += dist(particle[i][j][0], particle[i][j][1], particle[i-1][j-1][0], particle[i-1][j-1][1]);

        if (distance > minDis){
          minDis =distance;
          xID = i;
          yID = j;

        }
      }
    }
  }
  particle[xID][yID][7] = 0;



  if (mouseButton==RIGHT){
    for (int i=0; i<HOR; i++){
      for (int j=0; j<VER; j++){

        if (dist(mouseX, mouseY, particle[i][j][0], particle[i][j][1]) < minDis){
          minDis = dist(mouseX, mouseY, particle[i][j][0], particle[i][j][1]);
          xIE = i;
          yIE = j;
        }
      }
    }
    particle[xIE][yIE][7] = 1;
  }




  if (mouseY>600){
    if(!seedCountBool){
      seedCountBool = true;
    }
    else{
      seedCountBool = false;
    }
  }  



}

// particle[randI-1][randJ][8] ++;
//  particle[randI][randJ-1][11] ++;
// particle[randI+1][randJ][12] --;
// particle[randI][randJ+1][15] --;







/*
void normalise(float dx,float dy, float dz){
 float tempMag = sqrt((pow(dx,2))+(pow(dy,2))+(pow(dz,2)));
 dx /= tempMag;
 dy /= tempMag;
 dz /= tempMag;
 
 
 }
 */
void mousePressed(){
  //translate(-15,-15);
  //if(seedCountBool){seedCountBool = false;}
  //else{seedCountBool = true;}

  float minDis=100000;
  int xID=0, yID=0, xIE=0, yIE=0;
  if (mouseButton==LEFT){
    for (int i=0; i<HOR; i++){
      for (int j=0; j<VER; j++){

        if (dist(mouseX, mouseY, particle[i][j][0], particle[i][j][1]) < minDis){
          minDis = dist(mouseX, mouseY, particle[i][j][0], particle[i][j][1]);
          xID = i;
          yID = j;
        }
      }
    }
  }

  particle[xID][yID][7] = 0;

  if (mouseButton==RIGHT){
    for (int i=0; i<HOR; i++){
      for (int j=0; j<VER; j++){

        if (dist(mouseX, mouseY, particle[i][j][0], particle[i][j][1]) < minDis){
          minDis = dist(mouseX, mouseY, particle[i][j][0], particle[i][j][1]);
          xIE = i;
          yIE = j;
        }
      }
    }
  }

  particle[xIE][yIE][7] = 1;


  if (mouseY>600){
    if(!seedCountBool){
      seedCountBool = true;
    }
    else{
      seedCountBool = false;
    }
  }  



}




void importBone(PImage img){
  arrayI=new int [img.width][img.height];
  loadPixels();
  for(int i=0;i<img.height;i++){
    for(int j=0;j<img.width;j++){
         if(img.pixels[i*img.width+j] == color(0, 0, 0)){
           arrayI[j][i] = 1;
         }
         else{
           arrayI[j][i]=0;
         }
    }
  }
  updatePixels();
  

}



