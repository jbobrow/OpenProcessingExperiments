
void setup (){
//creo una finestra di dimensioni 600x600 di sfondo azzurro chiaro
size(600,600);
background(193,225,245);
}
void draw (){
//imposto lo spostamento tramite mouse
 translate(mouseX, mouseY);
 smooth();
strokeWeight(4);
strokeJoin(ROUND); // Arrotondo lo spessore degli angoli
fill (252,212,229);
ellipse(300,150,100,100); //creo un cerchio per la testa
fill (255,0,29);
triangle(300,30,375,110,225,110); //creo un trangolo per il cappello
fill (25,167,57);
rect(260,200,80,200);//creo un rettangolo per il busto
//creo due rettangolo per le tasche //

rect (270,340,18,25);
rect (310,340,18,25);
//creo due rettangoli per le braccia
rect(340,225,110,20);
rect(150,225,110,20);
//creo due cerchi per le mani
fill (252,212,229);
ellipse(137.5,237,25,25);
ellipse(463,237,25,25);
//creo due quadrilateri per le gambe
fill (255,0,29);
quad(260,400,280,400,220,550,200,550);
quad(320,400,340,400,400,550,380,550);
//creo due ellissi per i piedi
fill (64,55,51);
ellipse(200,550,50,10);
ellipse(400,550,50,10);
//crei due ellissi per gli occhi
ellipse(280,135,8,6);
ellipse(320,135,8,6);
//creo un arco per la bocca
fill (255,0,29);
arc(300,168,30,20,radians(1),radians(180));
}



