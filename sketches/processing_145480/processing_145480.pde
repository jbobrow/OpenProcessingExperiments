
PFont font1;
PFont font2;
String logo1 = "2";
String logo11 = "0";
String logo2 = "ft";
int interliniat = 90; 
int posiciologo = 130;
float moveX = 0;
float moveY = 0;
int numero = 0;


void setup(){
  size(300,600);
  background(0);
  smooth();
 
  textAlign(CENTER,CENTER);
  font1 = createFont("helvetica.ttf",50);
  font2 = createFont("Georgia.ttf",30);
  
  
}

void draw(){
  
  //ESTAMPAT!
  randomSeed(5);
  noFill();
  strokeWeight(50);
  moveX = mouseX;
  moveY = -mouseY;
  for(int i=0; i<1000; i++){
    stroke(random(100,255),18,random(100,255));
    beginShape();
    bezier(0,-1000+i*40,moveX/10,-moveY/10,moveX*2,-moveY*2,width,-1000+i*40);
    endShape();
  }
  
  
  
  //LOGOTIP!
  fill(255);
  noStroke();
  
  textFont(font1);
  textSize(100);
  text(logo1,width/2,posiciologo);
  text(logo11,width/2,posiciologo+interliniat);
  text(logo11,width/2,posiciologo+interliniat*2);
  text(logo11,width/2,posiciologo+interliniat*3);
  
  textFont(font2);
  textSize(50);
  text(logo2,width/2,posiciologo+interliniat*3+70);
}

void keyPressed(){
  if(key == 's'){
    save("wine_label_"+numero); 
    numero = numero + 1;
  } 
}


