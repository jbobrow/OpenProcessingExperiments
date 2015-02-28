
float puntox;//variables para seguimientod e hojo!
float puntoy;
float puntox2;
float puntoy2;
int v=0; //variable de textos
int aaa=0; //variable de background

void setup(){
  size(600,300);
  background(#00BFFF);
}
void draw(){
  noStroke();
  
  fill(0); //cabeza!
  rect(30,10,350,280);
  rect(10,40,390,220);
  rect(187,53,100,30);
  
  fill(#CFCFCF);
  rect(70,53,285,100);
  rect(94,119,235,170);
    
  fill(0);
  rect(187,53,50,15);
    
  stroke(0); //borde cara
  line(30,10,380,10);
  line(30,290,380,290);
  line(10,40,10,260);
  line(400,40,400,260);
  line(30,10,30,40);
  line(10,40,30,40);
  line(380,10,380,40);
  line(380,40,400,40);
  line(380,260,380,290);
  line(380,260,400,260);
  line(10,260,30,260);
  line(30,260,30,290);
  
  fill(#FFBF00); //pico!
  ellipse(210,200,160,50);
  

  

  
  if(mousePressed == true){
  noStroke();
  fill(0); //ojo!(parte negra) 1
  rect(100,90,70,20);
  rect(110,80,20,40);
  rect(140,80,20,40);
  rect(120,120,30,10);
  rect(130,130,10,10);
        fill(#FF0000);//parte roja!
        rect(110,90,20,20);
        rect(140,90,20,20);
        rect(120,100,30,20);
        rect(130,120,10,10);
        
  fill(0); //ojo!(parte negra) 2
  rect(250,90,70,20);
  rect(260,80,20,40);
  rect(290,80,20,40);
  rect(270,120,30,10);
  rect(280,130,10,10);
        fill(#FF0000);//parte roja!
        rect(260,90,20,20);
        rect(290,90,20,20);
        rect(270,100,30,20);
        rect(280,120,10,10);

  }
  else{
                
              smooth(); //seguimiento de ojo!
              stroke(0); 
              puntox=map(mouseX, 0, 900, 118, 155);
              puntoy=map(mouseY, 0, 300, 83, 128);
              puntox2=map(mouseX, 0, 900, 268, 305);
              puntoy2=map(mouseY, 0, 300, 83, 128);
              fill(255);
               
              rect(115,80,40,60);    
              rect(265,80,40,60);
              fill(0);
                
              rect(puntox, puntoy, 10, 10);
              rect(puntox2, puntoy2, 10, 10);
   
 }
}
//textos!

void mouseReleased(){
    textSize(15);
          if(v==0){
              text("Soy un pinguino!",420,60);
              v=v+1;
              }else if(v==1){
                text("y tengo sentimientos!",420,80);
                v=v+1;
              }else if(v==2){
                text("me enamoro!",420,100);
                v=v+1;
              }else if(v==3){
                text("pero solo de",420,120);
                v=v+1;
              }else if(v==4){
                text("quien pulsa el raton!",420,140);
                v=v+1;
              }else if(v==5){
                text("",420,160);
                v=v+1;
              }else if(v==6){
                text("te estoy vigilando!",420,180);
                v=v+1;
              }else if(v==7){
                text("no cliques en...!",420,200);
                v=v+1;
              }else if(v==8){
                text(" ",420,130);
                v=v+1;
              }else if(v==9){
                text(" ",420,130);
                v=v+1;
              }else if(v==10){
                textSize(25);
                text("este circulo!O",420,240);
              }
          }
void mousePressed(){
  if (567 <= mouseX && mouseX <= 584 && 223 <= mouseY && mouseY <= 240 ){ //solo si pulsas en la O
    aaa=color(random(255),random(255),random(255));
          background(aaa); //cambia el fondo
          textSize(25);
          text("este circulo!O",420,240); //para que siga saliendo el circulo
          v=v+1;
  if(v>=50){
          text("No te aburres?",419,269);
  }
  textSize(10);
  text("as pulsado "+(v-(10))+" veces",419,279); //contador de pulsaciones (desde que pulsas la O
  }
}


