
//"Stone Skipping"
//Valerie Nelkin
//Senior Honors Project 2010

float[] rightNode = new float[3]; 
float[] upNode = new float[3]; 
float[] leftNode = new float[3]; 
float[] downNode = new float[3]; 
 
boolean record, seedCountBool, vibrate; 
float damping = 0.5; 
float g = 9.81; 
int HOR = 77; 
int VER = 59; 
float k = 0.01; 
 
float[][][] particle = new float[HOR][VER][16]; //note 8,9, 10,11, 12,13, 14,15  are vertices of neighbours 
float[] destroyer = new float[4]; 
float[] destroyer2 = new float[4];

 
void setup(){ 
 
  colorMode(RGB,255); 

  size(785, 605,P3D); 
  int counter=0; 
 
  for (int i=0; i<HOR; i++){ 
    for (int j=0; j<VER; j++){ 
      particle[i][j][0] = i*10+15; 
      particle[i][j][1] = j*10+15; 
      particle[i][j][2] = 0; 
      particle[i][j][7] = 1; // 1 is alive. 0 is dead 
      counter=counter+3; 
    } 
  } 
 
  for (int i=1; i<HOR-1; i++){ 
    for (int j=1; j<VER-1; j++){ 
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
    } 
  } 
  destroyer[0] = random(width); 
  destroyer[1] = random(height); 
  destroyer[2] = 0; 
  destroyer[3] = 0; 
  destroyer2[0] = random(width); 
  destroyer2[1] = random(height); 
  destroyer2[2] = 0; 
  destroyer2[3] = 0; 
} 
 
