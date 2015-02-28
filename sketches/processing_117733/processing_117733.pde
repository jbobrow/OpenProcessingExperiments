
//3D DLA Density

//I will use my previous sketch to achieve a 3D DLA pattern formed by lines//


Cell[] myCells= new Cell[10000];
void setup(){
background(255);
smooth();
size(900,900,P3D);
for(int i=0; i<myCells.length; i++){
  myCells[i]=new Cell();
}
}
void draw(){
//background(255);
strokeWeight(5);
translate(500,450); 
rotateX(radians(60)); 
rotateZ(radians(30));
//rect(0,0,600,600);
//rectMode(CENTER);
fill(200,100,100,150);
for(int i=0;i<myCells.length;i++){ 
   
  //myCells[i].display();
  myCells[i].update();
  myCells[i].controlzposition();   // Because I am working on Z matrix in this work, I focused on controlling Z with this function.
} 
myCells[0].isseed=true; 
for (int i=0; i<myCells.length; i++) {
    if (myCells[i].isseed == false) {
      for (int j=0; j<myCells.length;j++) {
        if (myCells[j].isseed == true) {
          float d;
          d = PVector.dist(myCells[i].location, myCells[j].location);
          if (d < 25) {
            myCells[i].isseed = true;
            for (int k = 0; k < 10; k++) {
              strokeWeight(0.1);
              line(myCells[i].location.x, myCells[i].location.y,myCells[i].location.z, myCells[j].location.x, myCells[j].location.y,myCells[j].location.z);
            }
          }
        }
      }
    }
  }
}
// DNA // 
class Cell{
  PVector location;
  PVector velocity; 
  float redd;
  float greenn;
  float bluee;
  boolean isseed;
  Cell(){ 
  location= new PVector(random(-300,300),random(-300,300),random(-100,100));
  isseed=false; 
  }
  void display(){ 
    
  if(isseed==false){   
  strokeWeight(1); 
  stroke(redd,greenn,bluee);
  point(location.x,location.y,location.z);
  redd=0;
  greenn=0;
  bluee=0;
  } 
 if(isseed==true){
  strokeWeight(6); 
  redd=255;
  greenn=0;
  bluee=0;
  point(location.x,location.y,location.z);
 }  
  }

  void update(){
  if(isseed==false){ 
  velocity= new PVector(random(-2,2),random(-2,2),random(-0,70));
  location.add(velocity);
  }       
  } 

  void controlzposition(){   
    if(location.z>350){
     location.z=350;    
    }
  }
}

