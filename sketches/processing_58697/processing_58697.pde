
size(500,500);// area da janela 
background(0);// cor de fundo 
noStroke();// para nao haver contorno
smooth();// para suavizar o contorno 




for ( int x = 1; x < 20; x = x+1){// para criar repetiçoes do objecto
  rect(x * 20, 10, 10, height/2);// para criar a linha 
  
}

saveFrame("1'Grid.png");// para salvar a iamgem 

