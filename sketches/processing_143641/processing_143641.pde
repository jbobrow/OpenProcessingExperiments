
// Konkuk University 
 // Department of Dynamic Media 
 // SOS iDesign 
// Name: LEE Daeun  
 // ID: 201420095 

     


void setup(){
size(400, 400); 
smooth();

}

void draw(){

background(0); 
noStroke();

int n = 20; 

ellipseMode(CORNER); 
int a= width/n; 
int b= height/n; 

for (int i = 0; i<n; i++) { 

  for (int j = 0; j<n; j++) { 
      int x = i*a; 
      int y = j*b; 

    if ((i+j) %5== 0) { 
   rect(x+a/8, y+b/8, a-a/4, b-b/4); 

    } 
    else if ((i+j) %5 == 0) { 
      ellipse(x, y, a, b);
    } 
    else { 
      quad(x+a/2,y,x+a, y+b/2,x+a/2,y+b,x,y+b/2); 
    } 
  } 
} 
}


