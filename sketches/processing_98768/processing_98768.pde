


int quadrats=4;
//matrius de posicions i velocitats
float[] posX=new float [quadrats];
float[] posY=new float [quadrats];
float[] velX=new float [quadrats];
float[] velY=new float [quadrats];
float[] tamano=new float [quadrats];

var audioElement = document.createElement("audio");


void setup() {
  size (800, 800);
  frameRate(30); //perquè el moviment sigui fluïd i l'ull no s'adoni
 
 
 //Actualitzem
 for(int i=0;i<quadrats;i++){
    posX[i]=250;
    posY[i]=250;
    velX[i]=random(20);
    velY[i]=random(20);
    tamano [i]=random(1, 200);
 
  }
    
 }

  void draw(){
  background(0); //fons negre
  //bucle pel fons
  for (int i = 25; i<width+25; i = i +50){
   for(int j = 25; j<height+25; j = j+50){
    fill(255, random(250), mouseY-50);
    strokeWeight(1);
    stroke(255, 171, 3);
    ellipse(i, j, 50, 50);}}
  //els quadrats del fons que apareixeran seran 250
  for(int i=0; i<quadrats; i++){
    fill(255, random(10), random(200));
    rect(posY[i],posX[i],tamano[i],tamano[i]);
  }
 
  //condicionals de rebot i música de manera que torni al principi constantment
  for(int i=0;i<quadrats;i++){
    posX [i] = posX[i]+velX[i];
    posY [i] = posY[i]+velY[i];
    //actualitzem posicions
      if((posX[i]<0)||(posX[i]>width-tamano[i])){
      velX[i]=-velX[i];
      audioElement.setAttribute("src", "poik.mp3");
     audioElement.play();
 }
    if((posY[i]<0)||(posY[i]>height-tamano[i])){
      velY[i]=-velY[i];
      audioElement.setAttribute("src", "poik.mp3");
      audioElement.play();
      }
  }
  
  }
  
  

  
  //el so sembla una mica metralladora però no li dóna temps a carregar-se perquè estan constantment rebotant. He intentat posar un arxiu que simulés pluja però era massa gros!
  
  


 
 
    
 
  
  
    
  





