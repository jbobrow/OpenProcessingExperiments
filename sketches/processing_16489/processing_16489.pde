
 


int count = 15;


int maxSize = 70;
int minSize = 10;


float[][] e = new float[count][5];


float ds=1;


int sel = 0;


boolean dragging=false;


void mouseDragged(){
  

  dragging=true;
}
  

void mouseReleased(){
  

  dragging=false;
}



void setup(){
  

  frameRate(15);
  
  
  size(900,740);
  

  strokeWeight(3);
 

  for(int j=0;j< count;j++){
    e[j][0]=random(width); // X 
    e[j][1]=random(height); // Y
    e[j][2]=random(minSize,maxSize); // Radius
    e[j][3]=random(-.9,.9); // X Speed
    e[j][4]=random(-.9,.9); // Y Speed
  }
}


void draw(){
   

   background(0);
  

  for (int j=0;j< count;j++){
    

    noStroke();


    float radi=e[j][2];
    float diam=radi/2;
    

    if( dist(e[j][0],e[j][1],mouseX,mouseY) < 2*radi ){
      

      fill(0,0,0,0);
      

      sel=1;
      

      if(dragging){
        

        e[j][0]=mouseX++;
        e[j][1]=mouseY++;
      }
    } else {


   fill(0,0,0,0);
      
 
      sel=0;
    }
    

        smooth();
        
        
 
        
        
        
    ellipse(e[j][0],e[j][1],radi,radi);
    



    


    

    e[j][0]+=e[j][3];
    e[j][1]+=e[j][4];
    
 
    



    
    

    if( e[j][0] < 0      ){ e[j][0] += e[j][0];  } 
  if( e[j][0] > width ){ e[j][0] += e[j][0] ;       }
  if( e[j][1] <   0   ){ e[j][1] += e[j][1]; }
  if( e[j][1] > height ){ e[j][1] +=e[j][1];       }
    

 





    if(sel==1){
      

      fill(0,0,0,0);
      

    stroke(238,205,125);
    } else {            
      

      fill(0,0,0);
      

     stroke(238,205,122);
    }
    

    for(int k=0;k< count;k++){
      

      if( dist(e[j][0],e[j][1],e[k][0],e[k][1]) >radi){
        

        line(e[j][0],e[j][1],e[k][0],e[k][1]);
      }
    }
    

  noStroke();      
    


     
  }
}                               
