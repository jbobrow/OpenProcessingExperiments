


float rotX = 0; 
float rotY = 0; 
float scaleFactor = 1;
int xNum = 50;
int yNum = 50;
float k;

Flying_Carpet[][] Carpet = new Flying_Carpet[xNum][yNum];


void setup(){  
  size(600,600,P3D); 
  stroke(204, 102, 0);
  fill(30, 20, 55, 55);
  
  for(int i=0; i<xNum; i++){
    for(int j=0; j<yNum; j++){
       Carpet[i][j] = new Flying_Carpet(i*10-100,j*10-100);
    }
  }
  //smooth();
} 

void draw(){
  background(0);
  pushMatrix(); 
  translate(width/2, height/2, -1000); 
  rotateX(rotY);
  rotateZ(-rotX);
  scale(scaleFactor); 
  k += 0.01;


  // ******** DRAW STUFF GOES HERE **************
  //box(600);
  
 

  for(int i=1; i<xNum-1; i++){
    for(int j=1; j<yNum-1; j++){
   
     
       Carpet[i][j].z = int(i* cos(distance(i,j,mouseX,mouseY) + k));
  
       
       if (Carpet[i][j].z > 1 ) {
           fill(204, 102, 0, 90);
           strokeWeight(1);
       beginShape();
          
          vertex(Carpet[i+1][j].x, Carpet[i+1][j].y, Carpet[i+1][j].z);
         
          vertex(Carpet[i][j+1].x, Carpet[i][j+1].y, Carpet[i][j+1].z);
          
          vertex(Carpet[i-1][j].x, Carpet[i-1][j].y, Carpet[i-1][j].z);
         
          vertex(Carpet[i][j-1].x, Carpet[i][j-1].y, Carpet[i][j-1].z);
      endShape(CLOSE);
       }
       
       else {
         
 
      fill(255,255, 255, 65);
      strokeWeight(1);
       beginShape();
          
          vertex(Carpet[i+1][j].x, Carpet[i+1][j].y, Carpet[i+1][j].z);
         
          vertex(Carpet[i][j+1].x, Carpet[i][j+1].y, Carpet[i][j+1].z);
          
          vertex(Carpet[i-1][j].x, Carpet[i-1][j].y, Carpet[i-1][j].z);
         
          vertex(Carpet[i][j-1].x, Carpet[i][j-1].y, Carpet[i][j-1].z);
      endShape(CLOSE);
       }
   
      Carpet[i][j].z+=2; 
      Carpet[i][j].display();
    }
  }
  
  //Carpet[1][1].z = mouseX;
  
  
  
  
  popMatrix();
  

  
}




void mouseDragged() 
{ 
  if (mouseButton==LEFT){ 
    rotX += (mouseX - pmouseX) * 0.005; 
    rotY -= (mouseY - pmouseY) * 0.005; 
  } 
  if (mouseButton==RIGHT){ 
    if (scaleFactor>0.01){ 
      scaleFactor += 0.01*(mouseX-pmouseX); 
    } 
    else{ 
      scaleFactor += abs(0.01*(mouseX-pmouseX)); 
    } 
  } 
}

float distance(float x,float y,float Xorigion,float Yorigion) {
  return sqrt(sq(Xorigion - x) + sq(Yorigion - y));
}

