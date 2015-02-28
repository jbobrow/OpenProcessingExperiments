
size (500,500); 
background (255);  
smooth(); 
noStroke();

// Variaveis de tamanho 

float strokeSize = 2; // tamanho 
float pointSize = 5;

// Variaveis de quantidade

int numberLines = 200; // quantidade
int numberPoints = 10;

// Variaveis de forma (caixa para conter os objectos)

int numShapes = 5; 
int stepSizeH = (int) (height/ numShapes); 
int stepSizeW = (int) (width/ numShapes); 

// Localização de formas e loop

for ( int h = 0; h < height; h = h + stepSizeH)
{
    for ( int w = 0; w < width; w = w + stepSizeW)
  {
       stroke(random(255),random(255),random(255), random(50,255) );
      
        // Estructura da "caixa"
       
        for ( int i = 0; i < numberLines; i = i +1)
        { 
          strokeWeight( random(strokeSize)); 
          line (random(w,w+stepSizeW), random(h,h+stepSizeH), random(width), random(height));
          
          
          
          
  {
       stroke(random(255),random(255),random(255), random(50,255) );
        
       // Grelha manual de caixas (fundo do camaleao) 
       
        for ( int c = 0; c < numberPoints; c = c +1)
        { 
          strokeWeight( random(pointSize)); 
          point (random(300,400), random(50,150));
          point (random(250,350), random(150,250));
          point (random(150,250), random(250,350));
          point (random(150,250), random(150,250));
          point (random(250,300), random(100,150));
          point (random(50,150), random(200,300));
          point (random(50,150), random(300,400));
          point (random(80,270), random(100,200));
           point (random(100,200), random(80,100));
          
          
                  }
    }
    
}
        }
  }
 
  
  // Corpo camaleao
  
  fill(0,255,255,65);
  stroke(255);
  strokeWeight(5);
  beginShape();
  vertex(440,85);
  vertex(415,80);
  vertex(395,63);
  vertex(360,60);
  vertex(300,40);
  vertex(310,70);
  vertex(297,88);
  vertex(268,97);
  vertex(220,84);
  vertex(164,83);
  vertex(80,140);
  vertex(60,180);
  vertex(50,237);
  vertex(46,292);
  vertex(72,363);
  vertex(130,408);
  vertex(200,396);
  vertex(223,340);
  vertex(212,300);
  vertex(160,277);
  vertex(108,283);
  vertex(110,307);
  vertex(123,329);
  vertex(140,303);
  vertex(170,312);
  vertex(168,350);
  vertex(137,359);
  vertex(100,323);
  vertex(97,280);
  vertex(127,250);
  vertex(156,248);
  vertex(227,264);
  vertex(310,232);
  vertex(320,190);
  vertex(350,150);
  vertex(380,143);
  vertex(460,100);
  endShape(CLOSE);
  
  // Olho camaleao
  
  ellipse(370,85,50,50);
  ellipse(370,85,38,38);
  ellipse(370,85,26,26);
  ellipse(370,85,14,14);
  

