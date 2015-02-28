
int trans = 50;
float noiseval;
float xpos;

void setup (){
  size(800,600);
  background(255);
}

void draw() {
  
  noiseval +=0.01;
  xpos ++;
 
  frameRate(50);
 //noStroke();  // funciona con o sin contornos
  
  fill(58,8,80,trans); //morado1
  ellipse(xpos,noise(noiseval)*1500,30,30); 
  fill(192,12,242,trans); //morado2
  ellipse(xpos,noise(noiseval)*1520,30,30);
  fill(240,0,180,trans);// magenta
  ellipse(xpos,noise(noiseval)*1550,30,30);
  
  fill(199,9,9,trans); //rojo
  ellipse(xpos,noise(noiseval)*1350,30,30); 
  fill(240,159,32,trans); //naranjo
  ellipse(xpos,noise(noiseval)*1380,30,30);
  fill(255,192,0,trans);// amarillo
  ellipse(xpos,noise(noiseval)*1400,30,30);
  
  fill(2,5,33,trans); //calipso
  ellipse(xpos,noise(noiseval)*10,30,30);
  fill(0,193,132,trans); //verde 
  ellipse(xpos,noise(noiseval)*30,30,30);
  fill(23,75,134,trans);// azul
  ellipse(xpos,noise(noiseval)*50,30,30);
  
  fill(65,205,193,trans);
  ellipse(xpos,noise(noiseval)*150,30,30);
  fill(0,193,132,trans);
  ellipse(xpos,noise(noiseval)*180,30,30);
  fill(23,75,134,trans);
  ellipse(xpos,noise(noiseval)*200,30,30);
  
  fill(199,9,9,trans); //rojo
  ellipse(xpos,noise(noiseval)*300,30,30);
  fill(240,159,32,trans); //naranjo
  ellipse(xpos,noise(noiseval)*320,30,30);
  fill(255,192,0,trans);// amarillo
  ellipse(xpos,noise(noiseval)*350,30,30);
  
  fill(58,8,80,trans); //morado1
  ellipse(xpos,noise(noiseval)*450,30,30);
  fill(192,12,242,trans); //morado2
  ellipse(xpos,noise(noiseval)*480,30,30);
  fill(240,0,180,trans); // magenta
  ellipse(xpos,noise(noiseval)*500,30,30);
  
  fill(65,205,193,trans); //calipso
  ellipse(xpos,noise(noiseval)*600,30,30);
  fill(0,193,132,trans); //verde 
  ellipse(xpos,noise(noiseval)*620,30,30);
  fill(23,75,134,trans);// azul
  ellipse(xpos,noise(noiseval)*650,30,30);
  
  fill(2,5,33,trans);
  ellipse(xpos,noise(noiseval)*750,30,30);
  fill(6,13,88,trans);
  ellipse(xpos,noise(noiseval)*780,30,30);
  fill(0,255,255,trans);
  ellipse(xpos,noise(noiseval)*800,30,30);
  
  fill(65,205,193,trans); //calipso
  ellipse(xpos,noise(noiseval)*900,30,30);
  fill(0,193,132,trans); //verde 
  ellipse(xpos,noise(noiseval)*920,30,30);
  fill(23,75,134,trans);// azul
  ellipse(xpos,noise(noiseval)*950,30,30);

  
  fill(2,5,33,trans); //calipso
  ellipse(xpos,noise(noiseval)*1050,30,30);
  fill(0,193,132,trans); //verde 
  ellipse(xpos,noise(noiseval)*1080,30,30);
  fill(23,75,134,trans);// azul
  ellipse(xpos,noise(noiseval)*1100,30,30);
 
  fill(65,205,193,trans);
  ellipse(xpos,noise(noiseval)*1200,30,30);
  fill(0,193,132,trans);
  ellipse(xpos,noise(noiseval)*1220,30,30);
  fill(23,75,134,trans);
  ellipse(xpos,noise(noiseval)*1250,30,30);
}
