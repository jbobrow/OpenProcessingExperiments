


void setup(){
  size(400,400);
  background(255);
  smooth();


}

void draw (){
 // noFill();
 
square(200,100,5,5, 100,25);
square(100,200,5,5, 150,90);
square(300,300,5,5, 200,50);
square(100,400,5,5, 250,150);


}



void square (int x, float y, int rx, int ry, int d, int c){
  
pushMatrix();
 
translate(x,y);

    for(int i=d;i>0;i-=25){
    

    fill(c);
    ellipse(random(-rx, rx),random(-ry, ry),i,i);


  }

       popMatrix(); 
    
}



