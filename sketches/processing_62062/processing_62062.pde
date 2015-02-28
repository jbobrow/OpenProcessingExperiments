

int anzahl = width/100; 
void setup(){
  size(500,500);
  background (255);
  
}

void draw(){
     for (int i=0; i<=500; i=i+130){  
     for (int j=0; j<=500; j=j+130){
      
        Vogel (i,j);
      
}}
}

void Vogel(float a, float b){
  pushMatrix();
  translate(a, b);
  float irisx = mouseX/22;
  float irisx2 = mouseX/22 +50;
  float irisy = -mouseY/22;
  float x=25;
  float x2=75;
  float y=40;
 
  
  fill(255,240,0);
  triangle(3,35,35,3,5,5);//Ohr links
  triangle(97,40,60,3,95,5);//Ohr rechtslinks
  
  ellipse(50,50,100,100); //Kopf
  
  
  fill(255,120,0);
  triangle(25,60,75,60,40,110);//Schnabel
  fill(255,50,0);
  triangle(25,60,75,60,60,110);//Schnabel
  
  fill(255);
  ellipse(x,35,y,40); //Auge links
  ellipse(x2,35,y,40); //Auge rechts
  fill(0);
  ellipse(irisx+10,irisy+45,15,15); //Iris links
  ellipse(irisx2+10,irisy+45,15,15); //Iris rechts
  
 
    popMatrix();
}

