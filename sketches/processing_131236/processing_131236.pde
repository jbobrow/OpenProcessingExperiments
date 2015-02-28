
//Global Variables

/*-----Shape-----*/
float cloud_rad; //cloud rad
float c_plc_X ; //ellipse place X
float c_plc_Y ; //ellipse place Y
/*-----Color Variables-----*/
color e1 = color(random(100, 200), 200)  ; //stroke color
color e2= color( 255, 255, 255, random(100, 200 )); //fill color
/*Stroke*/
float poscol_R; // x color
float poscol_G; // y color
float poscol_B; // negative x color
/*Fill*/
float fillcol_R; // x color
float fillcol_G; // y color
float fillcol_B; // negative x color

void setup()
{
  size(1600, 900); //resolution 1600x900
  background(100); //white color
  smooth(); //anti aliasing
}

void draw()
{
  c_plc_X =  random(-800, 800);
  c_plc_Y =  random(-450, 450);
  cloud_rad = random(25, 100);


  pushMatrix();
  /*Mapping Stroke Color According to Position*/
  poscol_R= map(c_plc_X, 0, 800, 0, 255);
  poscol_G= map(c_plc_Y, 0, 450, 0, 255);
  poscol_B= map(c_plc_X, -800, 0, 0, 255);
  /*Mapping Fill Color According to Position*/
  fillcol_R= map(c_plc_X, 0, 800, 225, 255);
  fillcol_G= map(c_plc_Y, 0, 450, 225, 255);
  fillcol_B= map(c_plc_X, -800, 0, 225, 255);   

  translate(800, 450);
  fill(fillcol_R,fillcol_G,fillcol_B,random(100,200));
  stroke(poscol_R, poscol_G, poscol_B, random(50, 150));
  strokeWeight(random(1, 5));
  ellipse(c_plc_X, c_plc_Y, cloud_rad, cloud_rad);
  popMatrix();
}

