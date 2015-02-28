
int counter = 0;

int[] velY = {5,6,7,8,9,10,11,12,13,14};
int[] velYa = {5,6,7,8,9,10,11,12,13,14};
int[] velYb = {5,6,7,8,9,10,11,12,13,14};
int[] velYc = {5,6,7,8,9,10,11,12,13,14};
int[] velYd = {5,6,7,8,9,10,11,12,13,14};
int[] velYe = {5,6,7,8,9,10,11,12,13,14};
int[] velYf = {5,6,7,8,9,10,11,12,13,14};
int[] velYg = {5,6,7,8,9,10,11,12,13,14};
int[] velYh = {5,6,7,8,9,10,11,12,13,14};
int[] velYi = {5,6,7,8,9,10,11,12,13,14};

int[][] recLocation = {  {0, 350},
                         {50, 350},
                         {100, 350},
                         {150, 350},
                         {200, 350},
                         {250, 350},
                         {300, 350},
                         {350, 350},
                         {400, 350},
                         {450, 350} };
                         
int[][] recLocationA = {  {0, 325},
                         {50, 325},
                         {100, 325},
                         {150, 325},
                         {200, 325},
                         {250, 325},
                         {300, 325},
                         {350, 325},
                         {400, 325},
                         {450, 325} }; 

int[][] recLocationB = {  {0, 300},
                         {50, 300},
                         {100, 300},
                         {150, 300},
                         {200, 300},
                         {250, 300},
                         {300, 300},
                         {350, 300},
                         {400, 300},
                         {450, 300} }; 

int[][] recLocationC = {  {0, 275},
                         {50, 275},
                         {100, 275},
                         {150, 275},
                         {200, 275},
                         {250, 275},
                         {300, 275},
                         {350, 275},
                         {400, 275},
                         {450, 275} }; 

int[][] recLocationD = {  {0, 250},
                         {50, 250},
                         {100, 250},
                         {150, 250},
                         {200, 250},
                         {250, 250},
                         {300, 250},
                         {350, 250},
                         {400, 250},
                         {450, 250} }; 

int[][] recLocationE = {  {0, 225},
                         {50, 225},
                         {100, 225},
                         {150, 225},
                         {200, 225},
                         {250, 225},
                         {300, 225},
                         {350, 225},
                         {400, 225},
                         {450, 225} }; 
 
int[][] recLocationF = {  {0, 200},
                         {50, 200},
                         {100, 200},
                         {150, 200},
                         {200, 200},
                         {250, 200},
                         {300, 200},
                         {350, 200},
                         {400, 200},
                         {450, 200} }; 
 
int[][] recLocationG = {  {0, 175},
                         {50, 175},
                         {100, 175},
                         {150, 175},
                         {200, 175},
                         {250, 175},
                         {300, 175},
                         {350, 175},
                         {400, 175},
                         {450, 175} }; 
 
int[][] recLocationH = {  {0, 150},
                         {50, 150},
                         {100, 150},
                         {150, 150},
                         {200, 150},
                         {250, 150},
                         {300, 150},
                         {350, 150},
                         {400, 150},
                         {450, 150} }; 
 
int[][] recLocationI = {  {0, 125},
                         {50, 125},
                         {100, 125},
                         {150, 125},
                         {200, 125},
                         {250, 125},
                         {300, 125},
                         {350, 125},
                         {400, 125},
                         {450, 125} };                         
void setup(){
  size(500, 400);
  background(71, 139, 67);
  frameRate(30);

  
}
//
//void mouseClicked(){
//  if(mouseX > 0 && mouseX < 50){
//    for(int k=0; k<10; k++){
//    velY[k] = -velY[k];
//    }
//  }
//  
//}
  
   
void draw(){
  
    background(7, 26, 44);
  

    

    noStroke();
    
       for(int k=0; k<10; k++){
      fill(216, 237, 255);
     if (recLocationG[k][1] < 0 || recLocationG[k][1] > 360){
       velYg[k] = -velYg[k];
     }
     recLocationG[k][1] = recLocationG[k][1] + velYb[k];  
     rect(recLocationG[k][0],recLocationG[k][1], 50, 50);
   }
    
       for(int k=0; k<10; k++){
      fill(47, 72, 95);
     if (recLocationF[k][1] < 0 || recLocationF[k][1] > 360){
       velYf[k] = -velYf[k];
     }
     recLocationF[k][1] = recLocationF[k][1] + velYb[k];  
     rect(recLocationF[k][0],recLocationF[k][1], 50, 50);
   }
    
       for(int k=0; k<10; k++){
      fill(55, 120, 180);
     if (recLocationE[k][1] < 0 || recLocationE[k][1] > 360){
       velYe[k] = -velYe[k];
     }
     recLocationE[k][1] = recLocationE[k][1] + velYb[k];  
     rect(recLocationE[k][0],recLocationE[k][1], 50, 50);
   }
    
       for(int k=0; k<10; k++){
      fill(142, 201, 255);
     if (recLocationD[k][1] < 0 || recLocationD[k][1] > 360){
       velYd[k] = -velYd[k];
     }
     recLocationD[k][1] = recLocationD[k][1] + velYd[k];  
     rect(recLocationD[k][0],recLocationD[k][1], 50, 50);
   }
    
       for(int k=0; k<10; k++){
      fill(108, 185, 255);
     if (recLocationC[k][1] < 0 || recLocationC[k][1] > 360){
       velYc[k] = -velYc[k];
     }
     recLocationC[k][1] = recLocationC[k][1] + velYb[k];  
     rect(recLocationC[k][0],recLocationC[k][1], 50, 50);
   }
    
     for(int k=0; k<10; k++){
      fill(72, 168, 255);
     if (recLocationB[k][1] < 0 || recLocationB[k][1] > 360){
       velYb[k] = -velYb[k];
     }
     recLocationB[k][1] = recLocationB[k][1] + velYb[k];  
     rect(recLocationB[k][0],recLocationB[k][1], 50, 50);
   }
    
    for(int k=0; k<10; k++){
      fill(36, 151, 255);
     if (recLocationA[k][1] < 0 || recLocationA[k][1] > 360){
       velYa[k] = -velYa[k];
     }
     recLocationA[k][1] = recLocationA[k][1] + velYa[k];  
     rect(recLocationA[k][0],recLocationA[k][1], 50, 50);
   }
   
   for(int k=0; k<10; k++){
     fill(3, 133, 252);
     if (recLocation[k][1] < 0 || recLocation[k][1] > 360){
       velY[k] = -velY[k];
     }
     recLocation[k][1] = recLocation[k][1] + velY[k];  
     rect(recLocation[k][0],recLocation[k][1], 50, 50);
   }
   
      
    
}
