
size (200,200);
background(255);
int ladoy=(height-7*2)/8;
// 7 é o espaçamento e *2 porque é de 2mm entre cada quadrado
int ladox=(width-7*2)/8;
// 7 é o espaçamento e *2 porque é de 2mm entre cada quadrado
rect(0,0,ladox,ladoy);
// 0,0 é o local que inicia o primeiro quadrado
// ladox e ladoy 
//para que o quadrado como um todo tenha as medidas estabelecidas
for(int i=0; i<200; i= i+ladox+2){
  for(int j=0; j<200; j= j+ ladoy+2){
    rect(i,j,ladox,ladoy);
  }
}
//int i=0 representa a posição da matriz
//i<200 representa até onde você vai repetir os quadradinhos
// i= i + ladox+2 serve para dar o espaçmento entre os quad
// e com j será a mesma coisa
fill(190,190,190);
rect(2*ladox+2*2,1*ladoy+1*2,ladox,ladoy);
rect(5*ladox+5*2,1*ladoy+1*2, ladox, ladoy);
fill(170,190,190);
rect(1*ladox+1*2,2*ladoy+2*2,ladox,ladoy);
rect(6*ladox+6*2,2*ladoy+2*2,ladox,ladoy);
rect(2*ladox+2*2,2*ladoy+2*2,ladox,ladoy);
rect(5*ladox+5*2,2*ladoy+2*2,ladox,ladoy);
fill(150,190,190);
rect(3*ladox+3*2,3*ladoy+3*2,ladox,ladoy);
rect(4*ladox+4*2,3*ladoy+3*2,ladox,ladoy);
fill(130,190,190);
rect(2*ladox+2*2,4*ladoy+4*2,ladox,ladoy);
rect(5*ladox+5*2,4*ladoy+4*2,ladox,ladoy);
rect(3*ladox+3*2,4*ladoy+4*2,ladox,ladoy);
rect(4*ladox+4*2,4*ladoy+4*2,ladox,ladoy);
fill(110,190,190);
rect(2*ladox+2*2,5*ladox+5*2,ladox,ladoy);
rect(3*ladox+3*2,5*ladoy+5*2,ladox,ladoy);
rect(4*ladox+4*2,5*ladoy+5*2,ladox,ladoy);
rect(5*ladox+5*2,5*ladoy+5*2,ladox,ladoy);
fill(80,190,190);
rect(1*ladox+1*2,6*ladoy+6*2,ladox,ladoy);
rect(2*ladox+2*2,6*ladoy+6*2,ladox,ladoy);
rect(5*ladox+5*2,6*ladoy+6*2,ladox,ladoy);
rect(6*ladox+6*2,6*ladoy+6*2,ladox,ladoy);
fill(5,190,190);
rect(2*ladox+2*2,7*ladoy+7*2,ladox,ladoy);
rect(5*ladox+5*2,7*ladoy+7*2,ladox,ladoy);
