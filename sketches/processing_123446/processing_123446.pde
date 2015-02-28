
//MUSICA


//vinilos olas
float theta = 0.0;

//para latido de bocinas
float time = 0.0;
float increment = 0.01;

void setup() {
  
size(500,500);
smooth();
}

void draw() {
background(random(255));


//vinilos
//theta velocidad y flujo de la ola... x
  theta += 0.05;
   
  strokeWeight(10);
  stroke(0);
  fill(255);
  float x = theta;
  
   
  for (int i = 0; i <= 20; i++) {
    
    
 //operacion para la olita
    float y = sin(x)*height/2;
   
   
   //vinilo
  strokeWeight(18);
  stroke(0);
  fill(random(255), random(255), random(255), random(255));
    ellipse(i*25,y + height/2,50,50);
    x += 0.2;
    


//dibujando mi grabadora :)

//manijita superior
strokeWeight(10);
stroke(0,0,0);
noFill();
rect(210,130,70,25);

//cuerpo
strokeWeight(5);
stroke(0,0,0, 220);
fill(0,0,0, 230);
rect(100,150,300,160);

//centro
strokeWeight(2);
stroke(90,87,89);
fill(46,45,46);
rect(225,225,50,60);


//adorno
strokeWeight(3);
stroke(170,173,170);
fill(0,0,0, 230);
rect(100,150,300,30);



//efecto en bocinitas
float n = noise(time)*width/3.5;
  time += increment;

//bocinas fuera
strokeWeight(7);
stroke(170,173,170);
fill(56,58,59);
ellipse(150,250,n,n);
ellipse(350,250,n,n);

//bocina dentro
strokeWeight(3);
stroke(170,173,170);
fill(46,46,46);
ellipse(150,250,40,40);
ellipse(350,250,40,40);




  }
}


