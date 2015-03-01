
/*************************************************************************
Nome(s): Marina Mayumi Handa e Priscila Salomão de Jesus
Data: 13/10/2014

Explicação:

Ada Lovelace nasceu em Londres, Inglaterra, no século XIX. 
Na imagem representa-se o seu rosto com o penteado que corresponde a tal epoca e lugar. 
As mulheres eram lapidadas a gostar de arte e Alda era artistica, porém, se interessava 
muito por matematica. O papel da mulher se limitava ao de serem almas puras, e passivas,
por esse motivo, não deveriam ser corrompidas com ciencia. Anne Isabella, mae de Ada,
não queria ver sua filha envolvida com ciencia. Os numeros eram sua forma de se expressar 
artisticamente, por isso cita-se na representação, a frase que Ada chegou a dizer a 
sua mae “Se você não pode me dar poesia, poderia me dar ciência poética?"
*************************************************************************/

size(500, 500); // definindo o tamanho do quadro
background(#E8DAE8);

fill(244, 244, 244); // preenchendo com cor
ellipse(width/2, height/2, 200, 400); // moldura para criacao do rosto minimalista

fill(#FAF8E8); // cor do rosto
ellipse(width/2, 200, 80, 105); // moldura para criacao do rosto minimalista

stroke(#150E03);
fill(#150E03); // cor do cabelo
ellipse((height/2)-37, 185, 30, 60); // coque esquerdo

arc((height/2), 175, 65, 65, radians(160), radians(380));

stroke(#150E03);
fill(#150E03); // cor do cabelo
ellipse((height/2)+37, 185, 30, 60); // coque direito

stroke(255);
strokeWeight(2);
fill(#A4B4F2);
//rect(200, height-150, 100, 35); // area para a hashtag

fill(0);
textSize(20);
text("#AdaDay", 207, height-129); //hashtag

// texto final com citacao a Ada Lovelace
fill(0, 0, 0);
textSize(12);
text("Se você não pode me dar poesia, poderia me dar ciência poética?", 50, height - 30);

