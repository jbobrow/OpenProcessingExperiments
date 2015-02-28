

int UFO = 8;
int i;
 
//Matriu de posicions:
float[] mida = new float[UFO];
float[] x = new float[UFO];
float[] y = new float[UFO];
color[] llums = new color[UFO];


void setup(){
 size(600,600);
 //Posicions inicials
 for(int i=0; i<UFO; i++){ 
    x[i] = int(random(width)); 
    y[i] =int(random(height)); 
  }
}

 
void draw(){
 background(0);
 for(int i=0; i<UFO; i++){
    x[i] += random(-3,3);
    y[i] += random(-3,3);
    mida[i]=random (10,50); //La mida del feix de llum que projectat varia.
    llums[i]=color (random (255), random (255), random (255)); //Les llums de l'UFO canvien amb la posició d'aquest.
    
 //Quan arriben a un límit surten per l'oposat:
 if(x[i]<0){
      x[i] = width;
    }
 if(x[i]>width){
      x[i]=0;
    }
 if(y[i]<0){
      y[i] =height ;
    }
 if(y[i]>height){
      y[i] = 0;
    }
     
//Dibuixos:
 noStroke ();
 fill(253,255,173);
  if (mousePressed) {
  fill(random(255), random(255), random(255));
  noStroke();
}
//Raig:
    quad(x[i]-10, y[i],x[i]+10, y[i], x[i]+mida[i],y[i]+100, x[i]-mida[i], y[i]+100);
//UFO:
    fill(142,142,142);
    ellipse(x[i],y[i],80,42);
    fill(67,67,67);
    ellipse(x[i],y[i]-1.2,70,37.5);
    fill(142,142,142);
    ellipse(x[i],y[i]-6,50,20);
    fill(65,132,183);
    ellipse(x[i],y[i]-6,45,15);
    rect (x[i]-22.5, y[i]-25, 45,20);
    ellipse(x[i],y[i]-25,45,45);
    fill(llums[i]);
    ellipse(x[i],y[i]+10,7,7);
    ellipse(x[i]-15,y[i]+8,6,6);
    ellipse(x[i]+15,y[i]+8,6,6);
    ellipse(x[i]-26,y[i]+3,4,4);
    ellipse(x[i]+26,y[i]+3,4,4);
//Alien:
    fill(255);
    ellipse(x[i],y[i]-25,25,25);
    triangle(x[i]-11,y[i]-20,x[i]+11,y[i]-20,x[i],y[i]-9);
    fill(0);
    quad(x[i]-10, y[i]-27,x[i]-2, y[i]-24, x[i]-2,y[i]-18, x[i]-8, y[i]-20);
    quad(x[i]+10, y[i]-27,x[i]+2, y[i]-24, x[i]+2,y[i]-18, x[i]+8, y[i]-20);
    
//Quan mantenim apretat el mouse apareix una persona que está essent abduïda:    
if (mousePressed){
//Persona:
  stroke(0);
  strokeWeight (3);
  line(x[i]-12,y[i]+75,x[i]-17,y[i]+80);
  line(x[i]-12,y[i]+75,x[i]-5,y[i]+80);
  line(x[i]-15,y[i]+90,x[i]-5,y[i]+80);
  line(x[i]-5,y[i]+80,x[i],y[i]+70);
  ellipse(x[i],y[i]+62,5,5);
  line(x[i]-10,y[i]+65,x[i],y[i]+70); 
  line(x[i]+10,y[i]+65,x[i],y[i]+70); 
  fill(255);
  noStroke();
  ellipse(x[i]+40,y[i]+45,35,35);
  triangle(x[i]+20,y[i]+60,x[i]+45,y[i]+55,x[i]+45,y[i]+30);
  textSize (11);
  fill(0);
  text("WTF?!",x[i]+26,y[i]+50);
  }
 }
}
 
 
void mousePressed(){
//Quan apretem el mouse, les posicions canvien :
  for(int i = 0; i<UFO; i++){
     x[i] = random(width);
     y[i] = random(height);
   } 
}


