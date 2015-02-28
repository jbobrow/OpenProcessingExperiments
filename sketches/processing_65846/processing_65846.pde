
int clic=0;
int base=0;
int p0 = -180;
int p1 = -180;

void setup () {
  
  size(400,400);
  
}


void draw () {
  
  
  pushMatrix();
    
    translate(width/2, height/2);
    for(float a=0; a<=TWO_PI; a=a+PI/6){
    //rotate(30);

    for(int i=0; i<=12; i++){
          
      vertex(base,p0-clic);


     line (base,-180,base,-160); 
    rotate(a);
     
         endShape(CLOSE);


    }  
     
    }

    popMatrix();
    
  }

    
    

