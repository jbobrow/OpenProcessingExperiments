
//Romina de Grote
//Sketch with grid, sin and interactive
//21.11.2010

int Width=200;
int Height=200;

float r; // variables for colors
float g;
float b;
float A;

float d = 0.0; // sin and cos
  float s ;

 
void setup(){
size(200,200);
  background(255);
  smooth();
  frameRate(100);
 
}
  
   
void draw() {  

  
 r = random(255);
 g = random(255);
 b = random(255);
 A = random(255);
 
     
 
      int i,j,a=0;
      noStroke();
      for(i=10 ; i < Height ; i = i +20){ // loop function for the grid
        for(j=10;j<Width;j=j+20){
                if(a%2==0){
                    fill(r,g,b,A);
                    
                    
                }
                else{
                    fill(0);
                   
                   
                }
                ellipse(i,j,d,d);
                a++;
                 
                 
        }
        a++;
      
     }
       d = (20 * sin(s) ); 
       s += 0.1;

       
}

void mousePressed() { // mousse pressed for background black  
background(0);
  
}

void keyPressed(){ // key pressed for bacground white
background(255);
}

    
  

