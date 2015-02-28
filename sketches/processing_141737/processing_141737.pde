
// Meu ano de 2013 não foi nada demais, a gente só ficou morgando nos meses das férias. Teve neve em Curitiba! Mas infelizmente eu estava no Rio Grande do Sul na época. Eu também fiz 19 anos, comemorei em mais de um lugar com os meus amigos, mas a festa mais legal acho que foi no Bar Wonka. E eu aprendi a jogar direito Dota 2 HAHA E me diverto com os meus amigos cada dia mais. Depois das férias a gente voltou pras aulas, começamos um semestre novo mas foi um início bem lerdo, pois a gente entrou em férias logo após. Acho que a gente ainda vai ter que correr muito atrás do prejuizo por conta da greve e espero que se normalize logo, não é legal ter um calendário todo bagunçado como está o nosso, mas espero que nós consigamos fazer isso dar certo. Espero conseguir me dedicar esse semestre as matérias que eu me inscrevi pois não foram muitas e eu quero realmente passar nelas. Então espero que todos tenhamos um bom semestre. 

int quantity = 300;
float [] xPosition = new float[quantity];
float [] yPosition = new float[quantity];
int [] neveSize = new int[quantity];
int [] direction = new int[quantity];
int minNeveSize = 1;
int maxNeveSize = 5;
float y=0.0;

void setup() {
  
  size(800, 600);
  frameRate(30);
  noStroke();
  smooth();
  
  for(int i = 0; i < quantity; i++) {
    neveSize[i] = round(random(minNeveSize, maxNeveSize));
    xPosition[i] = random(0, width);
    yPosition[i] = random(0, height);
    direction[i] = round(random(0, 1));
  }
  
}

void draw() {
  
  background(0);
  
  for(int i = 0; i < xPosition.length; i++) {
    
    ellipse(xPosition[i], yPosition[i], neveSize[i], neveSize[i]);
    
    if(direction[i] == 0) {
      xPosition[i] += map(neveSize[i], minNeveSize, maxNeveSize, .1, .5);
    } else {
      xPosition[i] -= map(neveSize[i], minNeveSize, maxNeveSize, .1, .5);
    }
    
    yPosition[i] += neveSize[i] + direction[i]; 
    
    if(xPosition[i] > width + neveSize[i] || xPosition[i] < -neveSize[i] || yPosition[i] > height + neveSize[i]) {
      xPosition[i] = random(0, width);
      yPosition[i] = -neveSize[i];
    }
    
  }
    for(int x=15;x<=600;x+=120)
  fill (255, 250, 250);
  textSize(70);
  text("AULAS", y-5, 100);
  text("NEVE EM CURITIBA", y-5, 250);
  text("19 ANOS", y-5, 400);
  text("DOTA COM AMIGOS!", y-5, 550);
  y += 3.8; /*Função pra fazer o texto ser animado*/
  if ( y> 900) {
    y = -50.0;
  }
}


