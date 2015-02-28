

objecto01[] multObjecto; // variável que permite chamar o respectivo objecto
objecto02[] multObjecto2;

int numeroObjectos; // variável para definir o número de objectos 
int numeroObjectos2;

void setup (){ // configurar caraterísticas
  size (800,600); // tamanho da tela
  background (0);
  smooth(); // suavizar formas
 
  numeroObjectos = 50; // definir o numero de objectos da variável
   numeroObjectos2 = 40;
   
  multObjecto = new objecto01 [numeroObjectos]; // chamar o objecto com a condição de multiplicação, array
  multObjecto2 = new objecto02 [numeroObjectos2];
            
            
         for (int i =0; i < numeroObjectos2; i++){  // numero de objectos é inferior ao defenido na respectiva variável
  // valores da variáveis transparência, velocidade e tamanho do objecto
    float transparencia = (250.0/ numeroObjectos2) * i; 
  float vel = (1.0/ numeroObjectos2) * i;  
 float largura = (0.0 / numeroObjectos2) * i; 

// atribuir valores às variáveis que constituiem o objecto
 multObjecto2[i] = new objecto02 ( (int) random(width), (int) random(height), largura , transparencia, vel  );  
  }       
            
                              
  
  for (int i =0; i < numeroObjectos; i++){  // numero de objectos é inferior ao defenido na respectiva variável
  // valores da variáveis transparência, velocidade e tamanho do objecto
    float transparencia = (250.0/ numeroObjectos) * i; 
  float vel = (3.0/ numeroObjectos) * i;  
 float largura = (0.0 / numeroObjectos) * i; 

// atribuir valores às variáveis que constituiem o objecto
 multObjecto[i] = new objecto01 ( (int) random(width), (int) random(height), largura , transparencia, vel  );  
  }
  

  


} // fim do ciclo setup

void draw (){ // função que chama as funções de actualização e desenho do objecto
  background(0); // reiniciar o background a cada ciclo
  
  for (int i =0; i < numeroObjectos; i++){ // numero de objectos é inferior ao defenido na respectiva variável
    
       multObjecto[i].update(); // bucar função de actualização
       multObjecto[i].desenha(); // buscar função de desenho
                               
  }
  
    for (int i =0; i < numeroObjectos2; i++){ // numero de objectos é inferior ao defenido na respectiva variável

                                
       multObjecto2[i].update(); // bucar função de actualização
       multObjecto2[i].desenha(); // buscar função de desenho
  }
  
} // fim do ciclo draw

