
//EJ Posselius - Processing.0 - 11.10.05
int sunY;
int  s1x, s1y, s1s, s2x, s2y, s2s, s3x, s3y, s3s;
int  s4x, s4y, s4s, s5x, s5y, s5s, s6x, s6y, s6s;
int  s7x, s7y, s7s, s8x, s8y, s8s, s9x, s9y, s9s;
int  s10x, s10y, s10s, s11x, s11y, s11s, s12x, s12y, s12s;

void setup (){
  size(800,600);
  
  //random star locations - global
  s1x = round(random(0,800));  
  s1y = round(random(0,500));
  s1s = round(random(3,8));
  s2x = round(random(0,800));
  s2y = round(random(0,500));
  s2s = round(random(3,8));
  s3x = round(random(0,800));
  s3y = round(random(0,500));
  s3s = round(random(3,8));  
  s4x = round(random(0,800));
  s4y = round(random(0,500));
  s4s = round(random(3,8));
  s5x = round(random(0,800));
  s5y = round(random(0,500));
  s5s = round(random(3,8));
  s6x = round(random(0,800));
  s6y = round(random(0,500));
  s6s = round(random(3,8));    
  s7x = round(random(0,800));
  s7y = round(random(0,500));
  s7s = round(random(3,8));
  s8x = round(random(0,800));
  s8y = round(random(0,500));
  s8s = round(random(3,8));
  s9x = round(random(0,800));
  s9y = round(random(0,500));
  s9s = round(random(3,8));  
  s10x = round(random(0,800));
  s10y = round(random(0,500));
  s10s = round(random(3,8));
  s11x = round(random(0,800));
  s11y = round(random(0,500));
  s11s = round(random(3,8));
  s12x = round(random(0,800));
  s12y = round(random(0,500));
  s12s = round(random(3,8));  
  
  smooth();
}

void draw (){
  sunY=mouseY; //declare sunY
  
  stroke(0);
  background(map(sunY,0,600,255,0),map(sunY,0,600,255,30),70);  //sunset bg

  stroke(255,255,255,round(map(sunY,0,600,0,255))); //draw stars
  fill(255,255,255,round(map(sunY,0,600,0,255)));
  ellipse(s1x, s1y, s1s, s1s);
  ellipse(s2x, s2y, s2s, s2s); 
  ellipse(s3x, s3y, s3s, s3s);
  ellipse(s4x, s4y, s4s, s4s);
  ellipse(s5x, s5y, s5s, s5s); 
  ellipse(s6x, s6y, s6s, s6s);
  ellipse(s7x, s7y, s7s, s7s);
  ellipse(s8x, s8y, s8s, s8s); 
  ellipse(s9x, s9y, s9s, s9s);
  ellipse(s10x, s10y, s10s, s10s);
  ellipse(s11x, s11y, s11s, s11s); 
  ellipse(s12x, s12y, s12s, s12s);
  
  fill(255,150,0);
  ellipseMode(CORNER);
  ellipse(300+sunY/3,sunY-150,150,150); //draw and move sun
  
  
  fill(0,map(sunY,0,600,70,0),20); // change mountain colors
  
  stroke(0);
  triangle(200,600,350,350,500,600);
  triangle(400,600,500,250,700,600);
  quad(0,400,100,200,300,600,0,600);
  triangle(600,600,800,100,800,600); //foreground elements

}
