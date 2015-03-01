
int numeroEstrelles=200;
//creem un array de 100 posicions per les coordenades i el tamany en que cada posició significarà una estrella
float [] posicioX= new float[numeroEstrelles];
float [] posicioY=new float[numeroEstrelles];
int  [] tamanyE =new int [numeroEstrelles];
int [] direccio = new int [numeroEstrelles];
void setup(){
    
size(800,700);
frameRate(20);
//Determinem les característiques que tindran les coordenades i tamany de les estrelles

for(int i=0;i<numeroEstrelles;i++){
    tamanyE[i]=round(random(3,6));
    posicioX[i]= random(0,width);
    posicioY[i]=random(0,500);
    direccio[i]= round(random(0,1));
   }

}



void draw(){
  println(mouseX+ "," + mouseY);
  //fons i gespa
   background(0,0,0);
   
   
   //dibuixem les estrelles
  
     
   for(int i=0;i<posicioX.length;i++){
      fill(255,255,0);
     ellipse(posicioX[i],posicioY[i],tamanyE[i],tamanyE[i]); 
  //moviment de les estrelles
    if(direccio[i]==0){
         posicioY[i]= posicioY[i] +10; 
         posicioX[i]= posicioX[i] -10;
    }
    else{
        posicioY[i]= posicioY[i] + 10;
        posicioX[i]= posicioX[i] + 10;
    }
    //Fem que no deixi de caure estrelles
    if(posicioX[i] > width + tamanyE[i] || posicioY[i] > height + tamanyE[i]){
    posicioX[i] = random(0,width);
    posicioY[i] = tamanyE[i];
    
    }
   
   }
   //gespa
    fill(0,255,0);
   rect(0,500,800,200);
   //casa
   fill(200,100,0);
   rect(330,400,100,100);
   triangle(330,400,430,400,380,350);
     
   fill(255,255,0);
   rect(342,418,30,30);
   rect(387,418,30,30);
   fill(200,100,0);
   line(356,419,356,448);
   line(342,433,372,433);
   line(401,419,401,448);
   line(388,433,418,433);
   line(363,499,363,470);
   line(363,470,387,470);
   line(387,470,387,499);
   ellipse(381,488,5,5);
 
}


