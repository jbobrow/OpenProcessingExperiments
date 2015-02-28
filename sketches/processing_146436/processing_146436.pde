
int x_x = 450, x_y = 450, y_x = 50, y_y = 450,
    z_x = 250, z_y = 50, u_x = 250, u_y = 250;
float alfa, beta, gama, Ax, Az, Ay, A;


void setup() {
  size(500,500);
}

void draw() {
  background(255);
  fill(255);
  triangle( x_x, x_y, y_x, y_y, z_x, z_y );
  
  line(x_x, x_y, u_x, u_y);
  line(y_x, y_y, u_x, u_y);
  line(z_x, z_y, u_x, u_y);
  
  ellipse( x_x, x_y, 20, 20);
  ellipse( y_x, y_y, 20, 20);
  ellipse( z_x, z_y, 20, 20); 
 
 //tocka u
  ellipse( u_x, u_y, 20, 20);
  

  fill(50);
  text("x", x_x - 3, x_y + 5);
  text("y", y_x - 3, y_y + 5);
  text("z", z_x - 3, z_y + 5);
  text("u", u_x - 3, u_y + 5);
  
  
  //ispis vrijednosti
  text("x("+ x_x +", "+ x_y +")", 20, 20);
  text("y("+ y_x +", "+ y_y +")", 20, 35);
  text("z("+ z_x +", "+ z_y +")", 20, 50);
  text("u("+ u_x +", "+ u_y +")", 20, 65);
  
  
  //Povrsine unutrasnjih trokuta Ax(uyz), Ay(uxz), Az(uxy) i trokuta A(xyz) 
  Ax = (u_x*(y_y - z_y) + y_x*(z_y - u_y) + z_x*(u_y - y_y))/2;

  Ay = (u_x*(z_y - x_y) + z_x*(x_y - u_y) + x_x*(u_y - z_y))/2;

  A  = (x_x*(y_y - z_y) + y_x*(z_y - x_y) + z_x*(x_y - y_y))/2;
  
  Az = A - Ax - Ay;
  //racunanje parametara alfa, beta i gama po formuli alfa = Ax/A .. itd.

  alfa = Ax/A;  
  beta = Ay/A;
  gama = Az/A;
  
  //ispis vrijednosti
  text("\u03B1 = " + alfa, 20, 85);
  text("\u03B2 = " + beta, 20, 100);
  text("\u03B3 = " + gama, 20, 115);
}

void mouseDragged() {
  
  
  if((abs(mouseX - x_x) <= 20) && (abs(mouseY - x_y) <= 10)){
  x_x = mouseX;
  x_y = mouseY;
  }
  
  else if((abs(mouseX - y_x) <= 20) && (abs(mouseY - y_y) <= 10)){
  y_x = mouseX;
  y_y = mouseY;
  }
  
  else if((abs(mouseX - z_x) <= 20) && (abs(mouseY - z_y) <= 10)){
  z_x = mouseX;
  z_y = mouseY;
  }
  
  else if((abs(mouseX - u_x) <= 20) && (abs(mouseY - u_y) <= 10)){
  u_x = mouseX;
  u_y = mouseY;
  }
}