void draw(){ 
    background(20); 
 /* if (record) { 
    beginRaw(DXF, "output.dxf"); 
  }*/ 
  fill(153,80,60); 
  ellipse(destroyer[0],destroyer[1],8,8); 
  fill(100,80,60);
  ellipse(destroyer2[0],destroyer2[1],12,12); 
 
  destroyer[2] += (mouseX-destroyer[0])   *0.001; 
  destroyer[3] += (mouseY-destroyer[1])   *0.001; 
  destroyer2[2] += (mouseX-destroyer2[0])   *0.001; 
  destroyer2[3] += (mouseY-destroyer2[1])   *0.001; 
 
 
  destroyer[2] *= 0.95; 
  destroyer[3] *= 0.95; 
  destroyer2[2] *= 0.93; 
  destroyer2[3] *= 0.93; 
 
  destroyer[0]+= destroyer[2]; 
  destroyer[1]+=  destroyer[3]; 
  destroyer2[0]+= destroyer2[2]; 
  destroyer2[1]+=  destroyer2[3]; 
 
  if (destroyer[0] > width || destroyer[0]<0) { 
    destroyer[2] *=-1; 
  } 
  if (destroyer[1] > height || destroyer[1]<0) { 
    destroyer[3] *=-1; 
  } 
 if (destroyer2[0] > width || destroyer2[0]<0) { 
    destroyer2[2] *=-1; 
  } 
  if (destroyer2[1] > height || destroyer2[1]<0) { 
    destroyer2[3] *=-1; 
  } 
 
  for (int i=0; i<HOR; i++){ 
    for (int j=0; j<VER; j++){ 
 
      if (dist(particle[i][j][0],particle[i][j][1],destroyer[0],destroyer[1])<2){ 
        particle[i][j][7] = 0; 
      } 
      if (dist(particle[i][j][0],particle[i][j][1],destroyer2[0],destroyer2[1])<3){ 
        particle[i][j][7] = 0; 
      } 
    } 
  } 
 
  fill(1,1,1,0.2); 
  rect(1,1,width,height); 
 
  // draw the boxes 
  for (int i=0; i<HOR; i++){ 
    for (int j=0; j<VER; j++){ 
      noStroke(); 
      if ( particle[i][j][7] == 1){ 
        fill(182,233,150,20); 
      } 
      else{ 
        fill(150,182,233,5); 
      } 
      rect(particle[i][j][0],particle[i][j][1],8,8); 
    } 
  } 
 
  fill(0.5,0.1,0.1); 
  float Tension; 
  int seedCount=0; 
 
  // find the forces for all the nodes except the boundary ones 
  for (int i=1; i<HOR-1;i++){ 
    for (int j=1; j<VER-1; j++){ 
      if ( particle[i][j][7] == 1){ 
        seedCount=0; 
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
 
        stroke(0,0,0,0.2);  
        fill(1); 
 
        if(rightNode[0] !=0){ 
          line(particle[i][j][0],particle[i][j][1],particle[i][j][2],rightNode[0],rightNode[1],rightNode[2]);  
          Tension = 5*dist(particle[i][j][0],particle[i][j][1],particle[i][j][2],rightNode[0],rightNode[1],rightNode[2]); 
          pushMatrix(); 
          translate((particle[i][j][0]+rightNode[0])/2,(particle[i][j][1]+rightNode[1])/2,(particle[i][j][2]+rightNode[2])/2); 
          popMatrix(); 
        } 
        if(upNode[0] !=0){ 
          line(particle[i][j][0],particle[i][j][1],particle[i][j][2],upNode[0],upNode[1],upNode[2]);  
          Tension = 5*dist(particle[i][j][0],particle[i][j][1],particle[i][j][2],upNode[0],upNode[1],upNode[2]); 
          pushMatrix(); 
          translate((particle[i][j][0]+upNode[0])/2,(particle[i][j][1]+upNode[1])/2,(particle[i][j][2]+upNode[2])/2); 
          popMatrix(); 
        } 
 
        if(i==1){ 
          if(particle[0][j][7] !=0){ 
            line(particle[0][j][0],particle[0][j][1],particle[0][j][2],particle[i][j][0],particle[i][j][1],particle[i][j][2]);  
            Tension = 5*dist(particle[0][j][0],particle[0][j][1],particle[0][j][2],particle[i][j][0],particle[i][j][1],particle[i][j][2]); 
            pushMatrix(); 
            translate((particle[0][j][0]+particle[i][j][0])/2,(particle[0][j][1]+particle[i][j][1])/2,(particle[0][j][2]+particle[i][j][2])/2); 
            popMatrix(); 
          } 
        } 
 
        if(j==1){ 
          if(particle[i][0][7] !=0){ 
            line(particle[i][0][0],particle[i][0][1],particle[i][0][2],particle[i][j][0],particle[i][j][1],particle[i][j][2]);  
            Tension = 5*dist(particle[i][0][0],particle[i][0][1],particle[i][0][2],particle[i][j][0],particle[i][j][1],particle[i][j][2]); 
            pushMatrix(); 
            translate((particle[i][0][0]+particle[i][j][0])/2,(particle[i][0][1]+particle[i][j][1])/2,(particle[i][0][2]+particle[i][j][2])/2); 
            popMatrix(); 
          } 
        } 
        particle[i][j][3] += k*((leftNode[0]+rightNode[0]+upNode[0]+downNode[0]-(seedCount*particle[i][j][0])-damping*particle[i][j][3])); 
        particle[i][j][4] += k*((leftNode[1]+rightNode[1]+upNode[1]+downNode[1]-(seedCount*particle[i][j][1])-damping*particle[i][j][4])); 
        particle[i][j][5] += k*((leftNode[2]+rightNode[2]+upNode[2]+downNode[2]-(seedCount*particle[i][j][2])-damping*particle[i][j][5])); 
      } 
      if (seedCount<2){ 
        particle[i][j][7]=0; 
      } 
    } 
  } 
 
  for (int i=0; i<HOR;i++){ 
    for (int j=0; j<VER; j++){ 
      if ( particle[i][j][7] == 1){ 
        particle[i][j][0] += particle[i][j][3]; 
        particle[i][j][1] += particle[i][j][4]; 
        particle[i][j][2] += particle[i][j][5]; 
      } 
    } 
  } 
} 
 
void mousePressed(){ 
  setup(); 
} 
 
 
 
 


