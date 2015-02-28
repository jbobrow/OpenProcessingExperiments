
int x_x = 450, x_y = 450, y_x = 50, y_y = 450,
    z_x = 250, z_y = 50, u_x = 250, u_y = 250;
float alfa, beta, gama, Ax, Az, Ay, A;
float r1 = 255, r2= 0, r3=0, g1=0, g2=255, g3=0, b1=0, b2=0, b3=255;
//color c1;

 
 
 
 
void setup() {
  size(500,500);
   // c1 = color(random(0, 256), random(0, 256), random(0, 256));
  //c2 = color(random(0, 256), random(0, 256), random(0, 256));
    //c3 = color(random(0, 256), random(0, 256), random(0, 256));
   // r1 = random(0, 256); g1=random(0, 256); b1 = random(0, 256);
//r2 = random(0, 256); g2=random(0, 256); b2 = random(0, 256);
//r3 = random(0, 256); g3=random(0, 256); b3 = random(0, 256);
 
}
 
void draw() {
  background(255);
  fill(255);
  triangle( x_x, x_y, y_x, y_y, z_x, z_y );
  /* 
  fill(c1);
  triangle( u_x, u_y, y_x, y_y, z_x, z_y );
   
  fill(c2);
  triangle( x_x, x_y, u_x, u_y, z_x, z_y );
   
  fill(c3);
  triangle( x_x, x_y, y_x, y_y, u_x, u_y );
  
   
   
  fill(50);
  line(x_x, x_y, u_x, u_y);
  line(y_x, y_y, u_x, u_y);
  line(z_x, z_y, u_x, u_y);
    */
    stroke(0);strokeWeight(1);

  ellipse( x_x, x_y, 20, 20);

  ellipse( y_x, y_y, 20, 20);

  ellipse( z_x, z_y, 20, 20);
  text(int(r1*alfa+r2*beta+r3*gama), 20, 20);
 
   /*
 
  fill(50);
  text("x", x_x - 3, x_y + 5);
  text("y", y_x - 3, y_y + 5);
  text("z", z_x - 3, z_y + 5);
  text("u", u_x - 3, u_y + 5);
   
   /*
  //ispis vrijednosti
  ;
  text("y("+ y_x +", "+ y_y +")", 20, 35);
  text("z("+ z_x +", "+ z_y +")", 20, 50);
  text("u("+ u_x +", "+ u_y +")", 20, 65);
   
   */
  //Povrsine unutrasnjih trokuta Ax(uyz), Ay(uxz), Az(uxy) i trokuta A(xyz)
  //funkcija fabs() -> |apsolutna vrijednost floata|
  
  //tocka u
  
  //ellipse( u_x, u_y, 20, 20);
          strokeWeight(4);
          
  for (int i = 0; i <= 500; i++){
  for (int j = 0; j <= 500; j++){
  u_x = i;
  u_y = j;
  Ax = (u_x*(y_y - z_y) + y_x*(z_y - u_y) + z_x*(u_y - y_y))/2; 
  Ay = (u_x*(z_y - x_y) + z_x*(x_y - u_y) + x_x*(u_y - z_y))/2; 
  A  = (x_x*(y_y - z_y) + y_x*(z_y - x_y) + z_x*(x_y - y_y))/2;   
  Az = A - Ax - Ay; 
  alfa = Ax/A; 
  beta = Ay/A;
  gama = Az/A;
  stroke(int(r1*alfa+r2*beta+r3*gama),int(g1*alfa+g2*beta+g3*gama),int(b1*alfa+b2*beta+b3*gama));
  if(alfa >= 0 && beta >= 0 && gama >= 0 ){  
  point(i, j);
  }
  
  }
  }
}


 
void mouseDragged() {
   
 
 
 
  if((abs(mouseX - x_x) <= 20) && (abs(mouseY - x_y) <= 20)){
      //  r1 = random(0, 256); g1=random(0, 256); b1 = random(0, 256);
  x_x = mouseX;
  x_y = mouseY;
  }
   
  else if((abs(mouseX - y_x) <= 20) && (abs(mouseY - y_y) <= 20)){
    //  r2 = random(0, 256); g2=random(0, 256); b2 = random(0, 256);
  y_x = mouseX;
  y_y = mouseY;
  }
   
  else if((abs(mouseX - z_x) <= 20) && (abs(mouseY - z_y) <= 20)){
     // r3 = random(0, 256); g3=random(0, 256); b3 = random(0, 256);
  z_x = mouseX;
  z_y = mouseY;
  }
   
  else if((abs(mouseX - u_x) <= 20) && (abs(mouseY - u_y) <= 20)){
  u_x = mouseX;
  u_y = mouseY;
  }
}
