

// Exemplo com  Entrada de dados apartir do teclado

float t = 0;
String numero = javax.swing.JOptionPane.showInputDialog("Entre com o tamanho da ellipse ?:");
int num = int(numero); 

void setup(){
size(num*2,num*2);
t = float(numero);  // Conversão de String
}

// mostra uma eclipse no meio da tela definida pelo tamanho de entrada fornecido!!
void draw(){
ellipse(width/2, height/2, t,t);  
}

