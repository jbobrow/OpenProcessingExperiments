

//Viagem de colaçao de grau. Maceió-AL

float x1barco1=-200, x2barco1=-110, x1barco2=-300, x2barco2=-210;
float x1barco3=-400, x2barco3=-310, x1barco4=-500, x2barco4=-410;
float x1barco5=-600, x2barco5=-510, x1barco6=-700, x2barco6=-610;
void setup(){
  size(700,500);
  
}
void paisagem(){
    noStroke();
    int cor_ceu = 200;
    for (int x=0;x<=180;x+=10){
      fill(0,x,cor_ceu);
      rect(0,x,700,20);
      cor_ceu++;
    }
    //areia
    fill(219,203,91);
    for(int a=0;a<=700;a+=50){
      ellipse(a,270,300,200);
    }
    //Mar
    fill(0,0,255);
    for(int m=0;m<=700;m+=50){
      ellipse(m,400,200,330);
    }
    
        
}
void nuvens(){
  fill(192,217,217); 
    ellipse(185,28,120,40);
    ellipse(171,23,50,40);
    ellipse(207,23,50,40);
    ellipse(175,35,50,40);
    ellipse(205,35,50,40);
    ellipse(350,28,77,20);
    ellipse(314,23,50,20);
    ellipse(364,23,50,20);
    ellipse(319,35,50,20);
    ellipse(349,35,50,20);  
    ellipse(500,28,80,40);
    ellipse(514,23,50,40);
    ellipse(550,23,50,40);
    ellipse(519,35,50,40);
    ellipse(553,35,50,40);
  
}

void draw(){
  paisagem();
  nuvens();
  fill(237,28,36);
  triangle(x1barco1,300,x2barco1,350,x2barco1,220); //barco1
  fill(255,128,192);
  triangle(x1barco2,360,x2barco2,400,x2barco2,270); //barco2
  fill(255,242,0);
  triangle(x1barco3,300,x2barco3,350,x2barco3,220); //barco3
  fill(34,177,76);
  triangle(x1barco4,360,x2barco4,400,x2barco4,270); //barco4
  fill(0,162,232);
  triangle(x1barco5,300,x2barco5,350,x2barco5,220); //barco5
  fill(163,73,164);
  triangle(x1barco6,360,x2barco6,400,x2barco6,270); //barco6
  strokeWeight(11);
  stroke(100,100,100);
  line(x1barco1+10,360,x2barco1+20,353); //barco1 
  line(x1barco2+10,410,x2barco2+20,403); //barco2
  line(x1barco3+10,360,x2barco3+20,353); //barco3 
  line(x1barco4+10,410,x2barco4+20,403); //barco4
  line(x1barco5+10,360,x2barco5+20,353); //barco5 
  line(x1barco6+10,410,x2barco6+20,403); //barco6
  x2barco1 += 3; x1barco1 +=3; //barco1
  x2barco2 += 3; x1barco2 += 3; //barco2
  x2barco3 += 3; x1barco3 +=3; //barco3
  x2barco4 += 3; x1barco4 += 3; //barco4
  x2barco5 += 3; x1barco5 +=3; //barco5
  x2barco6 += 3; x1barco6 += 3; //barco6
  
  if (x1barco6 > 700){
    x1barco1 = -200;x2barco1 = -110; //barco1
    x1barco2 = -300;x2barco2 = -210; //barco2
    x1barco3 = -400;x2barco3 = -310; //barco3
    x1barco4 = -500;x2barco4 = -410; //barco4
    x1barco5 = -600;x2barco5 = -510; //barco5
    x1barco6 = -700;x2barco6 = -610; //barco6
  }
   
   
}
}
