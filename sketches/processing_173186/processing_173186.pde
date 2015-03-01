



//
int i=0;
int j=0;

int x1 = 0;
int y1 = 0;
int x2 = 600;
int y2 = 0;
 
int R1 = 120;
int G1 = 60;
int B1 = 255;

void setup() {
 
size(600,500);



}
 
void draw() {
  
 //fondo que no funciona
 // Color de la parte superior orcuro
//stroke(R1,G1,B1);
// Degradado horizontal sobre fondo mas claro
//for (int x=50; x<=500; x++){
  //stroke(R1,G1,B1);
  //line(x1,y1,x2,y2);
  //y1++;
  //y2++;
  //G1++;
//}

//}
  
 background(10,10,90);
 println(mouseX, mouseY);
 



 
//Estrellas

    frameRate(7);
    float estrelles = random(3);
    int l = 0;
     while(l < height ){
     int k = 0;
     while(k < width ){
        noStroke();
        fill (255);
        ellipse(random(600), random(500), estrelles, estrelles);
         k = k + 20;
          }
     l = l + 20;
     }    



   
   
//luces...


 // Edificios
 fill(0);
 noStroke();
 rect(0,308,96,499);
 rect(95,352,50,499);
 rect(144,203,90,499);
 rect(161,188,58,203);
 triangle(188,154,173,190,203,188);
 rect(234,413,200,499);
 rect(433,386,200,499);
 rect(469,117,95,499);
 rect(492,60,50,499);
 triangle(495,60,472,60,492,117);
 triangle(541,60,557,60,542,116);
 triangle(514,12,498,61,531,61);
 rect(247,363,180,499);
 rect(257,270,90,499);
 rect(351,230,70,427);
 rect(274,258,55,499);
 triangle(382,180,364,232,405,230);
 
 
 
    
 
 //luces..
 
  //edificio2!!
     float ventanas2 = 5;
    int o = 0;
     while(o < height ){
     int p = 0;
     while(p < width ){
        noStroke();
        fill (248,239,41);
        rect(random(-500), random(100),ventanas2,ventanas2);
         p = p + 150;
          }
     o = o + 150;
     }
     
     
    //edificio1!!
    float ventanas1 = 5;
    int m = 0;
     while(m < height ){
     int n = 0;
     while(n < width ){
        noStroke();
        fill (248,239,41);
        rect(random(143,204), random(235,500),ventanas1,ventanas1);
         n = n + 150;
          }
     m = m + 150;
     }
     
     //edificio2!!
     
    
  
  
 //luna
 fill(255);
 ellipse(60,58,50,50);
 




} 


 



