
// Cria uma janela de 900 x 500 pixels
int px;
public void setup() {
size(900,500);

px=0;
}

//fundo Branco
public void draw() {
  
background (122,175,247);

noStroke(); 
fill(180);

rect(0,0,900,390);
fill(122,175,247);

//Parede
quad(0,390,450,200,450,200,900,390);

//Céu
stroke(72,76,183);
fill(72,76,183);

quad(0,300,450,200,450,0,0,0);
quad(450,0,450,200,900,300,900,0);

//Calçada
stroke(200);
fill(200);

quad(0,300,450,200,450,200,0,250);
quad(450,200,900,250,900,300,450,200);

stroke (255);
fill(255);

float TopoPonte = 330*sin(map(mouseX,0,width,PI/2,0));

quad(50,330,430-TopoPonte,130,433-TopoPonte,133,130,330);

float TopoPonte2 = 550*sin(map(mouseX,0,width,PI/2,0));

quad(0,330,690-TopoPonte2,330,650-TopoPonte2,360,0,360);

quad(690,330,900,330,900,360,650,360);

//Bases de apoio
quad(680,360,740,360,715,400,705,400);
quad(30,360,90,360,65,400,55,400);

stroke(255,0,255);
strokeWeight(3);
for(int i=0; i<16; i++)
point(map(i,0,16,130,433-TopoPonte),map(i,0,16,330,133));

for(int i=0; i<16; i++)
point(map(i,0,16,130,690-TopoPonte2),map(i,0,16,330,330));


}

