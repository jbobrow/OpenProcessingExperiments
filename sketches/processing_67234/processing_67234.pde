
/**
 * Random Forest Generator
 * by Héctor Corte.
 * leo_corte@yahoo.es
 * 
 * Generates a Random Forest Using Random L-system fractal tree.
 */
////////////////////////// 
 int numoftrees=20; //Number of trees that are going to be generated.
 float [] a=new float [2];//We are going to use these 2 vectors to generate the Random L-System trees.
 float [] b=new float [2];
 int WIDTH=1000;
 int HEIGHT=300;   
//////////////////////////
void setup() {  
  size(WIDTH,HEIGHT);
  background(91);
  stroke(0, 0, 0);
  strokeWeight(5);
}
//////////////////////////
void draw(){
}
//////////////////////////
void mousePressed() {
 //Each time we press mouse a new forest is generated.  
    background(91);
    stroke(0, 0, 0);
    strokeWeight(5);   
    line(0,HEIGHT-HEIGHT/10,WIDTH,HEIGHT-HEIGHT/10); //Just adding a base line to make it looks cool.
    //Next for is to generate the first branch of the trees and make it at different locations and sizes. Also vaires the number of descendants each branch will have.
    for ( int i = 0; i < numoftrees; i++ ){
         float x=random(0+WIDTH/10,WIDTH-WIDTH/10);
         a[0]=x;
         a[1]=HEIGHT/10;
         b[0]=x;
         b[1]=a[1]+random(HEIGHT/10,HEIGHT/3);
         int n=round(random(3,7));    
         iterar(a,b,n); //To generate the rest of the tree we call this function wich is going to be called recursively
    }
  }
//////////////////////////
void iterar (float [] a,float [] b,int n ) {
  //We take a as initial point of branch and b as final point. a and b are vectors. We itierate by generating new brances who's initial point is atached to line between a and b, with less longitude than a-b line, and who's direction is rotated from a-b line.
  if (n==0){
  //If we are at a final branch, we put some leaves or flowers in it  
     float [] h=new float [2];
     h[0]=b[0]-a[0];
     h[1]=b[1]-a[1];
     for (int e=0;e<round(random(10,40));e++){
       //This is for leaves
       stroke(255);
       strokeWeight(0);
       point(b[0]+random(0,0.1)*h[0],HEIGHT-b[1]-random(0,0.1)*h[1]);
     }
     for (int e=0;e<round(random(0,1));e++){
       //This for flowers
       stroke(255,0,0);
       strokeWeight(4); 
       point(b[0]+random(0,0.05)*h[0],HEIGHT-b[1]-random(0,0.05)*h[1]);
     }    
  }
  else {
    //If we are not at final breanch, we need to iterate.
    //First draw current branch
    stroke(n*10, 0, 0);
    strokeWeight(1);   
    line(a[0],HEIGHT-a[1],b[0],HEIGHT-b[1]); 
    //And them calculating new set of branchs
    float [] h=new float [2];
    h[0]=b[0]-a[0];
    h[1]=b[1]-a[1];
    float r=random(1.2,8);
    //They start on some point along the existing branch
    float [] c=new float [2];
    c[0]=b[0]-1/r*h[0];
    c[1]=b[1]-1/r*h[1];
    float w=random(0,1);
    //Now we add several new branches to that point, each one less long that this one.
    for(int f=0;f<round(random(1,6));f++)
    {
      //The branched are rotated randomly
       float t=random(-w*PI/5-PI/8,w*PI/5+PI/8);
       float s=random(0.5,0.75);
       float [] d=new float [2];
       d[0]=c[0]+s*(cos(t)*h[0]+sin(t)*h[1]);
       d[1]=c[1]+s*(-sin(t)*h[0]+cos(t)*h[1]);
       //Each branch generates new ones or is the final branch
       iterar(c,d,n-round(random(0.49,1)));
    } 
  }  
}

