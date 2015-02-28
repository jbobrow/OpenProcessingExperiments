
size(1300, 300);

rectMode(CORNERS);

// Porta 4, 5
fill(#FF0000);
rect(0, 0, 300, 150);

// sanfona
fill(#999999);
rect(300, 0, 400, 150);
line(320, 0, 320, 150);
line(340, 0, 340, 150);
line(360, 0, 360, 150);
line(380, 0, 380, 150);

// Porta 3
fill(#FF0000);
rect(400, 0, 600, 150);

// Sanfona
fill(#999999);
rect(600, 0, 700, 150);
line(620, 0, 620, 150);
line(640, 0, 640, 150);
line(660, 0, 660, 150);
line(680, 0, 680, 150);

// Porta 1, 2
fill(#FF0000);
quad(700, 0, 1200, 0, 1250, 150, 700, 150);

// Rodas
fill(#000000);
ellipse(100, 150, 75, 75);
fill(#666666);
ellipse(100, 150, 45, 45);

fill(#000000);
ellipse(450, 150, 75, 75);
fill(#666666);
ellipse(450, 150, 45, 45);

fill(#000000);
ellipse(750, 150, 75, 75);
fill(#666666);
ellipse(750, 150, 45, 45);

fill(#000000);
ellipse(1050, 150, 75, 75);
fill(#666666);
ellipse(1050, 150, 45, 45);

// Janelas
fill(#B2B2FF);
rect(25, 20, 150, 100, 5);
rect(725, 20, 850, 100, 5);
rect(975, 20, 1100, 100, 5);
triangle(1207, 20, 1207, 100, 1232, 100); 

// Portas
fill(#B2B2FF);
rect(175, 20, 275, 140, 5);
line(225, 20, 225, 140);
fill(#FF0000);
rect(180, 100, 270, 135);  

fill(#B2B2FF);
rect(490, 20, 590, 140, 5);
line(540, 20, 540, 140);
fill(#FF0000);
rect(495, 100, 585, 135);  

fill(#B2B2FF);
rect(860, 20, 960, 140, 5);
line(910, 20, 910, 140);
fill(#FF0000);
rect(865, 100, 955, 135);  

fill(#B2B2FF);
rect(1105, 20, 1205, 140, 5);
line(1155, 20, 1155, 140);
fill(#FF0000);
rect(1110, 100, 1200, 135);  

// Farol
fill(#F3FC00);
rect(1210, 130, 1240, 140);

// logo
textSize(18);
fill(#000000);
text("cidade", 793, 117);
text("de", 828, 130);
text("curitiba", 790, 143);


