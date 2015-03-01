

// Dimensões da janela
int WSZ_X = 1000;
int WSZ_Y = 400;

// Centro de coordenadas
float cx = WSZ_X/2;
float cy = WSZ_Y/2;

// Parâmetros da fase
float theta = 0;    // fase das senóides
float step = 0.15;   // incremento de fase das senóides

// Parâmetros da senóide (portadora)
float f0 = 1000;     // frequência principal
float Fs = 50000;   // frequência de amostragem
float Ts = 1/Fs;    // intervalo de amostragem
float A_p = 50;    // amplitude

// Parâmetros da senóide (modulação em amplitude)
float f0_m = 100;
float Fs_m = Fs;
float Ts_m = 1/Fs_m;
float A_m  = 30;

// Parâmetros da senóide (modulação em frequência)
float f0_f = 100;
float Fs_f = Fs;
float Ts_f = 1/Fs_m;
float freq_desv = 5;
float freq_m = 1;

void setup() {
  size(1000, 400);
}

void draw() {
  background(0);
  
  theta -= step;
  
  // modulação em amplitude
  for ( float x = 0 ; x < WSZ_X ; x++ ) {
    float xbar, ybar, y;
    
    // centra a coordenada x
    xbar = x - cx;  
    
    // calcula a coordenada da onda
    ybar = ( A_p + A_m * sin(2*PI*f0_m*xbar*Ts_m) ) * sin(2*PI*f0*xbar*Ts + theta);
    
    // transforma na coordenada virtual
    y = ybar + cy;
    
    // plota
    stroke(255, 0, 0);
    point(x, y);
  }
  
  // modulação em frequência
  for ( float x = 0 ; x < WSZ_X ; x++ ) {
    float xbar, ybar, y;

    // centra a coordenada x
    xbar = x - cx;  
    
    // calcula a coordenada da onda
    ybar = A_p * sin(2*PI*f0*xbar*Ts + (freq_desv/freq_m) * cos(2*PI*f0_f*xbar*Ts) + theta);
    
    // transforma na coordenada virtual
    y = ybar + cy;
    
    // plota
    stroke(255, 250, 0);
    point(x, y);
  }    

}


