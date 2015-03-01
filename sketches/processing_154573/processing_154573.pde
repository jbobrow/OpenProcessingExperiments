
//Para entender rotate y translate

size(200,200);
rectMode(CENTER);

line(0,22,width,22); // linea 1 sin ninguna transformacion

translate(width/2, height/2);
line(0,22,width,22);

rotate(45);
  fill(255,0,0,100);
  strokeWeight(3);
  stroke(255);
  rect(0, 0, 150, 150); // Cuadro ROJO
  line(0,22,width,22);      
  
rotate(radians(45)); // radians() convierte a angulos
  fill(0,0,255);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
  rect(0,0,100,100); // Cuadro AZUL
