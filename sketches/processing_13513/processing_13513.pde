

//import processing.video.*;

float cerouno;
float c1=0.0;
int maxarco = 30; 
int boxtam = 20; 
int tamtodo = maxarco * boxtam; 
float noisecosa = .01; 
float c = 0.0; 

void setup() { 
  size(700,450,P3D); 
  noStroke(); 


noCursor ();

} 
 
void draw() { 
  background(#4D7142); 
    lights(); 
 c+=0.1;
cerouno = 1;


  
  translate(width/3,height/2,-450); 
  rotateX (TWO_PI+c/10);
 rotateY (TWO_PI+c/10);
  rotateZ (TWO_PI+c/10);
 
  pushMatrix(); 
  

  
  for (int i = 0; i<maxarco; i++) { 
    for (int j = 0; j<maxarco; j++) { 
     pushMatrix();
     
     float n = noise(map(i+c,0,maxarco,-cerouno,cerouno),map(j+c,0,maxarco,-cerouno, cerouno))*boxtam*10; 

    
  //n = n+10;
   translate(n,n,n);
     fill(75+n,70+n,21+n); 

     
     box (10+i);
    popMatrix ();
 
 
  pushMatrix();
     
 
   translate(-n,n,-n);
     fill(105+n,100+n,51+n); 

   
     box (i);
    popMatrix ();
 
  
 translate(boxtam,0,0); 

    rotateX (TWO_PI+c/1000);
  }
 
    translate(-boxtam*maxarco,maxarco,0); 


} 
  popMatrix(); 

}
 


