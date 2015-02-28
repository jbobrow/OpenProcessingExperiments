
//Remi A.Cavalheiro  S53 ARQ&URB UTFPR
//NEVASCA NA PONTE MARÇO2014

//NEVASCA NA PONTE de REMI está licenciado com uma Licença 
//Creative Commons - Atribuição 4.0 Internacional.

//<a rel="license" href="http://creativecommons.org/
//licenses/by/4.0/"><img alt="Licença Creative Commons" 
//style="border-width:0" src="http://i.creativecommons.org/
//l/by/4.0/88x31.png" /></a><br /><span xmlns:dct=
//"http://purl.org/dc/terms/" property="dct:title">NEVASCA NA PONTE
//</span> de <span xmlns:cc="http://creativecommons.org/ns#" 
//property="cc:attributionName">REMI</span> 
//está licenciado com uma Licença <a rel="license" href=
//"http://creativecommons.org/licenses/by/4.0/">Creative Commons 
//- Atribuição 4.0 Internacional</a>.

// Neve, seguindo tutorial chuva prof. Merkle  
int flocos=400;  
float angulo;
float [] nevex;  

float [] nevey;  

int ac;//função acumular neve  

void setup() {  

  size(400, 400);  

  strokeWeight(3);  

  stroke(0);  

  nevex = new float[flocos];  

  nevey = new float[flocos];  

  for (int i=0; i<flocos; i++)  

  {  

    nevex[i] = floor(random(width));  

    nevey[i] = floor(random(height));
  }
}  
void draw() {  
  //background(100, 100, 255);  
  background(44, 42, 70);  

  //predios pretos  
  fill(0);    

  rect(0, 280, 43, 120);  

  rect(42, 320, 30, 80);  

  rect(72, 250, 50, 150);  

  rect(82, 220, 30, 30);  

  triangle(87, 220, 107, 220, 97, 170);  

  rect(122, 300, 34, 100);  

  rect(155, 350, 55, 50);

  rect(290, 350, 63, 50);  

  rect(353, 250, 30, 150);  

  ellipse (368, 250, 30, 100);  

  rect(383, 300, 17, 100 );  


  stroke(200);  

  for (int i=0; i<flocos; i++)  

  {  
    point(nevex[i], nevey[i]);  

    nevey[i]=nevey[i]+random(-0.1, 0.5);//MOVIMENTO VER 

    nevex[i]=nevex[i]+random(-0.1, 0.1);//MOVIMENTO HOR

    if (nevey[i]>height)  

    {  

      nevex[i] = floor(random(width*1.5));  

      nevey[i] = 0;//floor(random(height));  


      if (ac< 90)//limite altura neve  

        ac++;//função acumular neve
    }
  }  

  fill(255);//função acumular neve  

  noStroke();//função acumular neve  

    rect(0, height, width, -pow(ac, 0.777));//função acumular neve
 
 
 //ponte esq
  pushMatrix();
  //translate(210, 215);
  translate(210, 350);
  rotate(-PI/5.0*(1+sin(angulo))); 
  angulo+=0.01;
  rect(0, 0, 40, 5);

  popMatrix();  

  //ponte dir 
  pushMatrix();
  //translate(210, 215);
  translate(290, 350);
  rotate(PI+PI/5.0*(1+sin(angulo))); 
  angulo+=0.0001;//velocidade subir/baixar
  rect(0, -5, 40, 5);

  popMatrix();  }  



