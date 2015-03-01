
void setup() 
{
  size(600, 600);
  background (255,255,255);
  
} 

void draw() 
{
  int mostres = 45; //num barres
  
  float angle = 0.0;
  float inc = TWO_PI/mostres;
  
  //inicialitza colors
  float col1 = 255;
  float col2 = 0;
  float col3 = 0;
  float inccol =  255*6.05 / mostres; //valor variacio segons mostres
  
  //vectors de moviment del color. 0 decreixent, 1 creixent i 2 estatic
  int veccol1 = 2;
  int veccol2 = 1;
  int veccol3 = 2;
    
     for(int mostra=0; mostra<mostres*2; mostra=mostra+2) {
       
       stroke (col1, col2, col3, 50);
       strokeWeight (5);
       line(300,300+20, 300-sin(angle)*200, 20+300-cos (angle)*200);
       angle = angle + inc;
      
  
  //comprobació vectors i inc/dec 
  
          if (veccol1==0)  { 
            col1=col1-inccol;
          } else {
            if (veccol1==1) {
              col1=col1+inccol;
              }
            }
            
          if (veccol2==0)  { 
            col2=col2-inccol;
          } else {
            if (veccol2==1) {
              col2=col2 + inccol;
              }
            }
            
          if (veccol3==0)  { 
            col3=col3-inccol;
            } else {
            if (veccol3==1) {
              col3=col3+inccol;
              }
            }
     
   //actualització vectors 
      
         //posar en repos  
         if (col1<=0) {
         col1=0;
         veccol1=2;
         }         
         if (col1>=255) {
         col1=255;
         veccol1=2;
         }
         
         if (col2<=0) {
         col2=0;
         veccol2=2;
         }         
         if (col2>=255) {
         col2=255;
         veccol2=2;
         }
         
         if (col3<=0) {
         col3=0;
         veccol3=2;
         }         
         if (col3>=255) {
         col3=255;
         veccol3=2;
         }
         
         
         //decrèixer
         if(col1==col2 && col1==255) {
         veccol1=0;
         }
         if(col2==col3 && col2==255) {
         veccol2=0;
         }
         if(col3==col1 && col3==255) {
         veccol3=0;
         }
         
         
         //crèixer
          if(col1==col2 && col1==0) {
         veccol1=1;
         }
         if(col2==col3 && col2==0) {
         veccol2=1;
         }
         if(col3==col1 && col3==0) {
         veccol3=1;
         }
                      
     }
     
     
     //cercle blanc
    fill (255,255,255);
    stroke (255,255,255);
    ellipse (300,300+20,200, 200);  
    
    //text
    fill(0,0,0);
    textSize(24);
    text("Cercle de Sant Martí", 180,60);
}




