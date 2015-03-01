
float circle_x = 550;
float circle_y= 200;
float circle_speed_x = -3;
float circle_speed_y = -5;

float circle_a = 200;
float circle_b = 500;
float circle_speed_a = -4;
float circle_speed_b = -7;

float circle_c = 300;
float circle_d = 100;
float circle_speed_c = -6;
float circle_speed_d = -9;

float circle_e = 600;
float circle_f = 300;
float circle_speed_e = -3;
float circle_speed_f = -10;

float circle_g = 200;
float circle_h = 190;
float circle_speed_g = -8;
float circle_speed_h = -9;

float circle_i =150;
float circle_j = 30;
float circle_speed_i = -3;
float circle_speed_j = -7;

float circle_k = 360;
float circle_l = 190;
float circle_speed_k = -1;
float circle_speed_l = -4;

float circle_m = 50;
float circle_n = 10;
float circle_speed_m = -1;
float circle_speed_n = -1;

float circle_o = 30;
float circle_p = 190;
float circle_speed_o = -3;
float circle_speed_p = -4;

void setup(){
  
  size(700,400);

}

void draw(){


background(20,83,100);

//+5 is the speed. 35 is faster, 2 is slower
noStroke();

circle_x = circle_x + circle_speed_x;
circle_y = circle_y + circle_speed_y;
ellipse(circle_x,circle_y,20,20);

//if the circle goes off screen 
//put the circle on screen
//if circle_y is negative

if(circle_y < 0 + 10){
  circle_speed_y = 5;
  fill(247,150,92);
}

if(circle_y > height - 10){
 circle_speed_y = -5 ;
 fill(240,83,81);
}
  
if(circle_x < 0 + 10){
 circle_speed_x = 6 ;
   fill(140,193,160);
}

if(circle_x > width - 10){
 circle_speed_x = -6; 
  fill(232,246,251);
}

circle_a = circle_a + circle_speed_a;
circle_b = circle_b + circle_speed_b;
ellipse(circle_a ,circle_b ,20,20);

if(circle_b < 0 + 10){
  circle_speed_b = 7;
    fill(232,246,251);

}

if(circle_b > height - 10){
 circle_speed_b = -7 ;
 fill(140,193,160);
}
  
if(circle_a < 0 + 10){
 circle_speed_a = 5 ;
   fill(240,83,81);
 
}

if(circle_a > width - 10){
 circle_speed_a = -5; 
   fill(247,150,92);

}

circle_e = circle_e + circle_speed_e;
circle_f = circle_f + circle_speed_f;
ellipse(circle_e ,circle_f ,20,20);

if(circle_f < 0 + 10){
  circle_speed_f = 5;
    fill(232,246,251);

}

if(circle_f > height - 10){
 circle_speed_f = -5 ;
 fill(140,193,160);
}
  
if(circle_e < 0 + 10){
 circle_speed_e = 10 ;
   fill(240,83,81);
 
}

if(circle_e > width - 10){
 circle_speed_e = -10; 
   fill(247,150,92);

}
circle_c = circle_c + circle_speed_c;
circle_d = circle_d + circle_speed_d;
ellipse(circle_c ,circle_d ,20,20);

if(circle_d < 0 + 10){
  circle_speed_d = 9;
    fill(232,246,251);

}

if(circle_d > height - 10){
 circle_speed_d = -9 ;
 fill(140,193,160);
}
  
if(circle_c < 0 + 10){
 circle_speed_c = 6 ;
   fill(240,83,81);
 
}

if(circle_c > width - 10){
 circle_speed_c = -6; 
   fill(247,150,92);

}

circle_g = circle_g + circle_speed_g;
circle_h = circle_h + circle_speed_h;
ellipse(circle_g ,circle_h ,20,20);

if(circle_h < 0 + 10){
  circle_speed_h = 9;
    fill(232,246,251);

}

if(circle_h > height - 10){
 circle_speed_h = -9 ;
 fill(140,193,160);
}
  
if(circle_g < 0 + 10){
 circle_speed_g = 8 ;
   fill(240,83,81);
 
}

if(circle_g > width - 10){
 circle_speed_g = -8; 
   fill(247,150,92);

}
circle_i = circle_i + circle_speed_i;
circle_j = circle_j + circle_speed_j;
ellipse(circle_i ,circle_j ,20,20);

if(circle_j < 0 + 10){
  circle_speed_j = 7;
    fill(232,246,251);

}

if(circle_j > height - 10){
 circle_speed_j = -7 ;
 fill(140,193,160);
}
  
if(circle_i < 0 + 10){
 circle_speed_i = 6 ;
   fill(240,83,81);
 
}

if(circle_i > width - 10){
 circle_speed_i = -6; 
   fill(247,150,92);

}

circle_k = circle_k + circle_speed_k;
circle_l = circle_l + circle_speed_l;
ellipse(circle_k,circle_l,20,20);

//if the circle goes off screen 
//put the circle on screen
//if circle_y is negative

if(circle_l < 0 + 10){
  circle_speed_l = 5;
  fill(247,150,92);
}

if(circle_l > height - 10){
 circle_speed_l = -5 ;
 fill(240,83,81);
}
  
if(circle_k < 0 + 10){
 circle_speed_k = 7 ;
   fill(140,193,160);
}

if(circle_k > width - 10){
 circle_speed_k = -7; 
  fill(232,246,251);
}

circle_m = circle_m + circle_speed_m;
circle_n = circle_n + circle_speed_n;
ellipse(circle_m,circle_n,20,20);

//if the circle goes off screen 
//put the circle on screen
//if circle_y is negative

if(circle_n < 0 + 10){
  circle_speed_n = 7;
  fill(247,150,92);
}

if(circle_n > height - 10){
 circle_speed_n = -7 ;
 fill(240,83,81);
}
  
if(circle_m < 0 + 10){
 circle_speed_m = 5 ;
   fill(140,193,160);
}

if(circle_m > width - 10){
 circle_speed_m = -5; 
  fill(232,246,251);
}

circle_o = circle_o + circle_speed_o;
circle_p = circle_p + circle_speed_p;
ellipse(circle_o,circle_p,20,20);

//if the circle goes off screen 
//put the circle on screen
//if circle_y is negative

if(circle_p < 0 + 10){
  circle_speed_p = 6;
  fill(247,150,92);
}

if(circle_p > height - 10){
 circle_speed_p = -6 ;
 fill(240,83,81);
}
  
if(circle_o < 0 + 10){
 circle_speed_o = 5 ;
   fill(140,193,160);
}

if(circle_o > width - 10){
 circle_speed_o = -5; 
  fill(232,246,251);
}


}

void mousePressed(){
  
  //if the mouse is pressed
  //make the circle come back onto the screen
  
circle_x = mouseX;
circle_y= mouseY;

circle_a = mouseX;
circle_b= mouseY;
circle_c = mouseX;
circle_d= mouseY;
circle_e = mouseX;
circle_f= mouseY;
circle_g = mouseX;
circle_h= mouseY;
circle_i = mouseX;
circle_j= mouseY;
circle_k = mouseX;
circle_l= mouseY;
circle_m = mouseX;
circle_n= mouseY;
circle_o = mouseX;
circle_p= mouseY;

//circle_a = mouseX + 20;
//circle_b= mouseY - 30;

//circle_c = mouseX - 120;
//circle_d= mouseY + 30;

//circle_e = mouseX + 120;
//circle_f= mouseY + 70;
}
