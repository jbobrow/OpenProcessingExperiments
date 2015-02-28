
float f = (30/3);
float e = (75/3);
float d = (58/3);
float c = (20/3);
float b = (86/3);
float a = (75/3);
float t = 30;



void setup(){
  
  size (720,720);
  colorMode(HSB, 360,100,100,100);
  noStroke();

}


void draw(){
  
  fill(200,100,50,1.6);
  rect(0,0,width, height);
  float angulo = radians(mouseX);
  
  
String texto = "ha sempre um copo de mar para um homem navegar";
String [] list = split (texto, ' ');


 if (list[0].equals("ha")) {
  
   translate(width/2, height/2);
  triangle(a, b, c, d, e, f);
  fill (204,46,91,t);
  
}

if (list[1].equals("sempre")) {

 
  rotate (angulo);
  triangle (1.3*f,1.3*e,1.3*b,1.3*a,1.3*d,1.3*c);
  fill (58,40,89,t);
  
  
}


if (list[2].equals("um")) {

 
  rotate (angulo);
  triangle (1.69*c,1.69*d,1.69*e,1.69*f,1.69*a,1.69*b);
  fill (204,46,91,t);
  
  
}

if (list[3].equals("copo")) {

 
  rotate (angulo);
  triangle (2.197*b,2.197*a,2.197*d,2.197*c,2.197*f,2.197*e);
  fill (58,40,89,t);
  
  
}

if (list[4].equals("de")) {

 
  rotate (angulo);
  triangle (2.8561*e,2.8561*f,2.8561*a,2.8561*b,2.8561*c,2.8561*d);
  fill (204,46,91,t);
  
  
}


if (list[5].equals("mar")) {

 
  rotate (angulo);
  triangle (3.71293*d,3.71293*c,3.71293*f,3.71293*e,3.71293*b,3.71293*a);
  fill (58,40,89,t);
  
  
}


if (list[6].equals("para")) {

 
  rotate (angulo);
  triangle (1.3*3.71293*a,1.3*3.71293*b,1.3*3.71293*c,1.3*3.71293*d,1.3*3.71293*e,1.3*3.71293*f);
  fill (204,46,91,t);
  
  
}

if (list[7].equals("um")) {

 
  rotate (angulo);
  triangle (1.3*1.3*3.71293*f,
  1.3*1.3*3.71293*e,
  1.3*1.3*3.71293*b,
  1.3*1.3*3.71293*a,
  1.3*1.3*3.71293*d,
  1.3*1.3*3.71293*c);
  fill (58,40,89,t);
  
  
}

if (list[8].equals("homem")) {

 
  rotate (angulo);
  triangle (1.3*1.3*1.3*3.71293*c,
  1.3*1.3*1.3*3.71293*d,
  1.3*1.3*1.3*3.71293*e,
  1.3*1.3*1.3*3.71293*f,
  1.3*1.3*1.3*3.71293*a,
  1.3*1.3*1.3*3.71293*b);
  fill (204,46,91,t);
  
  
}

if (list[9].equals("navegar")) {

 
  rotate (angulo);
  triangle (1.3*1.3*1.3*1.3*3.71293*b,
  1.3*1.3*1.3*1.3*3.71293*a,
  1.3*1.3*1.3*1.3*3.71293*d,
  1.3*1.3*1.3*1.3*3.71293*c,
  1.3*1.3*1.3*1.3*3.71293*f,
  1.3*1.3*1.3*1.3*3.71293*e);
  fill (58,40,89,t);
  
  
}



}


