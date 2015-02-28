


//nodo

// Variables de variacion y de posici´nn
float variacionX0, variacionY0, posX0, posY0;
float variacionX2, variacionY2, posX2, posY2;
float variacionX3, variacionY3, posX3, posY3;
float variacionX4, variacionY4, posX4, posY4;
float variacionX5, variacionY5, posX5, posY5;

//indice de variaci´on nodo 1
float ruidoX0 = 0.015;
float ruidoY0 = 0.014;


float ruidoX2 = 0.0091;
float ruidoY2 = 0.015;

float ruidoX3 = 0.0015;
float ruidoY3 = 0.0013;


float ruidoX4 = 0.0055;
float ruidoY4 = 0.0037;


float ruidoX5 = 0.0195;
float ruidoY5 = 0.0035;




// nodo2

// Variables de variacion y de posici´nn
float variacionXw0, variacionYw0, posXw0, posYw0;
float variacionXw2, variacionYw2, posXw2, posYw2;
float variacionXw3, variacionYw3, posXw3, posYw3;
float variacionXw4, variacionYw4, posXw4, posYw4;
float variacionXw5, variacionYw5, posXw5, posYw5;

// variaci´on nodo 2
float ruidoXw0 = 0.075;
float ruidoYw0 = 0.084;


float ruidoXw2 = 0.091;
float ruidoYw2 = 0.045;

float ruidoXw3 = 0.079;
float ruidoYw3 = 0.075;


float ruidoXw4 = 0.0055;
float ruidoYw4 = 0.0037;


float ruidoXw5 = 0.0195;
float ruidoYw5 = 0.0035;


/// --- SETUP --- ///

void setup () {
  size (300,500);
  smooth();


  //noCursor();
  cursor(CROSS);
  background(15, 15, 15);
  
  
  
}


void draw() {

entraNodo1();
entraNodo2();

}

