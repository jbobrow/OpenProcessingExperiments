
int Nboles = 20;
 
  float[] posx = new float[Nboles];
float[] velx = new float[Nboles];
 
float[] posy = new float[Nboles];
float[] vely = new float[Nboles];
 
float diametre = 20;
 
void setup() {
   
size(400, 400);
for (int i=0; i<Nboles; i++){
posx[i] = random(10,width-10);
posy[i] = random(10,height-10);
velx[i] = random(-5,5);
vely[i] = random(-8,8);
}
stroke(255,0,0);
colorMode(RGB,400);
}
 
void draw() {
   
background(0);

 FonsLineas ();
 
 for (int i=0; i<Nboles; i++){
 PosicioCos (posx[i],posy[i]);
 Actualitza (i);
 }
  
  //for (int i=0; i<Nboles; i++){
    

      
}

void FonsLineas (){
  
for (int i=0; i<800; i = i +5) {
  stroke(i/2,0,0);
line(i,0, 0, i);
 
}
}

void PosicioCos (float posx, float posy){
 ellipse(posx,posy,diametre,diametre);  
}


void Actualitza (int i){
  fill(400,0,0);
  
      posx[i] = posx[i] + velx[i];
      posy[i] = posy[i] + vely[i];
 
   if ((posx[i] + diametre/2 >= width)||(posx[i] - diametre/2 <= 0)){
   velx[i] = -velx[i];
     
   }
  if ((posy[i] + diametre/2 >= height)||(posy[i] - diametre/2 <= 0)){
      vely[i] = -vely[i];
 
}
}


